# frozen_string_literal: true

# Copyright 2021 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "test_helper"

# Unit tests for the service config yaml parsing
class ServiceConfigParserTest < Minitest::Test
  # Simple service_yaml with just the `apis` section
  def test_parse_simple_service_yaml
    config_version = 2
    service_name = "my_service"

    api1_name = "test_api1"

    yaml = <<~HEREDOC
      type: google.api.Service
      config_version: #{config_version}
      name: #{service_name}
      apis:
      - name: #{api1_name}
      - name: test_api2
    HEREDOC

    service = Gapic::Schema::ServiceConfigParser.parse_service_yaml yaml

    assert_equal config_version, service.config_version.value
    assert_equal service_name, service.name
    assert_equal 2, service.apis.length
    assert(service.apis.any? { |api| api.name == api1_name })
  end

  # Service_yaml with the `apis` and the `http-rules` section
  def test_parse_service_yaml_with_api_http
    api1_name = "test_api1"
    method1_name = "test_method1"
    method1_verb = "get"
    method1_binding = "/v1alpha1/{name=projects/*}/locations"

    method2_name = "test_method2"
    method2_verb = "post"
    method2_body = "*"
    method2_binding1 = "/v1alpha1/{resource=projects/*/locations/*/connectionProfiles/*}:setIamPolicy"
    method2_binding2 = "/v1alpha1/{resource=projects/*/locations/*/streams/*}:setIamPolicy"

    yaml = <<~HEREDOC
      type: google.api.Service
      config_version: 2
      name: my_service
      apis:
      - name: #{api1_name}
      - name: test_api2
      http:
        fully_decode_reserved_expansion: true
        rules:
        - selector: #{api1_name}.#{method1_name}
          #{method1_verb}: '#{method1_binding}'
        - selector: #{api1_name}.#{method2_name}
          #{method2_verb}: '#{method2_binding1}'
          body: '#{method2_body}'
          additional_bindings:
          - #{method2_verb}: '#{method2_binding2}'
            body: '#{method2_body}'
          - post: '/v1alpha1/{resource=projects/*/locations/*/privateConnections/*}:setIamPolicy'
            body: '*'
          - post: '/v1alpha1/{resource=projects/*/locations/*/privateConnections/*/routes/*}:setIamPolicy'
            body: '*'
    HEREDOC

    service = Gapic::Schema::ServiceConfigParser.parse_service_yaml yaml

    assert(service.apis.any? { |api| api.name == api1_name })
    refute_nil service.http
    http = service.http
    assert_equal 2, http.rules.length

    method1_rule = http.rules.find { |rule| rule.selector == "#{api1_name}.#{method1_name}" }
    refute_nil method1_rule
    assert method1_rule.respond_to? method1_verb
    assert_equal method1_binding, method1_rule.send(method1_verb)

    method2_rule = http.rules.find { |rule| rule.selector == "#{api1_name}.#{method2_name}" }
    refute_nil method2_rule
    assert method2_rule.respond_to? method2_verb
    assert_equal method2_binding1, method2_rule.send(method2_verb)
    assert_equal method2_body, method2_rule.body

    refute_nil method2_rule.additional_bindings
    method2_addbind = method2_rule.additional_bindings.find do |bind|
      bind.respond_to?(method2_verb) &&
        method2_binding2 == bind.send(method2_verb) &&
        method2_body == bind.body
    end
    refute_nil method2_addbind
  end
end

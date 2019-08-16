# frozen_string_literal: true

# Copyright 2018 Google LLC
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

require "gapic/config"

module Google
  module Cloud
    module Vision
      ##
      # Default configuration for the google-cloud-vision gem.
      #
      # @yield [config] Configure the google-cloud-vision gem.
      # @yieldparam config [Google::Cloud::Vision::Configuration]
      #
      # @return [Google::Cloud::Vision::Configuration]
      #
      def self.configure
        @configure ||= Google::Cloud::Vision::Configuration.new
        yield @configure if block_given?
        @configure
      end

      class Configuration
        extend Gapic::Config

        config_attr :credentials, nil do |value|
          allowed = [::String, ::Hash, ::Proc, ::Google::Auth::Credentials, ::Signet::OAuth2::Client, nil]
          allowed += [::GRPC::Core::Channel, ::GRPC::Core::ChannelCredentials] if defined? ::GRPC
          allowed.any? { |klass| klass === value }
        end
        config_attr :lib_name,     nil, String, nil
        config_attr :lib_version,  nil, String, nil
        config_attr :interceptors, nil, Array, nil
        config_attr :timeout,      nil, Numeric, nil
        config_attr :metadata,     nil, Hash, nil
        config_attr :retry_policy, nil, Hash, Proc, nil
      end
    end
  end
end

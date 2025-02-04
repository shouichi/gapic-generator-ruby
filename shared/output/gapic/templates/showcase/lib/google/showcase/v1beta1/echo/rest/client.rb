# frozen_string_literal: true

# The MIT License (MIT)
#
# Copyright <YEAR> <COPYRIGHT HOLDER>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# Auto-generated by gapic-generator-ruby. DO NOT EDIT!

require "google/showcase/v1beta1/echo_pb"
require "google/showcase/v1beta1/echo/rest/service_stub"

module Google
  module Showcase
    module V1beta1
      module Echo
        module Rest
          ##
          # REST client for the Echo service.
          #
          # This service is used showcase the four main types of rpcs - unary, server
          # side streaming, client side streaming, and bidirectional streaming. This
          # service also exposes methods that explicitly implement server delay, and
          # paginated calls. Set the 'showcase-trailer' metadata key on any method
          # to have the values echoed in the response trailers.
          #
          class Client
            # @private
            attr_reader :echo_stub

            ##
            # Configure the Echo Client class.
            #
            # See {::Google::Showcase::V1beta1::Echo::Rest::Client::Configuration}
            # for a description of the configuration fields.
            #
            # @example
            #
            #   # Modify the configuration for all Echo clients
            #   ::Google::Showcase::V1beta1::Echo::Rest::Client.configure do |config|
            #     config.timeout = 10.0
            #   end
            #
            # @yield [config] Configure the Client client.
            # @yieldparam config [Client::Configuration]
            #
            # @return [Client::Configuration]
            #
            def self.configure
              @configure ||= begin
                default_config = Client::Configuration.new

                default_config
              end
              yield @configure if block_given?
              @configure
            end

            ##
            # Configure the Echo Client instance.
            #
            # The configuration is set to the derived mode, meaning that values can be changed,
            # but structural changes (adding new fields, etc.) are not allowed. Structural changes
            # should be made on {Client.configure}.
            #
            # See {::Google::Showcase::V1beta1::Echo::Rest::Client::Configuration}
            # for a description of the configuration fields.
            #
            # @yield [config] Configure the Client client.
            # @yieldparam config [Client::Configuration]
            #
            # @return [Client::Configuration]
            #
            def configure
              yield @config if block_given?
              @config
            end

            ##
            # Create a new Echo REST client object.
            #
            # @example
            #
            #   # Create a client using the default configuration
            #   client = ::Google::Showcase::V1beta1::Echo::Rest::Client.new
            #
            #   # Create a client using a custom configuration
            #   client = ::Google::Showcase::V1beta1::Echo::Rest::Client.new do |config|
            #     config.timeout = 10.0
            #   end
            #
            # @yield [config] Configure the Echo client.
            # @yieldparam config [Client::Configuration]
            #
            def initialize
              # Create the configuration object
              @config = Configuration.new Client.configure

              # Yield the configuration if needed
              yield @config if block_given?

              # Create credentials
              credentials = @config.credentials
              credentials ||= Credentials.default scope: @config.scope
              if credentials.is_a?(::String) || credentials.is_a?(::Hash)
                credentials = Credentials.new credentials, scope: @config.scope
              end

              @operations_client = ::Google::Showcase::V1beta1::Echo::Rest::Operations.new do |config|
                config.credentials = credentials
                config.endpoint = @config.endpoint
              end

              @echo_stub = ::Google::Showcase::V1beta1::Echo::Rest::ServiceStub.new endpoint: @config.endpoint,
                                                                                    credentials: credentials
            end

            ##
            # Get the associated client for long-running operations.
            #
            # @return [::Google::Showcase::V1beta1::Echo::Operations]
            #
            attr_reader :operations_client

            # Service calls

            ##
            # This method simply echos the request. This method is showcases unary rpcs.
            #
            # @overload echo(request, options = nil)
            #   Pass arguments to `echo` via a request object, either of type
            #   {::Google::Showcase::V1beta1::EchoRequest} or an equivalent Hash.
            #
            #   @param request [::Google::Showcase::V1beta1::EchoRequest, ::Hash]
            #     A request object representing the call parameters. Required. To specify no
            #     parameters, or to keep all the default parameter values, pass an empty Hash.
            #   @param options [::Gapic::CallOptions, ::Hash]
            #     Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
            #     Note: currently retry functionality is not implemented. While it is possible
            #     to set it using ::Gapic::CallOptions, it will not be applied
            #
            # @overload echo(content: nil, error: nil)
            #   Pass arguments to `echo` via keyword arguments. Note that at
            #   least one keyword argument is required. To specify no parameters, or to keep all
            #   the default parameter values, pass an empty Hash as a request object (see above).
            #
            #   @param content [::String]
            #     The content to be echoed by the server.
            #   @param error [::Google::Rpc::Status, ::Hash]
            #     The error to be thrown by the server.
            # @yield [result, response] Access the result along with the Faraday response object
            # @yieldparam result [::Google::Showcase::V1beta1::EchoResponse]
            # @yieldparam response [::Faraday::Response]
            #
            # @return [::Google::Showcase::V1beta1::EchoResponse]
            #
            # @raise [::Gapic::Rest::Error] if the REST call is aborted.
            def echo request, options = nil
              raise ::ArgumentError, "request must be provided" if request.nil?

              request = ::Gapic::Protobuf.coerce request, to: ::Google::Showcase::V1beta1::EchoRequest

              # Converts hash and nil to an options object
              options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

              # Customize the options with defaults
              call_metadata = @config.rpcs.echo.metadata.to_h

              # Set x-goog-api-client header
              call_metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                lib_name: @config.lib_name, lib_version: @config.lib_version,
                gapic_version: ::Google::Showcase::VERSION,
                transports_version_send: [:rest]

              options.apply_defaults timeout:      @config.rpcs.echo.timeout,
                                     metadata:     call_metadata

              options.apply_defaults timeout:      @config.timeout,
                                     metadata:     @config.metadata

              @echo_stub.echo request, options do |result, response|
                yield result, response if block_given?
                return result
              end
            rescue ::Faraday::Error => e
              raise ::Gapic::Rest::Error.wrap_faraday_error e
            end

            ##
            # This is similar to the Expand method but instead of returning a stream of
            # expanded words, this method returns a paged list of expanded words.
            #
            # @overload paged_expand(request, options = nil)
            #   Pass arguments to `paged_expand` via a request object, either of type
            #   {::Google::Showcase::V1beta1::PagedExpandRequest} or an equivalent Hash.
            #
            #   @param request [::Google::Showcase::V1beta1::PagedExpandRequest, ::Hash]
            #     A request object representing the call parameters. Required. To specify no
            #     parameters, or to keep all the default parameter values, pass an empty Hash.
            #   @param options [::Gapic::CallOptions, ::Hash]
            #     Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
            #     Note: currently retry functionality is not implemented. While it is possible
            #     to set it using ::Gapic::CallOptions, it will not be applied
            #
            # @overload paged_expand(content: nil, page_size: nil, page_token: nil)
            #   Pass arguments to `paged_expand` via keyword arguments. Note that at
            #   least one keyword argument is required. To specify no parameters, or to keep all
            #   the default parameter values, pass an empty Hash as a request object (see above).
            #
            #   @param content [::String]
            #     The string to expand.
            #   @param page_size [::Integer]
            #     The amount of words to returned in each page.
            #   @param page_token [::String]
            #     The position of the page to be returned.
            # @yield [result, response] Access the result along with the Faraday response object
            # @yieldparam result [::Gapic::Rest::PagedEnumerable<::Google::Showcase::V1beta1::EchoResponse>]
            # @yieldparam response [::Faraday::Response]
            #
            # @return [::Gapic::Rest::PagedEnumerable<::Google::Showcase::V1beta1::EchoResponse>]
            #
            # @raise [::Gapic::Rest::Error] if the REST call is aborted.
            def paged_expand request, options = nil
              raise ::ArgumentError, "request must be provided" if request.nil?

              request = ::Gapic::Protobuf.coerce request, to: ::Google::Showcase::V1beta1::PagedExpandRequest

              # Converts hash and nil to an options object
              options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

              # Customize the options with defaults
              call_metadata = @config.rpcs.paged_expand.metadata.to_h

              # Set x-goog-api-client header
              call_metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                lib_name: @config.lib_name, lib_version: @config.lib_version,
                gapic_version: ::Google::Showcase::VERSION,
                transports_version_send: [:rest]

              options.apply_defaults timeout:      @config.rpcs.paged_expand.timeout,
                                     metadata:     call_metadata

              options.apply_defaults timeout:      @config.timeout,
                                     metadata:     @config.metadata

              @echo_stub.paged_expand request, options do |result, response|
                result = ::Gapic::Rest::PagedEnumerable.new @echo_stub, :paged_expand, "responses", request, result,
                                                            options
                yield result, response if block_given?
                return result
              end
            rescue ::Faraday::Error => e
              raise ::Gapic::Rest::Error.wrap_faraday_error e
            end

            ##
            # This method will wait the requested amount of and then return.
            # This method showcases how a client handles a request timing out.
            #
            # @overload wait(request, options = nil)
            #   Pass arguments to `wait` via a request object, either of type
            #   {::Google::Showcase::V1beta1::WaitRequest} or an equivalent Hash.
            #
            #   @param request [::Google::Showcase::V1beta1::WaitRequest, ::Hash]
            #     A request object representing the call parameters. Required. To specify no
            #     parameters, or to keep all the default parameter values, pass an empty Hash.
            #   @param options [::Gapic::CallOptions, ::Hash]
            #     Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
            #     Note: currently retry functionality is not implemented. While it is possible
            #     to set it using ::Gapic::CallOptions, it will not be applied
            #
            # @overload wait(end_time: nil, ttl: nil, error: nil, success: nil)
            #   Pass arguments to `wait` via keyword arguments. Note that at
            #   least one keyword argument is required. To specify no parameters, or to keep all
            #   the default parameter values, pass an empty Hash as a request object (see above).
            #
            #   @param end_time [::Google::Protobuf::Timestamp, ::Hash]
            #     The time that this operation will complete.
            #   @param ttl [::Google::Protobuf::Duration, ::Hash]
            #     The duration of this operation.
            #   @param error [::Google::Rpc::Status, ::Hash]
            #     The error that will be returned by the server. If this code is specified
            #     to be the OK rpc code, an empty response will be returned.
            #   @param success [::Google::Showcase::V1beta1::WaitResponse, ::Hash]
            #     The response to be returned on operation completion.
            # @yield [result, response] Access the result along with the Faraday response object
            # @yieldparam result [::Gapic::Operation]
            # @yieldparam response [::Faraday::Response]
            #
            # @return [::Gapic::Operation]
            #
            # @raise [::Gapic::Rest::Error] if the REST call is aborted.
            def wait request, options = nil
              raise ::ArgumentError, "request must be provided" if request.nil?

              request = ::Gapic::Protobuf.coerce request, to: ::Google::Showcase::V1beta1::WaitRequest

              # Converts hash and nil to an options object
              options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

              # Customize the options with defaults
              call_metadata = @config.rpcs.wait.metadata.to_h

              # Set x-goog-api-client header
              call_metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                lib_name: @config.lib_name, lib_version: @config.lib_version,
                gapic_version: ::Google::Showcase::VERSION,
                transports_version_send: [:rest]

              options.apply_defaults timeout:      @config.rpcs.wait.timeout,
                                     metadata:     call_metadata

              options.apply_defaults timeout:      @config.timeout,
                                     metadata:     @config.metadata

              @echo_stub.wait request, options do |result, response|
                result = ::Gapic::Operation.new result, @operations_client, options: options
                yield result, response if block_given?
                return result
              end
            rescue ::Faraday::Error => e
              raise ::Gapic::Rest::Error.wrap_faraday_error e
            end

            ##
            # This method will block (wait) for the requested amount of time
            # and then return the response or error.
            # This method showcases how a client handles delays or retries.
            #
            # @overload block(request, options = nil)
            #   Pass arguments to `block` via a request object, either of type
            #   {::Google::Showcase::V1beta1::BlockRequest} or an equivalent Hash.
            #
            #   @param request [::Google::Showcase::V1beta1::BlockRequest, ::Hash]
            #     A request object representing the call parameters. Required. To specify no
            #     parameters, or to keep all the default parameter values, pass an empty Hash.
            #   @param options [::Gapic::CallOptions, ::Hash]
            #     Overrides the default settings for this call, e.g, timeout, retries etc. Optional.
            #     Note: currently retry functionality is not implemented. While it is possible
            #     to set it using ::Gapic::CallOptions, it will not be applied
            #
            # @overload block(response_delay: nil, error: nil, success: nil)
            #   Pass arguments to `block` via keyword arguments. Note that at
            #   least one keyword argument is required. To specify no parameters, or to keep all
            #   the default parameter values, pass an empty Hash as a request object (see above).
            #
            #   @param response_delay [::Google::Protobuf::Duration, ::Hash]
            #     The amount of time to block before returning a response.
            #   @param error [::Google::Rpc::Status, ::Hash]
            #     The error that will be returned by the server. If this code is specified
            #     to be the OK rpc code, an empty response will be returned.
            #   @param success [::Google::Showcase::V1beta1::BlockResponse, ::Hash]
            #     The response to be returned that will signify successful method call.
            # @yield [result, response] Access the result along with the Faraday response object
            # @yieldparam result [::Google::Showcase::V1beta1::BlockResponse]
            # @yieldparam response [::Faraday::Response]
            #
            # @return [::Google::Showcase::V1beta1::BlockResponse]
            #
            # @raise [::Gapic::Rest::Error] if the REST call is aborted.
            def block request, options = nil
              raise ::ArgumentError, "request must be provided" if request.nil?

              request = ::Gapic::Protobuf.coerce request, to: ::Google::Showcase::V1beta1::BlockRequest

              # Converts hash and nil to an options object
              options = ::Gapic::CallOptions.new(**options.to_h) if options.respond_to? :to_h

              # Customize the options with defaults
              call_metadata = @config.rpcs.block.metadata.to_h

              # Set x-goog-api-client header
              call_metadata[:"x-goog-api-client"] ||= ::Gapic::Headers.x_goog_api_client \
                lib_name: @config.lib_name, lib_version: @config.lib_version,
                gapic_version: ::Google::Showcase::VERSION,
                transports_version_send: [:rest]

              options.apply_defaults timeout:      @config.rpcs.block.timeout,
                                     metadata:     call_metadata

              options.apply_defaults timeout:      @config.timeout,
                                     metadata:     @config.metadata

              @echo_stub.block request, options do |result, response|
                yield result, response if block_given?
                return result
              end
            rescue ::Faraday::Error => e
              raise ::Gapic::Rest::Error.wrap_faraday_error e
            end

            ##
            # Configuration class for the Echo REST API.
            #
            # This class represents the configuration for Echo REST,
            # providing control over credentials, timeouts, retry behavior, logging.
            #
            # Configuration can be applied globally to all clients, or to a single client
            # on construction.
            #
            # # Examples
            #
            # To modify the global config, setting the timeout for all calls to 10 seconds:
            #
            #     ::Google::Showcase::V1beta1::Echo::Client.configure do |config|
            #       config.timeout = 10.0
            #     end
            #
            # To apply the above configuration only to a new client:
            #
            #     client = ::Google::Showcase::V1beta1::Echo::Client.new do |config|
            #       config.timeout = 10.0
            #     end
            #
            # @!attribute [rw] endpoint
            #   The hostname or hostname:port of the service endpoint.
            #   Defaults to `"localhost:7469"`.
            #   @return [::String]
            # @!attribute [rw] credentials
            #   Credentials to send with calls. You may provide any of the following types:
            #    *  (`String`) The path to a service account key file in JSON format
            #    *  (`Hash`) A service account key as a Hash
            #    *  (`Google::Auth::Credentials`) A googleauth credentials object
            #       (see the [googleauth docs](https://googleapis.dev/ruby/googleauth/latest/index.html))
            #    *  (`Signet::OAuth2::Client`) A signet oauth2 client object
            #       (see the [signet docs](https://googleapis.dev/ruby/signet/latest/Signet/OAuth2/Client.html))
            #    *  (`nil`) indicating no credentials
            #   @return [::Object]
            # @!attribute [rw] scope
            #   The OAuth scopes
            #   @return [::Array<::String>]
            # @!attribute [rw] lib_name
            #   The library name as recorded in instrumentation and logging
            #   @return [::String]
            # @!attribute [rw] lib_version
            #   The library version as recorded in instrumentation and logging
            #   @return [::String]
            # @!attribute [rw] timeout
            #   The call timeout in seconds.
            #   @return [::Numeric]
            # @!attribute [rw] metadata
            #   Additional REST headers to be sent with the call.
            #   @return [::Hash{::Symbol=>::String}]
            #
            class Configuration
              extend ::Gapic::Config

              config_attr :endpoint,      "localhost:7469", ::String
              config_attr :credentials,   nil do |value|
                allowed = [::String, ::Hash, ::Proc, ::Symbol, ::Google::Auth::Credentials, ::Signet::OAuth2::Client,
                           nil]
                allowed.any? { |klass| klass === value }
              end
              config_attr :scope,         nil, ::String, ::Array, nil
              config_attr :lib_name,      nil, ::String, nil
              config_attr :lib_version,   nil, ::String, nil
              config_attr :timeout,       nil, ::Numeric, nil
              config_attr :metadata,      nil, ::Hash, nil

              # @private
              def initialize parent_config = nil
                @parent_config = parent_config unless parent_config.nil?

                yield self if block_given?
              end

              ##
              # Configurations for individual RPCs
              # @return [Rpcs]
              #
              def rpcs
                @rpcs ||= begin
                  parent_rpcs = nil
                  parent_rpcs = @parent_config.rpcs if defined?(@parent_config) && @parent_config.respond_to?(:rpcs)
                  Rpcs.new parent_rpcs
                end
              end

              ##
              # Configuration RPC class for the Echo API.
              #
              # Includes fields providing the configuration for each RPC in this service.
              # Each configuration object is of type `Gapic::Config::Method` and includes
              # the following configuration fields:
              #
              #  *  `timeout` (*type:* `Numeric`) - The call timeout in seconds
              #
              # there is one other field (`retry_policy`) that can be set
              # but is currently not supported for REST Gapic libraries.
              #
              class Rpcs
                ##
                # RPC-specific configuration for `echo`
                # @return [::Gapic::Config::Method]
                #
                attr_reader :echo
                ##
                # RPC-specific configuration for `paged_expand`
                # @return [::Gapic::Config::Method]
                #
                attr_reader :paged_expand
                ##
                # RPC-specific configuration for `wait`
                # @return [::Gapic::Config::Method]
                #
                attr_reader :wait
                ##
                # RPC-specific configuration for `block`
                # @return [::Gapic::Config::Method]
                #
                attr_reader :block

                # @private
                def initialize parent_rpcs = nil
                  echo_config = parent_rpcs.echo if parent_rpcs.respond_to? :echo
                  @echo = ::Gapic::Config::Method.new echo_config
                  paged_expand_config = parent_rpcs.paged_expand if parent_rpcs.respond_to? :paged_expand
                  @paged_expand = ::Gapic::Config::Method.new paged_expand_config
                  wait_config = parent_rpcs.wait if parent_rpcs.respond_to? :wait
                  @wait = ::Gapic::Config::Method.new wait_config
                  block_config = parent_rpcs.block if parent_rpcs.respond_to? :block
                  @block = ::Gapic::Config::Method.new block_config

                  yield self if block_given?
                end
              end
            end
          end
        end
      end
    end
  end
end

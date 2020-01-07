# frozen_string_literal: true

# Copyright 2020 Google LLC
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

# Auto-generated by gapic-generator-ruby v0.0.1.dev.1. DO NOT EDIT!


module Google
  module Cloud
    module SecretManager
      module V1beta1
        # Request message for [SecretManagerService.ListSecrets][google.cloud.secrets.v1beta1.SecretManagerService.ListSecrets].
        # @!attribute [rw] parent
        #   @return [String]
        #     Required. The resource name of the project associated with the
        #     [Secrets][google.cloud.secrets.v1beta1.Secret], in the format `projects/*`.
        # @!attribute [rw] page_size
        #   @return [Integer]
        #     Optional. The maximum number of results to be returned in a single page. If
        #     set to 0, the server decides the number of results to return. If the
        #     number is greater than 25000, it is capped at 25000.
        # @!attribute [rw] page_token
        #   @return [String]
        #     Optional. Pagination token, returned earlier via
        #     [ListSecretsResponse.next_page_token][google.cloud.secrets.v1beta1.ListSecretsResponse.next_page_token].
        class ListSecretsRequest
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Response message for [SecretManagerService.ListSecrets][google.cloud.secrets.v1beta1.SecretManagerService.ListSecrets].
        # @!attribute [rw] secrets
        #   @return [Google::Cloud::SecretManager::V1beta1::Secret]
        #     The list of [Secrets][google.cloud.secrets.v1beta1.Secret] sorted in reverse by create_time (newest
        #     first).
        # @!attribute [rw] next_page_token
        #   @return [String]
        #     A token to retrieve the next page of results. Pass this value in
        #     [ListSecretsRequest.page_token][google.cloud.secrets.v1beta1.ListSecretsRequest.page_token] to retrieve the next page.
        # @!attribute [rw] total_size
        #   @return [Integer]
        #     The total number of [Secrets][google.cloud.secrets.v1beta1.Secret].
        class ListSecretsResponse
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Request message for [SecretManagerService.CreateSecret][google.cloud.secrets.v1beta1.SecretManagerService.CreateSecret].
        # @!attribute [rw] parent
        #   @return [String]
        #     Required. The resource name of the project to associate with the
        #     [Secret][google.cloud.secrets.v1beta1.Secret], in the format `projects/*`.
        # @!attribute [rw] secret_id
        #   @return [String]
        #     Required. This must be unique within the project.
        # @!attribute [rw] secret
        #   @return [Google::Cloud::SecretManager::V1beta1::Secret]
        #     A [Secret][google.cloud.secrets.v1beta1.Secret] with initial field values.
        class CreateSecretRequest
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Request message for [SecretManagerService.AddSecretVersion][google.cloud.secrets.v1beta1.SecretManagerService.AddSecretVersion].
        # @!attribute [rw] parent
        #   @return [String]
        #     Required. The resource name of the [Secret][google.cloud.secrets.v1beta1.Secret] to associate with the
        #     [SecretVersion][google.cloud.secrets.v1beta1.SecretVersion] in the format `projects/*/secrets/*`.
        # @!attribute [rw] payload
        #   @return [Google::Cloud::SecretManager::V1beta1::SecretPayload]
        #     Required. The secret payload of the [SecretVersion][google.cloud.secrets.v1beta1.SecretVersion].
        class AddSecretVersionRequest
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Request message for [SecretManagerService.GetSecret][google.cloud.secrets.v1beta1.SecretManagerService.GetSecret].
        # @!attribute [rw] name
        #   @return [String]
        #     Required. The resource name of the [Secret][google.cloud.secrets.v1beta1.Secret], in the format `projects/*/secrets/*`.
        class GetSecretRequest
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Request message for [SecretManagerService.ListSecretVersions][google.cloud.secrets.v1beta1.SecretManagerService.ListSecretVersions].
        # @!attribute [rw] parent
        #   @return [String]
        #     Required. The resource name of the [Secret][google.cloud.secrets.v1beta1.Secret] associated with the
        #     [SecretVersions][google.cloud.secrets.v1beta1.SecretVersion] to list, in the format
        #     `projects/*/secrets/*`.
        # @!attribute [rw] page_size
        #   @return [Integer]
        #     Optional. The maximum number of results to be returned in a single page. If
        #     set to 0, the server decides the number of results to return. If the
        #     number is greater than 25000, it is capped at 25000.
        # @!attribute [rw] page_token
        #   @return [String]
        #     Optional. Pagination token, returned earlier via
        #     ListSecretVersionsResponse.next_page_token][].
        class ListSecretVersionsRequest
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Response message for [SecretManagerService.ListSecretVersions][google.cloud.secrets.v1beta1.SecretManagerService.ListSecretVersions].
        # @!attribute [rw] versions
        #   @return [Google::Cloud::SecretManager::V1beta1::SecretVersion]
        #     The list of [SecretVersions][google.cloud.secrets.v1beta1.SecretVersion] sorted in reverse by
        #     create_time (newest first).
        # @!attribute [rw] next_page_token
        #   @return [String]
        #     A token to retrieve the next page of results. Pass this value in
        #     [ListSecretVersionsRequest.page_token][google.cloud.secrets.v1beta1.ListSecretVersionsRequest.page_token] to retrieve the next page.
        # @!attribute [rw] total_size
        #   @return [Integer]
        #     The total number of [SecretVersions][google.cloud.secrets.v1beta1.SecretVersion].
        class ListSecretVersionsResponse
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Request message for [SecretManagerService.GetSecretVersion][google.cloud.secrets.v1beta1.SecretManagerService.GetSecretVersion].
        # @!attribute [rw] name
        #   @return [String]
        #     Required. The resource name of the [SecretVersion][google.cloud.secrets.v1beta1.SecretVersion] in the format
        #     `projects/*/secrets/*/versions/*`.
        #     `projects/*/secrets/*/versions/latest` is an alias to the `latest`
        #     [SecretVersion][google.cloud.secrets.v1beta1.SecretVersion].
        class GetSecretVersionRequest
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Request message for [SecretManagerService.UpdateSecret][google.cloud.secrets.v1beta1.SecretManagerService.UpdateSecret].
        # @!attribute [rw] secret
        #   @return [Google::Cloud::SecretManager::V1beta1::Secret]
        #     Required. [Secret][google.cloud.secrets.v1beta1.Secret] with updated field values.
        # @!attribute [rw] update_mask
        #   @return [Google::Protobuf::FieldMask]
        #     Required. Specifies the fields to be updated.
        class UpdateSecretRequest
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Request message for [SecretManagerService.AccessSecretVersion][google.cloud.secrets.v1beta1.SecretManagerService.AccessSecretVersion].
        # @!attribute [rw] name
        #   @return [String]
        #     Required. The resource name of the [SecretVersion][google.cloud.secrets.v1beta1.SecretVersion] in the format
        #     `projects/*/secrets/*/versions/*`.
        class AccessSecretVersionRequest
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Response message for [SecretManagerService.AccessSecretVersion][google.cloud.secrets.v1beta1.SecretManagerService.AccessSecretVersion].
        # @!attribute [rw] name
        #   @return [String]
        #     The resource name of the [SecretVersion][google.cloud.secrets.v1beta1.SecretVersion] in the format
        #     `projects/*/secrets/*/versions/*`.
        # @!attribute [rw] payload
        #   @return [Google::Cloud::SecretManager::V1beta1::SecretPayload]
        #     Secret payload
        class AccessSecretVersionResponse
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Request message for [SecretManagerService.DeleteSecret][google.cloud.secrets.v1beta1.SecretManagerService.DeleteSecret].
        # @!attribute [rw] name
        #   @return [String]
        #     Required. The resource name of the [Secret][google.cloud.secrets.v1beta1.Secret] to delete in the format
        #     `projects/*/secrets/*`.
        class DeleteSecretRequest
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Request message for [SecretManagerService.DisableSecretVersion][google.cloud.secrets.v1beta1.SecretManagerService.DisableSecretVersion].
        # @!attribute [rw] name
        #   @return [String]
        #     Required. The resource name of the [SecretVersion][google.cloud.secrets.v1beta1.SecretVersion] to disable in the format
        #     `projects/*/secrets/*/versions/*`.
        class DisableSecretVersionRequest
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Request message for [SecretManagerService.EnableSecretVersion][google.cloud.secrets.v1beta1.SecretManagerService.EnableSecretVersion].
        # @!attribute [rw] name
        #   @return [String]
        #     Required. The resource name of the [SecretVersion][google.cloud.secrets.v1beta1.SecretVersion] to enable in the format
        #     `projects/*/secrets/*/versions/*`.
        class EnableSecretVersionRequest
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Request message for [SecretManagerService.DestroySecretVersion][google.cloud.secrets.v1beta1.SecretManagerService.DestroySecretVersion].
        # @!attribute [rw] name
        #   @return [String]
        #     Required. The resource name of the [SecretVersion][google.cloud.secrets.v1beta1.SecretVersion] to destroy in the format
        #     `projects/*/secrets/*/versions/*`.
        class DestroySecretVersionRequest
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end
      end
    end
  end
end

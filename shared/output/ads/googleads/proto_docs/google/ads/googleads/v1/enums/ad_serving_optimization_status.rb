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
  module Ads
    module GoogleAds
      module V1
        module Enums
          # Possible ad serving statuses of a campaign.
          class AdServingOptimizationStatusEnum
            include Google::Protobuf::MessageExts
            extend Google::Protobuf::MessageExts::ClassMethods

            # Enum describing possible serving statuses.
            module AdServingOptimizationStatus
              # No value has been specified.
              UNSPECIFIED = 0

              # The received value is not known in this version.
              #
              # This is a response-only value.
              UNKNOWN = 1

              # Ad serving is optimized based on CTR for the campaign.
              OPTIMIZE = 2

              # Ad serving is optimized based on CTR * Conversion for the campaign. If
              # the campaign is not in the conversion optimizer bidding strategy, it will
              # default to OPTIMIZED.
              CONVERSION_OPTIMIZE = 3

              # Ads are rotated evenly for 90 days, then optimized for clicks.
              ROTATE = 4

              # Show lower performing ads more evenly with higher performing ads, and do
              # not optimize.
              ROTATE_INDEFINITELY = 5

              # Ad serving optimization status is not available.
              UNAVAILABLE = 6
            end
          end
        end
      end
    end
  end
end

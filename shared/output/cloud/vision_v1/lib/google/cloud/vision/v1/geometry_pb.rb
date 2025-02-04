# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/vision/v1/geometry.proto

require 'google/protobuf'

require 'google/api/annotations_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/cloud/vision/v1/geometry.proto", :syntax => :proto3) do
    add_message "google.cloud.vision.v1.Vertex" do
      optional :x, :int32, 1
      optional :y, :int32, 2
    end
    add_message "google.cloud.vision.v1.NormalizedVertex" do
      optional :x, :float, 1
      optional :y, :float, 2
    end
    add_message "google.cloud.vision.v1.BoundingPoly" do
      repeated :vertices, :message, 1, "google.cloud.vision.v1.Vertex"
      repeated :normalized_vertices, :message, 2, "google.cloud.vision.v1.NormalizedVertex"
    end
    add_message "google.cloud.vision.v1.Position" do
      optional :x, :float, 1
      optional :y, :float, 2
      optional :z, :float, 3
    end
  end
end

module Google
  module Cloud
    module Vision
      module V1
        Vertex = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1.Vertex").msgclass
        NormalizedVertex = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1.NormalizedVertex").msgclass
        BoundingPoly = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1.BoundingPoly").msgclass
        Position = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1.Position").msgclass
      end
    end
  end
end

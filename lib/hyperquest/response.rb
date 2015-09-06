require "ostruct"
require "forwardable"

module Hyperquest
  # Hyperquest::Response is a wrapper for responses from hyperquest.go
  class Response < OpenStruct
    extend Forwardable

    # Instantiated by {Request} - see {Request.open}
    #
    # @api private
    # @param [Hash] hash Parsed JSON
    # @return [Response]
    def initialize(hash)
      @response = OpenStruct.new(hash).freeze
    end

    # @!group Attributes
    # @!attribute [r] uri
    #   @return [String] Request url
    # @!attribute [r] content_length
    #   @return [Fixnum]
    # @!attribute [r] content_type
    #   @return [String]
    # @!attribute [r] body
    #   @return [String]
    # @!attribute [r] status
    #   @return [Fixnum]
    # @!attribute [r] error
    #   @return [String]
    def_delegators :@response,
                   :uri, :content_length, :content_type,
                   :body, :status, :error

    # Returns true if error is empty
    # @return [Boolean]
    def success?
      error.empty?
    end

    # Returns true if error is not empty
    # @return [Boolean]
    def failed?
      !success?
    end
    # @!endgroup
  end
end

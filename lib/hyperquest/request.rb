require "json"
require "hyperquest/response"

module Hyperquest
  # Dispatcher to Golang
  #
  # @api private
  module Request
    extend FFI::Library

    ffi_lib File.expand_path("../../../ext/hyperquest.so", __FILE__)

    # Does asynchronous get requests via a go extension
    attach_function :get, [:string], :string
    attach_function :head, [:string], :string

    # Open a type of request via our extension
    #
    # @param [Symbol] type Valid options are get and head
    # @param [Array<String>] uri Uri to be requested
    # @return [Array<Response>] {Response}
    def self.open(type, uri)
      response = public_send(type, Array(uri).to_json)
      JSON.parse(response).each_with_object({}) do |e, hash|
        hash[e["uri"]] = Response.new(e)
      end
    end
  end
end

require "ffi"
require "json"
require "hyperquest/request"

# {Hyperquest} is a library for doing asynchronous GET and HEAD requests.
module Hyperquest
  # Asynchronous get requests
  #
  # @param [Array[String]] uri URI to be requested
  # @return [Hash<String => Response>] See {Response}
  def self.get(uri)
    Request.open(:get, uri)
  end

  # Asynchronous head request
  #
  # @param [Array[String]] uri URI to be requested
  # @return [Hash<String => Response>] See {Response}
  def self.head(uri)
    Request.open(:head, uri)
  end
end

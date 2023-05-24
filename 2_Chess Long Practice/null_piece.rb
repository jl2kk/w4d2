# require_relative "piece.rb"
require "singleton"

class NullPiece
    include Singleton

    def initialize
        @color = nil
    end

    def symbol
        nil # maybe replace with underscore or something?
    end

    def inspect
        p " "
    end
end
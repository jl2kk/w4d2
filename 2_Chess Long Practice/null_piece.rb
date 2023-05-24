require_relative "piece.rb"
require "singleton"

class NullPiece < Piece
    include Singleton

    def initialize
        @color = nil
    end

    def symbol
        nil
    end

    def inspect
        p " "
    end
end
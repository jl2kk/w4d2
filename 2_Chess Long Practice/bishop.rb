require_relative "piece.rb"
require_relative "slideable.rb"


class Bishop < Piece
    include Slideable
 
    def move_dirs
        diagonal_dirs
    end

    def symbol
     "♗"
    end
 
    def inspect
     p  "♗"
    end
    
 end
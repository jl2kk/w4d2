require_relative "piece.rb"
require_relative "slideable.rb"


class Queen < Piece
    include Slideable
    

    def move_dirs
        diagonal_dirs.dup.concat(horizontal_dirs.dup)
    end
 
    def symbol
     "♕"
    end
 
    def inspect
     p  "♕"
    end
    
 end
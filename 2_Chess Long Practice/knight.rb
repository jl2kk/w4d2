require_relative "piece.rb"
require_relative "stepable.rb"

class Knight < Piece
    include Stepable

    def move_dirs
        horse_step
    end

    def symbol
     "♘"
    end
 
    def inspect
     p  "♘"
    end
    
 end
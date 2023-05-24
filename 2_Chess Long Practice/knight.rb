require_relative "piece.rb"
require_relative "steppable.rb"

class Knight < Piece

    def move_dirs
     include Steppable
    end
 
    def symbol
     "♘"
    end
 
    def inspect
     p  "♘"
    end
    
 end
require_relative "piece.rb"
require_relative "slideable.rb"


class Bishop < Piece

    def move_dirs
     include Steppable
    end
 
    def symbol
     "♗"
    end
 
    def inspect
     p  "♗"
    end
    
 end
require_relative "piece.rb"
require_relative "steppable.rb"

class King < Piece
    def initialize
    end

   def move_dirs
    include Steppable
   end

   def symbol
    *image*
   end
   
end
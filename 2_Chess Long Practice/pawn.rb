require_relative "piece.rb"
require "byebug"

class Pawn < Piece

   def moves
      grow_unblocked_moves_in_dir
   end

   def grow_unblocked_moves_in_dir
      arr = []
      row,col = @pos
      
      if self.color == :white
         if self.pos[0] == 6
            arr << [row-1,col] if @board[[row-1,col]].empty?
            arr << [row-2,col] if @board[[row-1,col]].empty? && @board[row-2,col].empty?
         else
            arr << [row-1,col] if @board[[row-1,col]].empty?
         end
         arr << [row-1, col-1] if @board[[row-1, col-1]].color == :black
         arr << [row-1, col+1] if @board[[row-1, col+1]].color == :black
      end

      if self.color == :black
         if self.pos[0] == 1
            arr << [row+1,col] if @board[[row+1,col]].empty?
            arr << [row+2,col] if @board[[row+1,col]].empty? && @board[[row+2,col]].empty?
         else
            arr << [row+1,col] if @board[[row+1,col]].empty?
         end
         arr << [row+1, col-1] if @board[[row+1, col-1]].color == :white
         arr << [row+1, col+1] if @board[[row+1, col+1]].color == :white
      end

      arr

   end
   

   def symbol
    "♙"
   end

   def inspect
    p  "♙"
   end
   
end
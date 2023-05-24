require_relative "piece.rb"
require_relative "stepable.rb"

class King < Piece
   include Stepable
   
   def move_dirs
      one_step
   end

   def grow_unblocked_moves_in_dir(dy,dx)
      arr = []
      row,col = @pos #5,5

      delta = [dy,dx] #-1,-1
      current_color = self.color
          
      new_pos = [row + dy, col + dx] #4,4
      return arr if !new_pos[0].between?(0,7) || !new_pos[1].between?(0,7)
      return arr if @board[new_pos].color == @board[@pos].color
      return arr << new_pos if @board[new_pos].color != self.color && @board[new_pos].color != nil
      arr << new_pos
      arr.reject {|pos| move_into_check.include?(pos)} 
   end

   def move_into_check
      all_poss_moves = []

      @board.grid.each do |row|
          row.each do |piece|
              if piece.color != self.color && !piece.is_a?(Pawn) && !piece.is_a?(NullPiece)
                  all_poss_moves << piece.moves
   #            elsif piece.is_a?(Pawn)
   #              row,col = pos
   #               if piece.color == :black
   #                  all_poss_moves << piece[row-1][col+1]
   #                  all_poss_moves << piece[row-1][col-1]
   #               elsif piece.color == :white
   #                  all_poss_moves << piece[row+1][col+1]
   #                  all_poss_moves << piece[row+1][col-1]
   #               end
              end
          end
      end
      all_poss_moves
   end


   def symbol
    "♔"
   end

   def inspect
    p  "♔"
   end
   
end
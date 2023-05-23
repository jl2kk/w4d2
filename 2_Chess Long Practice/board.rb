# require_relative "cursor.rb"
require_relative "null_piece.rb"
# require "piece.rb"
require "byebug"

class Board
    attr_reader :grid

    def initialize
        @null_piece = NullPiece.instance
        @grid = Array.new(8){Array.new(8,@null_piece)}
    end

    def [](pos)
        # debugger
        row,col = pos
        grid[row][col]
    end

    def []=(pos,value)
        row,col = pos
        grid[row][col] = value
    end

    def move_piece(color,start_pos,end_pos)
        if self[start_pos].is_a?(NullPiece)
            raise "there is no piece here dumbass"
        end

        unless valid_pos?(end_pos)
            raise "not a valid move"
        end


        self[end_pos] = self[start_pos]
        self[start_pos] = @null_piece
    end

    def valid_pos?(pos)
        row,col = pos
        row.between?(0,7) && col.between?(0,7)
    end


    def render
        
    end
end

# b = Board.new

# start_pos = [2,3]
# end_pos = [0,0]
# # debugger
# b[start_pos] = "HELLO I AM A ROOK"
# b.move_piece('black',start_pos,end_pos)
# p b
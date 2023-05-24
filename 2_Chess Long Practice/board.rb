# require_relative "cursor.rb"
require_relative "null_piece.rb"
# require "piece.rb"
require_relative "king.rb"
require_relative "knight.rb"
require_relative "pawn.rb"
require_relative "bishop.rb"
require_relative "queen.rb"
require_relative "rook.rb"
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

    def add_piece(piece,pos)
        self[pos] = piece
    end 


    def create_board
        grid.each_with_index do |row,row_idx|
            if [1,6].include?(row_idx)
                (0...row.length).each do |col_idx|
                    row[col_idx] = Pawn.new(:white,self,[row_idx,col_idx])
                end 
            elsif [0,7].include?(row_idx)
                (0...row.length).each do |col_idx|
                    if [0,7].include?(col_idx)
                        row[col_idx] = Rook.new(:white,self,[row_idx,col_idx])
                    elsif [1,6].include?(col_idx)
                        row[col_idx] = Knight.new(:white,self,[row_idx,col_idx])
                    elsif [2,5].include?(col_idx)
                        row[col_idx] = Bishop.new(:white,self,[row_idx,col_idx])
                    elsif col_idx == 3
                        row[col_idx] = Queen.new(:white,self,[row_idx,col_idx])
                    elsif col_idx == 4 
                        row[col_idx] = King.new(:white,self,[row_idx,col_idx])
                    end 
                end 
            end 
        end 

        # [0,1].each do |row_idx|
        #     grid[row_idx].each {|piece| piece.color = :black}
        # end 
        # [6,7].each do |row_idx|
        #     grid[row_idx].each {|piece| piece.color = :white}
        # end 
    end
end

# b = Board.new

# start_pos = [2,3]
# end_pos = [0,0]
# # debugger
# b[start_pos] = "HELLO I AM A ROOK"
# b.move_piece('black',start_pos,end_pos)
# p b
# require_relative 'board.rb'

class Piece
    attr_accessor :color, :pos

    def initialize(color,board,pos)
        @color = color
        @board = board
        @pos = pos
        #@board[@pos] = self #would this make sense to have??
    end

    def empty?(pos)
        board[pos].is_a?(NullPiece)
    end

    # def pos=(val)
    #     @board.move_piece(@color,@pos,val)
    #             #check whether this continues to make sense
    #             # as we build out more methods
    #     @pos = val
    # end

    private
    def move_into_check?(end_pos)
        # i am this piece instance, if i move to end_pos
        #does that put the king in check based on my poss moves
    end


end
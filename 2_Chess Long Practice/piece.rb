require_relative 'board.rb'

class Piece
    def initialize(color,board,pos)
        @color = color
        @board = board
        @pos = pos
        #@board[@pos] = self #would this make sense to have??
    end

    def empty?(pos)
        board[pos].is_a?(NullPiece)
    end

    # def valid_moves
    #     poss_moves = []
    #     #INCOMPLETE METHODS - THESE ARE JUST CONCEPTUAL
    #     poss_moves <<  EACH [pos + steppable moves for that piece]
    #     poss_moves.select {the ones where it wont error out}
    # end

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
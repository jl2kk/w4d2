
module Slideable
    HORIZONTAL_DIRS = [
        [0, -1], # left
        [0, 1], # right
        [-1, 0], # up
        [1, 0] # down
    ].freeze

    DIAGONAL_DIRS = [
        [-1, -1], # up_left
        [-1, 1], # up_right
        [1, 1], #down_right
        [1, -1] #down_left
    ].freeze

    def horizontal_dirs
        HORIZONTAL_DIRS
    end
    
    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        all_moves = []
        move_dirs.each do |dy, dx|
            all_moves << grow_unblocked_moves_in_dir(dy, dx)
        end
        all_moves
    end

    def move_dirs
        raise NotImplementedError if nil
    end

    def grow_unblocked_moves_in_dir(dy,dx)
        arr = []
        row,col = @pos #5,5
       
        delta = [dy,dx] #-1,-1
        current_color = self.color
        invalid = false
        until invalid
            new_pos = [row + dy, col + dx] #4,4
            return arr if !new_pos[0].between?(0,7) || !new_pos[1].between?(0,7)
            return arr if @board[new_pos].color == @board[@pos].color
            return arr << new_pos if @board[new_pos].color != self.color && @board[new_pos].color != nil
            arr << new_pos
            dy += delta[0]
            dx += delta[1]
        end

    end



end
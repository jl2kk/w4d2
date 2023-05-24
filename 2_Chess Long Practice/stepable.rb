
module Stepable
    ONE_STEP = [
        [0, -1], # left
        [0, 1], # right
        [-1, 0], # up
        [1, 0], # down
        [-1, -1], # up_left
        [-1, 1], # up_right
        [1, 1], #down_right
        [1, -1] #down_left
    ].freeze

    HORSE_STEP = [
        [-2, -1], # up_left
        [-2, 1], #up_right
        [-1, -2], # left_up 
        [1, -2], # left_down 
        [-1, 2], # right_up 
        [1, 2], # right_down
        [2, -1], # down_left 
        [2, 1] # down_right
    ].freeze

    def one_step
        ONE_STEP
    end

    def horse_step
        HORSE_STEP
    end

    def moves
        all_moves = []
        move_dirs.each do |dy,dx|
            all_moves << grow_unblocked_moves_in_dir(dy,dx)
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
            
        new_pos = [row + dy, col + dx] #4,4
        return arr if !new_pos[0].between?(0,7) || !new_pos[1].between?(0,7)
        return arr if @board[new_pos].color == @board[@pos].color
        return arr << new_pos if @board[new_pos].color != self.color && @board[new_pos].color != nil

        arr << new_pos
    
    end

   
end
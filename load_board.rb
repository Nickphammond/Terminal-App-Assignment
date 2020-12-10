

# Method to give default/empty board
def board(x,y)
    if y%14==0
        return "|"
    elsif x%7==0
        return "|"
    else
        return " "
    end
end


#  Method to give character at position
def grid_pos(x,y)
    return board(x,y)
end



# Method to print board to terminal

def print_board(numx,numy)
    for i in 0..numx
        for j in 0..numy
            print grid_pos(i,j)
        end
    print "\n"
    end
end
print_board(21,42)
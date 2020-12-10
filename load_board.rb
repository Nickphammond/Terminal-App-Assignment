
require 'io/console'
require "timeout"

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
def grid_pos(x,y, state)
    if state == "a" && x==4 && y==7
        return "a"
    else
        return board(x,y)
    end
end



# Method to print board to terminal

def print_board(numx,numy,state)
    for i in 0..numx
        for j in 0..numy
            print grid_pos(i,j,state)
        end
    print "\n"
    end
end
# print_board(21,42)


def board_cycle()
    system("clear")
    print_board(21,42,"r")
    begin
        status = Timeout::timeout(2) {
            
            str = STDIN.getch
            system("clear")
            if str == "a"
                print_board(21,42,str)
            elsif str == 'q'
                return "end"
            end
            
        }
    rescue
        board_cycle
    end
end

board_cycle
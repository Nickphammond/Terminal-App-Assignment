
require 'io/console'
require "timeout"

state0 = 0
timer = 1

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


def give_state(prev)
    if timer%20 == 0
        return (prev +1)%15
    else
        timer = timer + 1
    end
end



# Create module to give x and y coordinates for a particular state
module Coordinates

    def x(state)
        
        return (state/3)*7 + 4
        
    end

    def y(state)

        return (state%3)*14 + 7

    end

end

class Coord
    include Coordinates
end




#  Method to give character at position
def grid_pos(x,y, state)
    if x==Coord.new.x(state) && y==Coord.new.y(state)
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




def input_to_pos(str)
    if str == "w"
        return 0
    elsif str == "e"
        return 1
    elsif str == "r"
        return 2
    elsif str == "s"
        return 3
    elsif str == "d"
        return 4
    elsif str == "f"
        return 5
    elsif str == "x"
        return 6
    elsif str == "c"
        return 7
    elsif str == "v"
        return 8
    else
        return 1000
    end

end


def board_cycle(state)
    system("clear")
    puts state
    if state != 100
        print_board(21,42,state)
        begin
            status = Timeout::timeout(2) {
                
                str = STDIN.getch
                system("clear")
                puts state
                puts input_to_pos(str)
                if input_to_pos(str) != 1000
                    if input_to_pos(str) == state
                        return board_cycle(100)
                    end
                elsif str == 'q'
                    return "end"
                end
                
                
                return nick.to_i
            }
        rescue
            state = give_state(state)
            board_cycle(state)
        end
    else
        puts "You Win!!"
    end
end

board_cycle(state0)


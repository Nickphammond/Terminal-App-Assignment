
require 'io/console'
require "timeout"
require 'colorize'

state0 = 20
$timer = 1

# Method to give default/empty board
def board(x,y)
    if y%14==0
        return "o".colorize(:color => :light_cyan, :background => :light_green)
    elsif x%7==0
        return "o".colorize(:color => :light_cyan, :background => :light_green)
    else
        return "#".colorize(:color => :light_magenta, :background => :light_white)
    end
end


def give_state(prev)
    if $timer%20 == 0
        return rand(1..25)
    else
        
        return prev
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
            status = Timeout::timeout(0.1) {
                
                str = STDIN.getch
                system("clear")

                

                if input_to_pos(str) != 1000
                    if input_to_pos(str) == state
                        return board_cycle(100)
                    end
                elsif str == 'q'
                    return "end"
                end
                
                puts "blah"
                return nick.to_i
            }
        rescue
            $timer = $timer + 1
            state = give_state(state)
            board_cycle(state)
        end
    else
        puts "You Win!!"
    end
end



board_cycle(state0)




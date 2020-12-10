
require 'io/console'
require "timeout"

state0 = 1

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
    return (prev +1)%5
end

#  Method to give character at position
def grid_pos(x,y, state)
    if state == 0 && x==4 && y==7
        return "a"
    elsif state == "b" && x==4 && y==7
        return "b"
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


def board_cycle(state)
    system("clear")
    puts state
    if state != 100
        print_board(21,42,state)
        begin
            status = Timeout::timeout(2) {
                
                str = STDIN.getch
                system("clear")
                if str == "a" && state == 0
                    return board_cycle(100)
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
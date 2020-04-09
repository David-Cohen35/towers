require "byebug"
class Towers

    attr_reader :arr

    def initialize(arr)
        @arr = arr
        
    end

    def input
        # until arr[0].empty? && arr[1].empty?
        
        # raise_error if !valid_input?(input)
        
        puts 'Enter a pile to select from and a pile to deposit'
        input = gets.chomp.split.map(&:to_i)
        
        until valid_input?(input)
            puts 'Enter a pile to select from and a pile to deposit'
            input = gets.chomp.split.map(&:to_i)
            puts "Please try again with valid numbers"
        end
        input
            
    
    end

    def valid_input?(pos)
        return false if self.arr[pos[0]].nil?
        
        return false if self.arr[pos[0]].empty?

        return false if pos[0] == pos[1]

        pos.all? { |ele| (0...self.arr.length).include?(ele) }
    end

    def move
        # debugger
        until won?
            pos = self.input
            ele = self.arr[pos[0]].pop
            self.arr[pos[1]] << ele
        end

    end

    def won?
        return true if self.arr[0].empty? && self.arr[1].empty?
        false
    end

end

t = Towers.new([[3], [], []])
t.move
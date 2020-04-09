require "byebug"
class Array

    def my_uniq
        arr = []
        hash = Hash.new(0)
        self.each { |ele| hash[ele] += 1 }
        hash.keys
    end

    def two_sum
        arr = []
        self.each_with_index do |ele1, idx1|
            self.each_with_index do |ele2, idx2|
                if (ele1 + ele2 == 0 && idx2 > idx1)
                    arr << [idx1, idx2]
                end
            end
        end
        arr
    end

    def my_transpose
        raise "must be a 2D array" if self == self.flatten 
        arr = Array.new(self.length) {Array.new}
        self.each_with_index do |ele1, idx1| #x
            self.each_with_index do |ele2, idx2| #y
                arr[idx1][idx2] = self[idx2][idx1]
            end
        end
        arr
    end
    
    def stock_picker
        [self.index(self.min), self.index(self.max)]
    end

end


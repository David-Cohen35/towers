require 'rspec'
require 'TDD.rb'
require 'towers'

describe Array do
    subject(:arr) { Array.new }

    describe "#remove_dups" do 
        it "removes duplicate elements from an array" do 
            expect([1, 2, 2].my_uniq).to eq([1, 2])
        end

        it "returns the unique elements in the order in which they first appeared" do 
            expect([1, 2, 1, 3, 3].my_uniq).to eq([1, 2, 3])
        end
    end

    describe "#two_sum" do
        it "finds all pairs of positions where all elements at those positions sum to zero" do 
            expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
        end

        it "puts smaller elements first" do
            expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
        end
    end

    describe "#my_transpose" do 
        it "takes in a 2D array" do 
            expect{[[1,2],[3,4]].my_transpose }.to_not raise_error
        end

        it "raises an error if it's not a 2D array" do 
            expect{[1,2,3,4].my_transpose}.to raise_error("must be a 2D array")
        end

        it "returns a new 2D array where the rows become the columns" do 
            expect([[0, 1, 2],[3, 4, 5],[6, 7, 8]].my_transpose).to eq([[0, 3, 6], [1, 4, 7],[2, 5, 8]])
        end
    end

    describe "#stock_picker" do 
        it "takes in an array" do
            expect{ [2,3,4].stock_picker }.to_not raise_error
        end

        it "should return in indices of a pair of the minimum and maximum numbers" do
            expect([1, 2, 3, 5, 6, 7, 8].stock_picker).to eq([0, 6])
        end
    end
end

describe Towers do 
    subject(:tower) {Towers.new([[3],[],[]])}

    describe "#intialize" do 
        it "takes in a 2D array" do 
            expect{Towers.new([[1,2,3],[4,5,6],[]])}.to_not raise_error
        end

        # it "should set an array instance variable equal to the 2D array" do 
        #     expect{tower.arr}.to_not raise_error
        # end

        it "should have a length of three" do
            expect(tower.arr.length).to eq(3)
        end
        

        it "sets the second subarray to an empty array" do 
            expect(tower.arr[1]).to be_empty
        end

        it "sets the third subarray to an empty array" do 
            expect(tower.arr[2]).to be_empty
        end

    end

    describe "#input" do
    
        # it "uses #gets to obtain user input" do 
        #     expect(tower.input).to eq("4")
        # end

        # it "should call #valid_input" do
        #     expect(tower.input).to receive(:valid_input?)
        # end

        # it "should use #gets to return an array" do 
        #     expect(tower.input).to eq([0, 1])
        # end
 
    end

    describe "#valid_input?" do

        it "should take in an array of two numbers" do 
            expect{tower.valid_input?([1, 2])}.to_not raise_error
        end

        it "should not pick up from an empty array" do 
            expect(tower.valid_input?([1, 2])).to eq(false)
        end

        it "should not depsoit in the same array it picked up from" do 
            expect(tower.valid_input?([1, 1])).to eq(false)
        end

        it "should pick up and deposit from valid array positions" do 
            expect(tower.valid_input?([4,5])).to eq(false)
        end 

        it "should return a boolean" do 
            expect(tower.valid_input?([0,1])).to eq(true)
        end

    end

    describe "#move" do 
    
        it "should add the element to the second number position array" do
            expect(tower.move([0,1])).to eq(tower.arr[1] + tower.arr[0][-1])
        end
        it "should remove an element from the first number positon array" do 
            expect(tower.move([0,1])).to eq(tower.arr[0..-2])
        end
    end
        
end





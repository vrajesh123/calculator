require "calculator"

describe Calculator do

  let(:calc){ Calculator.new }

  describe "#add" do
    it "returns an integer" do
      expect(calc.add 1, 1).to be_an Integer
    end

    context "when adding zero to an integer" do
      it "returns the integer" do
        expect(calc.add 4, 0).to eq 4
      end
    end

    it "is not dependent on the operation order" do
      expect(calc.add 1, 2).to eq calc.add(2, 1)
    end

    it "accepts more than 2 arguments" do
      expect(calc.add 2, 4, 3).to eq 9
    end
  end

    describe "#subtraction" do
      it "returns an integer" do
        expect(calc.subtraction 4, 1).to be_an Integer
      end

      context "the order of operation should matter" do
        it {expect(calc.subtraction 1, 2).should_not eq calc.subtraction(2, 1)}
      end
    
      context "when subtacting an integer from itself should return zero" do
        it {expect(calc.subtraction 4, 4).to eq 0}
      end

      context "when should accept more than 2 numbers at a time" do
        it {expect(calc.subtraction 8, 4, 3).to eq 1}
      end
 
      context "when subtracting zero from an Integer" do
        it "returns the integer" do
          expect(calc.subtraction 4, 0).to eq 4
        end
      end
    end

    describe "#multiplication" do
      it "returns an integer" do
        expect(calc.multiplication 2, 4).to be_an Integer
      end
    

    context "the order of operation should not matter" do
      it {expect(calc.multiplication 2, 5).to eq calc.multiplication(5, 2)}
    end

    context "multiplying an integer by one should return the first integer" do
      it {expect(calc.multiplication 7, 1).to eq 7}
    end
  
    context "multiplying an integer by zero should return zero" do
      it {expect(calc.multiplication 6, 0).to eq 0}
    end

    context "should accept more than 2 numbers at a time" do
      it {expect(calc.multiplication 3, 5, 2 ).to eq 30}
    end
  end

    describe "#division" do
      
      context "returns an integer" do
        it {expect(calc.division 10, 2).to be_an Integer}
      end

      context "the order of operation should matter (not commutative)" do
        it {expect(calc.division 20, 5).should_not eq calc.division(5, 20)}
      end

      context "dividing an integer by one should return the first integer" do
        it {expect(calc.division 30, 1).to eq 30}
      end

      context "dividing zero by an integer should return zero" do
        it {expect(calc.division 0, 13).to eq 0}
      end

      it "dividing an integer by zero should raise an error" do
         expect{calc.division 18, 0}.to raise_error
      end

      context "should accept more than 2 numbers at a time" do
        it {expect(calc.division 100, 10, 2).to eq 5}
      end

    end

end

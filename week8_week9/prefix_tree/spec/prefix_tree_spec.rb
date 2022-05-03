#create prefix tree tests

require '../prefix_tree'
require 'rspec/autorun'

describe PrefixTree do
  subject(:tree) { described_class.new }

  describe "#add" do
    context "check add string method" do
      it "add string in tree" do
        tree.add('string')
        tree.add('str')

        expect(tree.dictionary.values).to eq(['string', 'str'])
      end

      it "add int by converting string in tree" do
        tree.add('1')
        tree.add('str')

        expect(tree.dictionary.values).to eq(['1', 'str'])
      end

      it "don't add same string twice" do
        tree.add('str')
        tree.add('str')

        expect(tree.dictionary.values).to eq(['str'])
      end
    end
  end

  describe "#include?" do
    context "tree include strings" do
      it "tree include str" do
        tree.add('str')
        tree.add('string')

        expect(tree.include?('str')).to be_truthy
      end

      it "tree include string" do
        tree.add('str')
        tree.add('string')

        expect(tree.include?('string')).to be_truthy
      end

      it "tree don't include strin" do
        tree.add('str')
        tree.add('string')

        expect(tree.include?('strin')).to be_falsey
      end
    end
  end

  describe "#delete" do
    context "delete string from tree" do
      it "delete string" do
        tree.add('str')
        tree.add('string')
        tree.delete('str')

        expect(tree.include?('str')).to be_falsey
      end

      it "delete string but other string stay" do
        tree.add('str')
        tree.add('string')
        tree.delete('str')

        expect(tree.include?('string')).to be_truthy
      end

      it "delete string which don't exist" do
        tree.add('str')
        tree.add('string')

        expect(tree.delete('mmd')).to eq(NO_WORD)
      end
    end
  end

  describe "#list" do
    context "check list method" do
      it "add some string and find list" do
        tree.add('string')
        tree.add('strw')
        tree.add('str')
        tree.add('stm')
        answer = "string\nstrw\nstr\n"

        expect { tree.list('str') }.to output(answer).to_stdout
      end

      it "add and delete some string and find list" do
        tree.add('string')
        tree.add('strw')
        tree.add('str')
        tree.add('stm')
        tree.delete('string')
        answer = "strw\nstr\n"
        
        expect { tree.list('str') }.to output(answer).to_stdout
      end

      it "add and delete, add some string and find list" do
        tree.add('string')
        tree.add('strw')
        tree.add('str')
        tree.add('stm')
        tree.delete('string')
        tree.add('string')
        answer = "strw\nstr\nstring\n"
        
        expect { tree.list('str') }.to output(answer).to_stdout
      end

      it "puts every word when input noting" do
        tree.add('string')
        tree.add('strw')
        tree.add('str')
        tree.add('stm')
        tree.delete('string')
        tree.add('string')
        answer = "strw\nstr\nstm\nstring\n"

        expect { tree.list('') }.to output(answer).to_stdout
      end

      it "puts nothing when input value is not in tree" do
        tree.add('string')
        tree.add('strw')
        tree.add('str')
        tree.add('stm')
        tree.delete('string')
        tree.add('string')
        answer = ""

        expect { tree.list('mm') }.to output(answer).to_stdout
      end
    end
  end
end



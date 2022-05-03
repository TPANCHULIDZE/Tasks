# create tests for node class

require '../node'
require 'rspec/autorun'

describe Node do
  subject(:root) { described_class.new }

  describe "#initialize" do
    context "check root attributs" do
      it "root value is root" do
        expect(root.value).to eq('root')
      end

      it "root children is empty" do
        expect(root.children.empty?).to be_truthy
      end

      it "nodes include root" do
        expect(Node.nodes.include?(root)).to be_truthy
      end

      it "root is not end point" do
        expect(root.is_end_point).to be_falsey
      end

      it "root number_size is 0" do
        expect(root.number_size).to be_zero
      end 
    end

    context "create node and check attributs" do
      subject(:node) { described_class.new('t') }

      it "mode value is root" do
        expect(node.value).to eq('t')
      end

      it "node children is empty" do
        expect(node.children.empty?).to be_truthy
      end

      it "nodes include node" do
        expect(Node.nodes.include?(node)).to be_truthy
      end

      it "node is not end point" do
        expect(node.is_end_point).to be_falsey
      end

      it "node number_size is 0" do
        expect(node.number_size).to be_zero
      end
    end
  end

  describe "#create_child" do
    subject(:node) { described_class.new('t') }

    context "create child for node" do
      subject(:first_child_node) { node.create_child('m') }
      subject(:second_child_node) { node.create_child('d') }
      subject(:not_child_node) { described_class.new('d') }

      it "node children is not empty" do
        expect(node.children.empty?).to be_truthy
      end

      it "check first_child_node" do
        expect(node.children.include?(first_child_node)).to be_truthy
      end

      it "check second_child_node" do
        expect(node.children.include?(second_child_node)).to be_truthy
      end

      it "check that not_child_node" do
        expect(node.children.include?(not_child_node)).to be_falsey
      end

      it "node children" do
        expect(node.children).to eq([first_child_node, second_child_node])
      end
    end
  end

  describe "#nodes" do
    subject(:node) { described_class.new('t') }

    context "see every node" do
      subject(:first_child_node) { node.create_child('m') }
      
      it "node is part of nodes" do
        expect(Node.nodes.include?(node)).to be_truthy
      end

      it "first_child_node is part of node" do
        expect(Node.nodes.include?(first_child_node)).to be_truthy
      end

      subject(:second_child_node) { node.create_child('d') }
            
      it "second_child_node is part of nodes" do
        expect(Node.nodes.include?(second_child_node)).to be_truthy
      end

      subject(:other_child_node) { described_class.new('d') }

      it "other_child_node is part of nodes" do
        expect(Node.nodes.include?(other_child_node)).to be_truthy
      end
    end
  end

  describe "#to_s" do
    subject(:node) { described_class.new('t') }

    context "to_s is puts values" do
      subject(:first_child_node) { node.create_child('m') }
      subject(:second_child_node) { node.create_child('d') }
      subject(:not_child_node) { described_class.new('d') }

      it "puts nodes children" do
        expect(first_child_node.to_s).to eq('m')
      end

      it "puts nodes children" do
        expect(second_child_node.to_s).to eq('d')
      end

      it "puts nodes children" do
        expect(node.to_s).to eq('t')
      end
    end
  end

  describe "#include?" do
    subject(:node) { described_class.new('t') }

    context "check include? method" do
      subject(:first_child_node) { node.create_child('m') }
      
      it "node children include first_child_node" do
        expect(node.include?(first_child_node.to_s)).to be_truthy
      end

      subject(:second_child_node) { node.create_child('d') }
      
      it "node children include second_child_node" do
        expect(node.include?(second_child_node.to_s)).to be_truthy
      end

      subject(:not_child_node) { described_class.new('d') }

      it "node children not include not_child_node" do
        expect(node.include?(not_child_node.to_s)).to be_falsey
      end
    end
  end

  describe "#find" do
    subject(:node) { described_class.new('t') }

    context "check find function" do
      subject(:first_child_node) { node.create_child('m') }
      subject(:second_child_node) { node.create_child('d') }
      subject(:not_child_node) { described_class.new('d') }

      it "return first_child_node" do
        expect(node.find(first_child_node.to_s)).to equal(first_child_node)
      end

      it "return second_child_node" do
        expect(node.find(second_child_node.to_s)).to equal(second_child_node)
      end

      it "return first_child_node" do
        expect(node.find(not_child_node.to_s)).to be_falsey
      end
    end
  end

  describe "#delete_node" do
    subject(:node) { described_class.new('t') }

    context "check delete_node method" do
      subject(:first_child_node) { node.create_child('m') }
      subject(:second_child_node) { node.create_child('d') }
      subject(:not_child_node) { described_class.new('d') }

      it "delete_node from node" do
        second_child_node.increment_size
        node.delete_node
        expect(node.children).to eq([second_child_node])
      end

      it "delete_node from node" do
        node.delete_node
        expect(node.children).to be_empty
      end
    end
  end

  describe "#become_end_point" do
    subject(:node) { described_class.new('t') }

    context "check become_end_point method" do
      subject(:first_child_node) { node.create_child('m') }
      subject(:second_child_node) { node.create_child('d') }
      subject(:not_child_node) { described_class.new('d') }

      it "when node is not is_end_point and and become end point" do
        node.become_end_point
        expect(node.is_end_point).to be_truthy
      end

      it "when node is not end point" do
        expect(node.is_end_point).to be_falsey
      end
    end
  end

  describe "#not_end_point" do
    subject(:node) { described_class.new('t') }

    context "check not_end_point method" do
      subject(:first_child_node) { node.create_child('m') }
      subject(:second_child_node) { node.create_child('d') }
      subject(:not_child_node) { described_class.new('d') }

      it "when node is_end_point and and become not end point" do
        node.not_end_point
        expect(node.is_end_point).to be_falsey
      end
    end
  end

  describe "#increment_size" do
    subject(:node) { described_class.new('t') }

    context "check increment_size method" do
      subject(:first_child_node) { node.create_child('m') }
      subject(:second_child_node) { node.create_child('d') }
      subject(:not_child_node) { described_class.new('d') }

      it "increment_size" do
        node.increment_size
        expect(node.number_size).to eq(1)
      end

      it "increment_size twice" do
        node.increment_size
        node.increment_size
        expect(node.number_size).to eq(2)
      end
    end
  end

  describe "#decrement_size" do
    subject(:node) { described_class.new('t') }

    context "check decrement_size method" do
      subject(:first_child_node) { node.create_child('m') }
      subject(:second_child_node) { node.create_child('d') }
      subject(:not_child_node) { described_class.new('d') }

      it "increment_size and decrement_size" do
        node.increment_size
        node.decrement_size
        expect(node.number_size).to eq(0)
      end

      it "increment_size twice and decrement_size ones" do
        node.increment_size
        node.increment_size
        node.increment_size
        node.decrement_size
        expect(node.number_size).to eq(2)
      end
    end
  end

  describe "#add_strings_indexs" do
    subject(:node) { described_class.new('t') }

    context "check add_strings_indexs method" do
      subject(:first_child_node) { node.create_child('m') }
      subject(:second_child_node) { node.create_child('d') }
      subject(:not_child_node) { described_class.new('d') }

      it "add_strings_indexs 2 times" do
        first_child_node.add_strings_indexs(10)
        first_child_node.add_strings_indexs(12)
        expect(first_child_node.strings_indexs).to eq([10, 12])
      end

      it "add_strings_indexs 4 times" do
        node.add_strings_indexs(10)
        node.add_strings_indexs(12)
        node.add_strings_indexs(14)
        node.add_strings_indexs(11)
        expect(node.strings_indexs).to eq([10, 12, 14, 11])
      end
    end
  end

  describe "#delete_strings_indexs" do
     subject(:node) { described_class.new('t') }

    context "check delete_strings_indexs method" do
      subject(:first_child_node) { node.create_child('m') }
      subject(:second_child_node) { node.create_child('d') }
      subject(:not_child_node) { described_class.new('d') }

      it "delete strings indexs" do
        first_child_node.add_strings_indexs(10)
        first_child_node.add_strings_indexs(12)
        node.add_strings_indexs(10)
        node.add_strings_indexs(12)
        node.add_strings_indexs(14)
        node.add_strings_indexs(11)
        node.delete_strings_indexs
        expect(node.strings_indexs).to eq([14, 11])
      end
    end
  end

  describe "#delete_elemnt" do
    subject(:node) { described_class.new('t') }

    context "check delete_elemnt method" do
      it "delete element which value is 5" do
        node.add_strings_indexs(5)
        node.add_strings_indexs(6)
        node.add_strings_indexs(3)
        node.delete_element(6)
        expect(node.strings_indexs).to eq([5, 3])
      end
    end
  end
end



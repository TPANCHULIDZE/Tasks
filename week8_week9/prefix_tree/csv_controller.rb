# CSV file reader and writer

require_relative 'prefix_tree'

class CsvController
  def initialize(tree = PrefixTree.new)
    @tree = tree
  end

  def fill_csv
    strings = @tree.dictionary.map do |key, value| 
      [key, value]
    end
    CSV.open('dictionary.csv', 'w') do |csv|
      csv << %w(id name)
      strings.each do |string|
        csv << string
      end
    end 
  end

  def read_csv
    strings = CSV.parse(File.read('strings_for_tree.csv'), headers: true).by_col[1]
    fill_tree(strings)
  end

  private

  def fill_tree(strings)
    strings.each do |string|
      @tree.add(string)
    end
  end
end

tree = PrefixTree.new()

tree.add('dsbh')
tree.add("mmss")
tree.delete('dsbh')
tree.add('string')


csv_controller = CsvController.new(tree)

csv_controller.read_csv
csv_controller.fill_csv



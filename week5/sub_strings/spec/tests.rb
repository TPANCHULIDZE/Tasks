# find dictionary words which included input word

require '../sub_strings'
require 'rspec/autorun'
require 'faker'
  
ERROR_MESSAGE = "every input value must be string"

describe Dictionary do 
  it "check which word is part of dictionary" do
    dictionary = %w[below down go going horn how howdy it i low part partner sit]
    answer = { "below" => 1, "low" => 1 }
    expect(Dictionary.new("below", dictionary).call.sort).to eq answer.sort
  end

  it "check if long string contain words from dictionary" do
    dictionary = %w[below down go going horn how howdy it i low own part partner sit]
    answer = { 
      "down" => 1, "go" => 1, "going" => 1, "how" => 2, "howdy" => 1, "it" => 2,
      "i" => 3, "own" => 1, "part" => 1, "partner" => 1, "sit" => 1 
    }
    input = "Howdy partner, sit down! How's it going?"
    output = Dictionary.new(input, dictionary).call
    expect(output.sort).to eq answer.sort
  end

  it "check when input string is empty" do 
    dictionary = %w[below down go going horn ho it i low own pt partner sit]
    input = ""
    output = Dictionary.new(input, dictionary).call
    answer = {}
    expect(output).to eq answer
  end

  it "return error if directory is include only string" do
    dictionary = ["sdjn", "rmsd,n", 1, "esj,dn"]
    input = "s"
    expect(Dictionary.new(input, dictionary).call).eql? ERROR_MESSAGE
  end

  it "return error if input string is not string" do 
    dictionary = ["sdjn", "rmsd,n", "esj,dn"]
    input = 1
    expect(Dictionary.new(input, dictionary).call).eql? ERROR_MESSAGE
  end

  it "return error when input string and directory contain integer" do 
    dictionary = ["sdjn", 1, "rmsd,n", "esj,dn"]
    input = 1
    expect(Dictionary.new(input, dictionary).call).eql? ERROR_MESSAGE
  end

  it "when input string is one symbol" do 
    dictionary = ["sdjn", "rmsd,n", "esj,dn"]
    input = 's'
    answer = {}
    expect(Dictionary.new(input, dictionary).call).to eq answer
  end

  it "when directory contain same words" do 
    dictionary = ["ss", "ss", "esj,dn"]
    input = 'sshh'
    answer = { 'ss' => 1 }
    expect(Dictionary.new(input, dictionary).call.sort).to eq answer.sort
  end
end



require './Lazy.rb'

RSpec.describe Lazy do
  it "has a class method 'answer'" do
    expect(Lazy.methods.include?(:answer)).to be_truthy
  end
  it "only takes one parameter" do
    expect(Lazy.answer).to raise_error(ArgumentError)
    expect(Lazy.answer(1,2)).to raise_error(ArgumentError)
  end
  it "confirms that parameter is an existing file" do
    expect(Lazy.answer('test')).to raise_error
  end
  it "loads the answer sheet into an array of hashes" do
    expect(Lazy.answer('test.txt').sample.class).to eq(Array)
  end
  it "passes back a string" do
    expect(Lazy.answer('test.txt').class).to eq(String)
  end
  it "correctly identifies the most common answers" do
    test_data = [%w{ABC},%w{ABC},%w{BCA}]
    expect( Lazy.test_answer(test_data)).to eq('ABC')
  end
end

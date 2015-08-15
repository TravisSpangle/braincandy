require './Lazy.rb'

RSpec.describe Lazy do
  it "has a class method 'answer'" do
    expect(Lazy.methods.include?(:answer)).to be_truthy
  end
  it "only takes one parameter" do
    expect{Lazy.answer}.to raise_error(ArgumentError)
    expect{Lazy.answer(1,2)}.to raise_error(ArgumentError)
  end
  it "confirms that parameter is an existing file" do
    expect{Lazy.answer('test')}.to raise_error(RuntimeError)
  end
  it "passes back a string" do
    expect(Lazy.answer('test.txt').class).to eq(String)
  end
  it "correctly identifies the most common answers" do
    expect( Lazy.answer('small_sample.txt')).to eq('ABC')
  end
end

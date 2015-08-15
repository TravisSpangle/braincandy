class Lazy
  attr_reader :sample, :answers

  def self.answer(file)
    fail unless File.exist?(file)
    
    @sample = File.readlines(file)
    @sample.map!{ |line| line[0..-2] }
    parse_sample_for_answer
  end

  def self.test_answer(sample_data)
    @sample = sample_data
    parse_sample_for_answer
  end

protected

  def load_answers
    @answers = Array.new( sample.length, Hash.new{ |hash,key| hash[key] = 0 } )
  end
  def parse_sample_for_answer
    load_answers

    sample.each do |line|
      line.chars.each_with_index do |char,index|
        answers[index][char] += 1
      end
    end
  end

  def detect_highest_occurances
    final = Array.new()

    answers.each do |ans|
      final << ans.sort_by{ |name, occ| occ }.reverse[0][0]
    end
    return final
  end
end

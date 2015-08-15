class Lazy
  attr_accessor :sample, :answers

  def self.answer(file)
    fail unless File.exist?(file)

    lazy = Lazy.new
    
    lazy.sample = File.readlines(file)
    lazy.sample.map!{ |line| line[0..-2] }
    lazy.parse_sample_for_answer
  end

  def self.test_answer(sample_data)
    lazy = Lazy.new
    
    lazy.sample = sample_data
    lazy.parse_sample_for_answer
  end

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

    detect_highest_occurances
  end

  def detect_highest_occurances
    final = String.new()

    answers.each do |ans|
      final << ans.sort_by{ |name, occ| occ }.reverse[0][0]
    end
    return final
  end
end

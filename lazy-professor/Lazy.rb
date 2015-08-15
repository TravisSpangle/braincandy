class Lazy
  attr_accessor :sample, :answers

  def self.answer(file)
    fail unless File.exist?(file)

    lazy = Lazy.new
    
    lazy.sample = File.readlines(file)
    lazy.sample.map!{ |line| line[0..-2] }

    lazy.load_answers
    lazy.parse_sample_for_answer
  end

  def load_answers
    longest_length = sample.map{ |line| line.length}.sort.last
    counter = Hash.new{ |hash,key| hash[key] = 0 } 
    @answers = Array.new
    longest_length.times{ @answers << counter.clone }
  end

  def parse_sample_for_answer
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

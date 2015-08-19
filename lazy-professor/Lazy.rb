# Lazy Class performs tasks for a Lazy Professor
class Lazy
  attr_accessor :sample, :answers

  def self.answer(file)
    fail unless File.exist?(file)

    lazy = Lazy.new

    lazy.load_from_file file
    lazy.calculate_occurrences
    lazy.detect_highest_occurrences
  end

  def load_from_file(file)
    self.sample = File.readlines(file).map { |line| line.chomp.chars }
  end

  def load_answers
    longest_length = sample.map(&:length).sort.last
    counter = Hash.new { |hash, key| hash[key] = 0 }

    @answers = []
    longest_length.times { @answers << counter.clone }
  end

  def calculate_occurrences
    lazy.load_answers
    sample.each do |line|
      line.each_with_index do |char, index|
        answers[index][char] += 1
      end
    end
  end

  def detect_highest_occurrences
    final = ''

    answers.each do |ans|
      final << ans.sort_by { |_, occurrences| occurrences }.reverse[0][0]
    end
    final
  end
end

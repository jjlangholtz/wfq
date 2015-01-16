require 'pry'

class WordFrequency
  def read(file)
    File.open(file).read.chomp
  end

  def clean(text)
    text.downcase.gsub(/[\-\.\,\?\!]/, '')
  end

  def count(text)
    raise ArgumentError if text == ''
    hash = {}
    text.split(' ').each do |word|
      hash[word].nil? ? hash[word] = 1 : hash[word] += 1
    end
    hash
  end

  def print(hash)
    sorted = hash.sort_by(&:last).reverse.first(20).to_h
    spacer = sorted.keys.first.length
    max = sorted.values.first
    sorted.each do |k, v|
      puts "#{k}:#{' '*(spacer-k.length+1)}#{'#' * (50 * (v.to_f/max)).floor} #{v}"
    end
  end
end

# wf = WordFrequency.new
# text = wf.read(ARGV[0])
# clean = wf.clean(text)
# hash = wf.count(clean)
# wf.print(hash)

require 'pry'
require_relative "wfq/version"

module Wfq
  class WordFrequency
    def read(file)
      File.open(file).read.chomp
    end

    def clean(text)
      text.downcase.gsub(/\W/, '')
    end

    def count(text)
      raise ArgumentError if text == ''
      text.split(' ').inject({}) { |sum, val| sum[val] = sum[val].to_i + 1; sum }
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
end

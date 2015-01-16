require 'word_frequency'

describe WordFrequency do
  let(:wf) { WordFrequency.new }

  describe '#read' do
    it 'converts a text file into a text string' do
      text = wf.read('spec/fixture.txt')
      expect(text).to be_a String
      expect(text).to eq 'This is a fixture file.'
    end
  end

  describe '#clean' do
    it 'lowercases text' do
      text = wf.clean('LOWERCASE')
      expect(text).to eq 'lowercase'
    end
    it 'removes punctuation' do
      text = wf.clean('!c,a.l?m-')
      expect(text).to eq 'calm'
    end
  end

  describe '#count' do
    context 'with empty string' do
      it 'raises an ArgumentError' do
        expect{ wf.count('') }.to raise_error(ArgumentError)
      end
    end
    context 'with a sentence' do
      it 'returns a hash and counts word frequency' do
        count = wf.count('fuzzy wuzzy was a bear fuzzy wuzzy had no hair')
        expect(count).to be_a Hash
        expect(count).to eq({
          'fuzzy' => 2,
          'wuzzy' => 2,
          'was' => 1,
          'a' => 1,
          'bear' => 1,
          'had' => 1,
          'no' => 1,
          'hair' => 1
        })
      end
    end
  end

  describe '#print' do
    it 'outputs the count hash to the console' do
      hash = { hello: 1 }
      expect{ wf.print(hash) }.to output("hello: #{'#'*50} 1\n").to_stdout
    end
    it 'outputs in descending order' do
      hash = { two: 2, three: 3, one: 1 }
      expect{ wf.print(hash) }.to output("three: #{'#'*50} 3\n"\
                                         "two:   #{'#'*33} 2\n"\
                                         "one:   #{'#'*16} 1\n").to_stdout
    end
  end
end

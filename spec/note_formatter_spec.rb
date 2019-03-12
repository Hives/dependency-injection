require 'note_formatter'

describe NoteFormatter do
  describe '#format' do
    it 'returns a formatted note' do
      note = double("Note")
      note_title = 'A Tale of Two Cities'
      note_body = 'It was the best of times, it was the worst of times.'
      allow(note).to receive(:title).and_return(note_title)
      allow(note).to receive(:body).and_return(note_body)

      expect(subject.format(note)).to eq "Title: #{note_title}\n#{note_body}" 
    end
  end
end

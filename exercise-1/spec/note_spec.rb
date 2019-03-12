require 'note'

describe Note do
  describe '#display' do
    it "returns a formatted note" do
      note_title = "Pride and Prejudice"
      note_body = "It is a truth universally accepted..."
      note_formatter = double(:note_formatter)
      allow(note_formatter).to receive(:format)
        .and_return("Title: #{note_title}\n#{note_body}")
      note = Note.new(note_title, note_body, note_formatter)
      expect(note.display).to eq "Title: #{note_title}\n#{note_body}"
    end
  end
end

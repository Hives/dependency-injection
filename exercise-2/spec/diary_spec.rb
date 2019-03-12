require 'diary'

describe Diary do
  describe '#add' do
    it 'adds a diary entry' do
      title = "title"
      body = "body"
      entry = double("entry")
      allow(entry).to receive(:title).and_return(title)
      allow(entry).to receive(:body).and_return(body)
      entry_class = double("Entry")
      allow(entry_class).to receive(:new).with(title, body).and_return(entry)
      diary = Diary.new(entry_class)
      expect(diary.add(title, body)).to eq [entry]
    end
  end

  describe '#index' do
    it 'prints the titles' do
      entries_data = [
        {title: "Title 01", body: "Body 01"},
        {title: "Title 02", body: "Body 02"},
        {title: "Title 03", body: "Body 03"},
      ]
      entry_class = double("Entry")
      entries_data.each do |e|
        entry = double("entry")
        allow(entry).to receive(:title).and_return(e[:title])
        allow(entry).to receive(:body).and_return(e[:body])
        allow(entry_class).to receive(:new).with(e[:title], e[:body])
          .and_return(entry)
      end
      diary = Diary.new(entry_class)
      entries_data.each { |e| diary.add(e[:title], e[:body]) }
      expect(diary.index).to eq entries_data.map { |e| e[:title] }.join("\n")
    end
  end
end
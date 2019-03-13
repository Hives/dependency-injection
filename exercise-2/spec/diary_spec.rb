require 'diary'

describe Diary do
  describe '#add' do
    before :each do
      @title = :a_title
      @body = :a_body
      @entry = double(:entry)
      @entry_class = double(:entry)
      allow(@entry_class).to receive(:new).and_return(@entry)
      @diary = described_class.new(@entry_class)
    end

    it "calls Entry.new with arguments 'title' and 'body'" do
      @diary.add(@title, @body)     
      expect(@entry_class).to have_received(:new).with(@title, @body).once
    end

    it 'stores a diary entry' do
      expect(@diary.add("title", "body")).to eq [@entry]
    end
  end

  describe '#index' do
    it 'prints the titles' do
      entries_data = [
        { title: "Title 01", body: "Body 01" },
        { title: "Title 02", body: "Body 02" },
        { title: "Title 03", body: "Body 03" },
      ]
      
      entry_class = double(:Entry)
      
      entries_data.each do |e|
        entry = double(:entry)
        allow(entry).to receive(:title).and_return(e[:title])
        allow(entry_class).to receive(:new).with(e[:title], e[:body])
          .and_return(entry)
      end

      diary = Diary.new(entry_class)
      entries_data.each { |e| diary.add(e[:title], e[:body]) }
      expect(diary.index).to eq entries_data.map { |e| e[:title] }.join("\n")
    end
  end
end

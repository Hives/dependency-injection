class Note
  def initialize(title, body, note_formatter = NoteFormatter.new)
    @title = title
    @body = body
    @formatter = note_formatter
  end

  def display
    @formatter.format(self)
  end

  attr_reader :title, :body
end

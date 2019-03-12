class SayHelloToMyLittleFriend
  def initialize(email = EmailClient.new)
    @email = email
  end

  def run
    @email.message.send(
      "friend@example.com",
      "HELLO!"
    )
  end
end

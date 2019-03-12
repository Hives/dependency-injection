require 'say_hello_to_my_little_friend'

describe SayHelloToMyLittleFriend do
  describe "#run" do
    it 'sends and email' do
      to = "friend@example.com"
      body = 'HELLO!'
      email_client = double :email_client
      message = double :message
      allow(email_client).to receive(:message).and_return(message)
      allow(message).to receive(:send).with(to, body)
      say_hello_to_my_little_friend = described_class.new(email_client)
      say_hello_to_my_little_friend.run
      expect(message).to have_received(:send).with(to, body).once
    end
  end
end
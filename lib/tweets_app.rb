class TweetsApp

  def call
    while true
      puts 'Welcome to Twitter'

      puts 'Enter a username:'
      username = gets.chomp

      puts 'Enter a message:'
      message = gets.chomp

      tweet = Tweet.new({'username' => username, 'message' => message})

      tweets = Tweet.all
      render(tweets)
    end
  end

  private

  def render(tweets)
    tweets.each.with_index(1) do |tweet, i|
      puts "#{i}. #{tweet.username} says: #{tweet.message}"
    end
  end
end
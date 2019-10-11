class TweetsApp

  def call
    puts 'Welcome to Twitter'
    while true
      puts ""
      puts "What would you like to do? Please enter the letter corresponding to your desired action: "
      puts "(l) List all tweets"
      puts "(c) Create a tweet"
      choice = gets.chomp

      case choice
      when "l"
        tweets = Tweet.all
        list_tweets(tweets)
      when "c"
        create_tweet
      end

      
    end
  end


  def list_tweets(tweets)
    puts "Here is a list of all the tweets:"
    puts ""
    tweets.each.with_index(1) do |tweet, i|
      puts "#{i}. #{tweet.username} says: #{tweet.message}"
    end
  end

  def create_tweet
    puts 'Enter a username:'
    username = gets.chomp
    puts 'Enter a message:'
    message = gets.chomp

    puts ""
    tweet = Tweet.new({'username' => username, 'message' => message})

    tweets = Tweet.all
  end
end
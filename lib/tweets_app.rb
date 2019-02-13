class TweetsApp

  def call
    while true
      puts 'Welcome to Twitter'

      puts "What would you like to do? (t) tweet | (d) delete | (a) display all tweets | (u) update a tweet"

      input = gets.chomp

      if input == 't'

        puts 'Enter a username:'
        username = gets.chomp

        puts 'Enter a message:'
        message = gets.chomp

        puts ""
        tweet = Tweet.new({'username' => username, 'message' => message})
        binding.pry
        tweet.save
        tweets = Tweet.all
        render(tweets)
        puts ""
      elsif input == 'u'
        tweets = Tweet.all
        render(tweets)
        puts "Enter the id of the tweet you want to update"

        id = gets.chomp
        tweet = Tweet.find_by_id(id)
        puts "What would you like to change the message to?"
        new_message = gets.chomp
        tweet.message = new_message
        tweet.save
      elsif input == 'a'
        tweets = Tweet.all
        # binding.pry
        render(tweets)

      elsif input == 'd'
        tweets = Tweet.all
        render(tweets)
        puts "Enter the id of the tweet you want to delete"

        id = gets.chomp

        Tweet.delete_by_id(id)
      end
    end
  end


  def render(tweets)
    tweets.each do |tweet|
      puts "#{tweet.id}. #{tweet.username} says: #{tweet.message}"
    end
  end
end
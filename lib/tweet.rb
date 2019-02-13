class Tweet
  attr_accessor :message, :username
  attr_reader :id
  @@all = []
  
  def initialize(props={})
    @id = props['id']
    @message = props['message']
    @username = props['username']
  end

  def self.all
    # binding.pry
    sql = <<-DOC 
    SELECT * FROM tweets
    DOC
    data = DB[:conn].execute(sql)
    
    data.map do |tweet_hash|
      Tweet.new(tweet_hash)
    end
    # @@all
  end
  
  def self.delete_by_id(id)
    sql = <<-DOC
    DELETE FROM tweets WHERE id = ?
    DOC
    
    data = DB[:conn].execute(sql, id)
  end
  
  def self.find_by_id(id)
    sql = <<-DOC
    SELECT * FROM tweets WHERE id = ?
    DOC
    
    data = DB[:conn].execute(sql, id)
    self.new(data[0])
  end

  def save
    if self.id 
      sql = <<-DOC
        UPDATE tweets SET message = ? WHERE id = ?
      DOC

      data = DB[:conn].execute(sql, self.message, self.id)

    else
      sql = <<-DOC
        INSERT INTO tweets (message, username) VALUES (?, ?)
      DOC

      data = DB[:conn].execute(sql, message, username)
    end
  end

end

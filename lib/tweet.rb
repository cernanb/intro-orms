
class Tweet
  attr_accessor :message, :username
  attr_reader :id

  def self.all
    sql = <<-SQL
      SELECT * from tweets
    SQL

    tweet_hashes = DB[:conn].execute(sql)
    tweet_hashes.map{|h| self.new(h)}
  end

  def initialize(props={})
    @id = props['id']
    @message = props['message']
    @username = props['username']
    # ALL << self
    
  end

  def save

    if persisted?
      sql = <<-SQL
        UPDATE tweets SET message = ?, username = ? WHERE id = ?
      SQL

      DB[:conn].execute(sql, self.message, self.username, self.id)
    else
      sql = <<-SQL
        INSERT INTO tweets (message, username) VALUES (?, ?)
      SQL

      DB[:conn].execute(sql, self.message, self.username)
    end
  end

  def persisted?
    !!id
  end
end
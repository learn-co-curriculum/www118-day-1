class Post
  attr_accessor :title, :body, :author
  @@all = []

  def self.print_titles
    self.all.each do |post|
      puts post.title
    end
  end
  
  def something
  end
  
  def save
    @@all << self
  end

  def self.all
    @@all 
  end

  def author=(author)
    @author = author
    author.posts << self
  end


end


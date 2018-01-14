require 'open-uri'
require 'json'

class Post
  attr_accessor :title, :body, :author
  @@all = []
  
  def save
    @@all << self
  end

  def word_count
    self.body.split(" ").size
  end

  def self.valid_number?(string)
    string.to_i > 0 && string.to_i <= Post.all.size
  end

  def self.all
    @@all 
  end

  def id
    @@all.index(self)+1
  end

  def author=(author)
    @author = author
    author.posts << self
  end

  def self.create_with_author(author_name, post_title, post_body)
    post = Post.new
    post.title = post_title 
    post.body = post_body 

    author = Author.new
    author.name = author_name

    post.author = author
    post.save

    post
  end

  def self.find_by_id(id)
    self.all[id.to_i-1]
  end
end


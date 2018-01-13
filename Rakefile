task :console do
  require './config/environment'
  a = Author.new
  a.name = "Writer"

  p = Post.new
  p.title = "Sample"
  
  p.author = a
  a.posts = [p]

  p.save

  a.posts 

  Pry.start
end

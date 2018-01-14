class BlogController

  def start
    puts "Welcome to My Blog!"
    main_menu
  end

  def main_menu
    puts "Menu:"
    puts "1. Write a Post"
    puts "2. List all Posts"
    puts "3. Exit"

    command = gets.strip

    case command
    when "1"
      new_post
    when "2"
      list_posts
    when "3"
      puts "Goodbye!!!"
      exit
    else
      puts "Invalid!"
      main_menu
    end
  end

  def new_post
    puts "What is your name?"
    author_name = gets.strip

    puts "What is the post title?"
    post_title = gets.strip

    puts "Write Your Post Below:"
    post_body = gets.strip

    create_post(author_name, post_title, post_body)
  end

  def create_post(author_name, post_title, post_body)
    post = Post.create_with_author(author_name, post_title, post_body)

    puts "Saved Post."
    
    main_menu
  end

  def list_posts
    puts "\nBlog Posts:"
    puts "-----------\n"

    Post.all.each do |post|
      puts "#{post.id}. #{post.title} (#{post.word_count})"
    end
    puts "\n"

    read_posts
  end

  def read_posts
    puts "Enter the number of the post to read or go back to the main menu."
    input = gets.strip

    if Post.valid_number?(input)
      post = Post.find_by_id(input)

      puts "Title: #{post.title}"
      puts "Author: #{post.author.name}"
      puts "Body: #{post.body}"

      list_posts
    else
      main_menu
    end
  end
end
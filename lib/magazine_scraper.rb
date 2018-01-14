class MagazineScraper
  attr_accessor :path

  def self.new_from_file(path)
    scraper = self.new
    scraper.path = path
    scraper
  end

  def self.new_from_json(url)
    raw_json = open(url).read
    json = JSON.parse(raw_json)
    json["blog_posts"].each do |p|
      Post.create_with_author(p["author_name"], p["title"], p["excerpt"])
    end
  end

  def import_html
    html = File.read(path)

    doc = Nokogiri::HTML(html)

    posts = doc.search("div.flex-grid.flex-grid--jigsaw")
    
    posts.each do |post_doc|
      title = post_doc.search("div.flex-grid__stretcher__headline.heading.heading--level-1.heading--color-black a").inner_text
      author_name = post_doc.search("div.heading.heading--color-grey-dark a").inner_text
      content = post_doc.search("div.flex-grid__stretcher__content.heading.heading--level-4").inner_text
      unless title.strip.empty?
        post = Post.create_with_author(author_name, title, content)
      end
    end
  end
end

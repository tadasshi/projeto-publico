class FeedController < ApplicationController
  layout false

  def rss
    @bibliographies = Bibliography.all
    @ebooks = Ebook.all
    @metaphors = Metaphor.all
    @posts = Post.all
  end
end

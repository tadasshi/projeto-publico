class FeedController < ApplicationController
  caches_page :rss
  layout false

  def rss
    @bibliographies = Bibliography.all
    @ebooks = Ebook.all
    @metaphors = Metaphor.all
  end
end

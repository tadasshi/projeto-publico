class SitemapsController < ApplicationController
  def index
    @static_pages = [root_url]

    @bibliographies = Bibliography.all
    @ebooks = Ebook.all
    @metaphors = Metaphor.all
    @posts = Post.all

    respond_to do |format|
      format.xml
    end
  end
end

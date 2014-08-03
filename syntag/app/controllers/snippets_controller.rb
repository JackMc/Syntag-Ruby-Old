class SnippetsController < ApplicationController
  def index
    @snippets = Snippet.all
  end
  
  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new
    
    @snippet.title = params[:snippet][:title]
    @snippet.contents = params[:snippet][:contents]
    @snippet.language_id = params[:snippet][:language_id]

    @snippet.save

    render 'new'
  end
end

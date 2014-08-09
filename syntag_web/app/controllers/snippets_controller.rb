class SnippetsController < ApplicationController
  def index
    @snippets = Snippet.all

    respond_to do |format|
      format.html
      format.json { render json: @snippets }
    end
  end

  def new
    @snippet = Snippet.new
  end

  def show
    @snippet = Snippet.find(params[:id])

    respond_to do |format|
      format.html { render plain: @snippet.contents }
      format.json { render json: @snippet }
    end
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

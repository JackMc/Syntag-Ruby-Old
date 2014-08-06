class Admin::LanguagesController < ApplicationController
  def index
    @languages = Language.all
    respond_to do |format|
      format.html
      format.json { render json: @languages }
    end
  end

  def new
    @language = Language.new

    respond_to do |format|
      format.html { render 'new' }
      format.json { render json: @language }
    end
  end

  def show
    @language = Language.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @language }
    end
  end

  def create
    @language = Language.new
    
    @language.name = params[:language][:name]
    @language.highlighter_name = params[:language][:highlighter_name]
    @language.save

    @message = "Successfully created language #{params[:language][:name]}"

    render 'new'
  end
end

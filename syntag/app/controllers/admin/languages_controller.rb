class Admin::LanguagesController < ApplicationController
  def index
    @languages = Language.all
  end

  def new
    @language = Language.new
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

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

  def update
    @language = Language.find(params[:id])

    @language.name = params[:language][:name]
    @language.code_editor_name = params[:language][:code_editor_name]
    @language.save

    render 'new'
  end

  def create
    @language = Language.new
    
    @language.name = params[:language][:name]
    @language.code_editor_name = params[:language][:code_editor_name]
    @language.save

    @message = "Successfully created language #{params[:language][:name]}"

    render 'new'
  end
end

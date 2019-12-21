class StoriesController < ApplicationController
  before_action :get_story, only: [:show, :edit, :update]

  def index
    @stories = Story.all
  end

  def new
    @story = Story.new
    @errors = flash[:errors]
  end

  def create
    @story = Story.new(story_params)
      if @story.valid?
        flash[:success] = "Good job filling out the form!"
        @story.save
        redirect_to @story
      else
        flash[:errors] = @story.errors.full_messages
        render :new
      end
  end

  def update
    if @story = Story.update(story_params)
      @story.save
      redirect_to @story
    else
      render :edit
    end
  end

  def destroy
    Story.destroy(params[:id])
  end

  private

  def get_story
    @story = Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:title, :content, :issue, :author, :url)
  end

end

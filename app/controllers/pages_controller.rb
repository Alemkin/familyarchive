class PagesController < ApplicationController

  def index
    @artifacts = Artifact.order("RANDOM()").limit(24)
    @styles = ["style1", "style2", "style3", "style4", "style5", "style6"]
    @count = 0
  end

  def generic
    @artifact = Artifact.find(params[:id])
    @story_paragraphs = @artifact.story_text.split("\n")
    @transcribed_paragraphs = @artifact.transcribed_text.split("\n") unless @artifact.transcribed_text.nil?
  end

end

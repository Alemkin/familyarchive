class PagesController < ApplicationController

  def index
    @artifacts = Artifact.order("RANDOM()").limit(50)
    @styles = ["style1", "style2", "style3", "style4", "style5", "style6"]
    @count = 0
  end

  def generic
    @artifact = Artifact.find(params[:id])
  end

end

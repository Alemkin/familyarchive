class PagesController < ApplicationController

  def index
    @styles = ["style1", "style2", "style3", "style4", "style5", "style6"]
    @count = 0
    if params[:search]
      @artifacts = Artifact.search(params[:search]).order("RANDOM()").limit(24)
    else
      @artifacts = Artifact.order("RANDOM()").limit(24)
    end
  end

end

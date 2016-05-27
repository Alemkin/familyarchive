class ArtifactsController < ApplicationController

  #get
  def new
    redirect_to '/forbidden' if current_user == nil || !current_user.is_admin
    @artifact = Artifact.new
    @family_names = ["Cecil", "Lemkin", "Bogg", "Drigger"]
    @artifact_types = ["Picture","Video", "Audio", "Journal","Recipe","Letter","News Report","PostCard","Card","Certificate"]
  end

  #post
  def create
    redirect_to '/forbidden' if current_user == nil || !current_user.is_admin
    @artifact = Artifact.new(artifact_params)
    if @artifact.save
      redirect_to '/newartifact'
      flash[:notice] = "Artifact created successfully with name: " + @artifact.artifact_name
    else
      redirect_to '/newartifact'
      flash[:error] = "Something went wrong filling out your artifact data."
    end
  end

  #get todo
  def edit
    redirect_to '/forbidden' if current_user == nil || !current_user.is_admin
  end

  #post todo
  def change
    redirect_to '/forbidden' if current_user == nil || !current_user.is_admin
  end

  #post
  def destroy
    redirect_to '/forbidden' if current_user == nil || !current_user.is_admin
  end

private
  def artifact_params
    params.require(:artifact).permit(:artifact_name, :short_description, :story_text, :image_url,
                                      :video_url, :subject_author_name, :family_name, :artifact_type,
                                      :exact_date, :estimated_date, :content_tag)
  end
end

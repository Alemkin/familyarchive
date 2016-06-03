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
      redirect_to '/artifacts/new'
      flash[:notice] = "Artifact created successfully with name: " + @artifact.artifact_name
    else
      flash[:error] = "Something went wrong filling out your artifact data."
      render :action => '/new'
    end
  end

  #get todo
  def edit
    redirect_to '/forbidden' if current_user == nil || !current_user.is_admin
    @artifact = Artifact.find(params[:id])
    @family_names = ["Cecil", "Lemkin", "Bogg", "Drigger"]
    @artifact_types = ["Picture","Video", "Audio", "Journal","Recipe","Letter","News Report","PostCard","Card","Certificate"]
  end

  #post todo
  def update
    redirect_to '/forbidden' if current_user == nil || !current_user.is_admin
    @artifact = Artifact.find(params[:id])
    if @artifact.update_attributes(artifact_params)
      redirect_to generic_path(:id => @artifact.id)
      flash[:notice] = "This artifact was edited successfully"
    else
      flash[:error] = "Something went wrong filling out your artifact data."
      render :action => '/artifacts/'+@artifact.id+'/edit'
    end
  end

  #post
  def destroy
    redirect_to '/forbidden' if current_user == nil || !current_user.is_admin
    Artifact.find(params[:id]).destroy
    flash[:notice] = "Artifact deleted"
    redirect_to '/'
  end

private
  def artifact_params
    params.require(:artifact).permit(:artifact_name, :short_description, :story_text,
                                      :video_url, :subject_author_name, :family_name, :artifact_type,
                                      :exact_date, :estimated_date, :transcribed_text, :content_tag => [], :image_url => [])
  end
end

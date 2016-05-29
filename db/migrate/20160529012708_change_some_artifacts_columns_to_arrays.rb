class ChangeSomeArtifactsColumnsToArrays < ActiveRecord::Migration
  def change
    change_column :artifacts, :image_url, "varchar[] USING (string_to_array(image_url, ','))"    
    change_column :artifacts, :content_tag, "varchar[] USING (string_to_array(content_tag, ','))"
  end
end

class CreateArtifacts < ActiveRecord::Migration
  def change
    create_table :artifacts do |t|
      t.string  :artifact_name
      t.string  :short_description
      t.string  :story_text
      t.string  :image_url
      t.string  :video_url
      t.string  :subject_author_name
      t.string  :family_name
      t.string  :artifact_type
      t.datetime  :exact_date
      t.string  :estimated_date
      t.string  :content_tag
      t.datetime  :created_at
      t.datetime :updated_at
    end
  end
end

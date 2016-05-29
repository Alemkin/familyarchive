class AddTranscribedTextToArtifacts < ActiveRecord::Migration
  def change
    add_column :artifacts, :transcribed_text, :string
  end
end

class Artifact < ActiveRecord::Base
  validates_presence_of :artifact_name
  validates_presence_of :short_description
  validates_presence_of :story_text
  validates_presence_of :image_url
  validates_presence_of :subject_author_name
  validates_presence_of :family_name
  validates_presence_of :artifact_type

  before_validation :strip_whitespace

private
def strip_whitespace
  self.artifact_name = self.artifact_name.strip unless self.artifact_name.nil?
  self.short_description = self.short_description.strip unless self.short_description.nil?
  self.story_text = self.story_text.strip unless self.story_text.nil?
  self.subject_author_name = self.subject_author_name.strip unless self.subject_author_name.nil?
  self.family_name = self.family_name.strip unless self.family_name.nil?
  self.artifact_type = self.artifact_type.strip unless self.artifact_type.nil?
  for image in self.image_url
    image.strip
  end
end

end

class Artifact < ActiveRecord::Base
  validates_presence_of :artifact_name
  validates_presence_of :short_description
  validates_presence_of :story_text
  validates_presence_of :image_url
  validates_presence_of :subject_name
  validates_presence_of :family_name
  validates_presence_of :artifact_type

  before_validation :strip_whitespace

private
def strip_whitespace
  self.artifact_name = self.artifact_name.strip unless self.artifact_name.nil?
  self.short_description = self.short_description.strip unless self.short_description.nil?
  self.story_text = self.story_text.strip unless self.story_text.nil?
  self.image_url = self.image_url.strip unless self.image_url.nil?
  self.subject_name = self.subject_name.strip unless self.subject_name.nil?
  self.family_name = self.family_name.strip unless self.family_name.nil?
  self.artifact_type = self.artifact_type.strip unless self.artifact_type.nil?
end

end

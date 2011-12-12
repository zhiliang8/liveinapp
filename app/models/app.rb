# encoding: utf-8
class App < ActiveRecord::Base
  belongs_to :node, :counter_cache => true
  belongs_to :user
  validates :url, :presence => true, :format => {:with => /http:\/\/\w+/}, :uniqueness => true
  mount_uploader :snapshot, SnapshotUploader
end

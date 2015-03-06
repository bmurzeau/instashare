class Authorization < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :user_id, :uid, :provider, :token, :secret
  validates_uniqueness_of :uid, :scope => :provider
end

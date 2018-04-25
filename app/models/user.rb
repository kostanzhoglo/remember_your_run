class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true
  validates :password, confirmation: true

  has_many :runs
  has_many :months, through: :runs

  def self.find_or_create_by_omniauth(auth_hash)
    self.where(email: auth_hash["info"]["email"]).first_or_create do |user|
      user.password = SecureRandom.hex
    end
  end

  def self.my_fastest_runs
    self.where(id: current_user.id).runs.order(pace_per_mile: :asc).first(3)
    raise self.inspect
  end
end






# ORIGINAL code from sessions_controller#create. It's refactored above. If you want to see how and why to refactor it, find Todo MVC Youtube Review #7 starting at 38:00.

# oauth_email = request.env["omniauth.auth"]["info"]["email"]
# if user = User.find_by(email: oauth_email)
#   session[:user_id] = user.id
#   redirect_to root_path
# else
#   user = User.create(email: oauth_email, password: SecureRandom.hex)
#   if user.save
#     session[:user_id] = user.id
#     redirect_to root_path
#   else
#     raise user.errors.full_messages.inspect
#   end
# end

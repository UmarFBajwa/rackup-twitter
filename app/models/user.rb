class User < ActiveRecord::Base
  include BCrypt
  has_many :tweets

  has_many :followings_as_follower, class_name: 'Following', foreign_key: :follower_id
  has_many :followings_as_followee, class_name: 'Following', foreign_key: :followee_id
  has_many :followers, through: :followings_as_followee
  has_many :followees, through: :followings_as_follower

  validates_presence_of :username, :email, :password
  validates :username, uniqueness: true
  validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/,
    message: "Please provide an email in the following format: you@domain.com."}

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def create
    @user = User.new(params[:user])
    @user.password = params[:password]
    @user.save!
  end

  # def login
  #   @user = User.find_by_username(params[:username])
  #   if @user.password == params[:password]
  #     user
  #   else
  #     redirect_to  '/users'
  #   end
  # end

  def self.authenticate(username, password)
    @user = User.find_by(username: username)
    if @user && @user.password == password
      @user
    else
      nil
    end
  end
end

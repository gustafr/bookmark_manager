'require bcrypt'
'require byebug'
class User
  attr_accessor :password, :password_confirmation

include DataMapper::Resource
include BCrypt

property :id, Serial
property :email, String
property :password_digest, Text
property :created_at, DateTime

#has n, :links, through: Resource

validates_presence_of :email, message: "Please fill in email."
validates_uniqueness_of :email , message: "User already exists."
validates_presence_of :password, message: "Please fill in password."
#validates_confirmation_of :password, message: "Sorry, password is not matching."

        #The User model
 #  def password
 #    @password ||= Password.new(password_hash)
 #  end

	# def password=(new_password)
 #    @password = Password.create(new_password)
 #    self.password_hash = @password
	# end

 #  def create
 #    @user = User.new(params[:user])
 #    @user.password = params[:password]
 #    @user.save!
 #  end

 #  def login
 #    @user = User.find_by_email(params[:email])
 #    if @user.password == params[:password]
 #      give_token
 #    else
 #      redirect_to home_url
 #    end
 #  end

 #    def forget_password
 #    @user = User.find_by_email(params[:email])
 #    random_password = Array.new(10).map { (65 + rand(58)).chr }.join
 #    @user.password = random_password
 #    @user.save!
 #    Mailer.create_and_deliver_password_change(@user, random_password)
 #  end

  before :save do
    if self.password == self.password_confirmation
      self.password_digest = BCrypt::Password.create(self.password)
    else
      break
    end
  end


  # def self.authenticate(email, password)
  #   user = first(email: email)
  #   if user && BCrypt::Password.new(user.password_digest) == password
  #     user
  #   else
  #     nil
  #   end
  # end

end
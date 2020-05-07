class SignupLoginService
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def sign_up
    user = (User.find_by(email: params[:user][:email]) || User.find_by(phone_number: params[:user][:phone_number]))
    if !user
      user = User.new(sign_up_params)
      if user.save
        return OpenStruct.new(status: 200, message: "User Register Sucessfully!!", user: UserSerializer.new(user,root: false))
      else
        return OpenStruct.new(status: 400, message: user.errors.full_messages[0], user: nil)
      end
    else
      return OpenStruct.new(status: 400, message: "User exist with this email or phone", user: nil)
    end
  end

  def sign_in
    user = User.find_by(email: params[:user][:email])
    if user
      if user.valid_password?(params[:user][:password])
        token = JWT.encode({user_id: user.id}, Rails.application.secrets.secret_key_base, 'HS256')
        return OpenStruct.new(status: 200, message: "Login Sucessfully", user: UserSerializer.new(user, root: false, serializer_options: {token: token}))
      else
        return OpenStruct.new(status: 400, message: "Invalid Password", user: nil)
      end
    else
      return OpenStruct.new(status: 400, message: "User not exist", user: nil)
    end
  end

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :phone_number, :gender)
  end

end

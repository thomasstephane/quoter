helpers do
  def hash(string)
    Digest::MD5.hexdigest(string.downcase.strip)
  end

  def gravatar(mail, size = 200)
    "http://www.gravatar.com/avatar/#{hash(mail)}?s=#{size}"
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def all_user
    User.all
  end

  def login_user(params)
    @user = User.find_by_email(params[:email])
    if @user.password = params[:password]
      session[:user_id] = @user.id
      redirect '/'
    else
      redirect '/sessions/new'
    end
  end

  def create_user(params)
    @user = User.create(params)
    session[:user_id] = @user.id
  end

  def check_exist(params)
    @msg = {}
    check_one_exist(params, "name")
    check_one_exist(params, "email")
    @msg
  end

  def check_one_exist(params, key)
    if params[key]
      search = User.where("#{key} = ?",params[key])[0]
      if search
        @msg[key] = "exist"
      else
        @msg[key] = ""
      end
    end
  end
end
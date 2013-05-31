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
    @msg = {}
    check_one_exist(params, "name")
    if @msg["name"] == "exist"
      check_password(params)
    end
    @msg
  end

  def check_password(params)
    if @user.password == params[:password]
      session[:user_id] = @user.id
      @msg["status"] = "login"
    else
      @msg["status"] = "failed"
    end
  end

  def create_user(params)
    @msg = {}
    @user = User.create(params)
    session[:user_id] = @user.id
    @msg["status"] = "login"
  end

  def check_exist(params)
    @msg = {}
    check_one_exist(params, "name")
    check_one_exist(params, "email")
    @msg
  end

  def check_one_exist(params, key)
    if params[key]
      @user = User.where("#{key} = ?",params[key])[0]
      if @user
        @msg[key] = "exist"
      else
        @msg[key] = ""
      end
    end
  end
end
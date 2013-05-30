helpers do
  def hash(string)
    Digest::MD5.hexdigest(string.downcase.strip)
  end

  def gravatar(mail, size = 200)
    "http://www.gravatar.com/avatar/#{hash(mail)}?s=#{size}"
  end

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
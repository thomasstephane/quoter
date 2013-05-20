helpers do
  def hash(string)
    Digest::MD5.hexdigest(string.downcase.strip)
  end

  def gravatar(mail, size)
    "http://www.gravatar.com/avatar/#{hash(mail)}?s=#{size}"
  end
end
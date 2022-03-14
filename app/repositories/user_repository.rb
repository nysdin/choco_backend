class UserRepository
  def prepare_login_user_find_by(attr = {})
    User.find_by(attr)
  end
end

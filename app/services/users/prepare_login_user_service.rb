module Users
  class PrepareLoginUserService
    def initialize(email:)
      @email = email
    end

    def execute
      UserRepository.new.prepare_login_user_find_by(email: @email)
    end
  end
end

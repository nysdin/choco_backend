module Authorization
  def user_for_graphiql
    # graphiql内及びテスト環境のみで使用する仮のログインユーザー
    {
      id: 0,
      name: 'graphiql user',
      email: 'graphiql@exmaple.com'
    }
  end
end
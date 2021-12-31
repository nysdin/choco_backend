class Healthcheck
  OK_RESPONSE = [200, { 'Content-Type' => 'text/plain' }, ['healthy']].freeze

  def initialize(app)
    @app = app
  end

  def call(env)
    if env['PATH_INFO'] == '/healthcheck'
      OK_RESPONSE
    else
      @app.call(env)
    end
  end
end

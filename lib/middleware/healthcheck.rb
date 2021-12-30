class Healthcheck
  OK_RESPONSE = [200, { 'Content-Type' => 'text/plain' }, ['healthy']]

  def initialize(app)
    @app = app
  end

  def call(env)
    if env['PAHT_INFO'] = '/healthcheck'
      OK_RESPONSE
    else
      @app.call(env)
    end
  end
end

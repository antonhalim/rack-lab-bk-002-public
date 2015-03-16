class RequestMethod

  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)
    body = response.first + "Using request method #{env["REQUEST_METHOD"]} "
    [status, headers, [body]]
  end

end

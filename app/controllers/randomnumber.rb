class RandomNumber

  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)
    body = response.first + "randomized number is - #{rand(1000)}"
    [status, headers, [body]]
  end

end

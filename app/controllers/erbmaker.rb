class ErbMaker

  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)
    erb = ERB.new(File.read('./lib/templates/index.html.erb'))
    if env["PATH_INFO"] == '/about'
      [status, headers, ["<h1><a href='/'>Are you lost?</a></h1>"]]
    else
      response_body = erb.result(binding)
      [status, headers, [response_body]]
    end
  end

end

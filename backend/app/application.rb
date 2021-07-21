class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/test/) 
      return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]
    elsif req.path.match(/users/)
      return [200, { 'Content-Type' => 'application/json' }, [ {data: User.all}.to_json ]]
    elsif req.path.match(/courses/)
      return [200, { 'Content-Type' => 'application/json' }, [ {data: Course.all}.to_json ]]
    elsif req.path.match(/languages/)
      return [200, { 'Content-Type' => 'application/json' }, [ {data: Language.all}.to_json ]]
    else
      resp.write "Path Not Found"

    end

    resp.finish
  end

end

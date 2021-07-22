require 'pry'

class Application
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
            if req.path.match(/test/)
                return [200, { "Content-Type" => "application/json" }, [{ :message => "test response!" }.to_json]]
            elsif req.path.match(/users/) && req.post?
                data = JSON.parse(req.body.read)
                userExists = User.find_by(name: data["name"])
                if userExists
                    return [200, { "Content-Type" => "application/json" }, [{ :error => "User with username: #{userExists.name} already exists" }.to_json]]
                else    
                    user = User.create(data)
                    return [200, { "Content-Type" => "application/json" }, [{ :data => {:message => "Successfully Signed Up", :user => user}}.to_json]]
                end
                # USER AUTHENTICATION COME BACK TO
            elsif req.path.match(/users/)
                return [200, { "Content-Type" => "application/json" }, [{ :data => User.all}.to_json]]
            elsif req.path.match(/courses/)
                return [200, { "Content-Type" => "application/json" }, [{ :data => Course.all}.to_json]]
            #         
            #  elsif req.path.match(/contacts/)
            #      return [200, { "Content-Type" => "application/json" }, [{ :message => "User does not exist"}]]
            #    resp.write "User Does Not Exist"
            #   end
                # return [200, { "Content-Type" => "application/json" }, [ {data: User.create}.to_json ]]
            # elsif req.path.match(/contacts/)
            #     return [200, { "Content-Type" => "application/json" }, [ {data: Contact.all}.to_json ]]
            else
                resp.write "Path Not Found"
            end
            resp.finish
        end
    end
    
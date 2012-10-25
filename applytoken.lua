
          local JSON = require("cjson")
          if ngx.var.request_method == "GET" then
            ngx.exit(ngx.HTTP_FORBIDDEN);
          end
          if ngx.var.request_method == "POST" then
            ngx.req.read_body()
            tmpdata = JSON.encode(ngx.req.get_post_args(5))
            local args = ngx.req.get_post_args(5)

            for key, val in pairs(args) do
              if key == "gid" then
                tmptoken = val
              end
              if key == "callback" then
                tmpuri = val
              end
            end

          end

          APPKEY = "pic-10050"
          SECRET = "99fc9fdbc6761f7d898ad25762486767"
          crtURI = ngx.encode_base64(tmpuri)
          timestamp = ngx.now()
          tokenbase = tmptoken .. "appkey=" .. APPKEY .. "&q=" .. crtURI .. "&timestamp=" .. timestamp
          token = ngx.md5(tokenbase .. SECRET)

            local memcached = require "resty.memcached"
            local memc, err = memcached:new()
            if not memc then
                ngx.say("failed to instantiate memc: ", err)
                return
            end

            memc:set_timeout(1000) -- 1 sec

            -- or connect to a unix domain socket file listened
            -- by a memcached server:
            --     local ok, err = memc:connect("unix:/path/to/memc.sock")

            local ok, err = memc:connect("127.0.0.1", 11211)
            if not ok then
                ngx.say("failed to connect: ", err)
                return
            end

            local ok, err = memc:set(token, tmpdata)
            if not ok then
                ngx.say("failed to set token: ", err)
                return
            end

            ngx.say(token)





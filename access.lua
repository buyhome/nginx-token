          if ngx.var.request_method == "GET" then
            ngx.exit(ngx.HTTP_FORBIDDEN);
          end
          if ngx.var.request_method == "POST" then
            local memcached = require "resty.memcached"
            local memc, err = memcached:new()
            if not memc then
              ngx.exit(ngx.HTTP_INTERNAL_SERVER_ERROR);
            end

            memc:set_timeout(1000) -- 1 sec

            -- or connect to a unix domain socket file listened
            -- by a memcached server:
            --     local ok, err = memc:connect("unix:/path/to/memc.sock")

            local ok, err = memc:connect("127.0.0.1", 11211)


            if not ok then
              ngx.exit(ngx.HTTP_SERVICE_UNAVAILABLE);
            end

            local res, flags, err = memc:get(ngx.var.token)
            if err then
              ngx.exit(ngx.HTTP_BAD_REQUEST);
            end

            if not res then
              ngx.exit(ngx.HTTP_NOT_FOUND);
            end
            memc:set_keepalive(0, 100)
          end

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

            local res, flags, err = memc:get(ngx.var.token)
            if err then
                ngx.say("failed to get token: ", err)
                return
            end

            if not res then
                ngx.say("token not found")
                return
            end

            ngx.say(res)

            -- put it into the connection pool of size 100,
            -- with 0 idle timeout
            memc:set_keepalive(0, 100)

            -- or just close the connection right away:
            -- local ok, err = memc:close()
            -- if not ok then
            --     ngx.say("failed to close: ", err)
            -- end

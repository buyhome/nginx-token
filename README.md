nginx-token
===========

NOT same to Secure Link or Nginx Accesss Key
Nginx-token will generate tokens and store in memcache with lua script. So it can work with another system for security well easily.

How to use

use curl to test if you can catch the token or not

  * curl --data 'cookie=23823er23sdafjafadsfa&storeid=28322&filetype=png&callback=http://anyhost/interface.aspx' youhost/youlocation

and you will catch the token, for example:

  * curl --data 'storied=28322&gid=23er23sdafjafadsfadwefjsdfj3dsf2&filetype=png&callback=http://www.cn100.com/interface.aspx&sz=20480' labs.rhomobi.com/test-json

  * 66985bc0f04ac3cd13e50b23bf5cf7d4


Bugs and Patches
    Please submit bug reports, wishlists, or patches by

    1. creating a ticket on the GitHub Issue Tracker
        (<http://buyhome.github.com/nginx-token>),

    2. or posting to the Rhomobile community
        (<http://rhomobi.com>).

TODO
  Short Term
    * add to redis include the token storage.

    * review and apply Brian Akin's patch for the new
        "shdict:flush_expired()" API.

    * implement the Nginx upload moudle.


  Longer Term
    * add lightweight thread API (i.e., the "ngx.thread" API) as
        demonstrated in this sample code
        (<http://agentzh.org/misc/nginx/lua-thread2.lua>).


Changes
    The changes of every release of this module can be obtained from the
    nginx-token's change logs:

    http://rhomobi.com/topics/71

Test Suite
    The following dependencies are required to run the test suite:

    * Nginx version >= 0.8.54


    * Nginx modules:

        * rds-json-nginx-module:
            http://github.com/agentzh/rds-json-nginx-module


    * C libraries:

        * yajl: https://github.com/lloyd/yajl

    * Lua modules:

        * lua-yajl: https://github.com/brimworks/lua-yajl

            * Note: the compiled module has to be placed in
                '/usr/local/lib/lua/5.1/'

    * Applications:

        * Nginx

        * memcached

    The order in which these modules are added during configuration is
    important as the position of any filter module in the filtering chain
    determines the final output. The correct adding order is:

    1. ngx_devel_kit

    2. lua-nginx-module (i.e. this module)

    3. rds-json-nginx-module

Copyright and License
    This module is licensed under the BSD license.

    Copyright (C) 2009-2012, by Rhomobile Justin Huang (huangqi)
    <huangqi@rhomobi.com>.

    All rights reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are
    met:

    * Redistributions of source code must retain the above copyright
        notice, this list of conditions and the following disclaimer.

    * Redistributions in binary form must reproduce the above copyright
        notice, this list of conditions and the following disclaimer in the
        documentation and/or other materials provided with the distribution.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
    IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
    TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
    PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
    HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
    SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
    TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
    PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
    LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
    NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
    SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

See Also
    * lua-resty-memcached
        (<http://github.com/agentzh/lua-resty-memcached>) library based on
        ngx_lua cosocket.

    * lua-resty-redis (<http://github.com/agentzh/lua-resty-redis>)
        library based on ngx_lua cosocket.

    * Dynamic Routing Based on Redis and Lua
        (<http://openresty.org/#DynamicRoutingBasedOnRedis>)

    * Using LuaRocks with ngx_lua (<http://openresty.org/#UsingLuaRocks>)

    * Introduction to ngx_lua
        (<https://github.com/chaoslawful/lua-nginx-module/wiki/Introduction>
        )

    * ngx_devel_kit (<http://github.com/simpl/ngx_devel_kit>)


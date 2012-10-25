nginx-token
===========

<<<<<<< HEAD
NOT same to Secure Link or Nginx Accesss Key
Nginx-token will generate tokens and store in memcache with lua script. So it can work with another system for security well easily.

# How to use

use curl to test if you can catch the token or not
curl --data 'cookie=23823er23sdafjafadsfa&storeid=28322&filetype=png&callback=http://anyhost/interface.aspx' youhost/youlocation

and you will catch the token, for example:

ot@rhosouth001 nginx-token_github]# curl --data 'storied=28322&gid=23er23sdafjafadsfadwefjsdfj3dsf2&filetype=png&callback=http://www.cn100.com/interface.aspx&sz=20480' labs.rhomobi.com/test-json
66985bc0f04ac3cd13e50b23bf5cf7d4
[root@rhosouth001 nginx-token_github]#

# Author
huangqi 2012cn100
=======
NOT same to Secure Link or Nginx Accesss Key , Nginx-token will generate tokens and store in memcache with lua script. So it work with another system for security well.
>>>>>>> 7270157a2b4b993feb1f47c5965c450a12f38b8f

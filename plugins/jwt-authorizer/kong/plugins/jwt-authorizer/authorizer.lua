local _M = {}
local req_get_headers = ngx.req.get_headers
local utils = require "kong.plugins.jwt-authorizer.utils"


function _M.run(conf)

   -- Validate token existence
   if not req_get_headers()["Authorization"] then
      return kong.response.exit(401)
   end

   -- Extract the access token from the authorization header
   local accessToken = string.sub(req_get_headers()["Authorization"], 8) 

   -- TEMP: Log the request
   local tokenlog = 'Access Token:' .. accessToken
   utils.printToFile(debug.getinfo(1).currentline, tokenlog)

   -- TODO: Decode JWT, then get roles and authorities claims

end

return _M

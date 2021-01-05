local BasePlugin = require "kong.plugins.base_plugin"
local access = require "kong.plugins.jwt-authorizer.authorizer"

local JwtAuthorizer = BasePlugin:extend()

-- JwtAuthorizer.PRIORITY = 2000

function JwtAuthorizer:new()
	JwtAuthorizer.super.new(self, "jwt-authorizer")
end

function JwtAuthorizer:access(conf)
	JwtAuthorizer.super.access(self)
	access.run(conf)
end

return JwtAuthorizer

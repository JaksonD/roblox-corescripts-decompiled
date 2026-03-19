local v0 = require(script.CredentialsProtocol);
local v1 = require(script.Constants);
local _ = require(script.CredentialsProtocolTypes);
local v3 = require(script.CredentialsProtocolErrorCodes);
local v4 = require(script.Flags.GetFFlagLuaAppEnableCredentialsProtocol);
local v5 = require(script.Flags.GetFIntLuaAppCredentialsProtocolTimeout);
local v6 = require(script.Flags.GetFIntLuaAppCredentialsProtocolAvailableTimeout);
return {
    Constants = v1, 
    CredentialsProtocol = v0, 
    CredentialsProtocolErrorCodes = v3, 
    Flags = {
        GetFFlagLuaAppEnableCredentialsProtocol = v4, 
        GetFIntLuaAppCredentialsProtocolTimeout = v5, 
        GetFIntLuaAppCredentialsProtocolAvailableTimeout = v6
    }
};
local v0 = require(script.GameProtocol);
local v1 = require(script.ExperienceServiceWrapper);
local _ = require(script.GameProtocolTypes);
local v3 = require(script.Flags.GetFFlagMoveLuaExpLaunchBegin);
return {
    GameProtocol = v0, 
    GameParams = require(script.GameParams), 
    ExperienceService = v1, 
    Flags = {
        GetFFlagMoveLuaExpLaunchBegin = v3
    }
};
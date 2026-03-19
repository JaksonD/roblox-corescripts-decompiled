local l_Parent_0 = script:FindFirstAncestor("GameLaunch").Parent;
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local v2 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.ExperienceService);
local l_ExperienceService_0 = require(l_Parent_0.ExperienceService).ExperienceService;
local l_GetFFlagMoveLuaExpLaunchBegin_0 = require(l_Parent_0.ExperienceService).Flags.GetFFlagMoveLuaExpLaunchBegin;
return function(v6, v7, v8, _, v10, v11) --[[ Line: 10 ]] --[[ Name: LaunchGame ]]
    -- upvalues: l_GetFFlagMoveLuaExpLaunchBegin_0 (copy), l_default_0 (copy), v2 (copy), l_ExperienceService_0 (copy)
    if not l_GetFFlagMoveLuaExpLaunchBegin_0() then
        l_default_0:logEvent("experience_launch_begin");
    end;
    local v12 = {
        placeId = tonumber(v6), 
        referralPage = v7
    };
    if v8 then
        v12 = v2.Dictionary.join(v12, v8);
    end;
    l_ExperienceService_0:LaunchExperience(v12, v10, v11);
end;
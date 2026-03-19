local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.ExperienceService);
local l_GameParams_0 = require(l_CorePackages_0.Workspace.Packages.ExperienceService).GameParams;
local l_ExperienceService_0 = require(l_CorePackages_0.Workspace.Packages.ExperienceService).ExperienceService;
local v4 = {};
local function _(v5, v6, v7) --[[ Line: 13 ]] --[[ Name: launchGame ]]
    -- upvalues: l_ExperienceService_0 (copy)
    l_ExperienceService_0:LaunchExperience(v5, v6, v7);
end;
v4.ByUser = function(_, v10, v11, v12) --[[ Line: 21 ]] --[[ Name: ByUser ]]
    -- upvalues: l_GameParams_0 (copy), l_ExperienceService_0 (copy)
    local v13 = nil;
    v13 = l_GameParams_0.fromUserId(v10.id);
    assert(v13.userId ~= nil, "Joining a game by user should always be done by user id");
    l_ExperienceService_0:LaunchExperience(v13, v11, v12);
end;
v4.ByUserAndPlaceId = function(_, v15, v16, v17, v18) --[[ Line: 38 ]] --[[ Name: ByUserAndPlaceId ]]
    -- upvalues: l_GameParams_0 (copy), l_ExperienceService_0 (copy)
    local v19 = nil;
    v19 = l_GameParams_0.fromUserId(v15.id, v16);
    assert(v19.userId ~= nil, "Joining a game by user and placeId should always contain a user id param");
    assert(v19.placeId ~= nil, "Joining a game by user and placeId should always contain a place id param");
    l_ExperienceService_0:LaunchExperience(v19, v17, v18);
end;
v4.ByGame = function(_, v21, v22, v23) --[[ Line: 57 ]] --[[ Name: ByGame ]]
    -- upvalues: l_GameParams_0 (copy), l_ExperienceService_0 (copy)
    local v24 = l_GameParams_0.fromPlaceId(v21);
    l_ExperienceService_0:LaunchExperience(v24, v22, v23);
end;
return v4;
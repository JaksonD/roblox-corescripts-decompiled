local l_Parent_0 = script:FindFirstAncestor("SocialTab").Parent;
local l_rolloutByApplicationId_0 = require(l_Parent_0.AppCommonLib).rolloutByApplicationId;
game:DefineFastInt("SocialTabUserProfileApiRollout", 0);
game:DefineFastFlag("SocialTabUserProfileApiEnabledForAll", false);
local function v2() --[[ Line: 8 ]]
    return game:GetFastInt("SocialTabUserProfileApiRollout");
end;
local function _() --[[ Line: 12 ]]
    return game:GetFastFlag("SocialTabUserProfileApiEnabledForAll");
end;
local v4 = l_rolloutByApplicationId_0(v2);
return function() --[[ Line: 18 ]]
    -- upvalues: v4 (copy)
    return game:GetFastFlag("SocialTabUserProfileApiEnabledForAll") or v4();
end;
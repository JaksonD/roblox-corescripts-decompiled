local l_Parent_0 = script:FindFirstAncestor("SharedFlags").Parent;
local l_rolloutByApplicationId_0 = require(l_Parent_0.AppCommonLib).rolloutByApplicationId;
game:DefineFastInt("CharacterNameHandlerUserProfileApiRollout", 0);
game:DefineFastFlag("CharacterNameHandlerUserProfileApiEnabledForAll", false);
local function v2() --[[ Line: 8 ]]
    return game:GetFastInt("CharacterNameHandlerUserProfileApiRollout");
end;
local function _() --[[ Line: 12 ]]
    return game:GetFastFlag("CharacterNameHandlerUserProfileApiEnabledForAll");
end;
local v4 = l_rolloutByApplicationId_0(v2);
return function() --[[ Line: 18 ]]
    -- upvalues: v4 (copy)
    return game:GetFastFlag("CharacterNameHandlerUserProfileApiEnabledForAll") or v4();
end;
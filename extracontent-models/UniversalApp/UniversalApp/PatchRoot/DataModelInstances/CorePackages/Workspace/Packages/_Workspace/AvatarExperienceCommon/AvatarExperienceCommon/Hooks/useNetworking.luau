local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local l_useRoactService_0 = require(l_Parent_0.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_Parent_0.RoactServiceTags).RoactNetworking;
return function() --[[ Line: 8 ]] --[[ Name: useNetworking ]]
    -- upvalues: l_useRoactService_0 (copy), l_RoactNetworking_0 (copy)
    return l_useRoactService_0(l_RoactNetworking_0);
end;
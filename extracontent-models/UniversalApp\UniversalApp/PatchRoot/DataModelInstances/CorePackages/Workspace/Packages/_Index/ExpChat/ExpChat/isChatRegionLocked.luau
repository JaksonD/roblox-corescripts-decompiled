local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local l_GetFFlagExpChatGuacChatDisabledReason_0 = require(l_Parent_0.SharedFlags).GetFFlagExpChatGuacChatDisabledReason;
local v2 = nil;
if l_GetFFlagExpChatGuacChatDisabledReason_0() then
    v2 = require(l_Parent_0.UniversalAppPolicy);
end;
return function() --[[ Line: 12 ]]
    -- upvalues: l_GetFFlagExpChatGuacChatDisabledReason_0 (copy), v2 (ref)
    if not l_GetFFlagExpChatGuacChatDisabledReason_0() then
        return false;
    else
        return v2.getAppFeaturePolicies().getExperienceChatAvailability() == "regionLocked";
    end;
end;
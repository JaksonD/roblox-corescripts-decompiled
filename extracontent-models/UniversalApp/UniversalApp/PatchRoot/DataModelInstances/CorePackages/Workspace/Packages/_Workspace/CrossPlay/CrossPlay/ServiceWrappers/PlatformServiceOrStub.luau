local l_script_FirstAncestor_0 = script:FindFirstAncestor("CrossPlay");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Signal_0 = require(l_Parent_0.AppCommonLib).Signal;
local v3 = require(l_script_FirstAncestor_0.Hooks.Constants);
local v7 = {
    OnLeaveConstrained = l_Signal_0.new(), 
    BeginCheckXboxPrivilege = function(_, _) --[[ Line: 10 ]] --[[ Name: BeginCheckXboxPrivilege ]]
        -- upvalues: v3 (copy)
        return {
            CanJoinGame = true, 
            PrivilegeCheckResult = v3.PrivilegeCheckResults.NO_ISSUE, 
            Success = true
        };
    end, 
    GetPlatformPartyMembers = function(_) --[[ Line: 18 ]] --[[ Name: GetPlatformPartyMembers ]]
        return {};
    end
};
local v8 = nil;
pcall(function() --[[ Line: 24 ]]
    -- upvalues: v8 (ref)
    v8 = game:GetService("PlatformService");
end);
return v8 or v7;
local l_Parent_0 = script:FindFirstAncestor("ProfilePlatform").Parent;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
return function() --[[ Line: 6 ]]
    -- upvalues: l_useAppPolicy_0 (copy)
    return l_useAppPolicy_0(function(v2) --[[ Line: 7 ]]
        return v2.getEnableProfileQrCode();
    end);
end;
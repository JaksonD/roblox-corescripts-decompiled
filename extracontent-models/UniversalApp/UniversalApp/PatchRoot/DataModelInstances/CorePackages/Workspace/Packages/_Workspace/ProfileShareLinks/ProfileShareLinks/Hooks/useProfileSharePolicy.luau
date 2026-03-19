local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileShareLinks");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local v3 = require(l_script_FirstAncestor_0.Enums.ProfileSharePolicyEnum);
return function() --[[ Line: 7 ]]
    -- upvalues: l_useAppPolicy_0 (copy), v3 (copy)
    return (l_useAppPolicy_0(function(v4) --[[ Line: 8 ]]
        -- upvalues: v3 (ref)
        local v5 = v4.getProfileShareLinkEnabled();
        local v6 = v4.getProfileCopyLinkEnabled();
        if v5 then
            return v3.Share;
        elseif v6 then
            return v3.Copy;
        else
            return v3.Disabled;
        end;
    end));
end;
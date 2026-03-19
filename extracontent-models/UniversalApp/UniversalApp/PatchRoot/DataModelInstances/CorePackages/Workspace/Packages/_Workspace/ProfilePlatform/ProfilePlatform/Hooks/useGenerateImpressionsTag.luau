local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Common.Enums);
local v3 = require(l_Parent_0.React);
local l_HttpService_0 = game:GetService("HttpService");
return function(v5) --[[ Line: 10 ]]
    -- upvalues: v3 (copy), l_HttpService_0 (copy)
    return v3.useMemo(function() --[[ Line: 11 ]]
        -- upvalues: v5 (copy), l_HttpService_0 (ref)
        return (("ProfilePlatform_$%*_$%*"):format(v5, (l_HttpService_0:GenerateGUID())));
    end, {
        v5
    });
end;
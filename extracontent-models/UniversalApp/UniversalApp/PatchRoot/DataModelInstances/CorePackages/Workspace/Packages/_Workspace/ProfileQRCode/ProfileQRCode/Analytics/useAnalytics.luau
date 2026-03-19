local l_Parent_0 = script:FindFirstAncestor("ProfileQRCode").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.ProfileQRCodeAnalytics);
return function() --[[ Line: 8 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.useContext(v2);
end;
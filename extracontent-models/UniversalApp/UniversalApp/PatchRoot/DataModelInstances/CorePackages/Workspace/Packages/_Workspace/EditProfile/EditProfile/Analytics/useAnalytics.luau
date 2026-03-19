local l_Parent_0 = script:FindFirstAncestor("EditProfile").Parent;
local v1 = require(script.Parent.EditProfileAnalyticsContext);
local v2 = require(l_Parent_0.React);
return function() --[[ Line: 8 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return v2.useContext(v1);
end;
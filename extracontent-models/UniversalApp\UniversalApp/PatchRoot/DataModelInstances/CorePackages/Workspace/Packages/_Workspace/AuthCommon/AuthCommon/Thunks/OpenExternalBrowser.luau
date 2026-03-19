local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local v1 = require(l_Parent_0.ArgCheck);
return function(v2, v3) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    v1.isNotNil(v2, "linking");
    v1.isType(v3, "string", "url");
    v2:openURL(v3);
end;
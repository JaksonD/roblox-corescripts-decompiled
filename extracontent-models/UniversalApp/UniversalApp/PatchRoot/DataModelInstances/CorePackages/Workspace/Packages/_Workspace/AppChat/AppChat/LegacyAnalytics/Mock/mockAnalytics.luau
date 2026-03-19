local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(script.Parent.MockAnalyticsProvider);
return function(v3) --[[ Line: 7 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.createElement(v2, {}, {
        AnalyticsElement = v3
    });
end;
local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(script.Parent.AnalyticsConsumer);
return function(v3) --[[ Line: 11 ]]
    -- upvalues: v1 (copy), v2 (copy)
    assert(type(v3) == "function", "Expect renderCallback to be a function.");
    return v1.createElement(v2, {
        render = v3
    });
end;
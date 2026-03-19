local l_Parent_0 = script:FindFirstAncestor("RealtimeDelivery").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.RealtimeContext);
return function(v3) --[[ Line: 12 ]] --[[ Name: RealtimeProvider ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.createElement(v2.Provider, {
        value = v3.realtime
    }, v3.children);
end;
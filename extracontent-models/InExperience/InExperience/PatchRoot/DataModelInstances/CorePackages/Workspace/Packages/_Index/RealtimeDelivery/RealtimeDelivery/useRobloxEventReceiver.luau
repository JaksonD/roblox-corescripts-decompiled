local l_Parent_0 = script:FindFirstAncestor("RealtimeDelivery").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.RealtimeContext);
return function() --[[ Line: 7 ]] --[[ Name: useRobloxEventReceiver ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.useContext(v2);
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local l_enums_0 = require(l_script_FirstAncestor_0.Parent.VirtualEventsState).enums;
local _ = require(l_script_FirstAncestor_0.Parent.VirtualEventsState);
local v3 = require(script.Parent.sendEventDeferred);
return function(v4) --[[ Line: 16 ]]
    -- upvalues: v3 (copy), l_enums_0 (copy)
    v3(l_enums_0.AnalyticsEvent.VirtualEventRSVP, v4);
end;
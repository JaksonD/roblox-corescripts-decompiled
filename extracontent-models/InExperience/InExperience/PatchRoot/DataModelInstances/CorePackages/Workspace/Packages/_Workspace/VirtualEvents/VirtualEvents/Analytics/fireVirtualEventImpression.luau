local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local l_enums_0 = require(l_script_FirstAncestor_0.Parent.VirtualEventsState).enums;
local v2 = require(script.Parent.sendEventDeferred);
return function(v3) --[[ Line: 13 ]]
    -- upvalues: v2 (copy), l_enums_0 (copy)
    v2(l_enums_0.AnalyticsEvent.VirtualEventImpression, v3);
end;
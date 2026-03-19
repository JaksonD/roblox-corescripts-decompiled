local l_EventIngestService_0 = game:GetService("EventIngestService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_getPlatformTarget_0 = require(l_Parent_0.Analytics).getPlatformTarget;
return function(v3, v4, v5) --[[ Line: 5 ]]
    -- upvalues: l_EventIngestService_0 (copy), l_getPlatformTarget_0 (copy)
    l_EventIngestService_0:SendEventDeferred(l_getPlatformTarget_0(), v3, v4, v5 or {});
end;
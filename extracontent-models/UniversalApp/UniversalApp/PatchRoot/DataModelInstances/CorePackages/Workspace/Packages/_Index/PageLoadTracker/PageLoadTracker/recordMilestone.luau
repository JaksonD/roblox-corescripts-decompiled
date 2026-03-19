local l_Parent_0 = script:FindFirstAncestor("PageLoadTracker").Parent;
local v1 = require(l_Parent_0.LoggingProtocol);
local v2 = require(script.Parent.PageLoadConfig);
local _ = require(script.Parent.PageLoadTypes);
local l_default_0 = v1.default;
recordMilestone = function(v5) --[[ Line: 10 ]] --[[ Name: recordMilestone ]]
    -- upvalues: l_default_0 (copy), v2 (copy)
    l_default_0:logRobloxTelemetryEvent(v2.PAGE_LOAD_SUMMARY_CONFIG, {
        l_default_0.StandardizedFields.addOsInfo
    }, v5);
end;
return recordMilestone;
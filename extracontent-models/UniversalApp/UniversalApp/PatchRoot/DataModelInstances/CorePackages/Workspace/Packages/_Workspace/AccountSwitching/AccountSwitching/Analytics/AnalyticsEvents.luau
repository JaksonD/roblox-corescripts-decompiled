local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local v2 = require(script.Parent.EventConstants);
local l_EventIngestService_0 = game:GetService("EventIngestService");
local v4 = v1.Analytics.AnalyticsReporters.EventIngest.new(l_EventIngestService_0);
return {
    sendModalShownEvent = function(v5, v6) --[[ Line: 8 ]] --[[ Name: sendModalShownEvent ]]
        -- upvalues: v4 (copy), v2 (copy)
        v4:sendEventDeferred(v5, v2.eventNames.modalShown, {
            state = v6
        });
    end, 
    sendButtonClickEvent = function(v7, v8, v9) --[[ Line: 11 ]] --[[ Name: sendButtonClickEvent ]]
        -- upvalues: v4 (copy), v2 (copy)
        v4:sendEventDeferred(v7, v2.eventNames.buttonClick, {
            btn = v8, 
            state = v9
        });
    end
};
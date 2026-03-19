local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local v2 = require(script.Parent.EventConstants);
local l_EventIngestService_0 = game:GetService("EventIngestService");
local v4 = v1.Analytics.AnalyticsReporters.EventIngest.new(l_EventIngestService_0);
return {
    sendPageLoadEvent = function(v5, v6, v7) --[[ Line: 8 ]] --[[ Name: sendPageLoadEvent ]]
        -- upvalues: v4 (copy), v2 (copy)
        v4:sendEventDeferred(v5, v2.eventNames.pageLoad, {
            origin = v6, 
            state = v7
        });
    end, 
    sendSelectEvent = function(v8, v9, v10) --[[ Line: 11 ]] --[[ Name: sendSelectEvent ]]
        -- upvalues: v4 (copy), v2 (copy)
        v4:sendEventDeferred(v8, v2.eventNames.buttonClick, {
            origin = v9, 
            btn = v2.btn.select, 
            state = v10
        });
    end, 
    sendModalShownEvent = function(v11, v12) --[[ Line: 18 ]] --[[ Name: sendModalShownEvent ]]
        -- upvalues: v4 (copy), v2 (copy)
        v4:sendEventDeferred(v11, v2.eventNames.modalShown, {
            origin = v12
        });
    end, 
    sendButtonClickEvent = function(v13, v14, v15) --[[ Line: 21 ]] --[[ Name: sendButtonClickEvent ]]
        -- upvalues: v4 (copy), v2 (copy)
        v4:sendEventDeferred(v13, v2.eventNames.buttonClick, {
            origin = v14, 
            btn = v15
        });
    end
};
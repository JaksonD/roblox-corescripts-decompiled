local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local v2 = require(script.Parent.EventConstants);
local l_EventIngestService_0 = game:GetService("EventIngestService");
local v4 = v1.Analytics.AnalyticsReporters.EventIngest.new(l_EventIngestService_0);
return {
    sendPageLoadEvent = function(v5, v6) --[[ Line: 8 ]] --[[ Name: sendPageLoadEvent ]]
        -- upvalues: v4 (copy), v2 (copy)
        v4:sendEventDeferred(v5, v2.eventNames.pageLoad, {
            origin = v6
        });
    end, 
    sendFormInteractionEvent = function(v7, v8, v9) --[[ Line: 11 ]] --[[ Name: sendFormInteractionEvent ]]
        -- upvalues: v4 (copy), v2 (copy)
        v4:sendEventDeferred(v7, v2.eventNames.formInteraction, {
            origin = v8, 
            field = v9
        });
    end, 
    sendButtonClickEvent = function(v10, v11, v12) --[[ Line: 18 ]] --[[ Name: sendButtonClickEvent ]]
        -- upvalues: v4 (copy), v2 (copy)
        v4:sendEventDeferred(v10, v2.eventNames.buttonClick, {
            origin = v11, 
            btn = v12
        });
    end
};
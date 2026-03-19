local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_gamePlayIntent_0 = require(l_Parent_0.DiscoveryAnalytics).Events.gamePlayIntent;
return function(v2, v3, v4) --[[ Line: 9 ]] --[[ Name: ReportAnEvent ]]
    -- upvalues: l_gamePlayIntent_0 (copy)
    local v5 = nil;
    local v6 = nil;
    if v3 == "gamePlayIntent" then
        v6 = {
            conversationId = v2.conversationId, 
            rootPlaceId = v2.placeId, 
            joinAttemptId = v2.joinAttemptId
        };
        v5 = v2.eventIngest;
    else
        v6 = {
            conversationId = v2.conversationId, 
            placeId = v2.placeId
        };
        v5 = v2.eventStream;
    end;
    if v3 == "gamePlayIntent" then
        l_gamePlayIntent_0(v5, v4, {
            placeId = v6.rootPlaceId, 
            rootPlaceId = tonumber(v6.rootPlaceId), 
            conversationId = v6.conversationId, 
            joinAttemptId = v6.joinAttemptId
        });
        return;
    else
        v5:setRBXEventStream(v4, v3, v6);
        return;
    end;
end;
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChatShared");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v5 = require(l_script_FirstAncestor_0.Logger):new("ExpChat/" .. script.Name);
local v6 = {};
local l_l_RbxAnalyticsService_0_0 = l_RbxAnalyticsService_0;
local function v9(v8) --[[ Line: 16 ]] --[[ Name: withDefaultArgs ]]
    -- upvalues: l_Dictionary_0 (copy)
    return l_Dictionary_0.join(v8, {
        gameId = tostring(game.GameId), 
        placeId = tostring(game.PlaceId)
    });
end;
local function v14(v10, v11, v12, v13) --[[ Line: 23 ]] --[[ Name: setRbxEventStream ]]
    -- upvalues: l_l_RbxAnalyticsService_0_0 (ref), v5 (copy), v9 (copy)
    if l_l_RbxAnalyticsService_0_0 then
        v5:debug("Event: {}", v12);
        l_l_RbxAnalyticsService_0_0:SetRBXEventStream(v10, v11, v12, v9(v13 or {}));
    end;
end;
local function v19(v15, v16, v17, v18) --[[ Line: 30 ]] --[[ Name: sendEventDeferred ]]
    -- upvalues: l_l_RbxAnalyticsService_0_0 (ref), v5 (copy), v9 (copy)
    if l_l_RbxAnalyticsService_0_0 then
        v5:debug("SendEventDeferred: {}", v17);
        l_l_RbxAnalyticsService_0_0:SendEventDeferred(v15, v16, v17, v9(v18 or {}));
    end;
end;
v6.with = function(v20) --[[ Line: 37 ]] --[[ Name: with ]]
    -- upvalues: l_l_RbxAnalyticsService_0_0 (ref), l_RbxAnalyticsService_0 (copy)
    l_l_RbxAnalyticsService_0_0 = v20 or l_RbxAnalyticsService_0;
end;
v6.FireRccAnalyticsWithEventName = function(v21, v22) --[[ Line: 41 ]] --[[ Name: FireRccAnalyticsWithEventName ]]
    -- upvalues: v14 (copy)
    v14("rcc", "experienceChat", v21, v22);
end;
v6.FireClientAnalyticsWithEventName = function(v23, v24) --[[ Line: 45 ]] --[[ Name: FireClientAnalyticsWithEventName ]]
    -- upvalues: v14 (copy)
    v14("client", "experienceChat", v23, v24);
end;
v6.reportCounter = function(v25, v26) --[[ Line: 49 ]] --[[ Name: reportCounter ]]
    -- upvalues: l_l_RbxAnalyticsService_0_0 (ref), v5 (copy)
    if l_l_RbxAnalyticsService_0_0 then
        v5:debug("Counter: {}", v25);
        l_l_RbxAnalyticsService_0_0:ReportCounter(v25, v26 or 1);
    end;
end;
v6.FireLikelySpeakingBubbleAnalytics = function(v27, v28, v29, v30) --[[ Line: 56 ]] --[[ Name: FireLikelySpeakingBubbleAnalytics ]]
    -- upvalues: v14 (copy)
    v14("client", "voiceChat", "likelySpeakingBubbleEvent", {
        eventType = v27, 
        universe_id = v28, 
        place_id = v29, 
        play_session_id = v30
    });
end;
v6.FireRccAnalyticsDeferred = function(v31, v32) --[[ Line: 70 ]] --[[ Name: FireRccAnalyticsDeferred ]]
    -- upvalues: v19 (copy)
    v19("RCC", "experienceChat", v31, v32);
end;
v6.TelemetryLogEvent = function(_, v34, v35, v36) --[[ Line: 74 ]] --[[ Name: TelemetryLogEvent ]]
    -- upvalues: l_TelemetryService_0 (copy)
    l_TelemetryService_0:LogEvent(v34, {
        customFields = v35, 
        standardizedFields = v36
    });
end;
return v6;
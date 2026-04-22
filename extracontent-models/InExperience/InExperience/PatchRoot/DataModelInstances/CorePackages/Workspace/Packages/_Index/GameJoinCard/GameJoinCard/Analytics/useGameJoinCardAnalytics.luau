local l_Players_0 = game:GetService("Players");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_Parent_0 = script:FindFirstAncestor("GameJoinCard").Parent;
local v3 = require(l_Parent_0.LoggingProtocol);
local v4 = game:DefineFastInt("GameJoinCardAnalyticsThrottleHundredthsPercent", 10000);
local v5 = {
    eventName = "buttonClick", 
    backends = {
        v3.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = v4, 
    lastUpdated = {
        2026, 
        4, 
        14
    }, 
    description = "Game join card button taps (GameJoinCardButtonEvents \226\134\146 buttonClick, ctx gameJoinCard)", 
    links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/social/game_join_card/game_join_card_button_events.proto"
};
local v6 = {
    eventName = "luaPageLoad", 
    backends = {
        v3.TelemetryBackends.EventIngest
    }, 
    throttlingPercentage = v4, 
    lastUpdated = {
        2026, 
        4, 
        14
    }, 
    description = "Game join card surface shown (GameJoinCardPageLoadedEvent \226\134\146 luaPageLoad, ctx gameJoinCard)", 
    links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/social/game_join_card/game_join_card_page_loaded.proto"
};
local function _(v7) --[[ Line: 40 ]] --[[ Name: optionalInt64FromString ]]
    if v7 == nil or v7 == "" then
        return nil;
    else
        return (tonumber(v7));
    end;
end;
local function v15(v9) --[[ Line: 48 ]] --[[ Name: buildGameJoinCardCommonFields ]]
    -- upvalues: l_Players_0 (copy)
    local v10 = {};
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if l_LocalPlayer_0 then
        v10.uid = l_LocalPlayer_0.UserId;
    end;
    if v9.friendId and v9.friendId ~= "" then
        local v12 = tonumber(v9.friendId);
        if v12 then
            v10.cardUserId = v12;
        end;
    end;
    local l_universeId_0 = v9.universeId;
    local v14 = if not (l_universeId_0 ~= nil) or l_universeId_0 == "" then nil else tonumber(l_universeId_0);
    if v14 then
        v10.universeId = v14;
    end;
    if v9.absolutePosition ~= nil then
        v10.carouselAbsolutePosition = math.floor(v9.absolutePosition);
    end;
    return v10;
end;
return {
    logGameJoinCardButtonEvent = function(v16, v17) --[[ Line: 75 ]] --[[ Name: logGameJoinCardButtonEvent ]]
        -- upvalues: v15 (copy), l_TelemetryService_0 (copy), v5 (copy)
        local v18 = v15(v17 or {});
        v18.buttonAction = v16;
        l_TelemetryService_0:LogEvent(v5, {
            eventContext = "gameJoinCard", 
            customFields = v18, 
            standardizedFields = {
                "addSessionInfo"
            }
        });
    end, 
    logGameJoinCardPageLoaded = function(v19) --[[ Line: 86 ]] --[[ Name: logGameJoinCardPageLoaded ]]
        -- upvalues: v15 (copy), l_TelemetryService_0 (copy), v6 (copy)
        local v20 = v15(v19 or {});
        l_TelemetryService_0:LogEvent(v6, {
            eventContext = "gameJoinCard", 
            customFields = v20, 
            standardizedFields = {
                "addSessionInfo"
            }
        });
    end
};
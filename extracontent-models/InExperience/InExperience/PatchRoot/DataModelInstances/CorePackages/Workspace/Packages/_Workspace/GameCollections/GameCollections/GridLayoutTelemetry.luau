local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameCollections");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.DiscoveryTypes);
local v4 = game:DefineFastFlag("LuaAppNullableGridLayoutTelemetryFields", false);
local v5 = {
    "addOSInfo", 
    "addSessionInfo", 
    "addSessionId"
};
local v6 = {
    eventName = "TileSkipped", 
    backends = {
        "EventIngest", 
        "Points"
    }, 
    throttlingPercentage = game:DefineFastInt("TileSkippedTelemetryThrottleHundredthsPercent", 0), 
    lastUpdated = {
        26, 
        1, 
        16
    }, 
    description = "This is fired when a tile render gets skipped."
};
local v7 = {
    eventName = "TilePlaced", 
    backends = {
        "EventIngest", 
        "Points"
    }, 
    throttlingPercentage = game:DefineFastInt("TilePlacedTelemetryThrottleHundredthsPercent", 0), 
    lastUpdated = {
        26, 
        1, 
        16
    }, 
    description = "This is fired when a tile position has been determined."
};
return {
    logTileSkipped = function(v8, v9, v10, v11, v12, v13, v14, v15, v16) --[[ Line: 38 ]] --[[ Name: logTileSkipped ]]
        -- upvalues: v4 (copy), l_TelemetryService_0 (copy), v6 (copy), v5 (copy)
        local v17 = {
            adId = if v4 then v8 else v8 or "", 
            universeId = if v4 then v9 else v9 or "", 
            tileType = v10, 
            pageContext = v11, 
            numColumns = v12, 
            numRows = v13, 
            originalFeedIndex = v14, 
            sortIndex = if v4 then v15 else v15 or -1, 
            topicId = if v4 then v16 else v16 or ""
        };
        l_TelemetryService_0:LogEvent(v6, {
            standardizedFields = v5, 
            customFields = v17
        });
    end, 
    logTilePlaced = function(v18, v19, v20, v21, v22, v23, v24, v25, v26, v27) --[[ Line: 67 ]] --[[ Name: logTilePlaced ]]
        -- upvalues: v4 (copy), l_TelemetryService_0 (copy), v7 (copy), v5 (copy)
        local v28 = {
            adId = if v4 then v18 else v18 or "", 
            universeId = if v4 then v19 else v19 or "", 
            tileType = v20, 
            pageContext = v21, 
            numColumns = v22, 
            numRows = v23, 
            originalFeedIndex = v24, 
            finalFeedIndex = v25, 
            sortIndex = v26, 
            topicId = v27
        };
        l_TelemetryService_0:LogEvent(v7, {
            standardizedFields = v5, 
            customFields = v28
        });
    end
};
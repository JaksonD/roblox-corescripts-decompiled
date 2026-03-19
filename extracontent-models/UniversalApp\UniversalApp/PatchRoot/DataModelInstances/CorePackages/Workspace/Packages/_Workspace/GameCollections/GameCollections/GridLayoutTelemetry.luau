local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameCollections");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.DiscoveryTypes);
local v4 = {
    "addOSInfo", 
    "addSessionInfo", 
    "addSessionId"
};
local v5 = {
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
local v6 = {
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
    logTileSkipped = function(v7, v8, v9, v10, v11, v12, v13, v14, v15) --[[ Line: 35 ]] --[[ Name: logTileSkipped ]]
        -- upvalues: l_TelemetryService_0 (copy), v5 (copy), v4 (copy)
        local v16 = {
            adId = v7 or "", 
            universeId = v8 or "", 
            tileType = v9, 
            pageContext = v10, 
            numColumns = v11, 
            numRows = v12, 
            originalFeedIndex = v13, 
            sortIndex = v14 or -1, 
            topicId = v15 or ""
        };
        l_TelemetryService_0:LogEvent(v5, {
            standardizedFields = v4, 
            customFields = v16
        });
    end, 
    logTilePlaced = function(v17, v18, v19, v20, v21, v22, v23, v24, v25, v26) --[[ Line: 64 ]] --[[ Name: logTilePlaced ]]
        -- upvalues: l_TelemetryService_0 (copy), v6 (copy), v4 (copy)
        local v27 = {
            adId = v17 or "", 
            universeId = v18 or "", 
            tileType = v19, 
            pageContext = v20, 
            numColumns = v21, 
            numRows = v22, 
            originalFeedIndex = v23, 
            finalFeedIndex = v24, 
            sortIndex = v25, 
            topicId = v26
        };
        l_TelemetryService_0:LogEvent(v6, {
            standardizedFields = v4, 
            customFields = v27
        });
    end
};
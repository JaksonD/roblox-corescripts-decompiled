local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("UnifiedLogging");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.t);
local l_DiscoveryEventErrorLogger_0 = require(l_Parent_0.DiscoveryUtils).DiscoveryEventErrorLogger;
local v6 = require(l_script_FirstAncestor_0.ContentType);
local l_FFlagLuaAppLoosenCollectionIdTypeInterface_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppLoosenCollectionIdTypeInterface;
local l_FFlagProfilePlatformEnableImpressions_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformEnableImpressions;
local l_FFlagItemImpressionsAddGameMetadata_0 = require(l_Parent_0.SharedFlags).FFlagItemImpressionsAddGameMetadata;
local l_FFlagEnableTopSongsSort_0 = require(l_Parent_0.SharedFlags).FFlagEnableTopSongsSort;
local l_FFlagLuaAppMigrateItemEventsTelemetryService_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateItemEventsTelemetryService;
local l_FFlagLuaAppItemEventsTelemetryServiceShadowTraffic_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppItemEventsTelemetryServiceShadowTraffic;
local v13 = game:DefineFastInt("LuaAppItemImpressionsEventThrottlingHundredthsPercent", 10000);
local v14 = game:DefineFastInt("LuaAppItemImpressionsShadowThrottlingHundredthsPercent", 10000);
local v15 = nil;
if l_FFlagLuaAppMigrateItemEventsTelemetryService_0 then
    v15 = {
        eventName = "itemImpressions", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v13, 
        lastUpdated = {
            26, 
            2, 
            4
        }, 
        description = "Fires when items become visible to the user, primarily through SDUI"
    };
end;
local v16 = nil;
if l_FFlagLuaAppItemEventsTelemetryServiceShadowTraffic_0 then
    v16 = {
        eventName = "itemImpressionsShadow", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v14, 
        lastUpdated = {
            26, 
            3, 
            4
        }, 
        description = "Shadow traffic for itemImpressions event recovery percentage"
    };
end;
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = v4.union(v4.interface({
    collectionId = if l_FFlagLuaAppLoosenCollectionIdTypeInterface_0 then v4.union(v4.string, v4.number) else v4.number, 
    collectionIdStr = v4.optional(v4.string)
}), v4.interface({
    collectionId = v4.optional(if l_FFlagLuaAppLoosenCollectionIdTypeInterface_0 then v4.union(v4.string, v4.number) else v4.number), 
    collectionIdStr = v4.string
}));
local v21 = {
    collectionPosition = v4.number, 
    totalNumberOfItems = v4.number, 
    contentType = v4.string, 
    itemIds = v4.string, 
    itemPositions = v4.string, 
    rowNumbers = v4.optional(v4.string), 
    feedRowNumbers = v4.optional(v4.string), 
    positionsInRow = v4.optional(v4.string), 
    positionsInTopic = v4.optional(v4.string)
};
v18 = v4.intersection(v20, v4.interface(v21));
v19 = v4.intersection(v20, v4.interface(v3.Dictionary.join(v21, {
    sourceCarousel = v4.string, 
    friendStatuses = v4.string, 
    presences = v4.string, 
    presenceUniverseIds = v4.string
})));
if l_FFlagItemImpressionsAddGameMetadata_0 then
    v17 = v4.intersection(v20, v4.interface(v3.Dictionary.join(v21, {
        universeId_arr = v4.string, 
        placeId_arr = v4.string
    })));
end;
local v22 = {
    [v6.User] = v19, 
    [v6.Game] = if l_FFlagItemImpressionsAddGameMetadata_0 and l_FFlagProfilePlatformEnableImpressions_0 then v17 else if l_FFlagProfilePlatformEnableImpressions_0 then v18 else nil, 
    [v6.Song] = if l_FFlagEnableTopSongsSort_0 then v18 else nil, 
    [v6.Badge] = v18
};
return function(v23, v24, v25, v26) --[[ Line: 115 ]]
    -- upvalues: v22 (copy), v18 (ref), l_DiscoveryEventErrorLogger_0 (copy), l_FFlagLuaAppMigrateItemEventsTelemetryService_0 (copy), l_TelemetryService_0 (copy), v15 (ref), l_FFlagLuaAppItemEventsTelemetryServiceShadowTraffic_0 (copy), v16 (ref)
    local v27 = v22[v25] or v18;
    if v27 then
        local v28, v29 = v27(v26);
        if not v28 then
            l_DiscoveryEventErrorLogger_0.reportError("ItemImpressionsEventInvalidInterface", v29);
        end;
    end;
    if l_FFlagLuaAppMigrateItemEventsTelemetryService_0 then
        for v30, v31 in v26 do
            if type(v31) == "boolean" then
                v26[v30] = v31 == true and "true" or v31 == false and "false" or nil;
            end;
        end;
        l_TelemetryService_0:LogEvent(v15, {
            eventContext = v24, 
            standardizedFields = {
                "addSessionInfo", 
                "addSessionId", 
                "addOSInfo"
            }, 
            customFields = v26
        });
    else
        v23:sendEventDeferred(v24, "itemImpressions", v26);
    end;
    if l_FFlagLuaAppItemEventsTelemetryServiceShadowTraffic_0 then
        local v32 = table.clone(v26);
        for v33, v34 in v32 do
            if type(v34) == "boolean" then
                v32[v33] = v34 == true and "true" or v34 == false and "false" or nil;
            end;
        end;
        l_TelemetryService_0:LogEvent(v16, {
            eventContext = v24, 
            standardizedFields = {
                "addSessionInfo", 
                "addSessionId", 
                "addOSInfo"
            }, 
            customFields = v32
        });
    end;
end;
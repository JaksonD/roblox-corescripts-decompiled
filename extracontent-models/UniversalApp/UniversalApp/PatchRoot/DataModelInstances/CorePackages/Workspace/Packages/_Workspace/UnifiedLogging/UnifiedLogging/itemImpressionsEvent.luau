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
local l_FFlagSduiClientBinding_0 = require(l_Parent_0.SharedFlags).FFlagSduiClientBinding;
local l_FFlagLuaAppMigrateItemEventsTelemetryService_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateItemEventsTelemetryService;
local l_FFlagLuaAppItemEventsTelemetryServiceShadowTraffic_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppItemEventsTelemetryServiceShadowTraffic;
local v14 = game:DefineFastInt("LuaAppItemImpressionsEventThrottlingHundredthsPercent", 10000);
local v15 = game:DefineFastInt("LuaAppItemImpressionsShadowThrottlingHundredthsPercent", 10000);
local v16 = nil;
if l_FFlagLuaAppMigrateItemEventsTelemetryService_0 then
    v16 = {
        eventName = "itemImpressions", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v14, 
        lastUpdated = {
            26, 
            2, 
            4
        }, 
        description = "Fires when items become visible to the user, primarily through SDUI"
    };
end;
local v17 = nil;
if l_FFlagLuaAppItemEventsTelemetryServiceShadowTraffic_0 then
    v17 = {
        eventName = "itemImpressionsShadow", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v15, 
        lastUpdated = {
            26, 
            3, 
            4
        }, 
        description = "Shadow traffic for itemImpressions event recovery percentage"
    };
end;
local v18 = nil;
local v19 = nil;
local v20 = nil;
local v21 = v4.union(v4.interface({
    collectionId = if l_FFlagLuaAppLoosenCollectionIdTypeInterface_0 then v4.union(v4.string, v4.number) else v4.number, 
    collectionIdStr = v4.optional(v4.string)
}), v4.interface({
    collectionId = v4.optional(if l_FFlagLuaAppLoosenCollectionIdTypeInterface_0 then v4.union(v4.string, v4.number) else v4.number), 
    collectionIdStr = v4.string
}));
local v22 = {
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
v19 = v4.intersection(v21, v4.interface(v22));
v20 = v4.intersection(v21, v4.interface(v3.Dictionary.join(v22, {
    sourceCarousel = v4.string, 
    friendStatuses = v4.string, 
    presences = v4.string, 
    presenceUniverseIds = v4.string
})));
if l_FFlagItemImpressionsAddGameMetadata_0 then
    v18 = v4.intersection(v21, v4.interface(v3.Dictionary.join(v22, {
        universeId_arr = v4.string, 
        placeId_arr = v4.string
    })));
end;
local v23 = {
    [v6.User] = v20, 
    [v6.Game] = if l_FFlagItemImpressionsAddGameMetadata_0 and l_FFlagProfilePlatformEnableImpressions_0 then v18 else if l_FFlagProfilePlatformEnableImpressions_0 then v19 else nil, 
    [v6.Song] = if l_FFlagEnableTopSongsSort_0 then v19 else nil, 
    [v6.Badge] = if l_FFlagSduiClientBinding_0 then v19 else nil
};
return function(v24, v25, v26, v27) --[[ Line: 116 ]]
    -- upvalues: v23 (copy), v19 (ref), l_DiscoveryEventErrorLogger_0 (copy), l_FFlagLuaAppMigrateItemEventsTelemetryService_0 (copy), l_TelemetryService_0 (copy), v16 (ref), l_FFlagLuaAppItemEventsTelemetryServiceShadowTraffic_0 (copy), v17 (ref)
    local v28 = v23[v26] or v19;
    if v28 then
        local v29, v30 = v28(v27);
        if not v29 then
            l_DiscoveryEventErrorLogger_0.reportError("ItemImpressionsEventInvalidInterface", v30);
        end;
    end;
    if l_FFlagLuaAppMigrateItemEventsTelemetryService_0 then
        for v31, v32 in v27 do
            if type(v32) == "boolean" then
                v27[v31] = v32 == true and "true" or v32 == false and "false" or nil;
            end;
        end;
        l_TelemetryService_0:LogEvent(v16, {
            eventContext = v25, 
            standardizedFields = {
                "addSessionInfo", 
                "addSessionId", 
                "addOSInfo"
            }, 
            customFields = v27
        });
    else
        v24:sendEventDeferred(v25, "itemImpressions", v27);
    end;
    if l_FFlagLuaAppItemEventsTelemetryServiceShadowTraffic_0 then
        local v33 = table.clone(v27);
        for v34, v35 in v33 do
            if type(v35) == "boolean" then
                v33[v34] = v35 == true and "true" or v35 == false and "false" or nil;
            end;
        end;
        l_TelemetryService_0:LogEvent(v17, {
            eventContext = v25, 
            standardizedFields = {
                "addSessionInfo", 
                "addSessionId", 
                "addOSInfo"
            }, 
            customFields = v33
        });
    end;
end;
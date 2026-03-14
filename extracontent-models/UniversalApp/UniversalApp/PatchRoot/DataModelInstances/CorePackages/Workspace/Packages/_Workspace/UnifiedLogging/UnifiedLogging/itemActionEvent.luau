local l_HttpService_0 = game:GetService("HttpService");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("UnifiedLogging");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.t);
local l_DiscoveryEventErrorLogger_0 = require(l_Parent_0.DiscoveryUtils).DiscoveryEventErrorLogger;
local v7 = require(l_script_FirstAncestor_0.ContentType);
local l_FFlagLuaAppLoosenCollectionIdTypeInterface_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppLoosenCollectionIdTypeInterface;
local v9 = require(script.Parent.FFlagLuaAppUnifiedLoggingDialogContentType);
local l_FFlagLuaAppMigrateItemEventsTelemetryService_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppMigrateItemEventsTelemetryService;
local l_FFlagLuaAppItemEventsTelemetryServiceShadowTraffic_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppItemEventsTelemetryServiceShadowTraffic;
local v12 = game:DefineFastInt("LuaAppItemActionEventThrottlingHundredthsPercent", 10000);
local v13 = game:DefineFastInt("LuaAppItemActionShadowThrottlingHundredthsPercent", 10000);
local v14 = nil;
if l_FFlagLuaAppMigrateItemEventsTelemetryService_0 then
    v14 = {
        eventName = "itemAction", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v12, 
        lastUpdated = {
            26, 
            2, 
            4
        }, 
        description = "Fires for default user actions, primarily through SDUI"
    };
end;
local v15 = nil;
if l_FFlagLuaAppItemEventsTelemetryServiceShadowTraffic_0 then
    v15 = {
        eventName = "itemActionShadow", 
        backends = {
            "EventIngest"
        }, 
        throttlingPercentage = v13, 
        lastUpdated = {
            26, 
            3, 
            4
        }, 
        description = "Shadow traffic for itemAction event recovery percentage"
    };
end;
local v16 = nil;
local v17 = nil;
local v18 = v5.union(v5.interface({
    collectionId = if l_FFlagLuaAppLoosenCollectionIdTypeInterface_0 then v5.union(v5.string, v5.number) else v5.number, 
    collectionIdStr = v5.optional(v5.string)
}), v5.interface({
    collectionId = v5.optional(if l_FFlagLuaAppLoosenCollectionIdTypeInterface_0 then v5.union(v5.string, v5.number) else v5.number), 
    collectionIdStr = v5.string
}));
local v19 = {
    collectionPosition = v5.number, 
    totalNumberOfItems = v5.number, 
    contentType = v5.string, 
    itemId = v5.optional(v5.string), 
    itemPosition = v5.optional(v5.number), 
    positionInRow = v5.optional(v5.number), 
    rowNumber = v5.optional(v5.number), 
    feedRowNumber = v5.optional(v5.number), 
    positionInTopic = v5.optional(v5.number), 
    actionType = v5.string, 
    interactionUuid = v5.optional(v5.string)
};
v16 = v5.intersection(v18, v5.interface(v19));
v17 = v5.intersection(v18, v5.interface(v4.Dictionary.join(v19, {
    itemId = v5.string, 
    itemPosition = v5.number, 
    sourceCarousel = v5.string, 
    friendStatus = v5.string, 
    presence = v5.string, 
    presenceUniverseId = v5.string
})));
local v20 = if v9 then v5.interface({
    contentType = v5.string, 
    actionType = v5.string, 
    interactionUuid = v5.optional(v5.string)
}) else nil;
local v21 = {
    [v7.User] = v17
};
if v9 then
    v21[v7.Dialog] = v20;
end;
return function(v22, v23, v24, v25) --[[ Line: 113 ]]
    -- upvalues: v21 (copy), v16 (ref), l_DiscoveryEventErrorLogger_0 (copy), l_HttpService_0 (copy), l_FFlagLuaAppMigrateItemEventsTelemetryService_0 (copy), l_TelemetryService_0 (copy), v14 (ref), l_FFlagLuaAppItemEventsTelemetryServiceShadowTraffic_0 (copy), v15 (ref)
    local v26 = v21[v24] or v16;
    if v26 then
        local v27, v28 = v26(v25);
        if not v27 then
            l_DiscoveryEventErrorLogger_0.reportError("ItemActionEventInvalidInterface", v28);
        end;
    end;
    if not v25.interactionUuid then
        v25.interactionUuid = l_HttpService_0:GenerateGUID(false);
    end;
    if l_FFlagLuaAppMigrateItemEventsTelemetryService_0 then
        for v29, v30 in v25 do
            if type(v30) == "boolean" then
                v25[v29] = v30 == true and "true" or v30 == false and "false" or nil;
            end;
        end;
        l_TelemetryService_0:LogEvent(v14, {
            eventContext = v23, 
            standardizedFields = {
                "addSessionInfo", 
                "addSessionId", 
                "addOSInfo"
            }, 
            customFields = v25
        });
    else
        v22:sendEventDeferred(v23, "itemAction", v25);
    end;
    if l_FFlagLuaAppItemEventsTelemetryServiceShadowTraffic_0 then
        local v31 = table.clone(v25);
        for v32, v33 in v31 do
            if type(v33) == "boolean" then
                v31[v32] = v33 == true and "true" or v33 == false and "false" or nil;
            end;
        end;
        l_TelemetryService_0:LogEvent(v15, {
            eventContext = v23, 
            standardizedFields = {
                "addSessionInfo", 
                "addSessionId", 
                "addOSInfo"
            }, 
            customFields = v31
        });
    end;
end;
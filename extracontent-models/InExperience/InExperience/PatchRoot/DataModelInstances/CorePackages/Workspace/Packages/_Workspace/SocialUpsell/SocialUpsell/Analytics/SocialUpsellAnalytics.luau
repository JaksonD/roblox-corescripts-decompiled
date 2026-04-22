local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialUpsell");
local _ = require(l_script_FirstAncestor_0.Types);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_script_FirstAncestor_0.Analytics.Enum.UpsellEntrySurfaceType);
local v6 = require(l_script_FirstAncestor_0.Analytics.Enum.UpsellComponent);
local v7 = require(l_script_FirstAncestor_0.Analytics.Enum.UpsellStage);
local _ = require(l_Parent_0.SocialLuaAnalytics).Analytics.Enums.EventTypes;
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v10 = require(l_script_FirstAncestor_0.Flag.FFlagAddSessionizationToAnalytics);
local v11 = require(l_script_FirstAncestor_0.Flag.FFlagAddAEGIS2Analytics);
local v12 = require(l_script_FirstAncestor_0.Flag.FFlagAddUpsellEntryComponentToAnalytics);
local v13 = game:DefineFastInt("FIntSocialUpsellEventThrottleHunderedthsPercent", 10000);
local v14 = {
    backends = {
        "EventIngest"
    }, 
    throttlingPercentage = v13, 
    lastUpdated = {
        2025, 
        9, 
        26
    }, 
    description = "Upsell Banner Analytics Event"
};
evaluateUpsellStage = function(v15, v16, v17) --[[ Line: 29 ]] --[[ Name: evaluateUpsellStage ]]
    -- upvalues: v6 (copy), v5 (copy), v11 (copy), v7 (copy)
    if v16 == v6.Modal then
        if v17 == v6.Modal and (v15 == v5.Homepage or v11 and (v15 == v5.InExperienceChatInputBar or v15 == v5.InExperienceVoiceChatIcon)) then
            return v7.Fae;
        else
            return v7.FaeDetails;
        end;
    else
        return v7.Fae;
    end;
end;
local function _(v18, v19, v20) --[[ Line: 60 ]] --[[ Name: generateUpsellIdentifier ]]
    if not v18 or not v19 or not v20 then
        return nil;
    else
        return v18 .. v19 .. v20;
    end;
end;
logUpsellEvent = function(v22, v23) --[[ Line: 71 ]] --[[ Name: logUpsellEvent ]]
    -- upvalues: v4 (copy), v14 (copy), l_RbxAnalyticsService_0 (copy), v12 (copy), v10 (copy), v11 (copy), l_TelemetryService_0 (copy)
    local v24 = v4.Dictionary.join(v14, {
        eventName = v22
    });
    local l_l_RbxAnalyticsService_0_PlaySessionId_0 = l_RbxAnalyticsService_0:GetPlaySessionId();
    local v26 = {
        upsellEntrySurface = v23.upsellEntrySurface, 
        upsellStage = v23.upsellStage, 
        upsellImpressionId = v23.upsellImpressionId, 
        upsellComponent = v23.upsellComponent, 
        btn = v23.btn or nil, 
        conversationId = v23.conversationId or nil, 
        playSessionId = if l_l_RbxAnalyticsService_0_PlaySessionId_0 ~= "" then l_l_RbxAnalyticsService_0_PlaySessionId_0 else nil, 
        clientTimeStamp = os.time(), 
        upsellEntryComponent = if v12 then v23.upsellEntryComponent else nil
    };
    local l_upsellPurpose_0 = v23.upsellPurpose;
    local l_upsellEntrySurface_0 = v23.upsellEntrySurface;
    local l_upsellComponent_0 = v23.upsellComponent;
    v26.upsellIdentifier = if l_upsellPurpose_0 and l_upsellEntrySurface_0 and l_upsellComponent_0 then l_upsellPurpose_0 .. l_upsellEntrySurface_0 .. l_upsellComponent_0 else nil;
    v26.upsellPurpose = v23.upsellPurpose;
    local v30 = if v10 then {
        "addSessionInfo"
    } else {};
    if v11 then
        table.insert(v30, "addPlaceId");
        table.insert(v30, "addUniverseId");
    end;
    l_TelemetryService_0:LogEvent(v24, {
        customFields = v26, 
        standardizedFields = v30
    });
end;
return {
    evaluateUpsellStage = evaluateUpsellStage, 
    logUpsellEvent = logUpsellEvent
};
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
local v10 = require(l_script_FirstAncestor_0.Flag.FFlagAddSurfaceTypeToAnalytics);
local v11 = require(l_script_FirstAncestor_0.Flag.FFlagAddMinorFixesToUpsellAnalytics);
local v12 = require(l_script_FirstAncestor_0.Flag.FFlagAddSessionizationToAnalytics);
local v13 = require(l_script_FirstAncestor_0.Flag.FFlagAddAEGIS2Analytics);
local v14 = require(l_script_FirstAncestor_0.Flag.FFlagAddUpsellEntryComponentToAnalytics);
local v15 = game:DefineFastInt("FIntSocialUpsellEventThrottleHunderedthsPercent", 10000);
local v16 = {
    backends = {
        "EventIngest"
    }, 
    throttlingPercentage = v15, 
    lastUpdated = {
        2025, 
        9, 
        26
    }, 
    description = "Upsell Banner Analytics Event"
};
evaluateUpsellStage = function(v17, v18, v19) --[[ Line: 31 ]] --[[ Name: evaluateUpsellStage ]]
    -- upvalues: v11 (copy), v6 (copy), v5 (copy), v13 (copy), v7 (copy)
    if v11 then
        if v18 == v6.Modal then
            if v19 == v6.Modal and (v17 == v5.Homepage or v13 and (v17 == v5.InExperienceChatInputBar or v17 == v5.InExperienceVoiceChatIcon)) then
                return v7.Fae;
            else
                return v7.FaeDetails;
            end;
        else
            return v7.Fae;
        end;
    elseif v18 == v6.Modal then
        if v17 == v5.HomepageBottomSheet or v13 and (v17 == v5.InExperienceChatInputBar or v17 == v5.InExperienceVoiceChatIcon) then
            return v7.Fae;
        else
            return v7.FaeDetails;
        end;
    else
        return v7.Fae;
    end;
end;
local function _(v20, v21, v22) --[[ Line: 86 ]] --[[ Name: generateUpsellIdentifier ]]
    -- upvalues: v11 (copy)
    if v11 and (not v20 or not v21 or not v22) then
        return nil;
    else
        return v20 .. v21 .. v22;
    end;
end;
logUpsellEvent = function(v24, v25) --[[ Line: 97 ]] --[[ Name: logUpsellEvent ]]
    -- upvalues: v4 (copy), v16 (copy), l_RbxAnalyticsService_0 (copy), v10 (copy), v14 (copy), v11 (copy), v12 (copy), v13 (copy), l_TelemetryService_0 (copy)
    local v26 = v4.Dictionary.join(v16, {
        eventName = v24
    });
    local l_l_RbxAnalyticsService_0_PlaySessionId_0 = l_RbxAnalyticsService_0:GetPlaySessionId();
    local v28 = {
        upsellEntrySurface = v25.upsellEntrySurface, 
        upsellStage = v25.upsellStage, 
        upsellImpressionId = v25.upsellImpressionId, 
        upsellComponent = if v10 then v25.upsellComponent else nil, 
        btn = v25.btn or nil, 
        conversationId = v25.conversationId or nil, 
        playSessionId = if l_l_RbxAnalyticsService_0_PlaySessionId_0 ~= "" then l_l_RbxAnalyticsService_0_PlaySessionId_0 else nil, 
        clientTimeStamp = os.time(), 
        upsellEntryComponent = if v14 then v25.upsellEntryComponent else nil
    };
    if v11 then
        local l_upsellPurpose_0 = v25.upsellPurpose;
        local l_upsellEntrySurface_0 = v25.upsellEntrySurface;
        local l_upsellComponent_0 = v25.upsellComponent;
        v28.upsellIdentifier = if not v11 or l_upsellPurpose_0 and l_upsellEntrySurface_0 and l_upsellComponent_0 then l_upsellPurpose_0 .. l_upsellEntrySurface_0 .. l_upsellComponent_0 else nil;
        v28.upsellPurpose = v25.upsellPurpose;
    end;
    local v32 = if v12 then {
        "addSessionInfo"
    } else {};
    if v13 then
        table.insert(v32, "addPlaceId");
        table.insert(v32, "addUniverseId");
    end;
    l_TelemetryService_0:LogEvent(v26, {
        customFields = v28, 
        standardizedFields = v32
    });
end;
return {
    evaluateUpsellStage = evaluateUpsellStage, 
    logUpsellEvent = logUpsellEvent
};
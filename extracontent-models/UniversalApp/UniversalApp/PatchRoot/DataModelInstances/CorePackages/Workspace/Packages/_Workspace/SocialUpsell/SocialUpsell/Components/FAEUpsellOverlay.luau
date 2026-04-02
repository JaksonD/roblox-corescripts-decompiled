local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SharedFlags);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v5 = require(l_Parent_0.FoundationCloudAssets);
local v6 = require(l_script_FirstAncestor_0.Flag.FIntCommsFAELockTimestamp);
local v7 = require(l_script_FirstAncestor_0.Components.UpsellOverlay);
local v8 = require(l_script_FirstAncestor_0.Utils.createCommonOverlayProps);
local v9 = require(l_script_FirstAncestor_0.Thunks.startFacialAgeEstimation);
local v10 = require(l_script_FirstAncestor_0.Analytics.Enum.UpsellEntrySurfaceType);
local v11 = require(l_script_FirstAncestor_0.Enum.SocialUpsellType);
local v12 = require(l_script_FirstAncestor_0.Analytics.Enum.UpsellComponent);
local v13 = require(l_script_FirstAncestor_0.Flag.FFlagEnableCountdownBadge);
local v14 = require(l_script_FirstAncestor_0.Flag.FFlagAddMinorFixesToUpsellAnalytics);
local l_Assets_0 = v5.Assets;
v5.preloadAsset("pictograms/chat_security");
local v16 = l_Assets_0["pictograms/chat_security"];
local v17 = v16 and v16.assetId or nil;
local v18 = require(l_script_FirstAncestor_0.Hooks.useSocialUpsellOverlayController);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v20 = game:DefineFastFlag("AEGISPhase1UseFAECopyV3", false);
local l_FFlagEnableAEGIS2CommsFAEUpsell_0 = v3.FFlagEnableAEGIS2CommsFAEUpsell;
local l_FFlagAEGIS2PassDownUpsellEntryComponent_0 = v3.FFlagAEGIS2PassDownUpsellEntryComponent;
local v23 = game:DefineFastFlag("AEGISPhase2ShowImageOnFAEOverlay", false);
local v24 = game:DefineFastFlag("ForceAegisPhase2Modal", false);
return function(v25) --[[ Line: 59 ]]
    -- upvalues: l_useDispatch_0 (copy), v18 (copy), l_useLocalization_0 (copy), l_FFlagEnableAEGIS2CommsFAEUpsell_0 (copy), v2 (copy), v24 (copy), v14 (copy), v10 (copy), v12 (copy), v9 (copy), v13 (copy), v6 (copy), v7 (copy), v8 (copy), v20 (copy), v23 (copy), v17 (copy), l_FFlagAEGIS2PassDownUpsellEntryComponent_0 (copy), v11 (copy)
    local v26 = v25 or {};
    local v27 = l_useDispatch_0();
    local v28 = v18(v26.isInExperience);
    local v29 = l_useLocalization_0({
        ToKeepChattingLetsCheckYourAge = "Feature.FAE.Label.ToKeepChattingLetsCheckYourAge", 
        ModalBodyInApp = "Feature.FAE.Label.ModalBodyInApp", 
        LetsCheckYourAgeSoYouCanUseChat = "Feature.FAE.Label.LetsCheckYourAgeSoYouCanUseChat", 
        ModalBodyInAppV3 = "Feature.FAE.Label.ModalBodyInAppV3", 
        YourSafetyMattersLetsCheckYourAge = "Feature.FAE.Label.YourSafetyMattersLetsCheckYourAge", 
        YouNeedAnAgeCheckToUseChatThisMakesChatSafer = "Feature.FAE.Label.YouNeedAnAgeCheckToUseChatThisMakesChatSafer", 
        Continue = "Feature.FAE.Action.Continue", 
        ThisAllowsYouToChatSafelyItOnlyTakesAMoment = l_FFlagEnableAEGIS2CommsFAEUpsell_0 and "Feature.FAE.Label.ThisAllowsYouToChatSafelyItOnlyTakesAMoment" or nil, 
        UnlockChat = l_FFlagEnableAEGIS2CommsFAEUpsell_0 and "Feature.FAE.Action.UnlockChat" or nil, 
        ThisHelpsYouToChatSafelyItOnlyTakesAMoment = "Feature.FAE.Label.ThisHelpsYouToChatSafelyItOnlyTakesAMoment"
    });
    local v30 = v2.useRef(false);
    local v31, v32 = v2.useMemo(function() --[[ Line: 81 ]]
        -- upvalues: l_FFlagEnableAEGIS2CommsFAEUpsell_0 (ref), v24 (ref), v26 (copy), v29 (copy), v14 (ref), v10 (ref), v12 (ref)
        if l_FFlagEnableAEGIS2CommsFAEUpsell_0 and (v24 or v26.isPhase2) then
            return v29.LetsCheckYourAgeSoYouCanUseChat, v29.ThisHelpsYouToChatSafelyItOnlyTakesAMoment;
        elseif v14 and v26.upsellEntrySurface == v10.Homepage and v26.upsellEntryComponent == v12.Modal or not v14 and v26.upsellEntrySurface == v10.HomepageBottomSheet or v26.upsellEntrySurface == v10.NotifPush then
            return v29.YourSafetyMattersLetsCheckYourAge, v29.YouNeedAnAgeCheckToUseChatThisMakesChatSafer;
        else
            return v29.LetsCheckYourAgeSoYouCanUseChat, v29.ModalBodyInAppV3;
        end;
    end, {
        if l_FFlagEnableAEGIS2CommsFAEUpsell_0 then v26.isPhase2 else nil, 
        v26.upsellEntrySurface, 
        v29
    });
    local v33 = v2.useCallback(function() --[[ Line: 109 ]]
        -- upvalues: v28 (copy), v26 (copy), l_FFlagEnableAEGIS2CommsFAEUpsell_0 (ref), v27 (copy), v9 (ref)
        v28.closeSocialOverlay();
        if v26.onAccept then
            v26.onAccept();
        end;
        if game.JobId ~= "" and not l_FFlagEnableAEGIS2CommsFAEUpsell_0 then
            return;
        else
            v27(v9(v26.entryPointEventCtx, v26.onSuccess, v26.onFailure, v26.upsellEntrySurface, if l_FFlagEnableAEGIS2CommsFAEUpsell_0 then v26.isInExperience else nil));
            return;
        end;
    end, {
        v27, 
        v28.closeSocialOverlay, 
        v26.upsellEntrySurface, 
        v26.entryPointEventCtx, 
        v26.onAccept, 
        v26.onSuccess, 
        v26.onFailure, 
        v26.isInExperience
    });
    local v34 = v2.useCallback(function() --[[ Line: 147 ]]
        -- upvalues: v26 (copy)
        if v26.onDismiss then
            v26.onDismiss();
        end;
    end, {
        v26.onDismiss
    });
    local v35 = v2.useMemo(function() --[[ Line: 153 ]]
        -- upvalues: v13 (ref), v26 (copy), v6 (ref)
        if v13 and v26.countDownBadgeText then
            return {
                text = v26.countDownBadgeText, 
                deadlineUtcTimestamp = v6
            };
        else
            return nil;
        end;
    end, {
        v26.countDownBadgeText
    });
    local v36 = v2.useMemo(function() --[[ Line: 163 ]]
        -- upvalues: l_FFlagEnableAEGIS2CommsFAEUpsell_0 (ref), v24 (ref), v26 (copy), v29 (copy), v33 (copy)
        return {
            text = if not (l_FFlagEnableAEGIS2CommsFAEUpsell_0 and (v24 or v26.isPhase2)) or v26.isInExperience then v29.Continue else v29.UnlockChat, 
            onActivated = v33
        };
    end, {
        if l_FFlagEnableAEGIS2CommsFAEUpsell_0 then v26.isPhase2 else nil, 
        v26.isInExperience, 
        v29, 
        v33
    });
    v2.useEffect(function() --[[ Line: 182 ]]
        -- upvalues: v30 (copy), v26 (copy)
        if not v30.current and v26.onMounted then
            v26.onMounted();
        end;
        v30.current = true;
    end, {
        v26.onMounted
    });
    return v2.createElement(v7, v8({
        onClose = v34, 
        countDownBadge = v35, 
        bodyText = if not not l_FFlagEnableAEGIS2CommsFAEUpsell_0 or v20 then v32 else v29.ModalBodyInApp, 
        title = if not not l_FFlagEnableAEGIS2CommsFAEUpsell_0 or v20 then v31 else v29.ToKeepChattingLetsCheckYourAge, 
        imageId = if l_FFlagEnableAEGIS2CommsFAEUpsell_0 and (v24 or v26.isPhase2) and not v23 and v26.isInExperience then nil else v17, 
        primaryAction = v36, 
        impressionId = v26.impressionId, 
        upsellEntryComponent = if l_FFlagAEGIS2PassDownUpsellEntryComponent_0 then v26.upsellEntryComponent else nil, 
        upsellEntrySurface = v26.upsellEntrySurface, 
        upsellPurpose = v11.FacialAgeEstimation, 
        containerRef = v26.containerRef
    }, v26));
end;
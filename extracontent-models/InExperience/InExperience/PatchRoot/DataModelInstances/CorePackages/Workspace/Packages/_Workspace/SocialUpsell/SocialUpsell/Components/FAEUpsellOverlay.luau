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
local l_FFlagEnableSocialUpsellFocusFixes_0 = v3.FFlagEnableSocialUpsellFocusFixes;
local l_FFlagAEGIS2PassDownUpsellEntryComponent_0 = v3.FFlagAEGIS2PassDownUpsellEntryComponent;
local v24 = game:DefineFastFlag("AEGISPhase2ShowImageOnFAEOverlay", false);
local v25 = game:DefineFastFlag("ForceAegisPhase2Modal", false);
return function(v26) --[[ Line: 60 ]]
    -- upvalues: l_useDispatch_0 (copy), v18 (copy), l_useLocalization_0 (copy), l_FFlagEnableAEGIS2CommsFAEUpsell_0 (copy), v2 (copy), v25 (copy), v14 (copy), v10 (copy), v12 (copy), v9 (copy), v13 (copy), v6 (copy), v7 (copy), v8 (copy), v20 (copy), v24 (copy), v17 (copy), l_FFlagAEGIS2PassDownUpsellEntryComponent_0 (copy), v11 (copy), l_FFlagEnableSocialUpsellFocusFixes_0 (copy)
    local v27 = v26 or {};
    local v28 = l_useDispatch_0();
    local v29 = v18(v27.isInExperience);
    local v30 = l_useLocalization_0({
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
    local v31 = v2.useRef(false);
    local v32, v33 = v2.useMemo(function() --[[ Line: 82 ]]
        -- upvalues: l_FFlagEnableAEGIS2CommsFAEUpsell_0 (ref), v25 (ref), v27 (copy), v30 (copy), v14 (ref), v10 (ref), v12 (ref)
        if l_FFlagEnableAEGIS2CommsFAEUpsell_0 and (v25 or v27.isPhase2) then
            return v30.LetsCheckYourAgeSoYouCanUseChat, v30.ThisHelpsYouToChatSafelyItOnlyTakesAMoment;
        elseif v14 and v27.upsellEntrySurface == v10.Homepage and v27.upsellEntryComponent == v12.Modal or not v14 and v27.upsellEntrySurface == v10.HomepageBottomSheet or v27.upsellEntrySurface == v10.NotifPush then
            return v30.YourSafetyMattersLetsCheckYourAge, v30.YouNeedAnAgeCheckToUseChatThisMakesChatSafer;
        else
            return v30.LetsCheckYourAgeSoYouCanUseChat, v30.ModalBodyInAppV3;
        end;
    end, {
        if l_FFlagEnableAEGIS2CommsFAEUpsell_0 then v27.isPhase2 else nil, 
        v27.upsellEntrySurface, 
        v30
    });
    local v34 = v2.useCallback(function() --[[ Line: 110 ]]
        -- upvalues: v29 (copy), v27 (copy), l_FFlagEnableAEGIS2CommsFAEUpsell_0 (ref), v28 (copy), v9 (ref)
        v29.closeSocialOverlay();
        if v27.onAccept then
            v27.onAccept();
        end;
        if game.JobId ~= "" and not l_FFlagEnableAEGIS2CommsFAEUpsell_0 then
            return;
        else
            v28(v9(v27.entryPointEventCtx, v27.onSuccess, v27.onFailure, v27.upsellEntrySurface, if l_FFlagEnableAEGIS2CommsFAEUpsell_0 then v27.isInExperience else nil));
            return;
        end;
    end, {
        v28, 
        v29.closeSocialOverlay, 
        v27.upsellEntrySurface, 
        v27.entryPointEventCtx, 
        v27.onAccept, 
        v27.onSuccess, 
        v27.onFailure, 
        v27.isInExperience
    });
    local v35 = v2.useCallback(function() --[[ Line: 148 ]]
        -- upvalues: v27 (copy)
        if v27.onDismiss then
            v27.onDismiss();
        end;
    end, {
        v27.onDismiss
    });
    local v36 = v2.useMemo(function() --[[ Line: 154 ]]
        -- upvalues: v13 (ref), v27 (copy), v6 (ref)
        if v13 and v27.countDownBadgeText then
            return {
                text = v27.countDownBadgeText, 
                deadlineUtcTimestamp = v6
            };
        else
            return nil;
        end;
    end, {
        v27.countDownBadgeText
    });
    local v37 = v2.useMemo(function() --[[ Line: 164 ]]
        -- upvalues: l_FFlagEnableAEGIS2CommsFAEUpsell_0 (ref), v25 (ref), v27 (copy), v30 (copy), v34 (copy)
        return {
            text = if not (l_FFlagEnableAEGIS2CommsFAEUpsell_0 and (v25 or v27.isPhase2)) or v27.isInExperience then v30.Continue else v30.UnlockChat, 
            onActivated = v34
        };
    end, {
        if l_FFlagEnableAEGIS2CommsFAEUpsell_0 then v27.isPhase2 else nil, 
        v27.isInExperience, 
        v30, 
        v34
    });
    v2.useEffect(function() --[[ Line: 183 ]]
        -- upvalues: v31 (copy), v27 (copy)
        if not v31.current and v27.onMounted then
            v27.onMounted();
        end;
        v31.current = true;
    end, {
        v27.onMounted
    });
    return v2.createElement(v7, v8({
        onClose = v35, 
        countDownBadge = v36, 
        bodyText = if not not l_FFlagEnableAEGIS2CommsFAEUpsell_0 or v20 then v33 else v30.ModalBodyInApp, 
        title = if not not l_FFlagEnableAEGIS2CommsFAEUpsell_0 or v20 then v32 else v30.ToKeepChattingLetsCheckYourAge, 
        imageId = if l_FFlagEnableAEGIS2CommsFAEUpsell_0 and (v25 or v27.isPhase2) and not v24 and v27.isInExperience then nil else v17, 
        primaryAction = v37, 
        impressionId = v27.impressionId, 
        upsellEntryComponent = if l_FFlagAEGIS2PassDownUpsellEntryComponent_0 then v27.upsellEntryComponent else nil, 
        upsellEntrySurface = v27.upsellEntrySurface, 
        upsellPurpose = v11.FacialAgeEstimation, 
        containerRef = if l_FFlagEnableSocialUpsellFocusFixes_0 then v27.containerRef else nil
    }, v27));
end;
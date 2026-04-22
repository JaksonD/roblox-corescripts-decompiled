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
local l_Assets_0 = v5.Assets;
v5.preloadAsset("pictograms/chat_security");
local v15 = l_Assets_0["pictograms/chat_security"];
local v16 = v15 and v15.assetId or nil;
local v17 = require(l_script_FirstAncestor_0.Hooks.useSocialUpsellOverlayController);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_FFlagEnableAEGIS2CommsFAEUpsell_0 = v3.FFlagEnableAEGIS2CommsFAEUpsell;
local v20 = game:DefineFastFlag("AEGISPhase2ShowImageOnFAEOverlay", false);
local v21 = game:DefineFastFlag("ForceAegisPhase2Modal", false);
return function(v22) --[[ Line: 53 ]]
    -- upvalues: l_useDispatch_0 (copy), v17 (copy), l_useLocalization_0 (copy), l_FFlagEnableAEGIS2CommsFAEUpsell_0 (copy), v2 (copy), v21 (copy), v10 (copy), v12 (copy), v9 (copy), v13 (copy), v6 (copy), v7 (copy), v8 (copy), v20 (copy), v16 (copy), v11 (copy)
    local v23 = v22 or {};
    local v24 = l_useDispatch_0();
    local v25 = v17(v23.isInExperience);
    local v26 = l_useLocalization_0({
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
    local v27 = v2.useRef(false);
    local v28, v29 = v2.useMemo(function() --[[ Line: 75 ]]
        -- upvalues: l_FFlagEnableAEGIS2CommsFAEUpsell_0 (ref), v21 (ref), v23 (copy), v26 (copy), v10 (ref), v12 (ref)
        if l_FFlagEnableAEGIS2CommsFAEUpsell_0 and (v21 or v23.isPhase2) then
            return v26.LetsCheckYourAgeSoYouCanUseChat, v26.ThisHelpsYouToChatSafelyItOnlyTakesAMoment;
        elseif v23.upsellEntrySurface == v10.Homepage and v23.upsellEntryComponent == v12.Modal or v23.upsellEntrySurface == v10.NotifPush then
            return v26.YourSafetyMattersLetsCheckYourAge, v26.YouNeedAnAgeCheckToUseChatThisMakesChatSafer;
        else
            return v26.LetsCheckYourAgeSoYouCanUseChat, v26.ModalBodyInAppV3;
        end;
    end, {
        if l_FFlagEnableAEGIS2CommsFAEUpsell_0 then v23.isPhase2 else nil, 
        v23.upsellEntrySurface, 
        v26
    });
    local v30 = v2.useCallback(function() --[[ Line: 100 ]]
        -- upvalues: v25 (copy), v23 (copy), l_FFlagEnableAEGIS2CommsFAEUpsell_0 (ref), v24 (copy), v9 (ref)
        v25.closeSocialOverlay();
        if v23.onAccept then
            v23.onAccept();
        end;
        if game.JobId ~= "" and not l_FFlagEnableAEGIS2CommsFAEUpsell_0 then
            return;
        else
            v24(v9(v23.entryPointEventCtx, v23.onSuccess, v23.onFailure, v23.upsellEntrySurface, if l_FFlagEnableAEGIS2CommsFAEUpsell_0 then v23.isInExperience else nil));
            return;
        end;
    end, {
        v24, 
        v25.closeSocialOverlay, 
        v23.upsellEntrySurface, 
        v23.entryPointEventCtx, 
        v23.onAccept, 
        v23.onSuccess, 
        v23.onFailure, 
        v23.isInExperience
    });
    local v31 = v2.useCallback(function() --[[ Line: 138 ]]
        -- upvalues: v23 (copy)
        if v23.onDismiss then
            v23.onDismiss();
        end;
    end, {
        v23.onDismiss
    });
    local v32 = v2.useMemo(function() --[[ Line: 144 ]]
        -- upvalues: v13 (ref), v23 (copy), v6 (ref)
        if v13 and v23.countDownBadgeText then
            return {
                text = v23.countDownBadgeText, 
                deadlineUtcTimestamp = v6
            };
        else
            return nil;
        end;
    end, {
        v23.countDownBadgeText
    });
    local v33 = v2.useMemo(function() --[[ Line: 154 ]]
        -- upvalues: l_FFlagEnableAEGIS2CommsFAEUpsell_0 (ref), v21 (ref), v23 (copy), v26 (copy), v30 (copy)
        return {
            text = if not (l_FFlagEnableAEGIS2CommsFAEUpsell_0 and (v21 or v23.isPhase2)) or v23.isInExperience then v26.Continue else v26.UnlockChat, 
            onActivated = v30
        };
    end, {
        if l_FFlagEnableAEGIS2CommsFAEUpsell_0 then v23.isPhase2 else nil, 
        v23.isInExperience, 
        v26, 
        v30
    });
    v2.useEffect(function() --[[ Line: 173 ]]
        -- upvalues: v27 (copy), v23 (copy)
        if not v27.current and v23.onMounted then
            v23.onMounted();
        end;
        v27.current = true;
    end, {
        v23.onMounted
    });
    return v2.createElement(v7, v8({
        onClose = v31, 
        countDownBadge = v32, 
        bodyText = v29, 
        title = v28, 
        imageId = if l_FFlagEnableAEGIS2CommsFAEUpsell_0 and (v21 or v23.isPhase2) and not v20 and v23.isInExperience then nil else v16, 
        primaryAction = v33, 
        impressionId = v23.impressionId, 
        upsellEntryComponent = v23.upsellEntryComponent, 
        upsellEntrySurface = v23.upsellEntrySurface, 
        upsellPurpose = v11.FacialAgeEstimation, 
        containerRef = v23.containerRef
    }, v23));
end;
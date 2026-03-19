local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.AppChatNetworking);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v4 = require(l_script_FirstAncestor_0.Hooks.useIsInExperience);
local v5 = require(l_script_FirstAncestor_0.Utils.createBannerConfigFromModalConfiguration);
local v6 = require(l_script_FirstAncestor_0.Conversations.Thunks.fetchChatMetadata);
local v7 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.types);
local v9 = require(l_script_FirstAncestor_0.Logger):new(script.Name);
local l_useCallback_0 = v7.useCallback;
local v11 = require(l_Parent_0.SocialUpsell);
local v12 = require(l_Parent_0.Foundation);
local l_UpsellBanner_0 = v11.UpsellBanner;
local l_startFacialAgeEstimation_0 = v11.Thunks.startFacialAgeEstimation;
local l_useSocialUpsellOverlayController_0 = v11.Hooks.useSocialUpsellOverlayController;
local l_UpsellComponent_0 = v11.Analytics.Enum.UpsellComponent;
local l_UpsellEntrySurfaceType_0 = v11.Analytics.Enum.UpsellEntrySurfaceType;
local l_ChatLandingModalVariant_0 = v2.Constants.ChatLandingModalVariant;
local l_ConversationBottomModal_0 = v2.Constants.ConversationBottomModal;
local v20 = game:DefineFastFlag("AEGIS2AppChatBannerFetchMetadataOnSuccess", false);
local v21 = game:DefineFastFlag("AEGIS2AppChatBannerUITagFix", false);
local v22 = {
    [l_ChatLandingModalVariant_0.ChatLandingAgeVerifiedCommsTimedModal] = l_UpsellEntrySurfaceType_0.PartyTab, 
    [l_ChatLandingModalVariant_0.ChatLandingAgeVerifiedCommsUpsellModal] = l_UpsellEntrySurfaceType_0.PartyTab, 
    [l_ConversationBottomModal_0.ConversationBottomAgeVerificationRequiredModal] = l_UpsellEntrySurfaceType_0.PartyChatConversationUA
};
local v23 = {
    [l_ChatLandingModalVariant_0.ChatLandingAgeVerifiedCommsTimedModal] = l_UpsellEntrySurfaceType_0.PartyTabInExperience, 
    [l_ChatLandingModalVariant_0.ChatLandingAgeVerifiedCommsUpsellModal] = l_UpsellEntrySurfaceType_0.PartyTabInExperience, 
    [l_ConversationBottomModal_0.ConversationBottomAgeVerificationRequiredModal] = l_UpsellEntrySurfaceType_0.PartyChatConversationInExperience
};
local v24 = {
    [l_ChatLandingModalVariant_0.ChatLandingAgeVerifiedCommsTimedModal] = true, 
    [l_ChatLandingModalVariant_0.ChatLandingAgeVerifiedCommsUpsellModal] = true, 
    [l_ConversationBottomModal_0.ConversationBottomAgeVerificationRequiredModal] = false
};
local v25 = {
    [l_ChatLandingModalVariant_0.ChatLandingAgeVerifiedCommsTimedModal] = "padding-x-medium padding-top-xxsmall padding-bottom-large align-x-center auto-y size-full-0", 
    [l_ChatLandingModalVariant_0.ChatLandingAgeVerifiedCommsUpsellModal] = "padding-x-medium padding-top-xxsmall padding-bottom-large align-x-center auto-y size-full-0", 
    [l_ConversationBottomModal_0.ConversationBottomAgeVerificationRequiredModal] = "padding-large align-x-center auto-y size-full-0 stroke-standard stroke-default bg-shift-100"
};
return v7.memo(function(v26) --[[ Line: 70 ]] --[[ Name: AppChatFAEBanner ]]
    -- upvalues: l_useDispatch_0 (copy), v4 (copy), l_useCallback_0 (copy), v6 (copy), v23 (copy), v22 (copy), l_useSocialUpsellOverlayController_0 (copy), v7 (copy), l_startFacialAgeEstimation_0 (copy), v11 (copy), v20 (copy), l_UpsellComponent_0 (copy), v5 (copy), v9 (copy), v24 (copy), v21 (copy), v25 (copy), v12 (copy), l_UpsellBanner_0 (copy)
    local v27 = l_useDispatch_0();
    local v28 = v4();
    local v29 = l_useCallback_0(function() --[[ Line: 73 ]]
        -- upvalues: v27 (copy), v6 (ref)
        v27(v6());
    end, {
        v27, 
        v6
    });
    local l_modalConfiguration_0 = v26.modalConfiguration;
    local v31 = if v28 then v23[l_modalConfiguration_0.modal_variant] else v22[l_modalConfiguration_0.modal_variant];
    local v32 = l_useSocialUpsellOverlayController_0(v28);
    local v34 = v7.useCallback(function(_) --[[ Line: 83 ]]
        -- upvalues: v27 (copy), l_startFacialAgeEstimation_0 (ref), v11 (ref), v31 (copy), v20 (ref), v29 (copy), v28 (copy)
        v27(l_startFacialAgeEstimation_0(v11.Enums.SocialUpsellType.FacialAgeEstimation .. v31, if v20 then v29 else nil, nil, v31, v28));
    end, {
        v27, 
        v31, 
        v28
    });
    local v36 = v7.useCallback(function(v35) --[[ Line: 94 ]]
        -- upvalues: v32 (copy), v11 (ref), v31 (copy), l_UpsellComponent_0 (ref)
        v32.openSocialOverlay(v11.Enums.SocialUpsellType.FacialAgeEstimation, {
            upsellEntrySurface = v31, 
            upsellEntryComponent = l_UpsellComponent_0.Banner, 
            impressionId = v35
        });
    end, {
        v32.openSocialOverlay, 
        v31
    });
    local v37 = v5(l_modalConfiguration_0);
    local v39 = v7.useCallback(function(_) --[[ Line: 104 ]]
        -- upvalues: v37 (copy), v9 (ref)
        if not v37.isDismissable then
            v9:warning("attempt to call AppChatFAEBanner onDismiss not provided and banner is not dismissable");
        end;
    end, {});
    local v40 = v26.onDismiss or v39;
    local v41 = v24[l_modalConfiguration_0.modal_variant];
    local v42 = if v21 then v25[l_modalConfiguration_0.modal_variant] else v41 and "padding-large align-x-center auto-y size-full-0" or "padding-large align-x-center auto-y size-full-0 stroke-standard stroke-default bg-shift-100";
    return v7.createElement(v12.View, {
        tag = v42
    }, {
        UpsellBanner = v7.createElement(l_UpsellBanner_0, {
            config = v37, 
            isContained = v41, 
            onPrimaryAction = v34, 
            onSecondaryAction = v36, 
            onDismiss = v40, 
            upsellEntrySurface = v31, 
            upsellEntryComponent = l_UpsellComponent_0.Banner, 
            conversationId = v26.conversationId
        })
    });
end);
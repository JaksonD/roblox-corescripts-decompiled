local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Cryo);
local v2 = require(l_Parent_0.SocialCommon);
local v3 = require(l_Parent_0.SocialUpsell);
local v4 = require(l_Parent_0.AppChatNetworking);
local l_SocialUpsellType_0 = require(l_Parent_0.SocialUpsell).Enums.SocialUpsellType;
local l_getDeepValue_0 = v2.Utils.getDeepValue;
local l_createCommonSocialUpsellBannerConfig_0 = v3.Utils.createCommonSocialUpsellBannerConfig;
local l_Constants_0 = v3.Constants;
local l_ChatLandingModalVariant_0 = v4.Constants.ChatLandingModalVariant;
local l_ConversationBottomModal_0 = v4.Constants.ConversationBottomModal;
local v11 = {
    [l_ChatLandingModalVariant_0.ChatLandingAgeVerifiedCommsTimedModal] = l_SocialUpsellType_0.FacialAgeEstimation, 
    [l_ChatLandingModalVariant_0.ChatLandingAgeVerifiedCommsUpsellModal] = l_SocialUpsellType_0.FacialAgeEstimation, 
    [l_ConversationBottomModal_0.ConversationBottomAgeVerificationRequiredModal] = l_SocialUpsellType_0.ConversationFacialAgeEstimation, 
    [l_ConversationBottomModal_0.NudgeToChatUpsell] = l_SocialUpsellType_0.ConversationFacialAgeEstimation
};
local v12 = {
    open_fae_upsell = l_Constants_0.UPSELL_BUTTON_ACTION.Primary, 
    open_fae_view_details = l_Constants_0.UPSELL_BUTTON_ACTION.Secondary, 
    dismiss = l_Constants_0.UPSELL_BUTTON_ACTION.Dismiss
};
local function v18(v13) --[[ Line: 44 ]] --[[ Name: getCountdownLabelItem ]]
    -- upvalues: l_getDeepValue_0 (copy), v1 (copy), v4 (copy), l_Constants_0 (copy)
    local v14 = nil;
    local v15 = l_getDeepValue_0(v13, "modal_layout.header.additional_content");
    if v15 then
        local v17 = v1.List.findWhere(v15, function(v16) --[[ Line: 48 ]]
            -- upvalues: v4 (ref)
            return v16.type == v4.Constants.ModalContentType.Countdown;
        end);
        if v17 and v15[v17].text then
            v14 = {
                type = l_Constants_0.UPSELL_LABEL_ITEM_TYPE_COUNTDOWN, 
                text = v15[v17].text
            };
        end;
    end;
    return v14;
end;
local function _(v19) --[[ Line: 62 ]] --[[ Name: getButtonAction ]]
    -- upvalues: v12 (copy)
    if v19.action and v19.action.type then
        return v12[v19.action.type];
    else
        return nil;
    end;
end;
return function(v21) --[[ Line: 69 ]]
    -- upvalues: v11 (copy), l_SocialUpsellType_0 (copy), l_getDeepValue_0 (copy), v18 (copy), v1 (copy), v12 (copy), l_createCommonSocialUpsellBannerConfig_0 (copy)
    local v22 = v11[v21.modal_variant] or l_SocialUpsellType_0.Unknown;
    local v23 = {};
    local v24 = l_getDeepValue_0(v21, "modal_layout.buttons");
    local v25 = v18(v21);
    if v25 then
        table.insert(v23, v25);
    end;
    local v28 = v1.List.filterMap(v24, function(v26) --[[ Line: 79 ]]
        -- upvalues: v12 (ref)
        local v27 = if v26.action and v26.action.type then v12[v26.action.type] else nil;
        if v27 and v26.text then
            return {
                text = v26.text, 
                action = v27
            };
        else
            return nil;
        end;
    end);
    return l_createCommonSocialUpsellBannerConfig_0({
        type = v22, 
        title = l_getDeepValue_0(v21, "modal_layout.header.text"), 
        body = l_getDeepValue_0(v21, "modal_layout.body.text"), 
        isDismissable = l_getDeepValue_0(v21, "modal_layout.dismissible"), 
        labelItems = v23, 
        buttons = v28
    });
end;
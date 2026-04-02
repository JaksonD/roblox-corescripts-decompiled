local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.types);
local l_ConversationBottomModal_0 = require(l_Parent_0.AppChatNetworking).Constants.ConversationBottomModal;
local v7 = require(l_script_FirstAncestor_0.Models.ModalConfiguration);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v9 = require(l_script_FirstAncestor_0.Utils.getDeepValue2);
local v10 = require(l_Parent_0.SocialExperiments);
local l_FFlagTestDeviceForFAEUpsell_0 = v10.FFlagTestDeviceForFAEUpsell;
local l_deviceMeetsRequirementsForFAE_0 = v10.deviceMeetsRequirementsForFAE;
local l_FFlagEnableAEGIS2AppChatConversationBanner_0 = require(l_Parent_0.SharedFlags).FFlagEnableAEGIS2AppChatConversationBanner;
local v14 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatNudgeToChatUpsellEnabled);
local v15 = require(l_script_FirstAncestor_0.Flags.FFlagDebugAppChatNudgeToChatUpsell_DEV);
local v16 = require(script.Parent.ConversationModal);
local v17 = require(l_script_FirstAncestor_0.Components.FaeBanner.AppChatFAEBanner);
local v19 = {
    shouldShowLegacyBottomModal = false, 
    onHeightChanged = function(_) --[[ Line: 39 ]] --[[ Name: onHeightChanged ]]

    end
};
return v4.memo(function(v20) --[[ Line: 42 ]] --[[ Name: ConversationBottomModalContainer ]]
    -- upvalues: v3 (copy), v19 (copy), l_useSelector_0 (copy), v9 (copy), v7 (copy), v4 (copy), l_FFlagEnableAEGIS2AppChatConversationBanner_0 (copy), v14 (copy), v15 (copy), l_ConversationBottomModal_0 (copy), v17 (copy), l_FFlagTestDeviceForFAEUpsell_0 (copy), l_deviceMeetsRequirementsForFAE_0 (copy), v16 (copy), v2 (copy)
    local v21 = v3.Dictionary.union(v19, v20);
    local v23 = l_useSelector_0(function(v22) --[[ Line: 46 ]]
        -- upvalues: v9 (ref), v21 (copy), v7 (ref)
        return v9(v22, (("ChatAppReducer.Modals.conversationBottomModals.%*"):format(v21.conversationId))) or v7.default;
    end);
    local v25 = v4.useCallback(function(v24) --[[ Line: 51 ]]
        -- upvalues: v21 (copy)
        v21.onHeightChanged(v24.AbsoluteSize.Y);
    end, {
        v21.onHeightChanged
    });
    local v26 = nil;
    if (l_FFlagEnableAEGIS2AppChatConversationBanner_0 or v14) and (not v21.shouldShowChatInputBar or v15) and v23 and v23.modal_variant ~= nil and v23.modal_variant ~= l_ConversationBottomModal_0.None then
        v26 = v4.createElement(v17, {
            modalConfiguration = v23, 
            conversationId = v21.conversationId
        });
    end;
    if l_FFlagTestDeviceForFAEUpsell_0 and not l_deviceMeetsRequirementsForFAE_0() then
        return nil;
    else
        if not v26 and v21.shouldShowLegacyBottomModal then
            v26 = v4.createElement(v16, {
                bodyText = v21.legacyBottomModalText
            });
        end;
        return v4.createElement(v2.View, {
            LayoutOrder = v21.layoutOrder, 
            onAbsoluteSizeChanged = v25, 
            tag = "auto-y size-full-0"
        }, {
            ConversationBottomModal = v26
        });
    end;
end);
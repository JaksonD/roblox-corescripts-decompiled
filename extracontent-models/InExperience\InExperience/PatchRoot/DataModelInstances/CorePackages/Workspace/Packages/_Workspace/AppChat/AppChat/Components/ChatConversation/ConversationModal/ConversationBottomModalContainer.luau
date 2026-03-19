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
local v14 = require(script.Parent.ConversationModal);
local v15 = require(l_script_FirstAncestor_0.Components.FaeBanner.AppChatFAEBanner);
local v17 = {
    shouldShowLegacyBottomModal = false, 
    onHeightChanged = function(_) --[[ Line: 37 ]] --[[ Name: onHeightChanged ]]

    end
};
return v4.memo(function(v18) --[[ Line: 40 ]] --[[ Name: ConversationBottomModalContainer ]]
    -- upvalues: v3 (copy), v17 (copy), l_useSelector_0 (copy), v9 (copy), v7 (copy), v4 (copy), l_FFlagEnableAEGIS2AppChatConversationBanner_0 (copy), l_ConversationBottomModal_0 (copy), v15 (copy), l_FFlagTestDeviceForFAEUpsell_0 (copy), l_deviceMeetsRequirementsForFAE_0 (copy), v14 (copy), v2 (copy)
    local v19 = v3.Dictionary.union(v17, v18);
    local v21 = l_useSelector_0(function(v20) --[[ Line: 44 ]]
        -- upvalues: v9 (ref), v19 (copy), v7 (ref)
        return v9(v20, (("ChatAppReducer.Modals.conversationBottomModals.%*"):format(v19.conversationId))) or v7.default;
    end);
    local v23 = v4.useCallback(function(v22) --[[ Line: 49 ]]
        -- upvalues: v19 (copy)
        v19.onHeightChanged(v22.AbsoluteSize.Y);
    end, {
        v19.onHeightChanged
    });
    local v24 = nil;
    if l_FFlagEnableAEGIS2AppChatConversationBanner_0 and not v19.shouldShowChatInputBar and v21 and v21.modal_variant ~= nil and v21.modal_variant ~= l_ConversationBottomModal_0.None then
        v24 = v4.createElement(v15, {
            modalConfiguration = v21, 
            conversationId = v19.conversationId
        });
    end;
    if l_FFlagTestDeviceForFAEUpsell_0 and not l_deviceMeetsRequirementsForFAE_0() then
        return nil;
    else
        if not v24 and v19.shouldShowLegacyBottomModal then
            v24 = v4.createElement(v14, {
                bodyText = v19.legacyBottomModalText
            });
        end;
        return v4.createElement(v2.View, {
            LayoutOrder = v19.layoutOrder, 
            onAbsoluteSizeChanged = v23, 
            tag = "auto-y size-full-0"
        }, {
            ConversationBottomModal = v24
        });
    end;
end);
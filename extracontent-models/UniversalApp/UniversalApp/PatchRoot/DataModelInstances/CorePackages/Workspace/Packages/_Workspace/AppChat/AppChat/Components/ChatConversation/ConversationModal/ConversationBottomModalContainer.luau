local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local Foundation = require(AppChatParent.Foundation)
local Cryo = require(AppChatParent.Cryo)
local React = require(AppChatParent.React)

require(AppChat.types)

local ConversationBottomModal = require(AppChatParent.AppChatNetworking).Constants.ConversationBottomModal
local ModalConfiguration = require(AppChat.Models.ModalConfiguration)
local useSelector = require(AppChatParent.RoactUtils).Hooks.RoactRodux.useSelector
local getDeepValue2 = require(AppChat.Utils.getDeepValue2)
local SocialExperiments = require(AppChatParent.SocialExperiments)
local FFlagTestDeviceForFAEUpsell = SocialExperiments.FFlagTestDeviceForFAEUpsell
local deviceMeetsRequirementsForFAE = SocialExperiments.deviceMeetsRequirementsForFAE
local FFlagEnableAEGIS2AppChatConversationBanner = require(AppChatParent.SharedFlags).FFlagEnableAEGIS2AppChatConversationBanner
local FFlagAppChatNudgeToChatUpsellEnabled = require(AppChat.Flags.FFlagAppChatNudgeToChatUpsellEnabled)
local ConversationModal = require(script.Parent.ConversationModal)
local AppChatFAEBanner = require(AppChat.Components.FaeBanner.AppChatFAEBanner)
local t1 = {
	shouldShowLegacyBottomModal = false,
	onHeightChanged = function(_) --[[ onHeightChanged ]] -- line: 38
	end
}

return React.memo(function(t2: {[any]: any}) --[[ ConversationBottomModalContainer ]] -- line: 41
	-- upvalues: Cryo (copy), t1 (copy), useSelector (copy), getDeepValue2 (copy), ModalConfiguration (copy), React (copy), FFlagEnableAEGIS2AppChatConversationBanner (copy), FFlagAppChatNudgeToChatUpsellEnabled (copy), ConversationBottomModal (copy), AppChatFAEBanner (copy), FFlagTestDeviceForFAEUpsell (copy), deviceMeetsRequirementsForFAE (copy), ConversationModal (copy), Foundation (copy)
	local v20 = Cryo.Dictionary.union(t1, t2)
	local v21 = useSelector(function(p2) -- line: 45
		-- upvalues: getDeepValue2 (copy), v20 (copy), ModalConfiguration (copy)
		return getDeepValue2(p2, `ChatAppReducer.Modals.conversationBottomModals.{ v20.conversationId }`) or ModalConfiguration.default
	end)
	local v22 = React.useCallback(function(p3) -- line: 50
		-- upvalues: v20 (copy)
		v20.onHeightChanged(p3.AbsoluteSize.Y)
	end, { v20.onHeightChanged })
	local v23 = nil

	if (FFlagEnableAEGIS2AppChatConversationBanner or FFlagAppChatNudgeToChatUpsellEnabled) and (not v20.shouldShowChatInputBar and v21 and v21.modal_variant ~= nil and v21.modal_variant ~= ConversationBottomModal.None) then
		v23 = React.createElement(AppChatFAEBanner, {
			modalConfiguration = v21,
			conversationId = v20.conversationId
		})
	end

	if FFlagTestDeviceForFAEUpsell and not deviceMeetsRequirementsForFAE() then
		return nil
	end

	if not v23 and v20.shouldShowLegacyBottomModal then
		v23 = React.createElement(ConversationModal, {
			bodyText = v20.legacyBottomModalText
		})
	end

	return React.createElement(Foundation.View, {
		LayoutOrder = v20.layoutOrder,
		onAbsoluteSizeChanged = v22,
		tag = "auto-y size-full-0"
	}, {
		ConversationBottomModal = v23
	})
end)

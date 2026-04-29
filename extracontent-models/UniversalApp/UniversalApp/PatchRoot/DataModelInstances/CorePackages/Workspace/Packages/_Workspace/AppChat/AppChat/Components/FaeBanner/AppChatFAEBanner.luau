local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent
local AppChatNetworking = require(AppChatParent.AppChatNetworking)
local useDispatch = require(AppChatParent.RoactUtils).Hooks.RoactRodux.useDispatch
local useIsInExperience = require(AppChat.Hooks.useIsInExperience)
local createBannerConfigFromModalConfiguration = require(AppChat.Utils.createBannerConfigFromModalConfiguration)
local fetchChatMetadata = require(AppChat.Conversations.Thunks.fetchChatMetadata)
local React = require(AppChatParent.React)

require(AppChat.types)

local v9 = require(AppChat.Logger):new(script.Name)
local useCallback = React.useCallback
local SocialUpsell = require(AppChatParent.SocialUpsell)
local Foundation = require(AppChatParent.Foundation)
local UpsellBanner = SocialUpsell.UpsellBanner
local startFacialAgeEstimation = SocialUpsell.Thunks.startFacialAgeEstimation
local useSocialUpsellOverlayController = SocialUpsell.Hooks.useSocialUpsellOverlayController
local UpsellComponent = SocialUpsell.Analytics.Enum.UpsellComponent
local UpsellEntrySurfaceType = SocialUpsell.Analytics.Enum.UpsellEntrySurfaceType
local ChatLandingModalVariant = AppChatNetworking.Constants.ChatLandingModalVariant
local ConversationBottomModal = AppChatNetworking.Constants.ConversationBottomModal
local t1 = {
	[ChatLandingModalVariant.ChatLandingAgeVerifiedCommsTimedModal] = UpsellEntrySurfaceType.PartyTab,
	[ChatLandingModalVariant.ChatLandingAgeVerifiedCommsUpsellModal] = UpsellEntrySurfaceType.PartyTab,
	[ConversationBottomModal.ConversationBottomAgeVerificationRequiredModal] = UpsellEntrySurfaceType.PartyChatConversationUA,
	[ConversationBottomModal.NudgeToBottomChatUpsell] = UpsellEntrySurfaceType.PartyChatConversationUA
}
local t2 = {
	[ChatLandingModalVariant.ChatLandingAgeVerifiedCommsTimedModal] = UpsellEntrySurfaceType.PartyTabInExperience,
	[ChatLandingModalVariant.ChatLandingAgeVerifiedCommsUpsellModal] = UpsellEntrySurfaceType.PartyTabInExperience,
	[ConversationBottomModal.ConversationBottomAgeVerificationRequiredModal] = UpsellEntrySurfaceType.PartyChatConversationInExperience,
	[ConversationBottomModal.NudgeToBottomChatUpsell] = UpsellEntrySurfaceType.PartyChatConversationInExperience
}
local t3 = {
	[ChatLandingModalVariant.ChatLandingAgeVerifiedCommsTimedModal] = true,
	[ChatLandingModalVariant.ChatLandingAgeVerifiedCommsUpsellModal] = true,
	[ConversationBottomModal.ConversationBottomAgeVerificationRequiredModal] = false,
	[ConversationBottomModal.NudgeToBottomChatUpsell] = false
}
local t4 = {
	[ChatLandingModalVariant.ChatLandingAgeVerifiedCommsTimedModal] = "padding-x-medium padding-top-xxsmall padding-bottom-large align-x-center auto-y size-full-0",
	[ChatLandingModalVariant.ChatLandingAgeVerifiedCommsUpsellModal] = "padding-x-medium padding-top-xxsmall padding-bottom-large align-x-center auto-y size-full-0",
	[ConversationBottomModal.ConversationBottomAgeVerificationRequiredModal] = "padding-large align-x-center auto-y size-full-0 stroke-standard stroke-default bg-shift-100",
	[ConversationBottomModal.NudgeToBottomChatUpsell] = "padding-large align-x-center auto-y size-full-0 stroke-standard stroke-default bg-shift-100"
}

return React.memo(function(t5: {[any]: any}) --[[ AppChatFAEBanner ]] -- line: 71
	-- upvalues: useDispatch (copy), useIsInExperience (copy), useCallback (copy), fetchChatMetadata (copy), t2 (copy), t1 (copy), useSocialUpsellOverlayController (copy), React (copy), startFacialAgeEstimation (copy), SocialUpsell (copy), UpsellComponent (copy), createBannerConfigFromModalConfiguration (copy), v9 (copy), t3 (copy), t4 (copy), Foundation (copy), UpsellBanner (copy)
	local v25 = useDispatch()
	local v26 = useIsInExperience()
	local v27 = useCallback(function() -- line: 74
		-- upvalues: v25 (copy), fetchChatMetadata (copy)
		v25(fetchChatMetadata())
	end, {
		v25,
		fetchChatMetadata
	})
	local modalConfiguration = t5.modalConfiguration
	local v29 = if not v26 then t1[modalConfiguration.modal_variant] else t2[modalConfiguration.modal_variant]
	local v30 = useSocialUpsellOverlayController(v26)
	local v31 = React.useCallback(function(_: string) -- line: 84
		-- upvalues: v25 (copy), startFacialAgeEstimation (copy), SocialUpsell (copy), v29 (copy), v27 (copy), v26 (copy)
		v25(startFacialAgeEstimation(SocialUpsell.Enums.SocialUpsellType.FacialAgeEstimation .. v29, v27, nil, v29, v26))
	end, {
		v25,
		v29,
		v26
	})
	local v32 = React.useCallback(function(s2: string) -- line: 95
		-- upvalues: v30 (copy), SocialUpsell (copy), v29 (copy), UpsellComponent (copy)
		v30.openSocialOverlay(SocialUpsell.Enums.SocialUpsellType.FacialAgeEstimation, {
			upsellEntrySurface = v29,
			upsellEntryComponent = UpsellComponent.Banner,
			impressionId = s2
		})
	end, {
		v30.openSocialOverlay,
		v29
	})
	local v33 = createBannerConfigFromModalConfiguration(modalConfiguration)
	local v34 = React.useCallback(function(_: string) -- line: 105
		-- upvalues: v33 (copy), v9 (copy)
		if not v33.isDismissable then
			v9:warning("attempt to call AppChatFAEBanner onDismiss not provided and banner is not dismissable")
		end
	end, {})
	local v35 = t5.onDismiss or v34
	local v36 = t3[modalConfiguration.modal_variant]
	local v37 = t4[modalConfiguration.modal_variant]

	return React.createElement(Foundation.View, {
		tag = v37
	}, {
		UpsellBanner = React.createElement(UpsellBanner, {
			config = v33,
			isContained = v36,
			onPrimaryAction = v31,
			onSecondaryAction = v32,
			onDismiss = v35,
			upsellEntrySurface = v29,
			upsellEntryComponent = UpsellComponent.Banner,
			conversationId = t5.conversationId
		})
	})
end)

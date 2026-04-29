local HttpService = game:GetService("HttpService")
local AppChat = script:FindFirstAncestor("AppChat")
local AppChatParent = AppChat.Parent

require(AppChat.types)

local Cryo = require(AppChatParent.Cryo)
local React = require(AppChatParent.React)
local LuaAppNavigationContext = require(AppChat.LuaAppNavigationContext)
local getDeepValue2 = require(AppChat.Utils.getDeepValue2)
local memo = React.memo
local useAnalytics = require(AppChat.Analytics.useAnalytics)
local useCallback = React.useCallback
local useContext = React.useContext
local useDispatch = require(AppChatParent.RoactUtils).Hooks.RoactRodux.useDispatch
local useEffect = React.useEffect
local useEffectOnMount = require(AppChatParent.RoactUtils).Hooks.useEffectOnMount
local useIsInExperience = require(AppChat.Hooks.useIsInExperience)
local useNavigation = require(AppChatParent.Navigation).useNavigation
local useSelector = require(AppChatParent.RoactUtils).Hooks.RoactRodux.useSelector
local useChatPagePadding = require(AppChat.Contexts.ChatPagePadding.useChatPagePadding)
local useState = React.useState
local useRef = React.useRef
local useIsGuiInChatVisible = require(AppChat.Hooks.useIsGuiInChatVisible)
local useRecordModalSeenWithDelay = require(AppChat.Hooks.useRecordModalSeenWithDelay)
local ChatLandingModalTelemetry = require(script.Parent.ChatLandingModalTelemetry)
local ChatLandingTelemetryLayer = require(AppChat.Telemetry.Layers.ChatLandingTelemetryLayer)
local ModalTelemetry = require(AppChat.Components.ModalTelemetry)
local useTelemetry = require(AppChat.Telemetry.useTelemetry)
local Enum2 = require(AppChatParent.UIBlox).App.Button.Enum
local SocialUpsell = require(AppChatParent.SocialUpsell)
local Foundation = require(AppChatParent.Foundation)
local UpsellBanner = SocialUpsell.UpsellBanner
local UpsellEntrySurfaceType = SocialUpsell.Analytics.Enum.UpsellEntrySurfaceType
local UpsellComponent = SocialUpsell.Analytics.Enum.UpsellComponent
local FFlagEnableAEGIS1AppChatBanner = SocialUpsell.Flags.FFlagEnableAEGIS1AppChatBanner
local useSocialUpsellOverlayController = SocialUpsell.Hooks.useSocialUpsellOverlayController
local AccessResponseEnum = require(AppChatParent.AmpUpsell).AmpEnums.AccessResponseEnum
local AppChatNetworking = require(AppChatParent.AppChatNetworking)
local ChatLandingModalVariant = AppChatNetworking.Constants.ChatLandingModalVariant
local AppPage = require(AppChatParent.RobloxAppEnums).AppPage
local NavigateBack = require(AppChatParent.NavigationRodux).Thunks.NavigateBack
local NavigateDown = require(AppChatParent.NavigationRodux).Thunks.NavigateDown
local refreshAllUnfilteredThreadsDetails = require(AppChat.Conversations.Thunks.refreshAllUnfilteredThreadsDetails)
local UnfilteredThreadsAMPFeatureName = require(AppChat.Components.UnfilteredThreadsAMPFeatureName)
local OpenTcLearnMoreLink = require(AppChat.Conversations.Thunks.OpenTcLearnMoreLink)
local ModalConfiguration = require(AppChat.Models.ModalConfiguration)
local createBannerConfigFromModalConfiguration = require(AppChat.Utils.createBannerConfigFromModalConfiguration)
local AppChatFAEBanner = require(AppChat.Components.FaeBanner.AppChatFAEBanner)
local FIntAppChatModalSeenImpressionDelayMs = require(AppChat.Flags.FIntAppChatModalSeenImpressionDelayMs)
local FFlagDebugAppChatFae = require(AppChat.Flags.FFlagDebugAppChatFae)
local FStringCanAccessTrustedContactsAmpFeature = require(AppChatParent.SharedFlags).FStringCanAccessTrustedContactsAmpFeature
local FStringCanAccessTrustedContactsAmpNameSpace = require(AppChatParent.SharedFlags).FStringCanAccessTrustedContactsAmpNameSpace
local FFlagEnableAEGIS2CommsFAEUpsell = require(AppChatParent.SharedFlags).FFlagEnableAEGIS2CommsFAEUpsell
local FFlagDebugAEGIS1AppChatBanner = require(AppChat.Flags.FFlagDebugAEGIS1AppChatBanner)
local FFlagEnableAEGIS2AppChatBanner = require(AppChatParent.SharedFlags).FFlagEnableAEGIS2AppChatBanner
local SocialExperiments = require(AppChatParent.SocialExperiments)
local FFlagTestDeviceForFAEUpsell = require(AppChatParent.SocialExperiments).FFlagTestDeviceForFAEUpsell
local deviceMeetsRequirementsForFAE = SocialExperiments.deviceMeetsRequirementsForFAE
local startFacialAgeEstimation = SocialUpsell.Thunks.startFacialAgeEstimation
local GetAgeVerifiedChangedSignal = SocialUpsell.Signals.GetAgeVerifiedChangedSignal
local ChatLandingModal = require(script.Parent.ChatLandingModal)
local t1 = {
	fully_eligible_ftux = true,
	party_only_ftux = true,
	phone_verify = true,
	[ChatLandingModalVariant.AgeAssuranceUpsell] = true
}
local t2 = {
	fully_eligible_ftux = "ChatLandingUnfilteredThreadsFtux",
	phone_verify = "ChatLandingPvUpsell"
}

return memo(function(_) --[[ ChatLandingModalContainer ]] -- line: 85
	-- upvalues: useDispatch (copy), useAnalytics (copy), useContext (copy), LuaAppNavigationContext (copy), useNavigation (copy), useState (copy), useIsInExperience (copy), useSelector (copy), ModalConfiguration (copy), getDeepValue2 (copy), React (copy), ChatLandingModalVariant (copy), FFlagEnableAEGIS2CommsFAEUpsell (copy), t2 (copy), t1 (copy), FFlagEnableAEGIS1AppChatBanner (copy), FFlagEnableAEGIS2AppChatBanner (copy), useTelemetry (copy), ChatLandingTelemetryLayer (copy), useEffectOnMount (copy), useEffect (copy), ChatLandingModalTelemetry (copy), useCallback (copy), NavigateDown (copy), AppPage (copy), UnfilteredThreadsAMPFeatureName (copy), NavigateBack (copy), AccessResponseEnum (copy), refreshAllUnfilteredThreadsDetails (copy), HttpService (copy), FStringCanAccessTrustedContactsAmpFeature (copy), FStringCanAccessTrustedContactsAmpNameSpace (copy), ModalTelemetry (copy), FFlagDebugAppChatFae (copy), FFlagDebugAEGIS1AppChatBanner (copy), OpenTcLearnMoreLink (copy), AppChatNetworking (copy), Cryo (copy), useChatPagePadding (copy), Foundation (copy), useSocialUpsellOverlayController (copy), startFacialAgeEstimation (copy), SocialUpsell (copy), UpsellEntrySurfaceType (copy), UpsellComponent (copy), useRef (copy), useIsGuiInChatVisible (copy), useRecordModalSeenWithDelay (copy), FIntAppChatModalSeenImpressionDelayMs (copy), FFlagTestDeviceForFAEUpsell (copy), deviceMeetsRequirementsForFAE (copy), UpsellBanner (copy), createBannerConfigFromModalConfiguration (copy), AppChatFAEBanner (copy), ChatLandingModal (copy), Enum2 (copy), GetAgeVerifiedChangedSignal (copy)
	local v63 = useDispatch()
	local v64 = useAnalytics()
	local v65 = useContext(LuaAppNavigationContext)
	local v66 = useNavigation()
	local v67, v68 = useState({})
	local v69 = useIsInExperience()
	local v70 = useSelector(function(p2) -- line: 94
		-- upvalues: ModalConfiguration (copy), getDeepValue2 (copy)
		local default = ModalConfiguration.default

		return getDeepValue2(p2, "ChatAppReducer.Modals.chatLandingModal") or default
	end)
	local v71 = React.useMemo(function() -- line: 99
		-- upvalues: ChatLandingModalVariant (copy), FFlagEnableAEGIS2CommsFAEUpsell (copy), v69 (copy)
		return {
			[ChatLandingModalVariant.ChatLandingAgeVerifiedCommsTimedModal] = FFlagEnableAEGIS2CommsFAEUpsell or not v69
		}
	end, { v69 })
	local modal_variant = v70.modal_variant
	local v73 = getDeepValue2(v70, "modal_layout.id")
	local v74 = getDeepValue2(v70, "modal_layout.seen_record_action")
	local v75 = getDeepValue2(v70, "modal_layout.dismissed_record_action")
	local v76 = getDeepValue2(v70, "modal_layout.buttons")
	local v77 = v76 and v76[1]
	local v78 = t2[modal_variant]
	local v79 = (t1[modal_variant] or (FFlagEnableAEGIS1AppChatBanner and v71[modal_variant] or FFlagEnableAEGIS2AppChatBanner and modal_variant == ChatLandingModalVariant.ChatLandingAgeVerifiedCommsUpsellModal)) and not v67[modal_variant]
	local v80 = useTelemetry(ChatLandingTelemetryLayer.Context)

	useEffectOnMount(function() -- line: 123
		-- upvalues: v64 (copy), v78 (copy), v79 (copy)
		if v64 and (v78 and v79) then
			v64.fireAnalyticsEvent(`{ v78 }Rendered`)
		end
	end)
	useEffect(function() -- line: 128
		-- upvalues: v79 (copy), modal_variant (copy), ChatLandingModalVariant (copy), v80 (copy), ChatLandingModalTelemetry (copy)
		if v79 and modal_variant == ChatLandingModalVariant.AgeAssuranceUpsell then
			v80.emit(ChatLandingModalTelemetry.Events.FaeModalShown, {})
		end

		if v79 then
			v80.emit(ChatLandingModalTelemetry.Events.ModalRendered, {
				modalVariant = modal_variant
			})
		end
	end, {
		modal_variant,
		v79
	})

	local v81 = useCallback(function() -- line: 139
		-- upvalues: v64 (copy), v78 (copy), v63 (copy), NavigateDown (copy), AppPage (copy), UnfilteredThreadsAMPFeatureName (copy), NavigateBack (copy), AccessResponseEnum (copy), refreshAllUnfilteredThreadsDetails (copy), v69 (copy)
		if v64 and v78 then
			v64.fireAnalyticsEvent(`{ v78 }ContinueClicked`)
		end

		v63(NavigateDown({
			name = AppPage.AmpWizardContainer,
			extraProps = {
				featureName = UnfilteredThreadsAMPFeatureName,
				completionCallback = function(p3, _) --[[ completionCallback ]] -- line: 147
					-- upvalues: v63 (copy), NavigateBack (copy), AccessResponseEnum (copy), v64 (copy), v78 (copy), refreshAllUnfilteredThreadsDetails (copy), v69 (copy)
					v63(NavigateBack(true))

					if p3 == AccessResponseEnum.Granted then
						if v64 and v78 then
							v64.fireAnalyticsEvent(`{ v78 }Succeeded`)
						end

						v63(refreshAllUnfilteredThreadsDetails(nil, v69))

						return
					end

					if v64 and v78 then
						v64.fireAnalyticsEvent(`{ v78 }Failed`)
					end
				end
			}
		}))
	end, {
		v63,
		v64,
		v78
	})
	local v82 = useCallback(function() -- line: 165
		-- upvalues: HttpService (copy), v80 (copy), ChatLandingModalTelemetry (copy), v63 (copy), NavigateDown (copy), AppPage (copy), FStringCanAccessTrustedContactsAmpFeature (copy), FStringCanAccessTrustedContactsAmpNameSpace (copy), NavigateBack (copy), AccessResponseEnum (copy), modal_variant (copy), ModalTelemetry (copy), refreshAllUnfilteredThreadsDetails (copy), v69 (copy), FFlagDebugAppChatFae (copy), FFlagDebugAEGIS1AppChatBanner (copy)
		local guid = HttpService:GenerateGUID(false)

		v80.emit(ChatLandingModalTelemetry.Events.TelemetryFaeButtonClick, {
			state = guid,
			btn = ChatLandingModalTelemetry.Constants.ConfirmFaeBtn
		})
		v63(NavigateDown({
			name = AppPage.AmpWizardContainer,
			extraProps = {
				featureName = FStringCanAccessTrustedContactsAmpFeature,
				entryPointEventCtx = ChatLandingModalTelemetry.Constants.EventStreamCtx,
				metadata = {
					sessionId = guid
				},
				nameSpace = FStringCanAccessTrustedContactsAmpNameSpace,
				completionCallback = function(p5, _) --[[ completionCallback ]] -- line: 180
					-- upvalues: v63 (copy), NavigateBack (copy), AccessResponseEnum (copy), v80 (copy), ChatLandingModalTelemetry (copy), modal_variant (copy), ModalTelemetry (copy), refreshAllUnfilteredThreadsDetails (copy), v69 (copy), FFlagDebugAppChatFae (copy), FFlagDebugAEGIS1AppChatBanner (copy)
					v63(NavigateBack(true))

					if p5 == AccessResponseEnum.Granted then
						v80.emit(ChatLandingModalTelemetry.Events.ModalActionResult, {
							modalVariant = modal_variant,
							action = ModalTelemetry.Enums.ModalActions.PrimaryCta,
							actionResult = ModalTelemetry.Enums.ModalActionResults.Success
						})
						v63(refreshAllUnfilteredThreadsDetails(nil, v69))
					else
						v80.emit(ChatLandingModalTelemetry.Events.ModalActionResult, {
							modalVariant = modal_variant,
							action = ModalTelemetry.Enums.ModalActions.PrimaryCta,
							actionResult = ModalTelemetry.Enums.ModalActionResults.Failure
						})
					end

					if FFlagDebugAppChatFae or FFlagDebugAEGIS1AppChatBanner then
						v63({
							type = "DEBUG_DismissChatLandingModal"
						})
					end
				end
			}
		}))
	end, {
		v63,
		v69,
		v80,
		modal_variant
	})
	local v83 = useCallback(function() -- line: 214
		-- upvalues: v64 (copy), v78 (copy), v66 (copy), v65 (copy)
		if v64 and v78 then
			v64.fireAnalyticsEvent(`{ v78 }LearnMoreClicked`)
		end

		local v104 = if not v66 then nil else v66.navigate

		v65.navigateToUnfilteredThreadsLearnMore(v104)
	end, {
		v65,
		v64,
		v66,
		v78
	})
	local v84 = useCallback(function() -- line: 228
		-- upvalues: v63 (copy), OpenTcLearnMoreLink (copy)
		v63(OpenTcLearnMoreLink())
	end, { v63 })
	local v85 = useCallback(function() -- line: 232
		-- upvalues: v64 (copy), v78 (copy), modal_variant (copy), ChatLandingModalVariant (copy), v80 (copy), ChatLandingModalTelemetry (copy), HttpService (copy), ModalTelemetry (copy), v63 (copy), AppChatNetworking (copy), v75 (copy), v73 (copy), FFlagDebugAppChatFae (copy), FFlagDebugAEGIS1AppChatBanner (copy), v68 (copy), Cryo (copy), v67 (copy)
		if v64 and v78 then
			v64.fireAnalyticsEvent(`{ v78 }Dismissed`)
		end

		if modal_variant == ChatLandingModalVariant.AgeAssuranceUpsell then
			v80.emit(ChatLandingModalTelemetry.Events.TelemetryFaeButtonClick, {
				state = HttpService:GenerateGUID(false),
				btn = ChatLandingModalTelemetry.Constants.CancelFaeBtn
			})
		end

		v80.emit(ChatLandingModalTelemetry.Events.ModalAction, {
			modalVariant = modal_variant,
			action = ModalTelemetry.Enums.ModalActions.Dismiss
		})
		v63(AppChatNetworking.rodux.RecordModalSequenceResponse.API(v75, "chat_landing_modal", v73)):catch(function(p7) -- line: 252
			warn("Error in ChatLandingModalContainer -> RecordModalSequenceResponse dismissed: " .. tostring(p7), p7)
		end)

		if FFlagDebugAppChatFae and modal_variant == ChatLandingModalVariant.AgeAssuranceUpsell or FFlagDebugAEGIS1AppChatBanner and modal_variant == ChatLandingModalVariant.ChatLandingAgeVerifiedCommsTimedModal then
			v63({
				type = "DEBUG_DismissChatLandingModal"
			})

			return
		end

		v68(Cryo.Dictionary.join(v67, {
			[modal_variant] = true
		}))
	end, {
		v67,
		v68,
		v63,
		v64,
		v78,
		v75,
		modal_variant,
		v73,
		v80
	})
	local v86 = nil
	local v87 = nil
	local v88 = nil
	local v89 = nil

	if FFlagEnableAEGIS1AppChatBanner then
		v86 = useChatPagePadding()
		v89 = Foundation.Hooks.useTokens()

		local v90 = useSocialUpsellOverlayController(v69)

		v87 = React.useCallback(function(_: string) -- line: 295
			-- upvalues: modal_variant (copy), ChatLandingModalVariant (copy), v63 (copy), startFacialAgeEstimation (copy), SocialUpsell (copy), UpsellEntrySurfaceType (copy), FFlagEnableAEGIS2CommsFAEUpsell (copy), v69 (copy)
			if modal_variant == ChatLandingModalVariant.ChatLandingAgeVerifiedCommsTimedModal then
				v63(startFacialAgeEstimation(SocialUpsell.Enums.SocialUpsellType.FacialAgeEstimation .. UpsellEntrySurfaceType.PartyTab, nil, nil, UpsellEntrySurfaceType.PartyTab, if not FFlagEnableAEGIS2CommsFAEUpsell then nil else v69))
			end
		end, {
			v63,
			modal_variant,
			v69
		})
		v88 = React.useCallback(function(s2: string) -- line: 308
			-- upvalues: modal_variant (copy), ChatLandingModalVariant (copy), v90 (copy), SocialUpsell (copy), UpsellEntrySurfaceType (copy), UpsellComponent (copy)
			if modal_variant == ChatLandingModalVariant.ChatLandingAgeVerifiedCommsTimedModal then
				v90.openSocialOverlay(SocialUpsell.Enums.SocialUpsellType.FacialAgeEstimation, {
					upsellEntrySurface = UpsellEntrySurfaceType.PartyTab,
					upsellEntryComponent = UpsellComponent.Banner,
					impressionId = s2
				})
			end
		end, {
			modal_variant,
			v90.openSocialOverlay
		})
	end

	local v91 = ({
		[ChatLandingModalVariant.AgeAssuranceUpsell] = v84
	})[modal_variant]
	local v92 = useCallback(function(...) -- line: 324
		-- upvalues: v80 (copy), ChatLandingModalTelemetry (copy), modal_variant (copy), ModalTelemetry (copy), v91 (copy)
		v80.emit(ChatLandingModalTelemetry.Events.ModalAction, {
			modalVariant = modal_variant,
			action = ModalTelemetry.Enums.ModalActions.InlineCta
		})
		v91(...)
	end, {
		v91,
		v80,
		modal_variant
	})
	local v93 = v70 and (not not v70.modal_layout and (not not v70.modal_layout.body and v70.modal_layout.body.additional_content)) or {}
	local v94 = React.useMemo(function() -- line: 337
		-- upvalues: Cryo (copy), v93 (copy), AppChatNetworking (copy), v92 (copy)
		return Cryo.List.map(v93, function(p8) -- line: 338
			-- upvalues: AppChatNetworking (copy), v92 (copy)
			local t3 = {
				type = p8.type,
				text = p8.text
			}

			if p8.type == AppChatNetworking.Constants.ModalContentType.Link then
				t3.onActivated = v92
			end

			return t3
		end)
	end, {
		v93,
		v91,
		v92
	})
	local v95 = ({
		phone_verify = v81,
		fully_eligible_ftux = v83,
		[ChatLandingModalVariant.AgeAssuranceUpsell] = v82
	})[modal_variant]
	local v96 = useCallback(function(...) -- line: 356
		-- upvalues: v80 (copy), ChatLandingModalTelemetry (copy), modal_variant (copy), ModalTelemetry (copy), v95 (copy)
		v80.emit(ChatLandingModalTelemetry.Events.ModalAction, {
			modalVariant = modal_variant,
			action = ModalTelemetry.Enums.ModalActions.PrimaryCta
		})
		v95(...)
	end, {
		v95,
		v80,
		modal_variant
	})
	local v97 = useRef(nil)
	local v98 = useIsGuiInChatVisible(v97, {
		v97.current,
		v79
	})

	useRecordModalSeenWithDelay({
		modalSequence = "chat_landing_modal",
		modalId = v73,
		actionToRecord = v74,
		delayMs = FIntAppChatModalSeenImpressionDelayMs,
		canRecordAction = v98 and v79
	})

	local v99 = not FFlagDebugAppChatFae and function() -- line: 380
	end or React.useCallback(function() -- line: 375
		-- upvalues: v63 (copy)
		v63({
			type = "DEBUG_ShowAppChatFaeUpsell"
		})
	end, { v63 })
	local v100 = if not FFlagDebugAEGIS1AppChatBanner then nil else React.useCallback(function() -- line: 383
		-- upvalues: v63 (copy)
		v63({
			type = "DEBUG_ShowChatLandingAgeVerifiedTimedModal"
		})
	end, { v63 })

	if FFlagTestDeviceForFAEUpsell and not deviceMeetsRequirementsForFAE() then
		return nil
	end

	if v79 then
		if FFlagEnableAEGIS1AppChatBanner and v71[modal_variant] then
			return React.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				ContentPadding = React.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 1),
					PaddingBottom = UDim.new(0, v89.Size.Size_400),
					PaddingLeft = UDim.new(0, v86.left),
					PaddingRight = UDim.new(0, v86.right)
				}),
				UpsellBanner = React.createElement(UpsellBanner, {
					config = createBannerConfigFromModalConfiguration(v70),
					onPrimaryAction = v87,
					onSecondaryAction = v88,
					onDismiss = v85,
					upsellEntrySurface = UpsellEntrySurfaceType.PartyTab,
					upsellEntryComponent = UpsellComponent.Banner
				})
			})
		end

		if FFlagEnableAEGIS2AppChatBanner and modal_variant == ChatLandingModalVariant.ChatLandingAgeVerifiedCommsUpsellModal then
			return React.createElement(AppChatFAEBanner, {
				modalConfiguration = v70,
				onDismiss = v85
			})
		end

		return React.createElement(ChatLandingModal, {
			titleLabelText = getDeepValue2(v70, "modal_layout.label.text"),
			titleText = getDeepValue2(v70, "modal_layout.header.text"),
			bodyText = getDeepValue2(v70, "modal_layout.body.text"),
			additionalContent = v94,
			actionText = v77 and v77.text,
			buttonType = if modal_variant ~= "fully_eligible_ftux" then Enum2.ButtonType.PrimarySystem else Enum2.ButtonType.Secondary,
			onActivated = v96,
			onDismissed = v85,
			hideActionButton = not v77 or not v95,
			ref = v97
		})
	end

	if modal_variant ~= "none" and modal_variant ~= nil and not t1[modal_variant] and (not FFlagEnableAEGIS1AppChatBanner or not v71[modal_variant]) then
		warn("Unsupported ChatLandingModal variant: " .. modal_variant)
	end

	if FFlagDebugAEGIS1AppChatBanner then
		return React.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 200)
		}, {
			Layout = React.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				SortOrder = Enum.SortOrder.Name,
				Padding = UDim.new(0, 10)
			}),
			Btn1 = React.createElement("TextButton", {
				Text = "DEBUG Show Chat Landing Age Verfication Timed Modal",
				Size = UDim2.new(0, 200, 0, 50),
				[React.Event.Activated] = v100
			}),
			Btn2 = React.createElement("TextButton", {
				Text = "DEBUG Fire Age Verified event",
				Size = UDim2.new(0, 200, 0, 50),
				[React.Event.Activated] = function() -- line: 472
					-- upvalues: GetAgeVerifiedChangedSignal (copy)
					GetAgeVerifiedChangedSignal():fire()
				end
			})
		})
	end

	if FFlagDebugAppChatFae then
		return React.createElement("TextButton", {
			Text = "DEBUG Show FAE Upsell",
			Size = UDim2.new(0, 200, 0, 50),
			[React.Event.Activated] = v99
		})
	end

	return nil
end)

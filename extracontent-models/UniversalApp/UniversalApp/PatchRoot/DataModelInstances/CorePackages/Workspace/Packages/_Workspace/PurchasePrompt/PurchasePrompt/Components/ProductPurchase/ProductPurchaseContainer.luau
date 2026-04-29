local GuiService = game:GetService("GuiService")
local ContextActionService = game:GetService("ContextActionService")
local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local PurchasePromptParent = PurchasePrompt.Parent
local PurchasePromptDeps = require(PurchasePromptParent.PurchasePromptDeps)
local Roact = PurchasePromptDeps.Roact
local React = require(PurchasePromptParent.React)
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local CachedPolicyService = require(PurchasePromptParent.CachedPolicyService)
local RobloxTranslator = require(PurchasePromptParent.RobloxTranslator)

require(PurchasePromptParent.Foundation)

local UIBlox = PurchasePromptDeps.UIBlox
local InteractiveAlert = UIBlox.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local Images = UIBlox.App.ImageSet.Images
local IAPExperience = require(PurchasePromptParent.IAPExperience)
local ProductPurchase = IAPExperience.ProductPurchase
local ProductPurchaseRobuxUpsell = IAPExperience.ProductPurchaseRobuxUpsell
local LeaveRobloxAlert = IAPExperience.LeaveRobloxAlert
local Animator = IAPExperience.Animator
local UnifiedProductPurchaseModal = IAPExperience.UnifiedProductPurchaseModal
local UnifiedProductPurchaseModalV2 = IAPExperience.UnifiedProductPurchaseModalV2
local RobloxSubscriptionPurchaseApp = require(PurchasePromptParent.RobloxSubscriptionPurchaseApp)
local getBlackbirdUpsellBannerProductInfo = require(PurchasePrompt.Utils.getBlackbirdUpsellBannerProductInfo)
local RobloxSubscriptionFlowCompleteReason = RobloxSubscriptionPurchaseApp.RobloxSubscriptionFlowCompleteReason
local SurfaceName = RobloxSubscriptionPurchaseApp.SurfaceName
local SurfaceContext = RobloxSubscriptionPurchaseApp.SurfaceContext
local PurchaseClientSessionIdType = RobloxSubscriptionPurchaseApp.PurchaseClientSessionIdType
local SetWindowState = require(PurchasePrompt.Actions.SetWindowState)
local PurchaseFlow = require(PurchasePrompt.Enums.PurchaseFlow)
local RequestType = require(PurchasePrompt.Enums.RequestType)
local PromptState = require(PurchasePrompt.Enums.PromptState)
local WindowState = require(PurchasePrompt.Enums.WindowState)
local PurchaseError = require(PurchasePrompt.Enums.PurchaseError)
local _ = require(PurchasePrompt.types).ProductTypeEnum
local hideWindow = require(PurchasePrompt.Thunks.hideWindow)
local retryPurchaseAfterUpsell = require(PurchasePrompt.Thunks.retryPurchaseAfterUpsell)
local completeRequest = require(PurchasePrompt.Thunks.completeRequest)
local purchaseItem = require(PurchasePrompt.Thunks.purchaseItem)
local completePurchase = require(PurchasePrompt.Thunks.completePurchase)
local launchRobuxUpsell = require(PurchasePrompt.Thunks.launchRobuxUpsell)
local openSecuritySettings = require(PurchasePrompt.Thunks.openSecuritySettings)
local isMockingPurchases = require(PurchasePrompt.Utils.isMockingPurchases)
local connectToStore = require(PurchasePrompt.connectToStore)
local sendEvent = require(PurchasePrompt.Thunks.sendEvent)
local PublishAssetAnalytics = require(PurchasePrompt.Utils.PublishAssetAnalytics)
local ExternalEventConnection = require(PurchasePrompt.Components.Connection.ExternalEventConnection)
local LocalizationService = require(PurchasePrompt.Localization.LocalizationService)
local getPlayerPrice = require(PurchasePrompt.Utils.getPlayerPrice)
local isGenericChallengeResponse = require(PurchasePrompt.Utils.isGenericChallengeResponse)
local SelectedRobuxPackage = require(PurchasePrompt.Utils.SelectedRobuxPackage)
local ProductPurchaseSurface = require(PurchasePromptParent.PurchasePromptLite).Enums.ProductPurchaseSurface
local logUnifiedPurchaseTelemetryCounter = require(PurchasePrompt.Utils.logUnifiedPurchaseTelemetryCounter)
local emitPerformanceMetrics = require(PurchasePrompt.Utils.emitPerformanceMetrics)
local initiateUserPurchaseSettingsPrecheck = require(PurchasePrompt.Thunks.initiateUserPurchaseSettingsPrecheck)
local VerifiedParentalConsentDialog = require(PurchasePromptParent.VerifiedParentalConsentDialog).VerifiedParentalConsentDialog
local VPCModalType = require(PurchasePrompt.Enums.VPCModalType)
local Animator2 = require(script.Parent.Animator)
local SharedFlags = require(PurchasePromptParent.SharedFlags)
local FFlagAddCursorProviderToPurchasePromptApp = SharedFlags.FFlagAddCursorProviderToPurchasePromptApp
local FFlagPurchasePromptPriceShouldUseProductInfoPrice = require(PurchasePrompt.Flags.FFlagPurchasePromptPriceShouldUseProductInfoPrice)
local getUnifiedPurchaseModalType = require(PurchasePrompt.Utils.getUnifiedPurchaseModalType)
local selectProductPrice = require(PurchasePrompt.Selectors.selectProductPrice)
local FFlagEnableDiscountInfoInUnifiedPurchaseModal = SharedFlags.FFlagEnableDiscountInfoInUnifiedPurchaseModal
local v65 = if not FFlagEnableDiscountInfoInUnifiedPurchaseModal then nil else require(PurchasePrompt.Selectors.selectPrice)
local SetPromptState = require(PurchasePrompt.Actions.SetPromptState)
local HttpService = game:GetService("HttpService")
local SetPurchaseFlowUUID = require(PurchasePrompt.Actions.SetPurchaseFlowUUID)
local SetPostPurchaseActions = require(PurchasePrompt.Actions.SetPostPurchaseActions)
local sendUnifiedPurchaseEventLog = require(PurchasePrompt.Utils.sendUnifiedPurchaseEventLog)
local UnifiedPurchaseEventNameEnum = require(PurchasePrompt.Enums.UnifiedPurchaseEventNameEnum)
local Constants = require(PurchasePrompt.Misc.Constants)
local FFlagEnablePurchaseFlowUUIDMigration = require(PurchasePrompt.Flags.FFlagEnablePurchaseFlowUUIDMigration)
local LoggingProtocol = require(PurchasePromptParent.LoggingProtocol)
local PurchaseFlowUUIDTelemetry = require(PurchasePrompt.Events.PurchaseFlowUUIDTelemetry)
local UnifiedPurchaseTelemetry = require(PurchasePrompt.Events.UnifiedPurchaseTelemetry)
local AppContext = require(PurchasePrompt.Utils.AppContext)
local DesktopUpsellExperiment = IAPExperience.Utility.DesktopUpsellExperiment
local ProductPurchaseModal = IAPExperience.ProductPurchaseModal
local RobuxUpsellModal = IAPExperience.RobuxUpsellModal
local RobuxUpsellModalTooExpensiveFallback = IAPExperience.RobuxUpsellModalTooExpensiveFallback
local shouldShowBlackbirdUpsell = require(PurchasePrompt.Utils.shouldShowBlackbirdUpsell)
local v83 = Roact.Component:extend(script.Name)
local ProductPurchasePrompt = require(script.Parent.ProductPurchasePrompt)
local SharedFlags2 = require(PurchasePromptParent.SharedFlags)
local GetFFlagOpenVngTosForVngRobuxUpsell = SharedFlags2.GetFFlagOpenVngTosForVngRobuxUpsell
local getAppFeaturePolicies = require(PurchasePromptParent.UniversalAppPolicy).getAppFeaturePolicies
local FFlagEnableUnifiedProductPurchaseFlow = SharedFlags2.FFlagEnableUnifiedProductPurchaseFlow
local UnifiedPurchaseModalTypeEnum = IAPExperience.Enums.UnifiedPurchaseModalTypeEnum
local FFlagUnifiedPurchaseGamepassAddProductUniverseId = require(PurchasePromptParent.SharedFlags).FFlagUnifiedPurchaseGamepassAddProductUniverseId
local FFlagUnifiedPurchaseFlowMarketplaceUIImprovements = require(PurchasePromptParent.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements
local FFlagAddUnifiedTestPurchaseDisclaimer = require(PurchasePromptParent.SharedFlags).FFlagAddUnifiedTestPurchaseDisclaimer
local FFlagAddPerformanceMetricsToUnifiedPurchaseModal = require(PurchasePromptParent.SharedFlags).FFlagAddPerformanceMetricsToUnifiedPurchaseModal
local FFlagEnableUnifiedPurchaseFlowForDevSubs = require(PurchasePromptParent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local FFlagAddCenterDialogForUnifiedPurchaseModal = require(PurchasePromptParent.SharedFlags).FFlagAddCenterDialogForUnifiedPurchaseModal
local FFlagUnifiedPurchaseAddSkeleton = require(PurchasePromptParent.SharedFlags).FFlagUnifiedPurchaseAddSkeleton
local FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal = require(PurchasePromptParent.SharedFlags).FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal
local FFlagEnableSubscriptionUpsellUnifiedPurchaseEventTelemetry = require(PurchasePromptParent.SharedFlags).FFlagEnableSubscriptionUpsellUnifiedPurchaseEventTelemetry
local v99 = game:DefineFastFlag("RemoveDelayedInputForUnifiedPurchaseModal", true)
local FFlagEnableDelayedInputForUnifiedPurchaseModalInExperience = IAPExperience.Flags.FFlagEnableDelayedInputForUnifiedPurchaseModalInExperience
local FFlagPurchasePromptSubtitleForTimedOptions = require(PurchasePromptParent.SharedFlags).FFlagPurchasePromptSubtitleForTimedOptions
local FFlagPurchaseModalTimedOptionExtension = require(PurchasePromptParent.SharedFlags).FFlagPurchaseModalTimedOptionExtension
local FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal = require(PurchasePromptParent.SharedFlags).FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal
local FFlagEnableBlackbirdUpsellImpressionGating = require(PurchasePromptParent.SharedFlags).FFlagEnableBlackbirdUpsellImpressionGating
local BlackbirdUpsellImpressionTracker = require(PurchasePrompt.Utils.BlackbirdUpsellImpressionTracker)
local FFlagBlackbirdUpsellGateResaleAndTimedOption = require(PurchasePrompt.Flags.FFlagBlackbirdUpsellGateResaleAndTimedOption)

local function isRelevantRequestType(p1, p2, p3) -- line: 169
	-- upvalues: FFlagUnifiedPurchaseAddSkeleton (copy), PromptState (copy), PurchaseFlow (copy), RequestType (copy), FFlagEnableUnifiedProductPurchaseFlow (copy), FFlagEnableUnifiedPurchaseFlowForDevSubs (copy)
	if FFlagUnifiedPurchaseAddSkeleton and (p3 == PromptState.InitializingPurchase and p2 == PurchaseFlow.RobuxUpsellV2) then
		return true
	end

	if p2 == PurchaseFlow.RobuxUpsellV2 or p2 == PurchaseFlow.LargeRobuxUpsell then
		return false
	end

	return p1 == RequestType.Asset or (p1 == RequestType.Bundle or (p1 == RequestType.GamePass or (p1 == RequestType.Product or (p1 == RequestType.AvatarCreationFee or (FFlagEnableUnifiedProductPurchaseFlow and p1 == RequestType.Experience or (FFlagEnableUnifiedProductPurchaseFlow and p1 == RequestType.Look or FFlagEnableUnifiedPurchaseFlowForDevSubs and p1 == RequestType.DeveloperSubscription))))))
end

function v83.init(p4) -- line: 208
	-- upvalues: HttpService (copy), FFlagEnablePurchaseFlowUUIDMigration (copy), LoggingProtocol (copy), PurchaseFlowUUIDTelemetry (copy), CachedPolicyService (copy), PromptState (copy), FFlagUnifiedPurchaseGamepassAddProductUniverseId (copy), sendUnifiedPurchaseEventLog (copy), v99 (copy), FFlagEnableDelayedInputForUnifiedPurchaseModalInExperience (copy), AppContext (copy), Players (copy), isRelevantRequestType (copy), FFlagEnableUnifiedProductPurchaseFlow (copy), logUnifiedPurchaseTelemetryCounter (copy), UnifiedPurchaseTelemetry (copy), UnifiedPurchaseEventNameEnum (copy), PurchaseError (copy), isGenericChallengeResponse (copy), RequestType (copy), PublishAssetAnalytics (copy), WindowState (copy), ContextActionService (copy), VPCModalType (copy), FFlagAddPerformanceMetricsToUnifiedPurchaseModal (copy), emitPerformanceMetrics (copy), Constants (copy)
	p4.state = {
		screenSize = Vector2.new(0, 0),
		isLuobu = false,
		analyticId = HttpService:GenerateGUID(false)
	}

	if not FFlagEnablePurchaseFlowUUIDMigration then
		p4.props.setPurchaseFlowUUID(HttpService:GenerateGUID(false))
		LoggingProtocol.default:logRobloxTelemetryCounter(PurchaseFlowUUIDTelemetry.ProductPurchaseContainerMigrationCounter, 1, {
			method = "ProductPurchaseContainerInit"
		})
	end

	coroutine.wrap(function() -- line: 227
		-- upvalues: CachedPolicyService (copy), p4 (copy)
		if CachedPolicyService:IsSubjectToChinaPolicies() then
			p4:setState({
				isLuobu = true
			})
		end
	end)()

	function p4.emitPurchaseFlowEvent(p5, p6) -- line: 238
		-- upvalues: p4 (copy), PromptState (copy), HttpService (copy)
		local promptState = p4.props.promptState
		local v157 = ({
			[PromptState.RobuxUpsell] = "PurchaseModal",
			[PromptState.UpsellInProgress] = "RobuxPurchasePending"
		})[promptState]

		if not v157 then
			return
		end

		local t1 = {
			purchase_flow_uuid = p4.props.purchaseFlowUUID,
			purchase_flow = "InGameRobuxUpsell",
			view_name = v157,
			purchase_event_type = p5,
			input_type = p6,
			event_metadata = HttpService:JSONEncode({
				universe_id = tostring(game.GameId),
				item_product_id = tostring(p4.props.productInfo.productId),
				item_name = p4.props.productInfo.name,
				price = tostring(p4.props.productInfo.price),
				user_balance = tostring(p4.props.accountInfo.balance) or nil,
				package_robux_amount = tostring(p4.props.robuxPurchaseAmount) or nil
			})
		}

		p4.props.onAnalyticEvent("UserPurchaseFlow", t1)
	end
	function p4.emitUnifiedProductPurchaseFlowEvent(p7) -- line: 262
		-- upvalues: p4 (copy), FFlagUnifiedPurchaseGamepassAddProductUniverseId (copy), sendUnifiedPurchaseEventLog (copy)
		local v160 = p4.props.purchaseAnalyticsMetadata or {}
		local t2 = {
			event_name = p7,
			purchase_flow_uuid = v160.purchaseFlowUUID,
			product_id = v160.productId,
			product_type = v160.productType,
			product_target_id = v160.productTargetId,
			robux_price = v160.price,
			surface = v160.surface,
			user_roblox_balance = v160.userRobuxBalance,
			salelocation_universeid = v160.saleLocationUniverseId,
			product_universeid = if not FFlagUnifiedPurchaseGamepassAddProductUniverseId then nil else v160.productUniverseId
		}

		sendUnifiedPurchaseEventLog(t2)
	end
	function p4.changeScreenSize(p8) -- line: 281
		-- upvalues: p4 (copy)
		if p4.state.screenSize ~= p8.AbsoluteSize then
			p4:setState({
				screenSize = p8.AbsoluteSize
			})
		end
	end
	function p4.hasDelayedInput() -- line: 289
		-- upvalues: v99 (copy), p4 (copy), FFlagEnableDelayedInputForUnifiedPurchaseModalInExperience (copy), PromptState (copy)
		if not v99 and p4.props.isTestPurchase then
			return false
		end

		local promptState = p4.props.promptState

		if FFlagEnableDelayedInputForUnifiedPurchaseModalInExperience and promptState == PromptState.PromptPurchase and p4.buyButtonUsesFoundationInputDelay then
			return true
		end

		if v99 then
			return promptState == PromptState.PurchaseInProgress or (promptState == PromptState.RobuxUpsell or promptState == PromptState.UpsellInProgress)
		end

		return promptState == PromptState.PromptPurchase or (promptState == PromptState.PurchaseInProgress or (promptState == PromptState.RobuxUpsell or promptState == PromptState.UpsellInProgress))
	end
	function p4.isWindowShowAndDoneAnimating() -- line: 325
		-- upvalues: p4 (copy)
		return p4.state.isAnimating == false
	end

	p4.buyButtonUsesFoundationInputDelay = AppContext.get() == AppContext.Enum.IN_EXPERIENCE

	function p4.canConfirmInput() -- line: 335
		-- upvalues: Players (copy), p4 (copy)
		if Players.LocalPlayer.GameplayPaused then
			return false
		end

		local v164 = p4.isWindowShowAndDoneAnimating()

		if p4.hasDelayedInput() then
			local v165 = false

			if p4.state.doneAnimatingTime then
				v165 = os.clock() - p4.state.doneAnimatingTime > 2.5
			end

			return v164 and v165
		end

		return v164
	end
	function p4.getConfirmButtonAction(p9, p10, p11) -- line: 360
		-- upvalues: PromptState (copy), isRelevantRequestType (copy), FFlagEnableUnifiedProductPurchaseFlow (copy), p4 (copy), logUnifiedPurchaseTelemetryCounter (copy), UnifiedPurchaseTelemetry (copy), UnifiedPurchaseEventNameEnum (copy), PurchaseError (copy), isGenericChallengeResponse (copy)
		if p9 == PromptState.None or not isRelevantRequestType(p10) then
			return nil
		end

		if p9 == PromptState.PromptPurchase or p9 == PromptState.PurchaseInProgress then
			if FFlagEnableUnifiedProductPurchaseFlow and p4.props.isUserEligibleForUnifiedPurchaseFlow then
				local v169 = p4.props.purchaseAnalyticsMetadata or {}

				logUnifiedPurchaseTelemetryCounter(UnifiedPurchaseTelemetry.UnifiedProductPurchaseModalBuyItemButtonClickedCounter, v169.surface, v169.productType)
				p4.emitUnifiedProductPurchaseFlowEvent(UnifiedPurchaseEventNameEnum.BuyItemModalBuyClicked)
			end

			return p4.props.onBuy
		end

		if p9 == PromptState.RobuxUpsell or p9 == PromptState.UpsellInProgress or p9 == PromptState.LeaveRobloxWarning then
			return p4.props.onRobuxUpsell
		end

		if p9 == PromptState.U13PaymentModal or p9 == PromptState.U13MonthlyThreshold1Modal or p9 == PromptState.U13MonthlyThreshold2Modal or p9 == PromptState.ParentalConsentWarningPaymentModal13To17 then
			return p4.props.onScaryModalConfirm
		end

		if p9 == PromptState.Error and p11 == PurchaseError.TwoFactorNeededSettings then
			return p4.props.onOpenSecuritySettings
		end

		if isGenericChallengeResponse(p11) then
			return function() -- line: 392
				-- upvalues: p4 (copy), p11 (copy)
				p4.props.onOpenSecuritySettings(p11)
			end
		end

		return p4.props.hideWindow
	end
	function p4.getCancelButtonAction(p12, p13) -- line: 400
		-- upvalues: PromptState (copy), isRelevantRequestType (copy), p4 (copy)
		if p12 == PromptState.None or not isRelevantRequestType(p13) then
			return nil
		end

		return p4.props.hideWindow
	end
	function p4.confirmButtonPressed() -- line: 408
		-- upvalues: p4 (copy), RequestType (copy), PromptState (copy), PublishAssetAnalytics (copy)
		if p4.props.requestType == RequestType.AvatarCreationFee and p4.props.promptState == PromptState.PromptPurchase then
			PublishAssetAnalytics.sendButtonClicked(PublishAssetAnalytics.Section.BuyItemModal, PublishAssetAnalytics.Element.Buy)
		end

		local v172 = p4.getConfirmButtonAction(p4.props.promptState, p4.props.requestType, p4.props.purchaseError)

		if v172 ~= nil and p4.canConfirmInput() then
			v172()
		end
	end
	function p4.cancelButtonPressed() -- line: 425
		-- upvalues: p4 (copy), RequestType (copy), PromptState (copy), PublishAssetAnalytics (copy), FFlagEnableUnifiedProductPurchaseFlow (copy), logUnifiedPurchaseTelemetryCounter (copy), UnifiedPurchaseTelemetry (copy)
		if p4.props.requestType == RequestType.AvatarCreationFee and p4.props.promptState == PromptState.PromptPurchase then
			PublishAssetAnalytics.sendButtonClicked(PublishAssetAnalytics.Section.BuyItemModal, PublishAssetAnalytics.Element.Cancel)
		end

		if FFlagEnableUnifiedProductPurchaseFlow and p4.props.isUserEligibleForUnifiedPurchaseFlow then
			logUnifiedPurchaseTelemetryCounter(UnifiedPurchaseTelemetry.UnifiedProductPurchaseModalCancelButtonClickedCounter, p4.props.purchaseAnalyticsMetadata.surface, p4.props.purchaseAnalyticsMetadata.productType)
		end

		local v173 = p4.getCancelButtonAction(p4.props.promptState, p4.props.requestType)

		if v173 ~= nil then
			v173()
		end
	end
	function p4.configContextActionService(p14) -- line: 450
		-- upvalues: WindowState (copy), ContextActionService (copy), p4 (copy)
		if p14 == WindowState.Shown then
			ContextActionService:BindCoreAction("ProductPurchaseConfirmButtonBind", function(_, p16, _) -- line: 452
				-- upvalues: p4 (copy)
				if p16 == Enum.UserInputState.Begin then
					p4.confirmButtonPressed()
				end
			end, false, Enum.KeyCode.ButtonA)
			ContextActionService:BindCoreAction("ProductPurchaseCancelButtonBind", function(_, p19, _) -- line: 457
				-- upvalues: p4 (copy)
				if p19 == Enum.UserInputState.Begin then
					p4.cancelButtonPressed()
				end
			end, false, Enum.KeyCode.ButtonB)

			return
		end

		ContextActionService:UnbindCoreAction("ProductPurchaseConfirmButtonBind")
		ContextActionService:UnbindCoreAction("ProductPurchaseCancelButtonBind")
	end
	function p4.getVPCModalType(p21) -- line: 468
		-- upvalues: PromptState (copy), VPCModalType (copy)
		if p21 == PromptState.EnablePurchaseVPCModal then
			return VPCModalType.toRawValue(VPCModalType.EnablePurchase)
		end

		return VPCModalType.toRawValue(VPCModalType.None)
	end
	function p4.onBuyItemButtonMounted(p22) -- line: 475
		-- upvalues: p4 (copy), logUnifiedPurchaseTelemetryCounter (copy), UnifiedPurchaseTelemetry (copy), UnifiedPurchaseEventNameEnum (copy), FFlagAddPerformanceMetricsToUnifiedPurchaseModal (copy), emitPerformanceMetrics (copy), Constants (copy)
		local v177 = p4.props.purchaseAnalyticsMetadata or {}

		logUnifiedPurchaseTelemetryCounter(UnifiedPurchaseTelemetry.UnifiedProductPurchaseModalShownCounter, v177.surface, v177.productType)
		p4.emitUnifiedProductPurchaseFlowEvent(UnifiedPurchaseEventNameEnum.BuyItemModalShown)

		if FFlagAddPerformanceMetricsToUnifiedPurchaseModal and (v177 and v177.surface) then
			emitPerformanceMetrics(Constants.PerformanceMetrics.IntervalName.ProductPurchaseContainerShown, v177.surface)
		end

		if p4.props.purchaseCallbacks and p4.props.purchaseCallbacks.onBuyItemButtonMounted then
			p4.props.purchaseCallbacks.onBuyItemButtonMounted(p22)
		end
	end
end
function v83.didMount(p23) -- line: 501
	-- upvalues: WindowState (copy), isRelevantRequestType (copy), GuiService (copy)
	local purchaseFlow = p23.props.purchaseFlow
	local requestType = p23.props.requestType

	if p23.props.windowState == WindowState.Shown and isRelevantRequestType(requestType, purchaseFlow) then
		p23:setState({
			isAnimating = true
		})
		p23.configContextActionService(p23.props.windowState)
		GuiService.SetPurchasePromptIsShown(true)
	end
end
function v83.willUpdate(p24, p25) -- line: 515
	if p24.props.expectedPrice ~= p25.expectedPrice then
		p24:setState({})
	end
end
function v83.didUpdate(p26, p27, _) -- line: 521
	-- upvalues: FFlagEnablePurchaseFlowUUIDMigration (copy), PromptState (copy), HttpService (copy), LoggingProtocol (copy), PurchaseFlowUUIDTelemetry (copy), Players (copy), isRelevantRequestType (copy), GuiService (copy), WindowState (copy), RequestType (copy), PublishAssetAnalytics (copy)
	if not FFlagEnablePurchaseFlowUUIDMigration and (p26.props.promptState ~= p27.promptState and p26.props.promptState == PromptState.None) then
		local guid = HttpService:GenerateGUID(false)

		p26.props.setPurchaseFlowUUID(guid)
		LoggingProtocol.default:logRobloxTelemetryCounter(PurchaseFlowUUIDTelemetry.ProductPurchaseContainerMigrationCounter, 1, {
			method = "ProductPurchaseContainerDidUpdate"
		})
	end

	if Players.LocalPlayer.GameplayPaused then
		p26.props.onAnalyticEvent("PurchasePromptGamePausedDetected", {
			place_id = game.PlaceId
		})
		p26.props.hideWindow()
	end

	local purchaseFlow = p26.props.purchaseFlow
	local requestType = p26.props.requestType

	if p27.windowState ~= p26.props.windowState and isRelevantRequestType(requestType, purchaseFlow) then
		p26:setState({
			isAnimating = true
		})
		p26.configContextActionService(p26.props.windowState)
		GuiService:SetPurchasePromptIsShown(p26.props.windowState == WindowState.Shown)

		if p26.props.windowState == WindowState.Hidden then
			p26.props.completeRequest()
		end
	end

	if requestType == RequestType.AvatarCreationFee and p26.props.promptState == PromptState.PurchaseComplete and p27.promptState ~= PromptState.PurchaseComplete then
		PublishAssetAnalytics.sendPageLoad(PublishAssetAnalytics.Section.ProcessCompleteModal)
	end

	if p27.promptState ~= p26.props.promptState then
		p26.emitPurchaseFlowEvent("ViewShown")
	end
end
function v83.getMessageKeysFromPromptState(p29) -- line: 580
	-- upvalues: PromptState (copy), PurchaseError (copy), LocalizationService (copy), isGenericChallengeResponse (copy)
	local promptState = p29.props.promptState
	local productInfo = p29.props.productInfo
	local purchaseError = p29.props.purchaseError

	if promptState == PromptState.PurchaseComplete then
		return {
			messageText = {
				key = "CoreScripts.PurchasePrompt.PurchaseMessage.Succeeded",
				params = {
					ITEM_NAME = productInfo.name
				}
			},
			okText = {
				key = "CoreScripts.PurchasePrompt.Button.OK"
			},
			titleText = {
				key = "CoreScripts.PurchasePrompt.Title.BuyItem"
			}
		}
	end

	if promptState == PromptState.U13PaymentModal then
		return {
			messageText = {
				key = "CoreScripts.PurchasePrompt.PurchaseDetails.ScaryModalOne"
			},
			okText = {
				key = "CoreScripts.PurchasePrompt.Button.OK"
			},
			titleText = {
				key = "CoreScripts.PurchasePrompt.Title.BuyItem"
			}
		}
	end

	if promptState == PromptState.U13MonthlyThreshold1Modal then
		return {
			messageText = {
				key = "CoreScripts.PurchasePrompt.PurchaseDetails.ScaryModalTwo"
			},
			okText = {
				key = "CoreScripts.PurchasePrompt.Button.OK"
			},
			titleText = {
				key = "CoreScripts.PurchasePrompt.Title.BuyItem"
			}
		}
	end

	if promptState == PromptState.U13MonthlyThreshold2Modal then
		return {
			messageText = {
				key = "CoreScripts.PurchasePrompt.PurchaseDetails.ScaryModalParental"
			},
			okText = {
				key = "CoreScripts.PurchasePrompt.Button.OK"
			},
			titleText = {
				key = "CoreScripts.PurchasePrompt.Title.BuyItem"
			}
		}
	end

	if promptState == PromptState.ParentalConsentWarningPaymentModal13To17 then
		return {
			messageText = {
				key = "CoreScripts.PurchasePrompt.PurchaseDetails.ParentalConsent"
			},
			okText = {
				key = "CoreScripts.PurchasePrompt.Button.OK"
			},
			titleText = {
				key = "CoreScripts.PurchasePrompt.Title.BuyItem"
			}
		}
	end

	if promptState == PromptState.Error then
		if purchaseError == PurchaseError.UnknownFailure then
			return {
				messageText = {
					key = LocalizationService.getErrorKey(purchaseError),
					params = {
						ITEM_NAME = productInfo.name
					}
				},
				okText = {
					key = "CoreScripts.PurchasePrompt.Button.OK"
				},
				titleText = {
					key = "CoreScripts.PremiumModal.Title.Error"
				}
			}
		end

		if purchaseError == PurchaseError.TwoFactorNeededSettings or isGenericChallengeResponse(purchaseError) then
			return {
				messageText = {
					key = "CoreScripts.PurchasePrompt.PurchaseFailed.Enable2SVLogout"
				},
				okText = {
					key = "CoreScripts.PurchasePrompt.Button.Settings"
				},
				cancelText = {
					key = "CoreScripts.PurchasePrompt.CancelPurchase.Cancel"
				},
				titleText = {
					key = "CoreScripts.PurchasePrompt.Title.VerificationRequired"
				}
			}
		end

		return {
			messageText = {
				key = LocalizationService.getErrorKey(purchaseError)
			},
			okText = {
				key = "CoreScripts.PurchasePrompt.Button.OK"
			},
			titleText = {
				key = "CoreScripts.PremiumModal.Title.Error"
			}
		}
	end
end
function v83.determinePrompt(p30) -- line: 649
	-- upvalues: FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (copy), WindowState (copy), PromptState (copy), isRelevantRequestType (copy), FFlagUnifiedPurchaseAddSkeleton (copy), FFlagEnableUnifiedProductPurchaseFlow (copy), FFlagEnableUnifiedPurchaseFlowForDevSubs (copy), RequestType (copy), PurchaseClientSessionIdType (copy), RobloxSubscriptionPurchaseApp (copy), RobloxSubscriptionFlowCompleteReason (copy), FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal (copy), SurfaceName (copy), AppContext (copy), SurfaceContext (copy), FFlagEnableDiscountInfoInUnifiedPurchaseModal (copy), shouldShowBlackbirdUpsell (copy), FFlagBlackbirdUpsellGateResaleAndTimedOption (copy), getBlackbirdUpsellBannerProductInfo (copy), FFlagEnableSubscriptionUpsellUnifiedPurchaseEventTelemetry (copy), UnifiedPurchaseEventNameEnum (copy), FFlagEnableBlackbirdUpsellImpressionGating (copy), BlackbirdUpsellImpressionTracker (copy), FFlagAddCenterDialogForUnifiedPurchaseModal (copy), Roact (copy), UnifiedProductPurchaseModalV2 (copy), FFlagPurchasePromptSubtitleForTimedOptions (copy), FFlagEnableDelayedInputForUnifiedPurchaseModalInExperience (copy), getUnifiedPurchaseModalType (copy), FFlagAddUnifiedTestPurchaseDisclaimer (copy), UnifiedProductPurchaseModal (copy), FFlagPurchasePromptPriceShouldUseProductInfoPrice (copy), getPlayerPrice (copy), FFlagUnifiedPurchaseFlowMarketplaceUIImprovements (copy), ProductPurchaseSurface (copy), DesktopUpsellExperiment (copy), ProductPurchaseModal (copy), ProductPurchase (copy), RobuxUpsellModal (copy), ProductPurchaseRobuxUpsell (copy), GetFFlagOpenVngTosForVngRobuxUpsell (copy), getAppFeaturePolicies (copy), LeaveRobloxAlert (copy), InteractiveAlert (copy), RobloxTranslator (copy), ButtonType (copy), PurchaseError (copy), isGenericChallengeResponse (copy), React (copy), ProductPurchasePrompt (copy), Images (copy), Animator (copy), VerifiedParentalConsentDialog (copy), RobuxUpsellModalTooExpensiveFallback (copy), UnifiedPurchaseModalTypeEnum (copy), FFlagPurchaseModalTimedOptionExtension (copy)
	local purchaseFlow = p30.props.purchaseFlow
	local promptState = p30.props.promptState
	local expectedPrice = p30.props.expectedPrice
	local requestType = p30.props.requestType
	local purchaseError = p30.props.purchaseError
	local productInfo = p30.props.productInfo
	local accountInfo = p30.props.accountInfo
	local isTestPurchase = p30.props.isTestPurchase

	if FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal and p30.props.windowState ~= WindowState.Shown then
		return nil
	end

	if promptState == PromptState.None or not isRelevantRequestType(requestType, purchaseFlow, if not FFlagUnifiedPurchaseAddSkeleton then nil else promptState) then
		return nil
	end

	if promptState == PromptState.PromptPurchase or promptState == PromptState.PurchaseInProgress or FFlagUnifiedPurchaseAddSkeleton and promptState == PromptState.InitializingPurchase then
		if FFlagEnableUnifiedProductPurchaseFlow and p30.props.isUserEligibleForUnifiedPurchaseFlow then
			local productPrice = p30.props.productPrice
			local v141 = not not FFlagEnableUnifiedPurchaseFlowForDevSubs and (requestType == RequestType.DeveloperSubscription and (productInfo.displayPrice ~= nil and productPrice == 0))

			local function v142() -- line: 689
				-- upvalues: p30 (copy), PromptState (copy), WindowState (copy), PurchaseClientSessionIdType (copy), RobloxSubscriptionPurchaseApp (copy), RobloxSubscriptionFlowCompleteReason (copy), FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal (copy), SurfaceName (copy), AppContext (copy), SurfaceContext (copy)
				p30.props.setPromptState(PromptState.BlackbirdUpsellInProgress)
				p30.props.setWindowState(WindowState.Suspended)

				local purchaseFlowUUID = p30.props.purchaseFlowUUID
				local v179 = if not purchaseFlowUUID or purchaseFlowUUID == "" then nil else purchaseFlowUUID
				local v180 = if not v179 then nil else {
					clientSessionIdType = PurchaseClientSessionIdType.PurchaseFlowUUID,
					clientSessionId = v179
				}

				RobloxSubscriptionPurchaseApp.initiateRobloxSubscriptionPurchase({
					showBackButton = true
				}, {
					onFlowComplete = function(p31) --[[ onFlowComplete ]] -- line: 708
						-- upvalues: RobloxSubscriptionFlowCompleteReason (copy), FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal (copy), p30 (copy)
						if p31 == RobloxSubscriptionFlowCompleteReason.UpsellPurchaseSucceeded then
							if FFlagAddOnRobloxSubscriptionUpsellSuccessCallbackToUnifiedPurchaseModal and p30.props.purchaseCallbacks and p30.props.purchaseCallbacks.onRobloxSubscriptionUpsellSuccess then
								p30.props.purchaseCallbacks.onRobloxSubscriptionUpsellSuccess()
							end

							p30.props.retryPurchaseAfterUpsell()

							return
						end

						if p31 == RobloxSubscriptionFlowCompleteReason.UpsellDismissed then
							p30.props.completeRequest()

							return
						end

						if p31 == RobloxSubscriptionFlowCompleteReason.UpsellPurchaseFailed then
							p30.props.completeRequest()

							return
						end

						p30.props.completeRequest()
					end,
					onBackButtonActivated = function() --[[ onBackButtonActivated ]] -- line: 730
						-- upvalues: p30 (copy), PromptState (copy), WindowState (copy)
						p30.props.setPromptState(PromptState.PromptPurchase)
						p30.props.setWindowState(WindowState.Shown)
					end
				}, nil, SurfaceName.UnifiedProductPurchaseModal, if AppContext.get() ~= AppContext.Enum.IN_APP then SurfaceContext.InGame else SurfaceContext.InApp, nil, if not v180 then nil else {
					clientSessionId = v180
				})
			end

			local v143 = nil

			if FFlagEnableDiscountInfoInUnifiedPurchaseModal then
				v143 = if not v141 then p30.props.price else nil
			end

			local v144 = nil

			if FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then
				v144 = shouldShowBlackbirdUpsell(v143, p30.props.requestType, v141, if not FFlagBlackbirdUpsellGateResaleAndTimedOption then nil else p30.props.productPayload)
			end

			local v145 = if not FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal or (not v144 or not p30.props.robloxSubscriptionProducts) then nil else getBlackbirdUpsellBannerProductInfo(p30.props.robloxSubscriptionProducts)
			local v146 = if not FFlagEnableSubscriptionUpsellUnifiedPurchaseEventTelemetry and not FFlagEnableBlackbirdUpsellImpressionGating then p30.onBuyItemButtonMounted else function(p32) -- line: 768
				-- upvalues: p30 (copy), FFlagEnableSubscriptionUpsellUnifiedPurchaseEventTelemetry (copy), v145 (copy), UnifiedPurchaseEventNameEnum (copy), FFlagEnableBlackbirdUpsellImpressionGating (copy), BlackbirdUpsellImpressionTracker (copy)
				p30.onBuyItemButtonMounted(p32)

				if FFlagEnableSubscriptionUpsellUnifiedPurchaseEventTelemetry and v145 then
					p30.emitUnifiedProductPurchaseFlowEvent(UnifiedPurchaseEventNameEnum.SubscriptionUpsellBannerShown)
				end

				if FFlagEnableBlackbirdUpsellImpressionGating and v145 then
					BlackbirdUpsellImpressionTracker.incrementImpressionCount()
				end
			end

			if FFlagAddCenterDialogForUnifiedPurchaseModal and AppContext.get() == AppContext.Enum.IN_APP then
				return Roact.createElement(UnifiedProductPurchaseModalV2, {
					product = {
						itemIcon = productInfo.imageUrl,
						itemName = productInfo.name,
						itemRobuxCost = if not v141 then p30.props.productPrice else nil,
						itemDisplayPrice = if not v141 then nil else productInfo.displayPrice,
						itemPrice = if not FFlagEnableDiscountInfoInUnifiedPurchaseModal then nil else v143,
						model = p30.props.humanoidModel
					},
					subtitleView = if not FFlagPurchasePromptSubtitleForTimedOptions then nil else p30.props.subtitleView,
					buttons = {
						buyItemActivated = p30.confirmButtonPressed,
						buyItemEnableInputDelayed = p30.isWindowShowAndDoneAnimating() and if not FFlagEnableDelayedInputForUnifiedPurchaseModalInExperience then AppContext.get() == AppContext.Enum.IN_EXPERIENCE else p30.buyButtonUsesFoundationInputDelay,
						cancelActivated = p30.cancelButtonPressed,
						isDisabled = promptState == PromptState.PurchaseInProgress
					},
					postPurchaseActions = p30.props.postPurchaseActions,
					setPostPurchaseActions = p30.props.setPostPurchaseActions,
					onBuyItemButtonMounted = v146,
					purchaseModalType = getUnifiedPurchaseModalType(p30.props.requestType),
					robuxBalanceAmount = accountInfo.balance,
					isTestPurchase = if not FFlagAddUnifiedTestPurchaseDisclaimer then nil else isTestPurchase,
					isLoading = if not FFlagUnifiedPurchaseAddSkeleton then nil else promptState == PromptState.InitializingPurchase,
					onBlackbirdUpsellActivated = if not FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then nil else v142,
					BlackbirdUpsellBannerProductInfo = v145
				})
			end

			return Roact.createElement(UnifiedProductPurchaseModal, {
				product = {
					itemIcon = productInfo.imageUrl,
					itemName = productInfo.name,
					itemRobuxCost = if not v141 then if not FFlagPurchasePromptPriceShouldUseProductInfoPrice then getPlayerPrice(productInfo, accountInfo.membershipType == 4, expectedPrice) else p30.props.productPrice else nil,
					itemDisplayPrice = if not v141 then nil else productInfo.displayPrice,
					itemPrice = if not FFlagEnableDiscountInfoInUnifiedPurchaseModal then nil else v143,
					model = p30.props.humanoidModel
				},
				buttons = {
					buyItemActivated = p30.confirmButtonPressed,
					buyItemEnableInputDelayed = p30.isWindowShowAndDoneAnimating() and AppContext.get() == AppContext.Enum.IN_EXPERIENCE,
					cancelActivated = p30.cancelButtonPressed,
					isDisabled = promptState == PromptState.PurchaseInProgress
				},
				postPurchaseActions = p30.props.postPurchaseActions,
				setPostPurchaseActions = p30.props.setPostPurchaseActions,
				onBuyItemButtonMounted = v146,
				purchaseModalType = getUnifiedPurchaseModalType(p30.props.requestType),
				robuxBalanceAmount = accountInfo.balance,
				isTestPurchase = if not FFlagAddUnifiedTestPurchaseDisclaimer then nil else isTestPurchase,
				onBlackbirdUpsellActivated = if not FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then nil else v142,
				BlackbirdUpsellBannerProductInfo = v145,
				hideUserRobuxBalance = v141 or if not FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then nil else p30.props.purchaseAnalyticsMetadata and p30.props.purchaseAnalyticsMetadata.surface == ProductPurchaseSurface.Catalog
			})
		end

		if DesktopUpsellExperiment.shouldShowNewModal() then
			return Roact.createElement(ProductPurchaseModal, {
				screenSize = p30.state.screenSize,
				product = {
					itemIcon = productInfo.imageUrl,
					itemName = productInfo.name,
					itemRobuxCost = if not FFlagPurchasePromptPriceShouldUseProductInfoPrice then getPlayerPrice(productInfo, accountInfo.membershipType == 4, expectedPrice) else p30.props.productPrice
				},
				balanceAmount = accountInfo.balance,
				balanceAmountValid = game:DefineFastFlag("BalanceNotShowingInExperimentIssueFix", false) and not accountInfo.hasFailed,
				buttons = {
					isDisabled = promptState == PromptState.PurchaseInProgress,
					buyItemActivated = p30.confirmButtonPressed,
					buyItemControllerIcon = if not p30.props.isGamepadEnabled then nil else "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png",
					buyItemIsDelayedInput = p30.hasDelayedInput(),
					buyItemEnableInputDelayed = p30.isWindowShowAndDoneAnimating(),
					cancelActivated = p30.cancelButtonPressed
				}
			})
		end

		return Roact.createElement(ProductPurchase, {
			screenSize = p30.state.screenSize,
			isDisabled = promptState == PromptState.PurchaseInProgress,
			model = p30.props.humanoidModel,
			itemIcon = productInfo.imageUrl,
			itemName = productInfo.name,
			itemRobuxCost = if not FFlagPurchasePromptPriceShouldUseProductInfoPrice then getPlayerPrice(productInfo, accountInfo.membershipType == 4, expectedPrice) else p30.props.productPrice,
			currentBalance = accountInfo.balance,
			currentBalanceValid = not accountInfo.hasFailed,
			testPurchase = isTestPurchase,
			isDelayedInput = p30.hasDelayedInput(),
			enableInputDelayed = p30.isWindowShowAndDoneAnimating(),
			buyItemControllerIcon = if not p30.props.isGamepadEnabled then nil else "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png",
			cancelControllerIcon = if not p30.props.isGamepadEnabled then nil else "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png",
			buyItemActivated = p30.confirmButtonPressed,
			cancelPurchaseActivated = p30.cancelButtonPressed,
			isLuobu = p30.state.isLuobu
		})
	end

	if promptState == PromptState.RobuxUpsell or promptState == PromptState.UpsellInProgress then
		if DesktopUpsellExperiment.shouldShowNewModal() then
			return Roact.createElement(RobuxUpsellModal, {
				screenSize = p30.state.screenSize,
				product = {
					model = p30.props.humanoidModel,
					itemIcon = productInfo.imageUrl,
					itemName = productInfo.name,
					itemRobuxCost = if not FFlagPurchasePromptPriceShouldUseProductInfoPrice then getPlayerPrice(productInfo, accountInfo.membershipType == 4, expectedPrice) else p30.props.productPrice
				},
				upsell = {
					balanceAmount = accountInfo.balance,
					robuxPurchaseAmount = p30.props.robuxPurchaseAmount,
					robuxPurchaseAmountBeforeBonus = p30.props.robuxAmountBeforeBonus,
					robuxPurchaseCost = p30.props.robuxPurchaseCost
				},
				buttons = {
					buyItemActivated = function() --[[ buyItemActivated ]] -- line: 930
						-- upvalues: p30 (copy)
						p30.confirmButtonPressed()
						p30.emitPurchaseFlowEvent("UserInput", "Buy")
					end,
					buyItemDisabled = promptState == PromptState.UpsellInProgress,
					buyItemControllerIcon = if not p30.props.isGamepadEnabled then nil else "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png",
					buyItemisDelayedInput = p30.hasDelayedInput(),
					buyItemEnableInputDelayed = p30.isWindowShowAndDoneAnimating(),
					cancelPurchaseActivated = function() --[[ cancelPurchaseActivated ]] -- line: 939
						-- upvalues: p30 (copy)
						p30.cancelButtonPressed()
						p30.emitPurchaseFlowEvent("UserInput", "Cancel")
					end,
					cancelControllerIcon = if not p30.props.isGamepadEnabled then nil else "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png",
					opensBuyRobuxPage = DesktopUpsellExperiment.getVariant() == DesktopUpsellExperiment.variants.OpenRobuxStore
				}
			})
		end

		return Roact.createElement(ProductPurchaseRobuxUpsell, {
			screenSize = p30.state.screenSize,
			isDisabled = promptState == PromptState.UpsellInProgress,
			model = p30.props.humanoidModel,
			itemIcon = productInfo.imageUrl,
			itemName = productInfo.name,
			itemRobuxCost = if not FFlagPurchasePromptPriceShouldUseProductInfoPrice then getPlayerPrice(productInfo, accountInfo.membershipType == 4, expectedPrice) else p30.props.productPrice,
			robuxPurchaseAmount = p30.props.robuxPurchaseAmount,
			robuxPurchaseAmountBeforeBonus = p30.props.robuxAmountBeforeBonus,
			balanceAmount = accountInfo.balance,
			isDelayedInput = p30.hasDelayedInput(),
			enableInputDelayed = p30.isWindowShowAndDoneAnimating(),
			buyItemControllerIcon = if not p30.props.isGamepadEnabled then nil else "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png",
			cancelControllerIcon = if not p30.props.isGamepadEnabled then nil else "rbxasset://textures/ui/Controls/DesignSystem/ButtonB.png",
			buyItemActivated = function() --[[ buyItemActivated ]] -- line: 969
				-- upvalues: p30 (copy)
				p30.confirmButtonPressed()
				p30.emitPurchaseFlowEvent("UserInput", "Buy")
			end,
			cancelPurchaseActivated = function() --[[ cancelPurchaseActivated ]] -- line: 973
				-- upvalues: p30 (copy)
				p30.cancelButtonPressed()
				p30.emitPurchaseFlowEvent("UserInput", "Cancel")
			end,
			isLuobu = p30.state.isLuobu,
			isVng = GetFFlagOpenVngTosForVngRobuxUpsell() and getAppFeaturePolicies().getShowVNGTosForRobuxUpsell()
		})
	end

	if promptState == PromptState.LeaveRobloxWarning then
		return Roact.createElement(LeaveRobloxAlert, {
			screenSize = p30.state.screenSize,
			cancelActivated = p30.cancelButtonPressed,
			continueActivated = p30.confirmButtonPressed
		})
	end

	if promptState == PromptState.PurchaseComplete and requestType == RequestType.AvatarCreationFee then
		return Roact.createElement(InteractiveAlert, {
			bodyText = RobloxTranslator:FormatByKey("CoreScripts.PublishAvatarPrompt.PurchaseCompleteDescription"),
			buttonStackInfo = {
				buttons = {{
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = p30.confirmButtonPressed,
						text = RobloxTranslator:FormatByKey("CoreScripts.PublishAssetPrompt.ResultModalOk"),
						inputIcon = if not p30.props.isGamepadEnabled then nil else "rbxasset://textures/ui/Controls/DesignSystem/ButtonA.png"
					}
				}}
			},
			screenSize = p30.state.screenSize,
			title = RobloxTranslator:FormatByKey("CoreScripts.BulkPurchasePrompt.CompletedPrompt.SuccessHeading")
		})
	end

	if promptState == PromptState.Error and purchaseError == PurchaseError.TwoFactorNeededSettings or isGenericChallengeResponse(purchaseError) then
		return React.createElement(ProductPurchasePrompt, {
			screenSize = p30.state.screenSize,
			titleIcon = Images["icons/status/error_large"],
			promptState = promptState,
			productInfo = productInfo,
			purchaseError = purchaseError,
			economicRestrictionError = p30.props.economicRestrictionError or {},
			isGamepadEnabled = p30.props.isGamepadEnabled,
			cancelButtonPressed = p30.cancelButtonPressed,
			confirmButtonPressed = p30.confirmButtonPressed,
			includeCancelButton = true,
			isGenericChallengeResponse = isGenericChallengeResponse,
			useUnifiedPurchaseCompletionModal = if not FFlagEnableUnifiedProductPurchaseFlow then nil else p30.props.isUserEligibleForUnifiedPurchaseFlow
		})
	end

	if promptState == PromptState.EnablePurchaseVPCModal then
		return Roact.createElement(Animator, {
			shouldAnimate = true,
			shouldShow = promptState == PromptState.EnablePurchaseVPCModal,
			renderChildren = function() --[[ renderChildren ]] -- line: 1029
				-- upvalues: Roact (copy), VerifiedParentalConsentDialog (copy), p30 (copy), promptState (copy)
				return Roact.createElement(VerifiedParentalConsentDialog, {
					screenSize = p30.state.screenSize,
					isActionable = false,
					modalType = p30.getVPCModalType(promptState),
					onDismiss = function() --[[ onDismiss ]] -- line: 1034
						-- upvalues: p30 (copy)
						p30.confirmButtonPressed()
					end
				})
			end
		})
	end

	if promptState == PromptState.Error and purchaseError == PurchaseError.NotEnoughRobuxXbox and DesktopUpsellExperiment.shouldShowNewModal() then
		return Roact.createElement(RobuxUpsellModalTooExpensiveFallback, {
			screenSize = p30.state.screenSize,
			product = {
				itemIcon = productInfo.imageUrl,
				itemName = productInfo.name,
				itemRobuxCost = if not FFlagPurchasePromptPriceShouldUseProductInfoPrice then getPlayerPrice(productInfo, accountInfo.membershipType == 4, expectedPrice) else p30.props.productPrice
			},
			balanceAmount = accountInfo.balance,
			doneActivated = function() --[[ doneActivated ]] -- line: 1057
				-- upvalues: p30 (copy)
				p30.cancelButtonPressed()
				p30.emitPurchaseFlowEvent("UserInput", "Cancel")
			end
		})
	end

	return React.createElement(ProductPurchasePrompt, {
		screenSize = p30.state.screenSize,
		promptState = promptState,
		productInfo = productInfo,
		purchaseError = purchaseError,
		economicRestrictionError = p30.props.economicRestrictionError or {},
		isGamepadEnabled = p30.props.isGamepadEnabled,
		cancelButtonPressed = p30.cancelButtonPressed,
		confirmButtonPressed = p30.confirmButtonPressed,
		includeCancelButton = false,
		isGenericChallengeResponse = isGenericChallengeResponse,
		useUnifiedPurchaseCompletionModal = if not FFlagEnableUnifiedProductPurchaseFlow then nil else p30.props.isUserEligibleForUnifiedPurchaseFlow,
		isMultiItem = getUnifiedPurchaseModalType(p30.props.requestType) == UnifiedPurchaseModalTypeEnum.MultiItem,
		timedOptionDays = if not FFlagPurchasePromptSubtitleForTimedOptions then nil else p30.props.timedOptionDays,
		completionMessage = if not FFlagPurchaseModalTimedOptionExtension then nil else p30.props.completionMessage
	})
end
function v83.render(p33) -- line: 1085
	-- upvalues: Roact (copy), Animator2 (copy), FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (copy), WindowState (copy), RequestType (copy), PromptState (copy), PublishAssetAnalytics (copy), FFlagEnableUnifiedProductPurchaseFlow (copy), ExternalEventConnection (copy), GuiService (copy), CoreGui (copy)
	local promptState = p33.props.promptState
	local v149 = p33:determinePrompt()

	return Roact.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		[Roact.Change.AbsoluteSize] = p33.changeScreenSize,
		BackgroundTransparency = 1
	}, {
		Animator = Roact.createElement(Animator2, {
			shouldShow = if not FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then p33.props.windowState ~= WindowState.Hidden else p33.props.windowState == WindowState.Shown,
			onShown = function() --[[ onShown ]] -- line: 1098
				-- upvalues: p33 (copy), RequestType (copy), promptState (copy), PromptState (copy), PublishAssetAnalytics (copy)
				if p33.props.requestType == RequestType.AvatarCreationFee and promptState == PromptState.PromptPurchase then
					PublishAssetAnalytics.sendPageLoad(PublishAssetAnalytics.Section.BuyItemModal)
				end

				p33:setState({
					isAnimating = false,
					doneAnimatingTime = os.clock()
				})
			end,
			onHidden = function() --[[ onHidden ]] -- line: 1110
				-- upvalues: p33 (copy)
				p33:setState({
					isAnimating = nil,
					doneAnimatingTime = nil
				})
			end,
			skipAnimation = if not FFlagEnableUnifiedProductPurchaseFlow then nil else p33.props.isUserEligibleForUnifiedPurchaseFlow,
			[Roact.Ref] = p33.animatorRef
		}, {
			Prompt = v149,
			ModalFix = v149 ~= nil and Roact.createElement("ImageButton", {
				BackgroundTransparency = 0,
				Modal = true,
				Size = UDim2.new(0, 0, 0, 0)
			}) or nil
		}),
		OnCoreGuiMenuOpened = Roact.createElement(ExternalEventConnection, {
			event = GuiService.MenuOpened,
			callback = function() --[[ callback ]] -- line: 1131
				-- upvalues: p33 (copy)
				if p33.props.hideWindow then
					p33.props.hideWindow()
				end
			end
		}),
		OnUserGuiRenderingChanged = Roact.createElement(ExternalEventConnection, {
			event = CoreGui.UserGuiRenderingChanged,
			callback = function(p34, p35) --[[ callback ]] -- line: 1139
				-- upvalues: p33 (copy)
				if not p34 or not p35 then
					p33.props.hideWindow()
				end
			end
		})
	})
end

return (connectToStore(function(p36) --[[ mapStateToProps ]] -- line: 1149
	-- upvalues: isMockingPurchases (copy), SelectedRobuxPackage (copy), FFlagEnableUnifiedProductPurchaseFlow (copy), FFlagPurchasePromptPriceShouldUseProductInfoPrice (copy), selectProductPrice (copy), v65 (copy), FFlagPurchasePromptSubtitleForTimedOptions (copy), FFlagPurchaseModalTimedOptionExtension (copy), FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (copy), FFlagBlackbirdUpsellGateResaleAndTimedOption (copy)
	local v151 = isMockingPurchases(p36.promptRequest.requestType)
	local v152 = if not p36.abVariations then nil else p36.abVariations.DesktopUpsellExpVariant

	return {
		purchaseFlowUUID = p36.purchaseFlowUUID,
		purchaseFlow = p36.purchaseFlow,
		promptState = p36.promptState,
		requestType = p36.promptRequest.requestType,
		humanoidModel = p36.promptRequest.humanoidModel,
		expectedPrice = p36.promptRequest.expectedPrice,
		windowState = p36.windowState,
		purchaseError = p36.purchaseError,
		economicRestrictionError = p36.economicRestrictionError,
		productInfo = p36.productInfo,
		accountInfo = p36.accountInfo,
		robuxPurchaseAmount = SelectedRobuxPackage.getRobuxPurchaseAmount(p36),
		robuxAmountBeforeBonus = SelectedRobuxPackage.getRobuxAmountBeforeBonus(p36),
		robuxPurchaseCost = SelectedRobuxPackage.getPrice(p36),
		isTestPurchase = v151,
		isGamepadEnabled = p36.gamepadEnabled,
		desktopUpsellExpVariant = v152,
		postPurchaseActions = if not FFlagEnableUnifiedProductPurchaseFlow then nil else p36.postPurchaseActions,
		purchaseCallbacks = if not FFlagEnableUnifiedProductPurchaseFlow then nil else p36.purchaseCallbacks,
		isUserEligibleForUnifiedPurchaseFlow = if not FFlagEnableUnifiedProductPurchaseFlow then nil else p36.isUserEligibleForUnifiedPurchaseFlow,
		purchaseAnalyticsMetadata = if not FFlagEnableUnifiedProductPurchaseFlow then nil else p36.purchaseAnalyticsMetadata,
		productPrice = if not FFlagPurchasePromptPriceShouldUseProductInfoPrice then nil else selectProductPrice(p36),
		price = if not v65 then nil else v65(p36),
		timedOptionDays = if not FFlagPurchasePromptSubtitleForTimedOptions or not p36.productPayload then nil else p36.productPayload.timedOptionDays,
		completionMessage = if not FFlagPurchaseModalTimedOptionExtension or not p36.purchaseOptions then nil else p36.purchaseOptions.completionMessage,
		robloxSubscriptionProducts = if not FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then nil else p36.robloxSubscriptionProducts,
		productPayload = if not FFlagBlackbirdUpsellGateResaleAndTimedOption then nil else p36.productPayload
	}
end, function(p37) --[[ mapDispatchToProps ]] -- line: 1195
	-- upvalues: SetPurchaseFlowUUID (copy), purchaseItem (copy), completePurchase (copy), launchRobuxUpsell (copy), openSecuritySettings (copy), initiateUserPurchaseSettingsPrecheck (copy), hideWindow (copy), retryPurchaseAfterUpsell (copy), SetWindowState (copy), FFlagAddCursorProviderToPurchasePromptApp (copy), GuiService (copy), completeRequest (copy), sendEvent (copy), SetPostPurchaseActions (copy), SetPromptState (copy)
	return {
		setPurchaseFlowUUID = function(p38) --[[ setPurchaseFlowUUID ]] -- line: 1197
			-- upvalues: p37 (copy), SetPurchaseFlowUUID (copy)
			p37(SetPurchaseFlowUUID(p38))
		end,
		onBuy = function() --[[ onBuy ]] -- line: 1200
			-- upvalues: p37 (copy), purchaseItem (copy)
			p37(purchaseItem())
		end,
		completePurchase = function() --[[ completePurchase ]] -- line: 1203
			-- upvalues: p37 (copy), completePurchase (copy)
			p37(completePurchase())
		end,
		onScaryModalConfirm = function() --[[ onScaryModalConfirm ]] -- line: 1206
			-- upvalues: p37 (copy), launchRobuxUpsell (copy)
			p37(launchRobuxUpsell())
		end,
		onOpenSecuritySettings = function(s1: string?) --[[ onOpenSecuritySettings ]] -- line: 1209
			-- upvalues: p37 (copy), openSecuritySettings (copy)
			if s1 then
				p37(openSecuritySettings(s1))

				return
			end

			p37(openSecuritySettings())
		end,
		onRobuxUpsell = function() --[[ onRobuxUpsell ]] -- line: 1216
			-- upvalues: p37 (copy), initiateUserPurchaseSettingsPrecheck (copy)
			p37(initiateUserPurchaseSettingsPrecheck())
		end,
		hideWindow = function() --[[ hideWindow ]] -- line: 1219
			-- upvalues: p37 (copy), hideWindow (copy)
			p37(hideWindow())
		end,
		retryPurchaseAfterUpsell = function() --[[ retryPurchaseAfterUpsell ]] -- line: 1222
			-- upvalues: p37 (copy), retryPurchaseAfterUpsell (copy)
			p37(retryPurchaseAfterUpsell())
		end,
		setWindowState = function(p39) --[[ setWindowState ]] -- line: 1225
			-- upvalues: p37 (copy), SetWindowState (copy)
			p37(SetWindowState(p39))
		end,
		completeRequest = function() --[[ completeRequest ]] -- line: 1228
			-- upvalues: FFlagAddCursorProviderToPurchasePromptApp (copy), GuiService (copy), p37 (copy), completeRequest (copy)
			if FFlagAddCursorProviderToPurchasePromptApp then
				GuiService.SelectedCoreObject = nil
			end

			p37(completeRequest())
		end,
		onAnalyticEvent = function(p40, p41) --[[ onAnalyticEvent ]] -- line: 1234
			-- upvalues: p37 (copy), sendEvent (copy)
			p37(sendEvent(p40, p41))
		end,
		setPostPurchaseActions = function(p42) --[[ setPostPurchaseActions ]] -- line: 1237
			-- upvalues: p37 (copy), SetPostPurchaseActions (copy)
			p37(SetPostPurchaseActions(p42))
		end,
		setPromptState = function(p43) --[[ setPromptState ]] -- line: 1240
			-- upvalues: p37 (copy), SetPromptState (copy)
			p37(SetPromptState(p43))
		end
	}
end)(v83))

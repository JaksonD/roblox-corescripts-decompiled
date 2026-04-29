local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local React = require(CorePackages.Packages.React)
local RoactUtils = require(CorePackages.Workspace.Packages.RoactUtils)
local useDispatch = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local useLocalization = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local useScreenSize = require(CorePackages.Workspace.Packages.RobloxAppHooks).useScreenSize
local useLocalUserId = require(CorePackages.Workspace.Packages.RobloxAppHooks).useLocalUserId
local useSelector = RoactUtils.Hooks.RoactRodux.useSelector
local useRoactService = require(Modules.LuaApp.Hooks.useRoactService)
local RoactNetworking = require(Modules.LuaApp.Services.RoactNetworking)
local PostReportSubscription = require(Modules.LuaApp.Http.Requests.EconomyAPI.PostReportSubscription)
local GenericAbuseReporting = require(CorePackages.Workspace.Packages.GenericAbuseReporting)
local AbuseVector = GenericAbuseReporting.Enums.AbuseVector
local OpenDynamicAbuseReport = GenericAbuseReporting.Thunks.OpenDynamicAbuseReport
local CloseCentralOverlay = require(CorePackages.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay
local FFlagEnableReportingFlowForDevSubs = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableReportingFlowForDevSubs
local SetCurrentToastMessage = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local ToastType = require(Modules.LuaApp.Enum.ToastType)
local default = require(CorePackages.Workspace.Packages.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default
local UrlBuilder = require(CorePackages.Packages.UrlBuilder)
local UrlBuilder2 = UrlBuilder.UrlBuilder
local UrlBase = UrlBuilder.UrlBase
local HttpRequest = require(CorePackages.Packages.HttpRequest)
local IAPExperience = require(CorePackages.Workspace.Packages.IAPExperience)
local SubscriptionPurchaseFlow = IAPExperience.PurchaseFlow.SubscriptionPurchaseFlow
local SubscriptionPurchaseFlowState = IAPExperience.PurchaseFlow.SubscriptionPurchaseFlowState
local PurchaseErrorType = IAPExperience.PurchaseFlow.PurchaseErrorType
local VPCModalType = require(Modules.LuaApp.Components.BuyRobux.Enum.VPCModalType)
local NativePurchaseProductTypeEnum = require(Modules.LuaApp.Enum.NativePurchaseProductTypeEnum)
local NativePurchaseStatus = require(Modules.LuaApp.Enum.NativePurchaseStatus)
local SetNativePurchaseResult = require(Modules.LuaApp.Actions.SetNativePurchaseResult)
local ClearNativePurchaseResult = require(Modules.LuaApp.Actions.ClearNativePurchaseResult)
local PaymentPlatform = require(Modules.LuaApp.Enum.PaymentPlatform)
local getPaymentPlatform = require(Modules.LuaApp.Util.getPaymentPlatform)

require(Modules.LuaApp.Models.SubscriptionApi.SubscriptionProductInfoModel)

local GetFFlagEnableVpcForInAppSubscriptionPurchase = require(Modules.LuaApp.Flags.GetFFlagEnableVpcForInAppSubscriptionPurchase)
local isErrorReasonPrefixWithEconomicRestrictions = IAPExperience.Utility.isErrorReasonPrefixWithEconomicRestrictions
local parseErrorReasonToEconomicRestriction = IAPExperience.Utility.parseErrorReasonToEconomicRestriction

local function parseSubscriptionError(p1) -- line: 74
	-- upvalues: PurchaseErrorType (copy)
	if p1 == "UserHasSpendLimitSet" then
		return PurchaseErrorType.SubscriptionExceededUserSpendLimit
	end

	if p1 == "UnsupportedLocale" then
		return PurchaseErrorType.SubscriptionUnsupportedLocale
	end

	if p1 == "RestrictedUser" then
		return PurchaseErrorType.RestrictedUser
	end

	if p1 == "PurchasePlatformNotSupported" then
		return PurchaseErrorType.SubscriptionPurchasePlatformNotSupported
	end

	if p1 == "InvalidSaleLocation" then
		return PurchaseErrorType.SubscriptionInvalidSaleLocation
	end

	if p1 == "UserAlreadySubscribed" then
		return PurchaseErrorType.AlreadySubscribed
	end

	if p1 == "ProductNotForSale" then
		return PurchaseErrorType.SubscriptionNotForSale
	end

	if p1 == "VpcRequired" then
		return PurchaseErrorType.VpcRequired
	end

	if p1 == "ExceedParentalSpendLimit" then
		return PurchaseErrorType.ExceedParentalSpendLimit
	end

	if p1 == "EconomicRestriction" then
		return PurchaseErrorType.EconomicRestriction
	end

	return PurchaseErrorType.Unknown
end

function SubscriptionPurchaseOverlay(t1: {[any]: any}) -- line: 118
	-- upvalues: React (copy), SubscriptionPurchaseFlowState (copy), PurchaseErrorType (copy), useDispatch (copy), useLocalization (copy), useScreenSize (copy), useLocalUserId (copy), useRoactService (copy), RoactNetworking (copy), useSelector (copy), NativePurchaseStatus (copy), ClearNativePurchaseResult (copy), FFlagEnableReportingFlowForDevSubs (copy), OpenDynamicAbuseReport (copy), AbuseVector (copy), CloseCentralOverlay (copy), PostReportSubscription (copy), SetCurrentToastMessage (copy), ToastType (copy), UrlBuilder2 (copy), UrlBase (copy), HttpService (copy), HttpRequest (copy), default (copy), isErrorReasonPrefixWithEconomicRestrictions (copy), parseErrorReasonToEconomicRestriction (copy), parseSubscriptionError (copy), SetNativePurchaseResult (copy), NativePurchaseProductTypeEnum (copy), GetFFlagEnableVpcForInAppSubscriptionPurchase (copy), SubscriptionPurchaseFlow (copy), VPCModalType (copy), getPaymentPlatform (copy), PaymentPlatform (copy)
	local endPurchase = t1.endPurchase
	local v46, v47 = React.useState(SubscriptionPurchaseFlowState.PurchaseModal)
	local v48, v49 = React.useState(PurchaseErrorType.None)
	local v50, v51 = React.useState({})
	local v52 = useDispatch()
	local v53 = useLocalization({
		subscribed = "Feature.Subscription.Text.Subscribed",
		perMonth = "Feature.Subscription.Text.PerMonth",
		disclaimerText = "Feature.Subscription.Text.DisclaimerTextMonthly",
		reportSubscriptionSubmitted = "Feature.Subscription.Message.ReportSubmitted",
		somethingIsWrong = "Feature.Toast.NetworkingError.SomethingIsWrong"
	})
	local v54 = useScreenSize()
	local v55 = useLocalUserId()
	local v56 = useRoactService(RoactNetworking)
	local subscriptionTargetKey = t1.subscriptionPurchaseProductInfo.subscriptionTargetKey
	local v58 = useSelector(function(p2) -- line: 138
		return p2.NativePurchase
	end)

	React.useEffect(function() -- line: 142
		-- upvalues: v58 (copy), NativePurchaseStatus (copy), v47 (copy), SubscriptionPurchaseFlowState (copy), t1 (copy), v49 (copy), PurchaseErrorType (copy)
		if v58 == nil or v58.purchaseStatus == nil then
			return
		end

		local purchaseStatus = v58.purchaseStatus

		if purchaseStatus == NativePurchaseStatus.Pending then
			v47(SubscriptionPurchaseFlowState.None)

			return
		end

		if purchaseStatus == NativePurchaseStatus.Success then
			t1.onPurchaseSuccess()

			return
		end

		if purchaseStatus == NativePurchaseStatus.Failed then
			v47(SubscriptionPurchaseFlowState.Error)
			v49(PurchaseErrorType.Unknown)
		end
	end, {
		v58,
		t1.onPurchaseSuccess
	})

	local v59 = useDispatch()

	React.useEffect(function() -- line: 111
		-- upvalues: v59 (copy), ClearNativePurchaseResult (copy)
		return function() -- line: 112
			-- upvalues: v59 (copy), ClearNativePurchaseResult (copy)
			v59(ClearNativePurchaseResult())
		end
	end, {})

	local v60 = React.useCallback(function() -- line: 160
		-- upvalues: FFlagEnableReportingFlowForDevSubs (copy), v52 (copy), OpenDynamicAbuseReport (copy), AbuseVector (copy), subscriptionTargetKey (copy), t1 (copy), CloseCentralOverlay (copy), PostReportSubscription (copy), v56 (copy), v55 (copy), SetCurrentToastMessage (copy), v53 (copy), ToastType (copy)
		if FFlagEnableReportingFlowForDevSubs then
			v52(OpenDynamicAbuseReport({
				abuseVector = AbuseVector.Subscription,
				targetId = {
					subscriptionTargetKey = subscriptionTargetKey,
					imageAssetId = tostring(t1.subscriptionPurchaseProductInfo.iconImageAssetId)
				},
				onClose = function() --[[ onClose ]] -- line: 168
					-- upvalues: v52 (copy), CloseCentralOverlay (copy)
					v52(CloseCentralOverlay())
				end
			}))

			return
		end

		PostReportSubscription(v56, subscriptionTargetKey, v55):andThen(function() -- line: 175
			-- upvalues: v52 (copy), SetCurrentToastMessage (copy), v53 (copy), ToastType (copy)
			v52(SetCurrentToastMessage({
				toastMessage = v53.reportSubscriptionSubmitted,
				isLocalized = true,
				toastType = ToastType.SuccessConfirmation
			}))
		end, function() -- line: 181
			-- upvalues: v52 (copy), SetCurrentToastMessage (copy), v53 (copy), ToastType (copy)
			v52(SetCurrentToastMessage({
				toastMessage = v53.somethingIsWrong,
				isLocalized = true,
				toastType = ToastType.NetworkingError
			}))
		end)
	end, {
		v56,
		subscriptionTargetKey,
		v55,
		v52,
		v53,
		t1.subscriptionPurchaseProductInfo.iconImageAssetId
	})
	local subscriptionProviderId = t1.subscriptionPurchaseProductInfo.subscriptionProviderId
	local v62 = React.useCallback(function() -- line: 201
		-- upvalues: subscriptionProviderId (copy), UrlBuilder2 (copy), UrlBase (copy), HttpService (copy), HttpRequest (copy), default (copy), v52 (copy), SetCurrentToastMessage (copy), v53 (copy), ToastType (copy)
		if not subscriptionProviderId then
			return
		end

		local v69 = UrlBuilder2.new({
			base = UrlBase.APIS,
			path = "sharelinks/v1/get-or-create-link"
		})()
		local json = HttpService:JSONEncode({
			universeId = tostring(subscriptionProviderId)
		})
		local json2 = HttpService:JSONEncode({
			linkType = "ExperienceDetails",
			data = json
		})

		HttpRequest.config({
			requestFunction = HttpRequest.requestFunctions.RequestInternal
		})(v69, "POST", {
			postBody = json2
		}):andThen(function(p3) -- line: 222
			-- upvalues: UrlBuilder2 (copy), default (copy)
			local v75 = p3.responseBody or p3.result

			if v75 and v75.linkId then
				local str = tostring(DateTime.now().UnixTimestampMillis)
				local v77 = UrlBuilder2.sharelinks.shortUrl({
					linkId = v75.linkId,
					type = "ExperienceDetails",
					stamp = str
				})

				if default then
					default:shareUrl({
						url = v77,
						context = "SubscriptionPurchaseShare"
					})
				end
			end
		end):catch(function() -- line: 239
			-- upvalues: v52 (copy), SetCurrentToastMessage (copy), v53 (copy), ToastType (copy)
			v52(SetCurrentToastMessage({
				toastMessage = v53.somethingIsWrong,
				isLocalized = true,
				toastType = ToastType.NetworkingError
			}))
		end)
	end, {
		subscriptionProviderId,
		v52,
		v53
	})
	local createElement = React.createElement
	local v64 = SubscriptionPurchaseFlow
	local t2 = {
		screenSize = v54,
		purchaseState = v46,
		errorType = v48,
		economicRestrictionError = v50,
		purchaseVPCType = if v46 ~= SubscriptionPurchaseFlowState.PurchaseVPCModal then VPCModalType.toRawValue(VPCModalType.None) else VPCModalType.toRawValue(VPCModalType.EnablePurchase),
		shouldUseNewModalDesign = t1.shouldUseNewModalDesign,
		isRobuxSubscription = t1.isRobuxSubscription,
		creatorName = t1.creatorName,
		creatorVerified = t1.creatorVerified,
		subscriptionId = subscriptionTargetKey,
		name = t1.subscriptionPurchaseProductInfo.name,
		subscriptionProviderId = t1.subscriptionPurchaseProductInfo.subscriptionProviderId,
		subscriptionProviderName = t1.subscriptionPurchaseProductInfo.subscriptionProviderName,
		priceTier = t1.subscriptionPurchaseProductInfo.priceTier,
		displayPrice = t1.subscriptionPurchaseProductInfo.displayPrice,
		period = v53.perMonth,
		description = t1.subscriptionPurchaseProductInfo.description,
		disclaimerText = v53.disclaimerText,
		itemIcon = t1.thumbnailString,
		disablePurchase = t1.isSubscribed,
		disablePurchaseText = if not t1.isSubscribed then nil else v53.subscribed,
		purchaseSubscription = function() --[[ purchaseSubscription ]] -- line: 248
			-- upvalues: t1 (copy), subscriptionTargetKey (copy), HttpService (copy), isErrorReasonPrefixWithEconomicRestrictions (copy), v49 (copy), PurchaseErrorType (copy), v47 (copy), SubscriptionPurchaseFlowState (copy), v51 (copy), parseErrorReasonToEconomicRestriction (copy), parseSubscriptionError (copy), v52 (copy), SetNativePurchaseResult (copy), NativePurchaseStatus (copy), NativePurchaseProductTypeEnum (copy), GetFFlagEnableVpcForInAppSubscriptionPurchase (copy)
			if t1.isRobuxSubscription then
				t1.promptSubscriptionPurchase(subscriptionTargetKey, t1.subscriptionPurchaseProductInfo.priceInRobux):andThen(function() -- line: 252
					-- upvalues: t1 (copy)
					t1.onPurchaseSuccess()
				end):catch(function(p4) -- line: 255
					-- upvalues: HttpService (copy), isErrorReasonPrefixWithEconomicRestrictions (copy), v49 (copy), PurchaseErrorType (copy), v47 (copy), SubscriptionPurchaseFlowState (copy), v51 (copy), parseErrorReasonToEconomicRestriction (copy), parseSubscriptionError (copy)
					local v79 = nil

					if type(p4) == "string" then
						v79 = p4
					elseif type(p4) == "table" and p4.Body then
						local ok, result = pcall(function() -- line: 260
							-- upvalues: HttpService (copy), p4 (copy)
							return HttpService:JSONDecode(p4.Body)
						end)

						if ok and result and result.errors and result.errors[1] then
							v79 = result.errors[1].code or result.errors[1].message
						end
					end

					if v79 and isErrorReasonPrefixWithEconomicRestrictions(v79) then
						v49(PurchaseErrorType.EconomicRestriction)
						v47(SubscriptionPurchaseFlowState.Error)
						v51(parseErrorReasonToEconomicRestriction(v79))

						return
					end

					local v82 = parseSubscriptionError(v79)

					v49(v82)
					v47(SubscriptionPurchaseFlowState.Error)
				end)

				return
			end

			v52(SetNativePurchaseResult(subscriptionTargetKey, NativePurchaseStatus.Pending, NativePurchaseProductTypeEnum.Subscription))
			t1.promptSubscriptionPurchase(subscriptionTargetKey):catch(function(p5) -- line: 291
				-- upvalues: isErrorReasonPrefixWithEconomicRestrictions (copy), v49 (copy), PurchaseErrorType (copy), v47 (copy), SubscriptionPurchaseFlowState (copy), v51 (copy), parseErrorReasonToEconomicRestriction (copy), parseSubscriptionError (copy), GetFFlagEnableVpcForInAppSubscriptionPurchase (copy)
				if isErrorReasonPrefixWithEconomicRestrictions(p5) then
					v49(PurchaseErrorType.EconomicRestriction)
					v47(SubscriptionPurchaseFlowState.Error)
					v51(parseErrorReasonToEconomicRestriction(p5))

					return
				end

				local v84 = parseSubscriptionError(p5)

				v49(v84)
				v47(if not GetFFlagEnableVpcForInAppSubscriptionPurchase() or v84 ~= PurchaseErrorType.VpcRequired then SubscriptionPurchaseFlowState.Error else SubscriptionPurchaseFlowState.PurchaseVPCModal)
			end)
		end,
		cancelPurchase = endPurchase,
		flowComplete = endPurchase
	}
	local v66 = getPaymentPlatform()

	t2.openSettingsPage = if not (v66 == PaymentPlatform.Google or (v66 == PaymentPlatform.Apple or (v66 == PaymentPlatform.UWP or v66 == PaymentPlatform.Amazon))) then nil else t1.openSettingsPage
	t2.onReport = if not t1.shouldUseNewModalDesign then nil else v60
	t2.onShare = if not t1.shouldUseNewModalDesign then nil else v62

	function t2.onAnalyticEvent(s1: string, t3: {[any]: any}) -- line: 343
		-- upvalues: t1 (copy)
		t1.onAnalyticEvent("EDPSubscriptionPurchase", s1, t3)
	end

	t2.eventPrefix = "EDP"

	return createElement(v64, t2)
end

return SubscriptionPurchaseOverlay

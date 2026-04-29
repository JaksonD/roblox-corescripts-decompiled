local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local PurchasePromptParent = PurchasePrompt.Parent

require(PurchasePrompt.Actions.SetABVariation)

local ErrorOccurred = require(PurchasePrompt.Actions.ErrorOccurred)
local RequestAssetPurchase = require(PurchasePrompt.Actions.RequestAssetPurchase)
local RequestGamepassPurchase = require(PurchasePrompt.Actions.RequestGamepassPurchase)
local RequestProductPurchase = require(PurchasePrompt.Actions.RequestProductPurchase)
local SetPurchaseFlowUUID = require(PurchasePrompt.Actions.SetPurchaseFlowUUID)
local PurchaseError = require(PurchasePrompt.Enums.PurchaseError)

require(PurchasePrompt.Misc.Constants)

local Network = require(PurchasePrompt.Services.Network)
local deprecated_GetProductInfo = require(PurchasePrompt.Network.deprecated_GetProductInfo)
local getProductInfo = require(PurchasePrompt.Network.getProductInfo)
local getBalanceInfo = require(PurchasePrompt.Network.getBalanceInfo)
local getIsAlreadyOwned = require(PurchasePrompt.Network.getIsAlreadyOwned)
local getAccountInfo = require(PurchasePrompt.Network.getAccountInfo)
local ExternalSettings = require(PurchasePrompt.Services.ExternalSettings)
local hasPendingRequest = require(PurchasePrompt.Utils.hasPendingRequest)
local Promise = require(PurchasePrompt.Promise)
local Thunk = require(PurchasePrompt.Thunk)
local _ = require(PurchasePromptParent.AppCommonLib).Logging
local LoggingProtocol = require(PurchasePromptParent.LoggingProtocol)
local ProductTypeEnum = require(PurchasePrompt.types).ProductTypeEnum
local RequestExperiencePurchase = require(PurchasePrompt.Actions.RequestExperiencePurchase)
local RequestLookPurchase = require(PurchasePrompt.Actions.RequestLookPurchase)
local RequestDeveloperSubscriptionPurchase = require(PurchasePrompt.Actions.RequestDeveloperSubscriptionPurchase)
local FFlagEnableUnifiedProductPurchaseFlow = require(PurchasePrompt.Parent.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow
local FFlagEnableUnifiedPurchaseFlowForDevSubs = require(PurchasePrompt.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local FFlagRemoveAcountInfoFetchFromPurchase = require(PurchasePrompt.Flags.FFlagRemoveAcountInfoFetchFromPurchase)
local SetIsUserEligibleForUnifiedPurchaseFlow = require(PurchasePrompt.Actions.SetIsUserEligibleForUnifiedPurchaseFlow)
local SetPromptState = require(PurchasePrompt.Actions.SetPromptState)
local PromptState = require(PurchasePrompt.Enums.PromptState)
local SetProductPayload = require(PurchasePrompt.Actions.SetProductPayload)
local resolvePromptState = require(script.Parent.resolvePromptState)
local buildProductPayloadFromInitiateArgs = require(PurchasePrompt.Utils.buildProductPayloadFromInitiateArgs)
local FFlagAddFetchProductInfoAsACallback = require(PurchasePrompt.Parent.SharedFlags).FFlagAddFetchProductInfoAsACallback
local GetFFlagEnableCreatorStorePurchasingCutover = require(PurchasePrompt.Flags.GetFFlagEnableCreatorStorePurchasingCutover)
local FFlagEnablePurchaseFlowUUIDMigration = require(PurchasePrompt.Flags.FFlagEnablePurchaseFlowUUIDMigration)
local getUnifiedPurchaseFlowEligibility = require(PurchasePrompt.Network.getUnifiedPurchaseFlowEligibility)
local FFlagFixPurchasingErrorCounter = require(PurchasePrompt.Flags.FFlagFixPurchasingErrorCounter)
local FFlagRefreshPriceOnRetryAfterUpsell = require(PurchasePrompt.Flags.FFlagRefreshPriceOnRetryAfterUpsell)
local v42 = game:DefineFastFlag("RefreshDevSubPriceOnRetryAfterUpsell2", false)
local FFlagRefreshLookPriceOnRetryAfterUpsell = require(PurchasePrompt.Flags.FFlagRefreshLookPriceOnRetryAfterUpsell)
local v44 = if not FFlagRefreshPriceOnRetryAfterUpsell and not FFlagRefreshLookPriceOnRetryAfterUpsell then nil else require(PurchasePrompt.Utils.applyRefreshedPrice)
local FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow = require(PurchasePrompt.Parent.SharedFlags).FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow
local FFlagAddPurchaseOptionForProvidingBalance = require(PurchasePrompt.Parent.SharedFlags).FFlagAddPurchaseOptionForProvidingBalance
local FFlagUnifiedPurchaseAddSkeleton = require(PurchasePrompt.Parent.SharedFlags).FFlagUnifiedPurchaseAddSkeleton
local getRobloxSubscriptionProducts = require(PurchasePromptParent.RobloxSubscriptionPurchaseApp).Network.getRobloxSubscriptionProducts
local FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal = require(PurchasePrompt.Parent.SharedFlags).FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal
local PurchaseFlowUUIDTelemetry = require(PurchasePrompt.Events.PurchaseFlowUUIDTelemetry)
local t1 = {
	Network,
	ExternalSettings
}

return function(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12) --[[ initiatePurchase ]] -- line: 79
	-- upvalues: Thunk (copy), t1 (copy), Network (copy), ExternalSettings (copy), hasPendingRequest (copy), FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (copy), FFlagEnablePurchaseFlowUUIDMigration (copy), HttpService (copy), SetPurchaseFlowUUID (copy), LoggingProtocol (copy), PurchaseFlowUUIDTelemetry (copy), RequestAssetPurchase (copy), RequestGamepassPurchase (copy), RequestProductPurchase (copy), FFlagEnableUnifiedProductPurchaseFlow (copy), ProductTypeEnum (copy), RequestExperiencePurchase (copy), RequestLookPurchase (copy), FFlagEnableUnifiedPurchaseFlowForDevSubs (copy), RequestDeveloperSubscriptionPurchase (copy), ErrorOccurred (copy), PurchaseError (copy), FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (copy), FFlagAddPurchaseOptionForProvidingBalance (copy), FFlagUnifiedPurchaseAddSkeleton (copy), FFlagAddFetchProductInfoAsACallback (copy), SetIsUserEligibleForUnifiedPurchaseFlow (copy), SetPromptState (copy), PromptState (copy), FFlagRefreshPriceOnRetryAfterUpsell (copy), Promise (copy), GetFFlagEnableCreatorStorePurchasingCutover (copy), getProductInfo (copy), deprecated_GetProductInfo (copy), FFlagRemoveAcountInfoFetchFromPurchase (copy), Players (copy), getAccountInfo (copy), getIsAlreadyOwned (copy), getBalanceInfo (copy), getUnifiedPurchaseFlowEligibility (copy), getRobloxSubscriptionProducts (copy), SetProductPayload (copy), buildProductPayloadFromInitiateArgs (copy), FFlagRefreshLookPriceOnRetryAfterUpsell (copy), v42 (copy), v44 (copy), resolvePromptState (copy), FFlagFixPurchasingErrorCounter (copy)
	return Thunk.new(script.Name, t1, function(p13, p14) -- line: 93
		-- upvalues: Network (copy), ExternalSettings (copy), hasPendingRequest (copy), FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (copy), p12 (copy), FFlagEnablePurchaseFlowUUIDMigration (copy), HttpService (copy), SetPurchaseFlowUUID (copy), LoggingProtocol (copy), PurchaseFlowUUIDTelemetry (copy), p2 (copy), RequestAssetPurchase (copy), p1 (copy), p3 (copy), p4 (copy), p5 (copy), p6 (copy), p7 (copy), p8 (copy), p9 (copy), p10 (copy), RequestGamepassPurchase (copy), RequestProductPurchase (copy), FFlagEnableUnifiedProductPurchaseFlow (copy), ProductTypeEnum (copy), RequestExperiencePurchase (copy), RequestLookPurchase (copy), FFlagEnableUnifiedPurchaseFlowForDevSubs (copy), RequestDeveloperSubscriptionPurchase (copy), ErrorOccurred (copy), PurchaseError (copy), FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow (copy), FFlagAddPurchaseOptionForProvidingBalance (copy), FFlagUnifiedPurchaseAddSkeleton (copy), FFlagAddFetchProductInfoAsACallback (copy), p11 (copy), SetIsUserEligibleForUnifiedPurchaseFlow (copy), SetPromptState (copy), PromptState (copy), FFlagRefreshPriceOnRetryAfterUpsell (copy), Promise (copy), GetFFlagEnableCreatorStorePurchasingCutover (copy), getProductInfo (copy), deprecated_GetProductInfo (copy), FFlagRemoveAcountInfoFetchFromPurchase (copy), Players (copy), getAccountInfo (copy), getIsAlreadyOwned (copy), getBalanceInfo (copy), getUnifiedPurchaseFlowEligibility (copy), getRobloxSubscriptionProducts (copy), SetProductPayload (copy), buildProductPayloadFromInitiateArgs (copy), FFlagRefreshLookPriceOnRetryAfterUpsell (copy), v42 (copy), v44 (copy), resolvePromptState (copy), FFlagFixPurchasingErrorCounter (copy)
		local v66 = p14[Network]
		local v67 = p14[ExternalSettings]

		if hasPendingRequest(p13:getState()) and (not FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal or not p12) then
			return nil
		end

		if FFlagEnablePurchaseFlowUUIDMigration then
			local guid = HttpService:GenerateGUID(false)

			p13:dispatch(SetPurchaseFlowUUID(guid))
			LoggingProtocol.default:logRobloxTelemetryCounter(PurchaseFlowUUIDTelemetry.InitiatePurchaseCounter, 1, {
				method = "initiatePurchase"
			})
		end

		if p2 == Enum.InfoType.Asset then
			p13:dispatch(RequestAssetPurchase(p1, p3, p4, p5, p6, p7, p8, p9, p10))
		elseif p2 == Enum.InfoType.GamePass then
			p13:dispatch(RequestGamepassPurchase(p1))
		elseif p2 == Enum.InfoType.Product then
			p13:dispatch(RequestProductPurchase(p1, p3))
		elseif FFlagEnableUnifiedProductPurchaseFlow and p2 == ProductTypeEnum.Experience then
			p13:dispatch(RequestExperiencePurchase(p1))
		elseif FFlagEnableUnifiedProductPurchaseFlow and p2 == ProductTypeEnum.Look then
			p13:dispatch(RequestLookPurchase(p1))
		else
			if not FFlagEnableUnifiedPurchaseFlowForDevSubs or p2 ~= ProductTypeEnum.DeveloperSubscription then
				assert(false, "Invalid product type")

				return nil
			end

			p13:dispatch(RequestDeveloperSubscriptionPurchase(p1, p10))
		end

		if v67.getFlagOrder66() then
			p13:dispatch(ErrorOccurred(PurchaseError.PurchaseDisabled))

			return nil
		end

		local v69 = nil
		local providedRobuxBalance = nil
		local v71 = nil

		if FFlagAXSupportRentalPurchaseInUnifiedProductPurchaseFlow then
			local purchaseOptions = p13:getState().purchaseOptions

			if purchaseOptions ~= nil and purchaseOptions.shouldSkipOwnershipCheck == true then
				v69 = true
			end

			if FFlagAddPurchaseOptionForProvidingBalance and purchaseOptions ~= nil and purchaseOptions.providedRobuxBalance ~= nil then
				providedRobuxBalance = purchaseOptions.providedRobuxBalance
			end

			if FFlagUnifiedPurchaseAddSkeleton and purchaseOptions ~= nil and purchaseOptions.enablePreloadedPurchaseUI == true then
				v71 = true
			end
		end

		local fetchProductInfo = nil

		if FFlagAddFetchProductInfoAsACallback then
			local purchaseCallbacks = p13:getState().purchaseCallbacks

			if purchaseCallbacks ~= nil and purchaseCallbacks.fetchProductInfo ~= nil then
				fetchProductInfo = purchaseCallbacks.fetchProductInfo
			end
		end

		local v75 = if not FFlagEnableUnifiedProductPurchaseFlow then nil else p11

		if FFlagEnableUnifiedProductPurchaseFlow and FFlagUnifiedPurchaseAddSkeleton and v71 then
			p13:dispatch(SetIsUserEligibleForUnifiedPurchaseFlow(true))
			p13:dispatch(SetPromptState(PromptState.InitializingPurchase))
		end

		local t2 = nil

		if FFlagRefreshPriceOnRetryAfterUpsell and p12 then
			local productPayload = p13:getState().productPayload

			t2 = {
				collectibleItemId = p7,
				collectibleItemInstanceId = p8,
				timedOptionDays = if not productPayload then nil else productPayload.timedOptionDays
			}
		end

		return Promise.all({
			productInfo = if not GetFFlagEnableCreatorStorePurchasingCutover() then deprecated_GetProductInfo(v66, p1, p2) else if not FFlagAddFetchProductInfoAsACallback or (fetchProductInfo == nil or not not FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal and p12) then getProductInfo(v66, p1, p2, v75, if not FFlagRefreshPriceOnRetryAfterUpsell then nil else t2) else fetchProductInfo(),
			accountInfo = if not FFlagRemoveAcountInfoFetchFromPurchase then getAccountInfo(v66, v67) else Promise.resolve({
				isPremium = Players.LocalPlayer.MembershipType == Enum.MembershipType.Premium
			}),
			alreadyOwned = getIsAlreadyOwned(v66, p1, p2, v69),
			balanceInfo = getBalanceInfo(v66, v67, false, true, providedRobuxBalance),
			isUserEligibleForUnifiedPurchaseFlow = if not FFlagEnableUnifiedProductPurchaseFlow then nil else getUnifiedPurchaseFlowEligibility(v66, p2),
			robloxSubscriptionProducts = if not FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then nil else getRobloxSubscriptionProducts():catch(function() -- line: 235
				return nil
			end)
		}):andThen(function(p15) -- line: 240
			-- upvalues: FFlagEnableUnifiedPurchaseFlowForDevSubs (copy), ProductTypeEnum (copy), p13 (copy), SetProductPayload (copy), p1 (copy), FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal (copy), buildProductPayloadFromInitiateArgs (copy), p2 (copy), p3 (copy), p4 (copy), p5 (copy), p6 (copy), p7 (copy), p8 (copy), p9 (copy), p10 (copy), v75 (copy), FFlagRefreshPriceOnRetryAfterUpsell (copy), FFlagRefreshLookPriceOnRetryAfterUpsell (copy), p12 (copy), v42 (copy), v44 (copy), resolvePromptState (copy)
			if FFlagEnableUnifiedPurchaseFlowForDevSubs and p15.productInfo.ProductType == ProductTypeEnum.DeveloperSubscription and (p13:getState().productPayload == nil or p13:getState().productPayload.kind == nil) then
				p13:dispatch(SetProductPayload({
					subscriptionId = p1,
					kind = ProductTypeEnum.DeveloperSubscription,
					expectedPrice = p15.productInfo.PriceInRobux,
					iconImageAssetId = p15.productInfo.IconImageAssetId,
					isSubscriptionInRobux = p15.productInfo.PriceInRobux ~= nil and p15.productInfo.PriceInRobux > 0
				}))
			end

			if FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then
				local productPayload = p13:getState().productPayload

				if not productPayload or not productPayload.kind then
					local v80 = buildProductPayloadFromInitiateArgs(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, v75)

					if v80 then
						p13:dispatch(SetProductPayload(v80))
					end
				end
			end

			local v81 = p10

			if (FFlagRefreshPriceOnRetryAfterUpsell or FFlagRefreshLookPriceOnRetryAfterUpsell) and p12 then
				local refreshedExpectedPrice = p15.productInfo.refreshedExpectedPrice

				if v42 and FFlagEnableUnifiedPurchaseFlowForDevSubs and p15.productInfo.ProductType == ProductTypeEnum.DeveloperSubscription then
					refreshedExpectedPrice = p15.productInfo.PriceInRobux
				end

				if refreshedExpectedPrice ~= nil then
					v81 = refreshedExpectedPrice
					v44(p13, refreshedExpectedPrice)
				end
			end

			p13:dispatch(resolvePromptState(p15.productInfo, p15.accountInfo, p15.balanceInfo, p15.alreadyOwned, p4, v81, p15.isUserEligibleForUnifiedPurchaseFlow, if not FFlagEnableBlackbirdUpsellInUnifiedPurchaseModal then nil else p15.robloxSubscriptionProducts))
		end):catch(function(p16) -- line: 315
			-- upvalues: FFlagFixPurchasingErrorCounter (copy), PurchaseError (copy), p13 (copy), ErrorOccurred (copy)
			if FFlagFixPurchasingErrorCounter then
				if PurchaseError.isMember(p16) then
					p13:dispatch(ErrorOccurred(p16))

					return
				end

				p13:dispatch(ErrorOccurred(PurchaseError.UnknownFailure))

				return
			end

			p13:dispatch(ErrorOccurred(p16))
		end)
	end)
end

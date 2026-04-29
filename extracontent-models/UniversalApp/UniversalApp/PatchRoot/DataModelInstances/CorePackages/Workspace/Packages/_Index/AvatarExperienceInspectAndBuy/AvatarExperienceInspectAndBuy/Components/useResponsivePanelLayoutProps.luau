local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local MarketplaceService = game:GetService("MarketplaceService")
local LocalizationService = game:GetService("LocalizationService")
local AvatarExperienceInspectAndBuyParent = AvatarExperienceInspectAndBuy.Parent
local tutils = require(AvatarExperienceInspectAndBuyParent.tutils)
local React = require(AvatarExperienceInspectAndBuyParent.React)
local RoactUtils = require(AvatarExperienceInspectAndBuyParent.RoactUtils)
local useEventConnection = require(AvatarExperienceInspectAndBuyParent.ReactUtils).useEventConnection
local useSelector = RoactUtils.Hooks.RoactRodux.useSelector
local VerifiedBadges = require(AvatarExperienceInspectAndBuyParent.VerifiedBadges)
local Localization = require(AvatarExperienceInspectAndBuyParent.Localization)
local NumberLocalization = Localization.NumberLocalization
local useLocalization = Localization.Hooks.useLocalization
local useItemSelectionStore = require(AvatarExperienceInspectAndBuy.Contexts.ItemSelectionStoreContext).useItemSelectionStore

require(AvatarExperienceInspectAndBuy.Stores.createItemSelectionStore)

local FFlagAXEnableIaBTimedOptionsBulkPurchase = require(AvatarExperienceInspectAndBuyParent.AvatarExperienceFlags).FFlagAXEnableIaBTimedOptionsBulkPurchase

require(AvatarExperienceInspectAndBuy.Components.Common.ResponsivePanelLayout)

local AvatarItemsViewLayout = require(AvatarExperienceInspectAndBuy.Components.ItemsView.AvatarItemsViewLayout)
local ItemDetailsLayout = require(AvatarExperienceInspectAndBuy.Components.ItemDetails.ItemDetailsLayout)
local ViewportLayout = require(AvatarExperienceInspectAndBuy.Components.ItemsView.ViewportLayout)
local ViewType = require(AvatarExperienceInspectAndBuy.Enums.ViewType)

require(AvatarExperienceInspectAndBuy.Types)

local useRemoteBulkPurchaseEvent = require(AvatarExperienceInspectAndBuy.Hooks.useRemoteBulkPurchaseEvent)

require(AvatarExperienceInspectAndBuy.Components.Common.BuyActionBar)

local getItemThumbnailUrl = require(AvatarExperienceInspectAndBuy.Utils.getItemThumbnailUrl)
local usePurchaseButtonProps = require(AvatarExperienceInspectAndBuy.Components.usePurchaseButtonProps)
local useInspectPlayer = require(AvatarExperienceInspectAndBuy.Hooks.useInspectPlayer)
local useTokens = require(AvatarExperienceInspectAndBuyParent.Foundation).Hooks.useTokens
local FFlagAXFixBulkPurchaseFreeItems = require(AvatarExperienceInspectAndBuyParent.AvatarExperienceFlags).FFlagAXFixBulkPurchaseFreeItems
local FFlagIBV2Attribution = require(AvatarExperienceInspectAndBuyParent.SharedFlags).FFlagIBV2Attribution
local AvatarExperienceFlags = require(AvatarExperienceInspectAndBuyParent.AvatarExperienceFlags)
local FFlagAXReportTryOnAnalyticsIaB = AvatarExperienceFlags.FFlagAXReportTryOnAnalyticsIaB
local v29 = not AvatarExperienceFlags.FFlagAXFormatPDPPriceLabel and function(n1: number?) -- line: 61
	-- upvalues: NumberLocalization (copy), LocalizationService (copy)
	local v34 = string.format("%.0f", n1 or 0)

	return NumberLocalization.localize(v34, LocalizationService.RobloxLocaleId)
end or require(AvatarExperienceInspectAndBuy.Utils.formatNumber)

local function selectView(p1) -- line: 66
	return p1.view
end
local function selectInspectPreviewDetails(p2) -- line: 70
	return p2.avatarPreviewDetails
end

local t1 = {
	[ViewType.WideLandscape] = {
		tag = "size-full row align-y-center align-x-center",
		layoutOrder = {
			first = 1,
			second = 2
		},
		panelSizes = {
			first = UDim2.new(0.65, 0, 1, 0),
			second = UDim2.new(0.35, 0, 1, 0)
		},
		showRightBorder = true
	},
	[ViewType.Wide] = {
		tag = "size-full col align-y-center align-x-center",
		layoutOrder = {
			first = 2,
			second = 1
		},
		panelSizes = {
			first = UDim2.new(1, 0, 0.65, 0),
			second = UDim2.new(1, 0, 0.35, 0)
		},
		showRightBorder = false
	},
	[ViewType.Compact] = {
		tag = "size-full col align-y-center align-x-center",
		layoutOrder = {
			first = 2,
			second = 1
		},
		panelSizes = {
			first = UDim2.new(1, 0, 0.7, 0),
			second = UDim2.new(1, 0, 0.3, 0)
		},
		showRightBorder = false
	}
}

return function(t2: {[any]: any}) -- line: 143
	-- upvalues: useSelector (copy), selectView (copy), tutils (copy), ViewType (copy), React (copy), selectInspectPreviewDetails (copy), useRemoteBulkPurchaseEvent (copy), useInspectPlayer (copy), v29 (copy), useTokens (copy), FFlagAXEnableIaBTimedOptionsBulkPurchase (copy), useItemSelectionStore (copy), useLocalization (copy), VerifiedBadges (copy), FFlagAXReportTryOnAnalyticsIaB (copy), usePurchaseButtonProps (copy), FFlagAXFixBulkPurchaseFreeItems (copy), useEventConnection (copy), MarketplaceService (copy), ItemDetailsLayout (copy), FFlagIBV2Attribution (copy), AvatarItemsViewLayout (copy), ViewportLayout (copy), getItemThumbnailUrl (copy), t1 (copy)
	local v40 = useSelector(selectView, tutils.deepEqual)
	local v41 = v40 == ViewType.WideLandscape
	local v42, v43 = React.useState(nil)
	local v44, v45 = React.useState({
		isTryOnEnabled = false,
		tryOnItem = {}
	})
	local items = useSelector(selectInspectPreviewDetails, tutils.deepEqual).items
	local v47, v48, v49 = useRemoteBulkPurchaseEvent(items, t2.analytics)
	local v50 = useInspectPlayer()
	local v51 = v29(v49)
	local v52 = useTokens()
	local v53 = if not FFlagAXEnableIaBTimedOptionsBulkPurchase then nil else useItemSelectionStore()
	local v54 = React.useRef(nil)
	local v55 = React.useRef(0)
	local v56 = useLocalization({
		bulkPurchaseButtonText = "Feature.Catalog.Label.BuyItems",
		headerText = if not v50.hasVerifiedBadge then {
			"InGame.InspectMenu.Label.Avatar",
			PLAYER_NAME = v50.playerName
		} else {
			"InGame.InspectMenu.Label.VerifiedAvatar",
			PLAYER_NAME = v50.playerName,
			VERIFIED_BADGE = VerifiedBadges.emoji.verified
		},
		totalItems = if not items then nil else {
			"Feature.Catalog.Feature.Catalog.Label.TotalItemsParenthesis",
			itemCount = #items
		},
		total = "Feature.Catalog.Label.TotalUnformatted"
	})
	local v57 = React.useCallback(function(p3) -- line: 189
		-- upvalues: v45 (copy), FFlagAXReportTryOnAnalyticsIaB (copy), t2 (copy)
		v45(function(p4) -- line: 190
			-- upvalues: p3 (copy), FFlagAXReportTryOnAnalyticsIaB (copy), t2 (copy)
			local v62 = p3
			local v63 = not p4.isTryOnEnabled

			if FFlagAXReportTryOnAnalyticsIaB and v63 then
				t2.analytics.reportTryOnButtonClicked(p3.itemType, p3.itemId)
			end

			if not v63 then
				v62 = {}
			end

			return {
				isTryOnEnabled = v63,
				tryOnItem = v62
			}
		end)
	end, if not FFlagAXReportTryOnAnalyticsIaB then {} else { t2.analytics })
	local v58 = usePurchaseButtonProps({
		purchaseButtonText = v56.bulkPurchaseButtonText,
		onBulkPurchase = v47,
		isDisabled = if not FFlagAXFixBulkPurchaseFreeItems then items == nil or (v49 == 0 or not v48) else not v48,
		selectedItem = v42,
		localizedStrings = v56,
		formattedTotalPrice = v51,
		onPromptPurchase = t2.onPromptPurchase
	})

	useEventConnection(MarketplaceService.PromptBulkPurchaseFinished, t2.onBulkPurchaseFinished)
	React.useEffect(function() -- line: 231
		-- upvalues: v54 (copy), v55 (copy)
		if v54.current then
			v54.current.CanvasPosition = Vector2.new(0, v55.current)
		end
	end, { v42 })
	React.useEffect(function() -- line: 238
		-- upvalues: v42 (copy), t2 (copy)
		if v42 then
			t2.onItemDetailsOpened(v42)
		end
	end, {
		v42,
		t2.onItemDetailsOpened
	})

	local v59 = if not FFlagAXEnableIaBTimedOptionsBulkPurchase then nil else React.useCallback(function() -- line: 245
		-- upvalues: v53 (copy), t2 (copy)
		v53.clearAll()
		t2.onInspectMenuClosed()
	end, {
		v53,
		t2.onInspectMenuClosed
	})

	return {
		view = v40,
		renderFirstPanel = function() -- line: 252
			-- upvalues: v42 (copy), React (copy), ItemDetailsLayout (copy), v40 (copy), v43 (copy), v45 (copy), t2 (copy), FFlagIBV2Attribution (copy), ViewType (copy), v58 (copy), v57 (copy), v44 (copy), v29 (copy), AvatarItemsViewLayout (copy), items (copy), v56 (copy), FFlagAXEnableIaBTimedOptionsBulkPurchase (copy), v59 (copy), v54 (copy), v55 (copy), v51 (copy)
			if v42 then
				return (React.createElement(ItemDetailsLayout, {
					itemDetailsViewProps = {
						view = v40,
						item = v42,
						onItemDetailsClosed = function() --[[ onItemDetailsClosed ]] -- line: 258
							-- upvalues: v43 (copy), v45 (copy)
							v43(nil)
							v45({
								isTryOnEnabled = false,
								tryOnItem = {}
							})
						end,
						onToggleFavorite = t2.onToggleFavorite,
						openAttributionOverlay = if not FFlagIBV2Attribution then nil else t2.openAttributionOverlay,
						purchaseButtonProps = if v40 ~= ViewType.Wide then nil else v58.purchaseButtonProps,
						onToggleTryOn = v57,
						renderTryOnViewport = t2.renderTryOnViewport,
						tryOnState = v44,
						localPlayerModel = t2.localPlayerModel,
						formatNumber = v29
					},
					buyActionBarProps = v58,
					view = v40
				}))
			end

			return (React.createElement(AvatarItemsViewLayout, {
				view = v40,
				items = items,
				headerText = v56.headerText,
				onInspectMenuClosed = if not FFlagAXEnableIaBTimedOptionsBulkPurchase or not v59 then t2.onInspectMenuClosed else v59,
				onItemCardActivated = function(p5) --[[ onItemCardActivated ]] -- line: 286
					-- upvalues: v54 (copy), v55 (copy), v43 (copy)
					if v54.current then
						v55.current = v54.current.CanvasPosition.Y
					end

					v43(p5)
				end,
				subheaderText = {
					leftSlotLabel = v56.totalItems or "",
					rightSlotPrice = v51
				},
				buyActionBarProps = v58,
				ref = v54
			}))
		end,
		renderSecondPanel = if not (v40 == ViewType.WideLandscape or (v40 == ViewType.Wide or v40 == ViewType.Compact) and not v42) then nil else function() -- line: 302
			-- upvalues: React (copy), ViewportLayout (copy), v40 (copy), v42 (copy), getItemThumbnailUrl (copy), v50 (copy), v43 (copy), t2 (copy), v41 (copy), v58 (copy), v44 (copy), v52 (copy)
			return React.createElement(ViewportLayout, {
				view = v40,
				thumbnailUrl = if not v42 then "rbxthumb://type=Avatar&id=" .. tostring(v50.playerId) .. "&w=420&h=420" else getItemThumbnailUrl(v42) or "",
				backButtonProps = {
					onBackButtonClick = if not v42 then t2.onInspectMenuClosed else function() -- line: 310
						-- upvalues: v43 (copy)
						v43(nil)
					end
				},
				viewportProps = {
					ScaleType = Enum.ScaleType.Crop,
					Size = if not v41 then UDim2.new(1, 0, 1, 0) else UDim2.new(1, 0, 0, 0),
					AspectRatio = 1
				},
				buyActionBarProps = v58,
				Size = UDim2.new(1, 0, 1, 0),
				renderTryOnViewport = t2.renderTryOnViewport,
				tryOnState = v44,
				thumbnailPadding = if not v42 then nil else {
					left = UDim.new(0, v52.Padding.XXLarge),
					right = UDim.new(0, v52.Padding.XXLarge),
					top = UDim.new(0, v52.Padding.XXLarge),
					bottom = UDim.new(0, v52.Padding.XXLarge)
				}
			})
		end,
		panelConfig = t1[v40] or t1[ViewType.Wide]
	}
end

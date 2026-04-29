local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local LocalizationService = game:GetService("LocalizationService")
local AvatarExperienceInspectAndBuyParent = AvatarExperienceInspectAndBuy.Parent
local React = require(AvatarExperienceInspectAndBuyParent.React)
local Foundation = require(AvatarExperienceInspectAndBuyParent.Foundation)
local BundleAssetsList = require(AvatarExperienceInspectAndBuy.Components.ItemDetails.BundleAssetsList)
local Enums = Foundation.Enums
local ItemHeader = require(AvatarExperienceInspectAndBuy.Components.Common.ItemHeader)
local useConvertedItemData = require(AvatarExperienceInspectAndBuy.Hooks.useConvertedItemData)
local useItemExperienceInfo = require(AvatarExperienceInspectAndBuy.Hooks.useItemExperienceInfo)
local ControlBar = require(AvatarExperienceInspectAndBuy.Components.ItemDetails.ControlBar)
local ResellableInstancesLabel = require(AvatarExperienceInspectAndBuy.Components.ItemDetails.ResellableInstancesLabel)
local ItemInfoLabels = require(AvatarExperienceInspectAndBuy.Components.ItemDetails.ItemInfoLabels)
local NumberLocalization = require(AvatarExperienceInspectAndBuyParent.Localization).NumberLocalization
local useItemStatusLocalization = require(AvatarExperienceInspectAndBuy.Hooks.useItemStatusLocalization)
local itemDetailsUtils = require(AvatarExperienceInspectAndBuy.Utils.itemDetailsUtils)
local isCollectible = itemDetailsUtils.isCollectible
local isInExperienceCreationPlayable = itemDetailsUtils.isInExperienceCreationPlayable
local isTradeable = itemDetailsUtils.isTradeable
local getCreatorName = itemDetailsUtils.getCreatorName
local getOriginalPrice = itemDetailsUtils.getOriginalPrice
local getQuantitySold = itemDetailsUtils.getQuantitySold
local ViewportLayout = require(AvatarExperienceInspectAndBuy.Components.ItemsView.ViewportLayout)
local getItemThumbnailUrl = require(AvatarExperienceInspectAndBuy.Utils.getItemThumbnailUrl)
local SubheaderLabelPrice = require(AvatarExperienceInspectAndBuy.Components.Common.SubheaderLabelPrice)
local getPriceStatus = require(AvatarExperienceInspectAndBuy.Utils.getPriceStatus)
local getPriceInRobux = itemDetailsUtils.getPriceInRobux
local isItemAvailableForTryOn = require(AvatarExperienceInspectAndBuy.Utils.isItemAvailableForTryOn)
local BackButton = require(AvatarExperienceInspectAndBuy.Components.Common.BackButton)
local formatNumber = require(AvatarExperienceInspectAndBuy.Utils.formatNumber)
local AvatarExperienceFlags = require(AvatarExperienceInspectAndBuyParent.AvatarExperienceFlags)
local FFlagAXFormatPDPPriceLabel = AvatarExperienceFlags.FFlagAXFormatPDPPriceLabel
local FFlagAXHideInspectAndBuyPriceIfUnavailable = AvatarExperienceFlags.FFlagAXHideInspectAndBuyPriceIfUnavailable

require(AvatarExperienceInspectAndBuy.Types)

local ViewType = require(AvatarExperienceInspectAndBuy.Enums.ViewType)
local useTokens = Foundation.Hooks.useTokens

require(AvatarExperienceInspectAndBuy.Components.Common.BuyActionBar)
require(AvatarExperienceInspectAndBuy.Enums.PriceStatus)

local FFlagIBV2Attribution = require(AvatarExperienceInspectAndBuyParent.SharedFlags).FFlagIBV2Attribution

local function v37(p1, p2) -- line: 75
	-- upvalues: ViewType (copy)
	if p1 == ViewType.WideLandscape then
		return {
			PaddingTop = UDim.new(0, p2.Padding.XSmall),
			PaddingLeft = UDim.new(0, p2.Padding.Medium),
			PaddingRight = UDim.new(0, p2.Padding.Medium),
			PaddingBottom = UDim.new(0, p2.Padding.XXLarge)
		}
	end

	if p1 == ViewType.Wide then
		return {
			PaddingTop = UDim.new(0, p2.Padding.XSmall),
			PaddingBottom = UDim.new(0, p2.Padding.XLarge),
			PaddingLeft = UDim.new(0, p2.Margin.Large * 2),
			PaddingRight = UDim.new(0, p2.Margin.Large * 2)
		}
	end

	return {
		PaddingTop = UDim.new(0, p2.Padding.XSmall),
		PaddingBottom = UDim.new(0, p2.Padding.XLarge),
		PaddingLeft = UDim.new(0, p2.Padding.XXLarge),
		PaddingRight = UDim.new(0, p2.Padding.XXLarge)
	}
end
local function v38(p3, p4) -- line: 105
	-- upvalues: ViewType (copy)
	if p3 == ViewType.WideLandscape then
		return {
			left = UDim.new(0, p4.Padding.Large),
			right = UDim.new(0, p4.Padding.Large),
			bottom = UDim.new(0, p4.Padding.XXLarge)
		}
	end

	return {
		bottom = UDim.new(0, p4.Padding.XXLarge)
	}
end
local function v39(p5, t1: {[any]: any}, p6) -- line: 125
	-- upvalues: ViewType (copy)
	if p5 == ViewType.Compact then
		return UDim2.new(1, 0, 1, -t1.buyActionBarOffset - t1.backButtonOffset - p6.Padding.Small)
	end

	return UDim2.new(1, 0, 1, -t1.backButtonOffset - p6.Padding.Small)
end

return function(t2: {[any]: any}) --[[ ItemDetailsView ]] -- line: 145
	-- upvalues: useTokens (copy), useConvertedItemData (copy), FFlagIBV2Attribution (copy), useItemExperienceInfo (copy), getPriceStatus (copy), ViewType (copy), useItemStatusLocalization (copy), v37 (copy), isCollectible (copy), getQuantitySold (copy), getOriginalPrice (copy), isTradeable (copy), isInExperienceCreationPlayable (copy), React (copy), Foundation (copy), Enums (copy), BackButton (copy), v39 (copy), ViewportLayout (copy), getItemThumbnailUrl (copy), ItemHeader (copy), v38 (copy), SubheaderLabelPrice (copy), getCreatorName (copy), FFlagAXFormatPDPPriceLabel (copy), formatNumber (copy), getPriceInRobux (copy), FFlagAXHideInspectAndBuyPriceIfUnavailable (copy), ControlBar (copy), NumberLocalization (copy), LocalizationService (copy), isItemAvailableForTryOn (copy), ResellableInstancesLabel (copy), ItemInfoLabels (copy), BundleAssetsList (copy)
	local v49 = useTokens()
	local v50 = useConvertedItemData(t2.item)
	local v51 = if not FFlagIBV2Attribution or not v50 then nil else v50.creatingUniverseId
	local v52 = if not FFlagIBV2Attribution then nil else useItemExperienceInfo(v51)
	local v53 = getPriceStatus(v50)
	local v54 = t2.view == ViewType.WideLandscape
	local v55 = t2.view == ViewType.Compact
	local v56 = t2.view == ViewType.Wide
	local v57 = useItemStatusLocalization(v50)
	local v58 = v37(t2.view, v49)
	local v59 = t2.buyActionBarOffset or 0
	local Size_1000 = v49.Size.Size_1000
	local t3 = {
		{
			key = "Category",
			isVisible = true,
			labelProps = {
				leftLabel = v57.category,
				rightLabel = not v50 and "" or v57[v50.itemSubType]
			}
		},
		{
			key = "QuantitySold",
			isVisible = isCollectible(v50),
			labelProps = {
				leftLabel = v57.quantitySold,
				rightLabel = getQuantitySold(v50, t2.formatNumber)
			}
		},
		{
			key = "OriginalPrice",
			isVisible = isCollectible(v50),
			labelProps = {
				leftLabel = v57.originalPrice,
				rightLabel = getOriginalPrice(v50, v57.na, t2.formatNumber)
			}
		},
		{
			key = "Tradeable",
			isVisible = isCollectible(v50),
			labelProps = {
				leftLabel = v57.tradeable,
				rightLabel = if not isTradeable(v50) then v57.no else v57.yes
			}
		}
	}

	if FFlagIBV2Attribution then
		table.insert(t3, {
			key = "MadeIn",
			isVisible = isInExperienceCreationPlayable(v52),
			labelProps = {
				leftLabel = v57.madein,
				rightLabel = React.createElement(Foundation.View, {
					LayoutOrder = 2,
					tag = "auto-xy",
					onActivated = function() --[[ onActivated ]] -- line: 203
						-- upvalues: t2 (copy), v52 (copy)
						if t2.openAttributionOverlay then
							t2.openAttributionOverlay(v52)
						end
					end
				}, {
					AttributionLabel = React.createElement(Foundation.View, {
						tag = "auto-xy row gap-small align-y-center"
					}, {
						ExperienceName = v52 and React.createElement(Foundation.Text, {
							LayoutOrder = 1,
							tag = "auto-xy text-title-medium content-default",
							Text = v52.name
						}) or nil,
						ArrowIcon = v52 and React.createElement(Foundation.Icon, {
							LayoutOrder = 2,
							name = Enums.IconName.ArrowSmallRight,
							variant = Enums.IconVariant.Filled,
							size = Enums.IconSize.Medium,
							style = v49.Color.Content.Default
						}) or nil
					})
				})
			}
		})
	end

	return React.createElement(Foundation.View, {
		tag = "size-full"
	}, {
		ButtonContainer = React.createElement(Foundation.View, {}, {
			BackButton = React.createElement(BackButton, {
				onBackButtonClick = t2.onItemDetailsClosed,
				Size = UDim2.new(0, Size_1000, 1, 0),
				Position = UDim2.new(0, v49.Padding.Small, 0, v49.Padding.Small)
			})
		}),
		ScrollingFrame = React.createElement("ScrollingFrame", {
			Size = v39(t2.view, {
				buyActionBarOffset = v59,
				backButtonOffset = Size_1000
			}, v49),
			Position = UDim2.new(0, 0, 0, Size_1000 + v49.Padding.Medium),
			CanvasSize = UDim2.new(1, 0, 0, 0),
			BackgroundTransparency = 1,
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			ScrollingDirection = Enum.ScrollingDirection.Y,
			ScrollBarThickness = 0,
			BorderSizePixel = 0
		}, {
			UIPadding = React.createElement("UIPadding", v58),
			UIListLayout = React.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				Padding = UDim.new(0, v49.Padding.Small)
			}),
			ViewportLayout = if not v55 and not v56 then nil else React.createElement(ViewportLayout, {
				view = t2.view,
				LayoutOrder = 1,
				thumbnailUrl = getItemThumbnailUrl(t2.item) or "",
				viewportProps = {
					Size = UDim2.new(0, v49.Size.Size_3000 * (t2.view ~= ViewType.Wide and 2 or 2.5), 0, v49.Size.Size_3000 * (t2.view ~= ViewType.Wide and 2 or 2.5))
				},
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				renderTryOnViewport = t2.renderTryOnViewport,
				tryOnState = t2.tryOnState
			}),
			Header = React.createElement(ItemHeader, {
				LayoutOrder = 1,
				headerHeight = v49.Size.Size_1300,
				purchaseButtonProps = t2.purchaseButtonProps,
				padding = v38(t2.view, v49),
				header = React.createElement(Foundation.Text, {
					LayoutOrder = 1,
					tag = "auto-xy text-heading-small content-emphasis text-truncate-end",
					Text = v50 and v50.name or ""
				}),
				subheader = if not v56 then React.createElement(Foundation.Text, {
					LayoutOrder = 2,
					tag = "auto-xy text-body-large content-emphasis text-truncate-end",
					Text = getCreatorName(v50)
				}) else React.createElement(SubheaderLabelPrice, {
					subheaderText = {
						leftSlotLabel = getCreatorName(v50),
						rightSlotPrice = if not FFlagAXFormatPDPPriceLabel then tostring(getPriceInRobux(v50, v53)) else formatNumber(getPriceInRobux(v50, v53))
					},
					priceStatus = if not FFlagAXHideInspectAndBuyPriceIfUnavailable then nil else v53,
					LayoutOrder = 2
				})
			}),
			DetailsContainer = React.createElement(Foundation.View, {
				tag = "auto-xy col align-x-left align-y-top gap-small",
				LayoutOrder = 2
			}, {
				UIPadding = if not v54 then nil else React.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, v49.Padding.Large),
					PaddingRight = UDim.new(0, v49.Padding.Large)
				}),
				ControlBar = React.createElement(ControlBar, {
					LayoutOrder = 1,
					favoritesBadge = {
						text = if not v50 or (not v50.favoritesDetails or not v50.favoritesDetails.numFavorites) then nil else NumberLocalization.abbreviate(v50.favoritesDetails.numFavorites, LocalizationService.RobloxLocaleId),
						iconVariant = if not v50 or (not v50.favoritesDetails or not v50.favoritesDetails.isFavorited) then Enums.IconVariant.Regular else Enums.IconVariant.Filled,
						onActivated = function() --[[ onActivated ]] -- line: 334
							-- upvalues: v50 (copy), t2 (copy)
							if v50 and v50.favoritesDetails then
								t2.onToggleFavorite(t2.item, v50.favoritesDetails.isFavorited or false)
							end
						end,
						LayoutOrder = 1
					},
					tryOnBadge = if not v50 or not isItemAvailableForTryOn(t2.localPlayerModel, v50) then nil else {
						text = v57.tryOn,
						iconVariant = if not t2.tryOnState.isTryOnEnabled then Enums.IconVariant.Regular else Enums.IconVariant.Filled,
						onActivated = function() --[[ onActivated ]] -- line: 347
							-- upvalues: v50 (copy), t2 (copy)
							if v50 then
								t2.onToggleTryOn({
									itemId = v50.id,
									itemType = v50.itemType,
									itemSubType = v50.itemSubType,
									assetsInBundle = v50.assetsInBundle
								})
							end
						end,
						LayoutOrder = 2
					}
				}),
				DescriptionLabel = React.createElement(Foundation.Text, {
					LayoutOrder = 3,
					tag = "auto-xy text-body-medium content-emphasis text-truncate-end text-align-x-left text-wrap padding-bottom-large padding-top-large",
					Text = not v50 and "" or v50.description
				}),
				ResellableInstancesLabel = if not isCollectible(v50) or (not v50 or (not v50.collectibleItemDetails or not (v50.collectibleItemDetails.resellableCount > 0))) then nil else React.createElement(ResellableInstancesLabel, {
					ownedItemsLabel = v57.ownedItems,
					padding = {
						top = UDim.new(0, v49.Padding.Large)
					},
					LayoutOrder = 3
				}),
				ItemInfoLabels = React.createElement(ItemInfoLabels, {
					LayoutOrder = 5,
					itemInfoLabels = t3
				}),
				BundleAssetsList = if not v50 or (not v50.assetsInBundle or not (#v50.assetsInBundle > 0)) then nil else React.createElement(BundleAssetsList, {
					itemData = v50,
					headerLabel = v57.includedParts,
					view = t2.view,
					LayoutOrder = 6
				})
			})
		})
	})
end

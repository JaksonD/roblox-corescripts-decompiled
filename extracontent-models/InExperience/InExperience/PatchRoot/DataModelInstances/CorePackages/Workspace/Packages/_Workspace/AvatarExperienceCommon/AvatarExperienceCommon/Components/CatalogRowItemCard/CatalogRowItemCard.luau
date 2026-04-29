local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local AvatarExperienceCommonParent = AvatarExperienceCommon.Parent
local React = require(AvatarExperienceCommonParent.React)
local useTokens = require(AvatarExperienceCommonParent.Foundation).Hooks.useTokens
local ItemCardComponents = require(AvatarExperienceCommonParent.AvatarExperienceUIKit).ItemCardComponents
local ItemCardHeader = ItemCardComponents.ItemCardHeader
local ItemCardBadge = ItemCardComponents.ItemCardBadge
local ItemCardStatus = ItemCardComponents.ItemCardStatus
local ItemCardHeaderCornersOverlay = ItemCardComponents.ItemCardHeaderCornersOverlay
local ItemCardIcon = ItemCardComponents.ItemCardIcon
local CatalogRowItemCardFooter = require(script.Parent.CatalogRowItemCardFooter)
local CatalogItemCardItemTypeEnum = require(script.Parent.Parent.CatalogItemCard.Enums.CatalogItemCardItemTypeEnum)
local CatalogItemCardItemInfoEnum = require(script.Parent.Parent.CatalogItemCard.Enums.CatalogItemCardItemInfoEnum)
local CatalogItemCardStatusIconTypeEnum = require(script.Parent.Parent.CatalogItemCard.Enums.CatalogItemCardStatusIconTypeEnum)
local AvatarExperienceFlags = require(AvatarExperienceCommonParent.AvatarExperienceFlags)
local FFlagAXDurablesForMIS = AvatarExperienceFlags.FFlagAXDurablesForMIS

require(AvatarExperienceCommon.Types.TimedOptionType)

local FFlagAXEnableTimedOptionsForCatalogRowCard = AvatarExperienceFlags.FFlagAXEnableTimedOptionsForCatalogRowCard
local t1 = {
	DYNAMIC_HEAD = "icons/menu/clothing/dynamicHead",
	LIMITED = "icons/status/item/limited",
	MODERATED = "icons/actions/info_small",
	PENDING_MODERATION = "icons/status/pending_small",
	UNAVAILABLE = "icons/status/warning_small",
	DURABLE = "icons/status/pending_small"
}
local t2 = {
	[CatalogItemCardStatusIconTypeEnum.Moderated] = t1.MODERATED,
	[CatalogItemCardStatusIconTypeEnum.PendingModeration] = t1.PENDING_MODERATION,
	[CatalogItemCardStatusIconTypeEnum.Unavailable] = t1.UNAVAILABLE,
	[CatalogItemCardStatusIconTypeEnum.Durable] = t1.DURABLE
}
local t3 = {
	[CatalogItemCardItemTypeEnum.Limited] = {{
		type = "icon",
		icon = t1.LIMITED
	}},
	[CatalogItemCardItemTypeEnum.Collectible] = {
		{
			type = "icon",
			icon = t1.LIMITED
		},
		{
			type = "text",
			text = "#"
		}
	}
}
local t4 = {
	[CatalogItemCardItemInfoEnum.DynamicHead] = t1.DYNAMIC_HEAD
}

return (React.forwardRef(function(t5: {[any]: any}, p1) -- line: 116
	-- upvalues: useTokens (copy), t4 (copy), t3 (copy), t2 (copy), React (copy), ItemCardHeader (copy), ItemCardHeaderCornersOverlay (copy), ItemCardBadge (copy), ItemCardStatus (copy), ItemCardIcon (copy), CatalogRowItemCardFooter (copy), FFlagAXDurablesForMIS (copy), FFlagAXEnableTimedOptionsForCatalogRowCard (copy)
	local v24 = useTokens()
	local v25 = if not t5.itemInfo then nil else t4[t5.itemInfo]
	local v26 = if not t5.itemType then nil else t3[t5.itemType]
	local v27 = if not t5.itemStatus or t5.itemStatus.type ~= "icon" then nil else t2[t5.itemStatus.iconType]

	return React.createElement("TextButton", {
		Text = "",
		AutoButtonColor = false,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		[React.Event.Activated] = if not t5.isDisabled then t5.onActivated else nil,
		ref = p1,
		AutomaticSize = t5.AutomaticSize,
		LayoutOrder = t5.LayoutOrder,
		SelectionGroup = true,
		ClipsDescendants = false,
		[React.Tag] = t5.tag
	}, {
		HorizontalLayout = React.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			Padding = UDim.new(0, v24.Gap.Medium)
		}),
		Header = React.createElement(ItemCardHeader, {
			LayoutOrder = 1,
			aspectRatio = t5.headerAspectRatio,
			Size = t5.headerSize,
			overlaySlot = React.createElement(ItemCardHeaderCornersOverlay, {
				topLeftSlot = if not t5.itemStatus or t5.itemStatus.type ~= "badge" then if not t5.itemStatus then nil else if t5.itemStatus.type ~= "text" then if not v27 then nil else React.createElement(ItemCardIcon, {
					icon = v27
				}) else React.createElement(ItemCardStatus, {
					text = t5.itemStatus.text
				}) else React.createElement(ItemCardBadge, {
					content = {
						{
							type = "icon",
							icon = t2[t5.itemStatus.iconType]
						},
						{
							type = "text",
							text = t5.itemStatus.text
						}
					}
				}),
				bottomLeftSlot = if not v26 then nil else React.createElement(ItemCardBadge, {
					content = v26
				}),
				bottomRightSlot = if not v25 then nil else React.createElement(ItemCardBadge, {
					content = {{
						type = "icon",
						icon = v25
					}}
				})
			})
		}, t5.presentationSlot),
		Footer = React.createElement(CatalogRowItemCardFooter, {
			title = t5.title,
			creatorName = if not t5.creator then nil else t5.creator.name,
			bundlePartsText = t5.bundlePartsText,
			itemSubType = t5.itemSubType,
			creatorHasVerifiedBadge = if not t5.creator then nil else t5.creator.verified,
			priceLineContent = t5.priceLineContent,
			expirationTime = if not FFlagAXDurablesForMIS and not FFlagAXEnableTimedOptionsForCatalogRowCard then nil else t5.expirationTime,
			isOwned = if not FFlagAXDurablesForMIS and not FFlagAXEnableTimedOptionsForCatalogRowCard then nil else t5.isOwned,
			timedOptions = if not FFlagAXDurablesForMIS and not FFlagAXEnableTimedOptionsForCatalogRowCard then nil else t5.timedOptions,
			onTimedOptionPriceChanged = if not FFlagAXDurablesForMIS and not FFlagAXEnableTimedOptionsForCatalogRowCard then nil else t5.onTimedOptionPriceChanged,
			selectedTimedOptionPrice = if not FFlagAXDurablesForMIS and not FFlagAXEnableTimedOptionsForCatalogRowCard then nil else t5.selectedTimedOptionPrice,
			setSelectedTimedOptionPrice = if not FFlagAXDurablesForMIS and not FFlagAXEnableTimedOptionsForCatalogRowCard then nil else t5.setSelectedTimedOptionPrice,
			selectedTimedOptionIndexInReducer = if not FFlagAXDurablesForMIS and not FFlagAXEnableTimedOptionsForCatalogRowCard then nil else t5.selectedTimedOptionIndexInReducer,
			wearTimeSelectedOptionInList = if not FFlagAXDurablesForMIS and not FFlagAXEnableTimedOptionsForCatalogRowCard then nil else t5.wearTimeSelectedOptionInList,
			LayoutOrder = 2,
			Size = t5.footerSize,
			AutomaticSize = if not t5.footerAutomaticSize then Enum.AutomaticSize.Y else t5.footerAutomaticSize
		})
	})
end))

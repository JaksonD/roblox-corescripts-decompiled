local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ProfilePlatformParent = ProfilePlatform.Parent
local React = require(ProfilePlatformParent.React)
local Foundation = require(ProfilePlatformParent.Foundation)
local CatalogRowItemCard = require(ProfilePlatformParent.AvatarExperienceCommon).Components.CatalogItemCard.CatalogRowItemCard
local ItemCardThumbnail = require(ProfilePlatformParent.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail
local getPriceLineContent = require(ProfilePlatformParent.AvatarExperienceInspectAndBuy).Utils.getPriceLineContent
local View = Foundation.View
local Checkbox = Foundation.Checkbox
local useTokens = Foundation.Hooks.useTokens
local InputSize = Foundation.Enums.InputSize
local useLocalization = require(ProfilePlatformParent.Localization).Hooks.useLocalization

require(ProfilePlatform.Common.Types)

local ItemDisplayHelpers = require(script.Parent.ItemDisplayHelpers)

return function(t1: {[any]: any}) --[[ CatalogItemRowCardContainer ]] -- line: 39
	-- upvalues: useTokens (copy), ItemDisplayHelpers (copy), useLocalization (copy), React (copy), View (copy), Checkbox (copy), InputSize (copy), CatalogRowItemCard (copy), ItemCardThumbnail (copy), getPriceLineContent (copy)
	local v15 = useTokens()
	local asset = t1.asset
	local id = asset.id
	local v18 = ItemDisplayHelpers.shouldShowBundleParts(asset)
	local v19 = useLocalization(if not v18 then {} else {
		bundleParts = {
			"Feature.Catalog.Label.UsingBundleParts",
			count = asset.bundlePartsCount
		}
	})
	local v20 = ItemDisplayHelpers.getThumbnailUrl(asset)

	return React.createElement(View, {
		tag = "row align-y-top gap-medium",
		Size = UDim2.new(1, 0, 0, t1.rowHeight),
		LayoutOrder = t1.index
	}, {
		ItemCheckbox = React.createElement(Checkbox, {
			label = "",
			isChecked = t1.isPurchasable and t1.isChecked,
			isDisabled = not t1.isPurchasable,
			size = InputSize.Small,
			onActivated = function(_: boolean) --[[ onActivated ]] -- line: 66
				-- upvalues: t1 (copy), id (copy)
				t1.onToggleItem(id)
			end,
			LayoutOrder = 1
		}),
		ItemCard = React.createElement(View, {
			tag = "fill size-0-full",
			LayoutOrder = 2
		}, {
			Card = React.createElement(CatalogRowItemCard, {
				title = asset.name,
				tag = "size-full",
				presentationSlot = React.createElement(ItemCardThumbnail, {
					url = v20
				}),
				creator = if not asset.creator or not asset.creator.creatorName then nil else {
					name = asset.creator.creatorName,
					verified = asset.creator.creatorHasVerifiedBadge
				},
				itemSubType = ItemDisplayHelpers.getItemTypeDisplayName(asset, t1.localizedStrings),
				bundlePartsText = v19.bundleParts,
				priceLineContent = getPriceLineContent(asset, v15, t1.priceStatusLocalized, {
					isShopContext = true
				}),
				headerSize = UDim2.fromOffset(t1.rowHeight, t1.rowHeight),
				footerSize = UDim2.fromScale(0, 1),
				footerAutomaticSize = Enum.AutomaticSize.X,
				onActivated = function() --[[ onActivated ]] -- line: 95
					-- upvalues: t1 (copy), id (copy), asset (copy)
					t1.openItemDetails(id, asset.itemType or "Asset", t1.index)
				end
			})
		})
	})
end

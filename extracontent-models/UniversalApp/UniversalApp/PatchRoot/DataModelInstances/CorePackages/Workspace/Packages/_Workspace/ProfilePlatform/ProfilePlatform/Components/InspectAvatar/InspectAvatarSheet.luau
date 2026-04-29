local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ProfilePlatformParent = ProfilePlatform.Parent
local React = require(ProfilePlatformParent.React)
local Foundation = require(ProfilePlatformParent.Foundation)
local DisplayBackground = require(ProfilePlatformParent.EditProfileBackground).DisplayBackground
local BuyActionBar = require(ProfilePlatformParent.AvatarExperienceInspectAndBuy).Components.BuyActionBar
local Dash = require(ProfilePlatformParent.Dash)
local View = Foundation.View
local FoundationText = Foundation.Text
local IconButton = Foundation.IconButton
local Divider = Foundation.Divider
local Skeleton = Foundation.Skeleton
local IconName = Foundation.Enums.IconName
local IconSize = Foundation.Enums.IconSize
local ButtonVariant = Foundation.Enums.ButtonVariant
local useLocalization = require(ProfilePlatformParent.Localization).Hooks.useLocalization

require(ProfilePlatform.Common.Types)

local ItemDisplayHelpers = require(script.Parent.ItemDisplayHelpers)
local InspectAvatarUtils = require(script.Parent.InspectAvatarUtils)
local CatalogItemRowCardContainer = require(script.Parent.CatalogItemRowCardContainer)
local isItemPurchasable = InspectAvatarUtils.isItemPurchasable

return function(t1: {[any]: any}) --[[ InspectAvatarSheet ]] -- line: 60
	-- upvalues: useLocalization (copy), ItemDisplayHelpers (copy), React (copy), Dash (copy), CatalogItemRowCardContainer (copy), isItemPurchasable (copy), View (copy), DisplayBackground (copy), IconButton (copy), IconName (copy), IconSize (copy), ButtonVariant (copy), FoundationText (copy), Skeleton (copy), Divider (copy), BuyActionBar (copy)
	local v22 = useLocalization({
		title = {
			"Feature.Profile.Header.InspectAndBuy",
			username = t1.username
		},
		buyHeader = {
			"Feature.Profile.Header.InspectAndBuy.BuySection",
			numberOfSelectedItems = t1.purchaseSummary.count,
			totalNumberOfItems = #t1.displayItems
		},
		buyItems = "Feature.Catalog.Label.BuyItems",
		bundle = "Feature.Catalog.Label.Bundle",
		insufficientRobux = "Feature.Profile.Heading.InsufficientFunds"
	})
	local v23 = useLocalization(ItemDisplayHelpers.PRICE_STATUS_LOCALIZATION_KEYS)
	local v24 = useLocalization(ItemDisplayHelpers.ASSET_TYPE_LOCALIZATION_KEYS)
	local v25 = useLocalization(ItemDisplayHelpers.BUNDLE_TYPE_LOCALIZATION_KEYS)
	local v26 = React.useMemo(function() -- line: 78
		-- upvalues: v22 (copy), Dash (copy), v24 (copy), v25 (copy)
		return {
			bundle = v22.bundle,
			bundleParts = nil,
			assetTypeNames = Dash.join(v24, v25)
		}
	end, {
		v22.bundle,
		v24,
		v25
	})
	local t2 = {}

	for v28, v29 in t1.displayItems do
		local id = v29.id

		t2[`item_{ id }`] = React.createElement(CatalogItemRowCardContainer, {
			asset = v29,
			index = v28,
			isChecked = t1.selectedItems[id] == true,
			isPurchasable = isItemPurchasable(v29),
			rowHeight = 72,
			localizedStrings = v26,
			priceStatusLocalized = v23,
			onToggleItem = t1.onToggleItem,
			openItemDetails = t1.openItemDetails
		})
	end

	return React.createElement(View, {
		Size = UDim2.fromScale(1, 1)
	}, {
		Scrim = React.createElement("TextButton", {
			Size = UDim2.new(1, -t1.cardWidth, 1, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Text = "",
			AutoButtonColor = false,
			[React.Event.Activated] = t1.onDismiss
		}),
		Sheet = React.createElement(View, {
			tag = "col position-top-right anchor-top-right margin-bottom-small padding-x-xlarge bg-surface-0",
			Size = UDim2.new(0, t1.cardWidth, 1, 0)
		}, {
			StatusBarSpacer = if not (t1.topOffset > 0) then nil else React.createElement(View, {
				tag = "bg-surface-0",
				Size = UDim2.new(1, 0, 0, t1.topOffset),
				LayoutOrder = 0
			}),
			AvatarViewport = React.createElement(View, {
				Size = UDim2.new(1, 0, 0, t1.avatarViewportHeight),
				LayoutOrder = 1
			}, {
				Background = React.createElement(DisplayBackground, {
					height = t1.avatarViewportHeight,
					userId = tonumber(t1.profileId),
					userThumbnail = t1.avatarThumbnail
				}),
				TopBar = React.createElement(View, {
					tag = "row align-y-center size-full-0 auto-y padding-small",
					ZIndex = 2
				}, {
					BackButton = React.createElement(IconButton, {
						icon = IconName.ChevronLargeLeft,
						size = IconSize.Medium,
						variant = ButtonVariant.Utility,
						onActivated = t1.onClose,
						isCircular = true
					})
				})
			}),
			Title = React.createElement(FoundationText, {
				tag = "size-full-0 auto-y padding-y-small text-heading-small text-align-x-left",
				Text = v22.title,
				LayoutOrder = 2
			}),
			ScrollWrapper = React.createElement(View, {
				tag = "fill size-full-0",
				LayoutOrder = 3
			}, {
				ScrollContent = React.createElement("ScrollingFrame", {
					Size = UDim2.fromScale(1, 1),
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.new(0, 0, 0, 0),
					ScrollBarThickness = 0,
					BackgroundTransparency = 1,
					BorderSizePixel = 0
				}, {
					ItemList = if t1.isLoading then nil else React.createElement(View, {
						tag = "col gap-large size-full-0 auto-y padding-bottom-large padding-top-medium"
					}, t2),
					LoadingShimmer = if not t1.isLoading then nil else React.createElement(View, {
						tag = "col size-full-0 auto-y"
					}, ((function() -- line: 174
						-- upvalues: React (copy), Skeleton (copy)
						local t3 = {}

						for i = 1, 4 do
							t3[`Shimmer{ i }`] = React.createElement(Skeleton, {
								Size = UDim2.new(1, 0, 0, 72),
								LayoutOrder = i
							})
						end

						return t3
					end)()))
				})
			}),
			FooterDivider = React.createElement(Divider, {
				Size = UDim2.new(1, 0, 0, 1),
				LayoutOrder = 4
			}),
			Footer = React.createElement(View, {
				tag = "size-full-2500 bg-surface-0",
				LayoutOrder = 5
			}, {
				ActionBar = React.createElement(BuyActionBar, {
					priceLabel = {
						leftLabel = v22.buyHeader,
						priceInRobux = tostring(t1.purchaseSummary.totalPrice)
					},
					purchaseButtonProps = {
						purchaseButtonText = if not t1.hasInsufficientFunds then v22.buyItems else v22.insufficientRobux,
						onPurchase = t1.onBuyAll,
						isDisabled = t1.isLoading or (t1.purchaseSummary.count == 0 or t1.hasInsufficientFunds == true),
						variant = ButtonVariant.Emphasis
					}
				})
			})
		})
	})
end

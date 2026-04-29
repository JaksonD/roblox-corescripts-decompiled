local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ProfilePlatformParent = ProfilePlatform.Parent
local LocalizationService = game:GetService("LocalizationService")
local React = require(ProfilePlatformParent.React)
local Foundation = require(ProfilePlatformParent.Foundation)
local Navigation = require(ProfilePlatformParent.Navigation)
local RoactUtils = require(ProfilePlatformParent.RoactUtils)
local useNavigation = Navigation.useNavigation
local useDispatch = RoactUtils.Hooks.RoactRodux.useDispatch
local useLocalization = require(ProfilePlatformParent.Localization).Hooks.useLocalization
local NumberLocalization = require(ProfilePlatformParent.Localization).NumberLocalization
local AvatarSaveContext = require(ProfilePlatformParent.AvatarExperienceSave).Context.AvatarSaveContext
local PurchaseBulkItems = require(ProfilePlatform.Networking.PurchaseBulkItems)
local EventNames = require(ProfilePlatform.Analytics.EventNames)
local useProfileAnalyticsContext = require(ProfilePlatform.Contexts.useProfileAnalyticsContext)
local useProfileWrapperContext = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local HandlePurchaseItemsSuccess = require(script.Parent.HandlePurchaseItemsSuccess)
local View = Foundation.View
local FoundationText = Foundation.Text
local Checkbox = Foundation.Checkbox
local Dialog = Foundation.Dialog
local InputSize = Foundation.Enums.InputSize
local DialogSize = Foundation.Enums.DialogSize
local ButtonVariant = Foundation.Enums.ButtonVariant
local EnumsOrientation = Foundation.Enums.Orientation
local IconName = Foundation.Enums.IconName
local getIconRichText = Foundation.Utility.getIconRichText

return function(t1: {[any]: any}) --[[ PurchaseConfirmationModal ]] -- line: 39
	-- upvalues: useNavigation (copy), useProfileAnalyticsContext (copy), useDispatch (copy), useProfileWrapperContext (copy), React (copy), AvatarSaveContext (copy), useLocalization (copy), EventNames (copy), PurchaseBulkItems (copy), HandlePurchaseItemsSuccess (copy), NumberLocalization (copy), LocalizationService (copy), getIconRichText (copy), IconName (copy), View (copy), FoundationText (copy), Dialog (copy), DialogSize (copy), Checkbox (copy), InputSize (copy), EnumsOrientation (copy), ButtonVariant (copy)
	local v29 = useNavigation()
	local v30 = useProfileAnalyticsContext()
	local v31 = useDispatch()
	local v32 = useProfileWrapperContext()
	local v33 = React.useContext(AvatarSaveContext)
	local v34 = t1.navigation.state.params or {}
	local v35 = v34.totalPrice or 0
	local v36 = v34.purchasableLineItems or {}
	local v37 = v34.userId or ""
	local v38 = v34.purchasedWearIds or {}
	local v39 = v34.ownedAssetIds or {}
	local v40 = v34.wearTypeMap or {}
	local v41 = useLocalization({
		buyTitle = "IAPExperience.PurchasePrompt.Header.BuyAvatar",
		buyAction = "IAPExperience.PurchasePrompt.Action.Buy",
		totalPrice = "IAPExperience.PurchasePrompt.Label.TotalPriceV2",
		wearAfterPurchase = "Feature.Catalog.Label.WearAvatarAfterPurchase",
		purchaseSuccessSingular = {
			"Feature.Avatar.Message.LooksPurchaseSuccessSingular",
			numItems = 1
		},
		purchaseSuccessPlural = {
			"Feature.Avatar.Message.LooksPurchaseSuccessPlural",
			numItems = #v36
		},
		purchasePartialFailure = "Feature.Avatar.Heading.LooksPurchasePartialSuccess"
	})
	local v42 = React.useMemo(function() -- line: 67
		-- upvalues: v41 (copy)
		return {
			purchaseSuccessSingular = v41.purchaseSuccessSingular,
			purchaseSuccessPlural = v41.purchaseSuccessPlural,
			purchasePartialFailure = v41.purchasePartialFailure
		}
	end, {
		v41.purchaseSuccessSingular,
		v41.purchaseSuccessPlural,
		v41.purchasePartialFailure
	})
	local v43, v44 = React.useState(false)
	local v45, v46 = React.useState(true)
	local v47 = React.useCallback(function() -- line: 82
		-- upvalues: v43 (copy), v29 (copy)
		if v43 then
			return
		end

		v29.goBack()
	end, {
		v43,
		v29
	})
	local v48 = React.useCallback(function() -- line: 90
		-- upvalues: v43 (copy), v36 (copy), v44 (copy), v30 (copy), EventNames (copy), PurchaseBulkItems (copy), v37 (copy), HandlePurchaseItemsSuccess (copy), v45 (copy), v38 (copy), v39 (copy), v40 (copy), v32 (copy), v33 (copy), v31 (copy), v42 (copy), v29 (copy)
		if v43 or #v36 == 0 then
			return
		end

		v44(true)
		v30.fireAnalyticsEvent(EventNames.CatalogItemOpened, {
			btnContext = "InspectAvatarBuyAll"
		})
		PurchaseBulkItems({
			userId = v37,
			lineItems = v36
		}):andThen(function(p1) -- line: 103
			-- upvalues: HandlePurchaseItemsSuccess (copy), v45 (copy), v38 (copy), v39 (copy), v40 (copy), v32 (copy), v33 (copy), v31 (copy), v42 (copy)
			HandlePurchaseItemsSuccess({
				result = p1,
				isWearAfterPurchaseChecked = v45,
				purchasedWearIds = v38,
				ownedAssetIds = v39,
				wearTypeMap = v40,
				profileWrapperContext = v32,
				avatarSaveContext = v33,
				dispatch = v31,
				localized = v42
			})
		end):finally(function() -- line: 115
			-- upvalues: v44 (copy), v29 (copy)
			v44(false)
			v29.goBack()
		end)
	end, {
		v43,
		v36,
		v37,
		v38,
		v39,
		v40,
		v45,
		v30,
		v29,
		v31,
		v42,
		v32,
		v33
	})
	local v49 = React.useMemo(function() -- line: 137
		-- upvalues: NumberLocalization (copy), v35 (copy), LocalizationService (copy), getIconRichText (copy), IconName (copy)
		local v51 = NumberLocalization.localize(v35, LocalizationService.RobloxLocaleId)

		return `{ getIconRichText(IconName.Robux) } { v51 }`
	end, {
		v35,
		LocalizationService.RobloxLocaleId
	})
	local v50 = React.createElement(View, {
		LayoutOrder = 1,
		tag = "size-full-1300 padding-left-xxsmall padding-right-xxsmall padding-top-small padding-bottom-large"
	}, {
		BorderContainer = React.createElement(View, {
			tag = "auto-xy align-y-center align-x-center radius-medium padding-x-large row stroke-default padding-y-xsmall"
		}, {
			LeftSide = React.createElement(View, {
				LayoutOrder = 1,
				tag = "row align-y-center gap-small padding-y-xsmall",
				Size = UDim2.new(0.5, 0, 1, 0)
			}, {
				Label = React.createElement(FoundationText, {
					LayoutOrder = 1,
					Text = v41.totalPrice,
					tag = "auto-xy text-title-medium content-default text-align-x-left padding-y-xsmall"
				})
			}),
			RightSide = React.createElement(View, {
				LayoutOrder = 2,
				tag = "row align-y-center align-x-right gap-large padding-y-xsmall",
				Size = UDim2.new(0.5, 0, 1, 0)
			}, {
				Price = React.createElement(FoundationText, {
					LayoutOrder = 1,
					Text = v49,
					tag = "auto-xy text-title-medium content-emphasis text-align-x-right padding-y-xsmall",
					RichText = true
				})
			})
		})
	})

	return React.createElement(Dialog.Root, {
		size = DialogSize.Small,
		onClose = v47
	}, {
		DialogTitle = React.createElement(Dialog.Title, {
			LayoutOrder = 1,
			text = v41.buyTitle
		}),
		DialogContent = React.createElement(Dialog.Content, {
			LayoutOrder = 2
		}, {
			Body = React.createElement(View, {
				tag = "col gap-medium auto-y size-full-0 align-x-left"
			}, {
				PriceTotal = v50,
				WearCheckbox = React.createElement(Checkbox, {
					LayoutOrder = 2,
					label = v41.wearAfterPurchase,
					size = InputSize.XSmall,
					isChecked = v45,
					onActivated = function() --[[ onActivated ]] -- line: 193
						-- upvalues: v46 (copy), v45 (copy)
						v46(not v45)
					end,
					isDisabled = v43
				})
			})
		}),
		DialogActions = React.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			orientation = EnumsOrientation.Horizontal,
			actions = {{
				text = v41.buyAction,
				variant = ButtonVariant.Emphasis,
				onActivated = v48
			}}
		})
	})
end

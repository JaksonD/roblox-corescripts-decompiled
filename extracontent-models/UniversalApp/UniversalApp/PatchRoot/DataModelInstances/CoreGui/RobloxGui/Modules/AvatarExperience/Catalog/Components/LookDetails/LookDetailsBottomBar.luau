local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local CorePackages = game:GetService("CorePackages")
local Roact = require(CorePackages.Packages.Roact)
local UIBlox = require(CorePackages.Packages.UIBlox)
local Cryo = require(CorePackages.Packages.Cryo)
local AvatarExperienceSlotBasedEditor = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor)
local AvatarExperienceCommon = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local NumberLocalization = require(CorePackages.Workspace.Packages.Localization).NumberLocalization
local isGamepadInput = require(CorePackages.Workspace.Packages.RoactUtils).isGamepadInput
local Images = UIBlox.App.ImageSet.Images
local RoactGamepad = require(CorePackages.Packages.RoactGamepad)
local Modules = CoreGui.RobloxGui.Modules
local Utils = require(Modules.AvatarExperience.Common.Utils)

require(Modules.AvatarExperience.Common.AvatarExperienceState)

local Analytics = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local RoactLocalization = require(Modules.LuaApp.Services.RoactLocalization)
local RoactNetworking = require(Modules.LuaApp.Services.RoactNetworking)
local AvatarExperienceNavigation = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigation.Enums.AvatarScreen
local useAvatarRoute = AvatarExperienceNavigation.AvatarRoute.Hooks.useAvatarRoute
local NavigateWithLock = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock
local SetLookFavorite = require(Modules.AvatarExperience.Catalog.Thunks.SetLookFavorite)
local ActionBar = require(Modules.AvatarExperience.Catalog.Components.ActionBar.ActionBar)
local logOnOverlayClosed = AvatarExperienceNavigation.Debug.logOnOverlayClosed
local ReportLook = require(Modules.AvatarExperience.Catalog.Thunks.ReportLook)
local NavigationUtils = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)

require(Modules.AvatarExperience.Common.Components.ItemDetails.Prompts.ContextFrame)

local Constants = require(Modules.AvatarExperience.Common.Constants)
local useLookUnifiedPurchaseFlow = require(Modules.AvatarExperience.Catalog.Hooks.useLookUnifiedPurchaseFlow)
local AvatarEditorSubcategories = AvatarExperienceSlotBasedEditor.Enums.AvatarEditorSubcategories
local AvatarEditorCategories = AvatarExperienceSlotBasedEditor.Enums.AvatarEditorCategories
local Constants2 = require(Modules.AvatarExperience.Common.Constants)
local GetAvatarEditorCategories = require(Modules.AvatarExperience.AvatarEditor.GetAvatarEditorCategories)
local Constants3 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local SetTryOnManagerPeekViewState = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.SetTryOnManagerPeekViewState
local SetFullView = require(Modules.AvatarExperience.Common.Thunks.SetFullView)
local FullView = AvatarExperienceCommon.Enums.FullView
local PeekViewState = require(CorePackages.Workspace.Packages.PeekView).PeekViewState
local LookDetailsBottomBarUtils = require(Modules.AvatarExperience.Catalog.Components.LookDetails.LookDetailsBottomBarUtils)
local CatalogConstants = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local React = require(CorePackages.Packages.React)
local useStyle = UIBlox.Core.Style.useStyle
local useDesignTokens = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local useDispatch = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local useNavigation = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local useShareButton = require(Modules.AvatarExperience.Common.Hooks.useShareButton)
local useFavoriteButton = require(Modules.AvatarExperience.Common.Hooks.useFavoriteButton)
local useRoactService = require(Modules.LuaApp.Hooks.useRoactService)
local useLocalization = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local useSelector = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local GetFFlagEnableLookFavoriting = require(Modules.AvatarExperience.Flags.GetFFlagEnableLookFavoriting)
local getUseSelectorDeepEquals = AvatarExperienceCommon.Utils.getUseSelectorDeepEquals
local selectTryOnsLookId = AvatarExperienceCommon.State.Selectors.selectTryOnsLookId
local useFocusController = RoactGamepad.useFocusController

require(Modules.AvatarExperience.Common.Reducers.CollectiblesItemInfo)
require(Modules.AvatarExperience.Common.Reducers.CollectiblesResellableInstances)
require(Modules.AvatarExperience.Common.Reducers.CollectiblesResellersInstances)

local SetCurrentToastMessage = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local ToastType = require(Modules.LuaApp.Enum.ToastType)
local v56 = game:DefineFastFlag("AXHideShareButtonForContextMenu", false)
local AvatarExperienceFlags = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlags.FFlagAXMISEnableMultiShopping
local FFlagAXEnableUnifiedPurchaseFlowForLooks = AvatarExperienceFlags.FFlagAXEnableUnifiedPurchaseFlowForLooks
local FFlagAXCatalogMakeupSupport = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogMakeupSupport
local PurchasePromptLite = require(CorePackages.Workspace.Packages.PurchasePromptLite)
local getTTIEventName = PurchasePromptLite.getTTIEventName
local TimeToInteractiveTracker = require(CorePackages.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker
local ProductPurchaseSurface = PurchasePromptLite.Enums.ProductPurchaseSurface
local getIsUserEligibleForUnifiedPurchaseFlow = PurchasePromptLite.getIsUserEligibleForUnifiedPurchaseFlow

require(Modules.AvatarExperience.Common.Reducers.OutfitTryOn)
require(Modules.AvatarExperience.Common.Reducers.Looks)
require(Modules.AvatarExperience.Common.Types)

local FFlagUnifiedPurchaseFlowMarketplaceUIImprovements = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FFlagAXFixLookDetailsContextualMenu = AvatarExperienceFlags.FFlagAXFixLookDetailsContextualMenu
local FFlagAddPerformanceMetricsToUnifiedPurchaseModal = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAddPerformanceMetricsToUnifiedPurchaseModal
local FFlagAXLaunchUnifiedPurchaseFlowMarketplaceLooks = AvatarExperienceFlags.FFlagAXLaunchUnifiedPurchaseFlowMarketplaceLooks
local FFlagAXFixLookLinkToCustomize = AvatarExperienceFlags.FFlagAXFixLookLinkToCustomize
local FFlagAXBlackbirdRoot = AvatarExperienceFlags.FFlagAXBlackbirdRoot
local FFlagAXMISEnableMultiShoppingUnifiedEvents = AvatarExperienceFlags.FFlagAXMISEnableMultiShoppingUnifiedEvents
local v74 = game:DefineFastFlag("HideLookDiscountPercentWithIneligibleItems", false)
local FIntBlackbirdUpsellMinPriceForDiscountInclusive = require(CorePackages.Workspace.Packages.SharedFlags).FIntBlackbirdUpsellMinPriceForDiscountInclusive
local FIntBlackbirdUpsellMaxPriceForDiscountInclusive = require(CorePackages.Workspace.Packages.SharedFlags).FIntBlackbirdUpsellMaxPriceForDiscountInclusive
local v77 = Images["icons/common/robux"]
local v78 = Images["icons/actions/block"]
local v79 = Images["icons/menu/avatar_on"]
local v80 = Images["icons/actions/feedback"]
local v81 = Images["icons/actions/info"]
local v82 = Images["icons/actions/edit/delete"]

local function selectTryOnItems(p1) -- line: 137
	return p1.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
end
local function selectLookId(p2) -- line: 140
	return p2.AvatarExperience.AvatarScene.OutfitTryOn.LookId
end
local function selectLookDetails(p3) -- line: 143
	return p3.AvatarExperience.AvatarScene.Looks
end
local function selectLocalUserId(p4) -- line: 146
	return p4.LocalUserId
end
local function selectUserRobux(p5) -- line: 149
	return p5.UserRobux
end
local function selectCollectiblesItemInfo(p6) -- line: 152
	return p6.AvatarExperience.Common.Collectibles.CollectiblesItemInfo
end
local function selectCollectiblesResellersInstances(p7) -- line: 155
	return p7.AvatarExperience.Common.Collectibles.CollectiblesResellersInstances
end
local function selectResellableInstances(p8) -- line: 158
	return p8.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances
end
local function selectPeekViewState(p9) -- line: 161
	return p9.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState
end

local u92 = nil

if FFlagAXEnableUnifiedPurchaseFlowForLooks then
	function u92(p10) -- line: 166
		return p10.AvatarExperience.AvatarScene.OutfitTryOn.LookAnalyticsInfo
	end
end

local u93 = nil

if FFlagAXMISEnableMultiShoppingUnifiedEvents then
	function u93(p11) -- line: 173
		return p11.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookAnalyticsInfo
	end
end

local function v94(p12, p13, p14, p15, p16, s1: string?) -- line: 199
	-- upvalues: LookDetailsBottomBarUtils (copy), FFlagAXBlackbirdRoot (copy), v74 (copy), FIntBlackbirdUpsellMaxPriceForDiscountInclusive (copy), FIntBlackbirdUpsellMinPriceForDiscountInclusive (copy), Cryo (copy)
	local n1 = 0
	local n2 = 0
	local n3 = 0
	local t1 = {}
	local v125 = false
	local v126 = false
	local v127 = false

	for _, v129 in p12 do
		if v129.selectedInTryOnManager then
			n1 += 1

			local v130 = LookDetailsBottomBarUtils.getItemInfo(v129.itemId, v129.itemType, p16, s1)

			if not v130 then
				if not v125 then
					v125 = true
				end
			elseif not v130 or not v130.quantityOwned or not (v130.quantityOwned > 0) then
				local v131 = LookDetailsBottomBarUtils.getPriceForItem(v130, p13, p14, p15, v129.selectedTimedOptionIndex)

				if v131 ~= nil then
					if FFlagAXBlackbirdRoot then
						if v130 and v130.discountInformation then
							local v132 = false

							if v129.selectedTimedOptionIndex and v130.timedOptions then
								local v133 = v130.timedOptions[v129.selectedTimedOptionIndex]

								if v133 and v133.discountInformation then
									n3 += v133.discountInformation.originalPrice
									v132 = true
								elseif v133 and not v133.discountInformation and v133.days ~= 0 then
									n3 += v133.price
									v132 = true
								end
							end

							if not v132 then
								n3 += v130.discountInformation.originalPrice
							end
						else
							n3 += v131
						end

						if v74 then
							local v134 = if not v130 or not v130.discountInformation then v131 else v130.discountInformation.originalPrice
							local v135 = FIntBlackbirdUpsellMaxPriceForDiscountInclusive
							local v136 = v134 <= FIntBlackbirdUpsellMinPriceForDiscountInclusive or v135 ~= 0 and v135 <= v134

							if v130 and v130.discountInformation and not v136 then
								v126 = true
							else
								v127 = true
							end
						end
					end

					n2 += v131
					t1[v129.itemId] = Cryo.Dictionary.join(v129, {
						expectedPrice = v131
					})
				end
			end
		end
	end

	local v137 = if not FFlagAXBlackbirdRoot then nil else n3

	if v74 then
		return n2, n1, t1, v125, v137, v126 and v127
	end

	return n2, n1, t1, v125, v137, nil
end

local t2 = {
	addToMyAvatarsLabel = if not FFlagAXEnableUnifiedPurchaseFlowForLooks then nil else "Feature.Avatar.Label.Title.AddToMyAvatars",
	wearAfterPurchaseLabel = if not FFlagAXEnableUnifiedPurchaseFlowForLooks then nil else "Feature.Catalog.Label.WearAfterPurchase",
	wearAvatarAfterPurchaseLabel = if not FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then nil else "Feature.Catalog.Label.WearAvatarAfterPurchase",
	saveAsCharacterLabel = if not FFlagUnifiedPurchaseFlowMarketplaceUIImprovements then nil else "Feature.Catalog.Label.SaveAsCharacter",
	saveAsMakeupLookLabel = if not FFlagAXCatalogMakeupSupport then nil else "Feature.Avatar.Label.Title.AddToMyMakeupLooks",
	wearAfterPurchaseMakeupLabel = if not FFlagAXCatalogMakeupSupport then nil else "Feature.Avatar.Label.Title.WearAfterPurchase",
	freeText = "Feature.Catalog.LabelFree",
	reportText = "Feature.Catalog.Action.Report",
	viewDetailsPageLabel = "Feature.Catalog.Action.ViewDetailsPage",
	deleteAvatarLabel = "Feature.Catalog.Action.DeleteAvatar"
}

return function(t3: {[any]: any}) --[[ LookDetailsBottomBar ]] -- line: 326
	-- upvalues: UserInputService (copy), React (copy), isGamepadInput (copy), FFlagAXEnableUnifiedPurchaseFlowForLooks (copy), FFlagAXLaunchUnifiedPurchaseFlowMarketplaceLooks (copy), useAvatarRoute (copy), useDispatch (copy), useSelector (copy), selectLookDetails (copy), getUseSelectorDeepEquals (copy), FFlagAXCatalogMakeupSupport (copy), FFlagAXMISEnableMultiShopping (copy), selectTryOnsLookId (copy), selectLookId (copy), GetFFlagEnableLookFavoriting (copy), useNavigation (copy), useRoactService (copy), RoactNetworking (copy), RoactLocalization (copy), Analytics (copy), u92 (ref), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), u93 (ref), Constants (copy), useLocalization (copy), t2 (copy), useStyle (copy), useDesignTokens (copy), selectTryOnItems (copy), selectLocalUserId (copy), selectUserRobux (copy), selectCollectiblesItemInfo (copy), selectCollectiblesResellersInstances (copy), selectResellableInstances (copy), selectPeekViewState (copy), NavigationUtils (copy), SetLookFavorite (copy), SetCurrentToastMessage (copy), ToastType (copy), useFavoriteButton (copy), Cryo (copy), getIsUserEligibleForUnifiedPurchaseFlow (copy), AvatarScreen (copy), useShareButton (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), useFocusController (copy), SetFullView (copy), FullView (copy), SetTryOnManagerPeekViewState (copy), PeekViewState (copy), CatalogConstants (copy), logOnOverlayClosed (copy), NavigateWithLock (copy), FFlagAXFixLookDetailsContextualMenu (copy), v81 (copy), v56 (copy), v82 (copy), v80 (copy), ReportLook (copy), LookDetailsBottomBarUtils (copy), v94 (copy), Constants2 (copy), FFlagAXFixLookLinkToCustomize (copy), Utils (copy), AvatarEditorSubcategories (copy), AvatarEditorCategories (copy), Constants3 (copy), GetAvatarEditorCategories (copy), FFlagAddPerformanceMetricsToUnifiedPurchaseModal (copy), getTTIEventName (copy), ProductPurchaseSurface (copy), TimeToInteractiveTracker (copy), useLookUnifiedPurchaseFlow (copy), FFlagAXBlackbirdRoot (copy), v77 (copy), v79 (copy), v78 (copy), NumberLocalization (copy), Roact (copy), ActionBar (copy)
	local LastInputType = UserInputService:GetLastInputType()
	local v140, _ = React.useState(isGamepadInput(LastInputType))
	local v142, v143 = React.useState(false)
	local v144 = nil
	local u145 = nil

	if FFlagAXEnableUnifiedPurchaseFlowForLooks and not FFlagAXLaunchUnifiedPurchaseFlowMarketplaceLooks then
		local v146

		v144, v146 = React.useState(false)
		u145 = v146
	end

	local v147 = useAvatarRoute()
	local v148 = useDispatch()
	local v149 = useSelector(selectLookDetails, getUseSelectorDeepEquals())
	local v150 = useSelector(if not FFlagAXCatalogMakeupSupport or not FFlagAXMISEnableMultiShopping then selectLookId else selectTryOnsLookId, getUseSelectorDeepEquals())
	local v151 = not not GetFFlagEnableLookFavoriting() and (v150 ~= nil and (v149[v150] ~= nil and (v149[v150].isFavorited or false)))
	local v152 = useNavigation()
	local v153 = useRoactService(RoactNetworking)
	local v154 = useRoactService(RoactLocalization)
	local v155 = useRoactService(Analytics)
	local v156 = nil

	if FFlagAXEnableUnifiedPurchaseFlowForLooks then
		v156 = useSelector(u92, getUseSelectorDeepEquals())
	end

	local v157 = nil
	local v158 = nil

	if FFlagAXMISEnableMultiShoppingUnifiedEvents then
		v158 = useSelector(u93, getUseSelectorDeepEquals())
		v157 = not not v150 and (not not v149 and (not not v149[v150] and v149[v150].lookType == Constants.LookType.Makeup))
	end

	local v159 = useLocalization(t2)
	local v160 = useStyle()
	local Theme = v160.Theme
	local Font = v160.Font
	local v163 = useDesignTokens()
	local v164 = useSelector(selectTryOnItems, getUseSelectorDeepEquals())
	local v165 = useSelector(selectLocalUserId, getUseSelectorDeepEquals())
	local v166 = useSelector(selectUserRobux, getUseSelectorDeepEquals())[v165]
	local v167 = useSelector(selectCollectiblesItemInfo, getUseSelectorDeepEquals())
	local v168 = useSelector(selectCollectiblesResellersInstances, getUseSelectorDeepEquals())
	local v169 = useSelector(selectResellableInstances, getUseSelectorDeepEquals())
	local v170 = useSelector(selectPeekViewState, getUseSelectorDeepEquals())
	local v171 = if not GetFFlagEnableLookFavoriting() then nil else React.useCallback(function(p17) -- line: 390
		-- upvalues: NavigationUtils (copy), v151 (copy), FFlagAXCatalogMakeupSupport (copy), v150 (copy), v149 (copy), v148 (copy), SetLookFavorite (copy), v153 (copy), SetCurrentToastMessage (copy), ToastType (copy)
		NavigationUtils.closeOverlay(p17)

		local v213 = not v151

		if FFlagAXCatalogMakeupSupport then
			local v214 = if not v150 or not v149[v150] then nil else v149[v150].lookType

			v148(SetLookFavorite(v153, v150, v213, v214))
		else
			v148(SetLookFavorite(v153, v150, v213))
		end

		v148(SetCurrentToastMessage({
			toastMessage = not v213 and "Feature.Catalog.Toast.UnfavoritedLook" or "Feature.Catalog.Toast.FavoritedLook",
			toastType = ToastType.SuccessConfirmation
		}))
	end, {
		v148,
		SetCurrentToastMessage,
		SetLookFavorite,
		v150,
		v149,
		v153,
		v151,
		v152
	})
	local v172 = if not GetFFlagEnableLookFavoriting() then nil else useFavoriteButton(v150, v151, v171)
	local v173 = if not FFlagAXMISEnableMultiShopping then nil else React.useMemo(function() -- line: 427
		-- upvalues: t3 (copy), v150 (copy), v149 (copy), Cryo (copy)
		if not t3.alwaysBuyAll then
			return nil
		end

		if v150 and v149 then
			return Cryo.Dictionary.union(v149[v150].lookAssetInfos or {}, v149[v150].lookBundleInfos or {})
		end

		return {}
	end, {
		v150,
		v149,
		t3.alwaysBuyAll
	})

	if FFlagAXEnableUnifiedPurchaseFlowForLooks and not FFlagAXLaunchUnifiedPurchaseFlowMarketplaceLooks then
		React.useEffect(function() -- line: 446
			-- upvalues: getIsUserEligibleForUnifiedPurchaseFlow (copy), v153 (copy), u145 (ref)
			getIsUserEligibleForUnifiedPurchaseFlow(v153):andThen(function(b1: boolean) -- line: 448
				-- upvalues: u145 (ref)
				u145(b1)
			end):catch(function(_) -- line: 451
				-- upvalues: u145 (ref)
				u145(false)
			end)
		end, { v153 })
	end

	local v174 = React.useCallback(function() -- line: 459
		-- upvalues: v148 (copy), SetCurrentToastMessage (copy), ToastType (copy)
		v148(SetCurrentToastMessage({
			toastMessage = "Feature.Catalog.Toast.AvatarUnderReview",
			toastType = ToastType.NetworkingError
		}))
	end, { v148 })
	local v175 = React.useMemo(function() -- line: 465
		-- upvalues: v149 (copy), v150 (copy), Constants (copy)
		if v149 and v150 then
			return v149[v150].moderationStatus == Constants.ModerationStatus.Moderated
		end

		return false
	end, {
		v149,
		v150
	})
	local v176 = React.useMemo(function() -- line: 472
		-- upvalues: v149 (copy), v150 (copy), Constants (copy)
		if v149 and v150 then
			return v149[v150].moderationStatus == Constants.ModerationStatus.PendingModeration
		end

		return false
	end, {
		v149,
		v150
	})
	local v177 = React.useMemo(function() -- line: 479
		-- upvalues: v147 (copy), AvatarScreen (copy)
		return v147 and (v147.opaque and v147.opaque.name == AvatarScreen.MySharedAvatars)
	end, { v147 })
	local v178 = useShareButton(v150, Constants.ItemType.Look, true, nil, v176 and v174 or nil)
	local v179 = if not FFlagAXMigrateAXToGlobalAutofocus then useFocusController() else nil
	local v180 = React.useCallback(function(p19) -- line: 498
		-- upvalues: v155 (copy), Constants (copy), v148 (copy), SetFullView (copy), v147 (copy), FullView (copy), SetTryOnManagerPeekViewState (copy), PeekViewState (copy), NavigationUtils (copy)
		v155.sendAXCounter(Constants.Counter.ContextFrame.ViewDetailsPageClick)
		v148(SetFullView(v155, v147.opaque.name, FullView.None))
		v148(SetTryOnManagerPeekViewState(PeekViewState.Brief))
		NavigationUtils.closeOverlay(p19)
	end, {
		v155,
		v148,
		v147
	})
	local v181 = React.useMemo(function() -- line: 505
		-- upvalues: v165 (copy), v149 (copy), v150 (copy), CatalogConstants (copy)
		if v165 and (v149 and v150) then
			local v216 = v149[v150]

			return v216 and (v216.curator and (tostring(v216.curator.id) == tostring(v165) and v216.curator.type == CatalogConstants.CreatorType.User))
		end

		return false
	end, {
		v149,
		v150,
		v165
	})
	local v182 = React.useCallback(function() -- line: 518
		-- upvalues: v140 (copy), v147 (copy), AvatarScreen (copy), logOnOverlayClosed (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), v179 (copy)
		if v140 and v147.current.name == AvatarScreen.LookDetails then
			logOnOverlayClosed("LookDetails")

			if not FFlagAXMigrateAXToGlobalAutofocus then
				v179.captureFocus()
			end
		end
	end, {
		v140,
		v147,
		if not FFlagAXMigrateAXToGlobalAutofocus then v179 else nil
	})
	local v183 = React.useCallback(function(p20) -- line: 535
		-- upvalues: v155 (copy), Constants (copy), NavigationUtils (copy), AvatarScreen (copy), v182 (copy), v150 (copy), v152 (copy), v148 (copy), NavigateWithLock (copy)
		v155.sendAXCounter(Constants.Counter.ContextFrame.DeleteAvatarClick)
		NavigationUtils.closeOverlay(p20)
		v148(NavigateWithLock(function() -- line: 538
			-- upvalues: AvatarScreen (copy), v182 (copy), v150 (copy), v152 (copy)
			local DeleteAvatarConfirmationPrompt = AvatarScreen.DeleteAvatarConfirmationPrompt
			local t4 = {
				onOverlayClosed = v182,
				lookId = v150
			}

			v152.navigate(DeleteAvatarConfirmationPrompt, t4)
		end))
	end, {
		v155,
		v148,
		v150,
		v182
	})
	local v184 = React.useCallback(function() -- line: 550
		-- upvalues: v170 (copy), PeekViewState (copy), FFlagAXFixLookDetailsContextualMenu (copy), v81 (copy), v159 (copy), v180 (copy), GetFFlagEnableLookFavoriting (copy), v175 (copy), v172 (copy), v56 (copy), v177 (copy), v178 (copy), v181 (copy), v82 (copy), v183 (copy), v80 (copy), v148 (copy), ReportLook (copy), v153 (copy), NavigationUtils (copy)
		local v218 = v170 == PeekViewState.SuperBrief

		if FFlagAXFixLookDetailsContextualMenu then
			local t5 = {}

			if v218 then
				table.insert(t5, {
					icon = v81,
					text = v159.viewDetailsPageLabel,
					onActivated = v180
				})
			end

			if GetFFlagEnableLookFavoriting() and not v175 then
				table.insert(t5, v172)
			end

			if not v56 and not v175 and not v177 then
				table.insert(t5, v178)
			end

			if v181 and v177 then
				table.insert(t5, {
					icon = v82,
					text = v159.deleteAvatarLabel,
					onActivated = v183
				})
			end

			if not v181 then
				table.insert(t5, {
					icon = v80,
					text = v159.reportText,
					onActivated = function(p21) --[[ onActivated ]] -- line: 585
						-- upvalues: v148 (copy), ReportLook (copy), v153 (copy), NavigationUtils (copy)
						v148(ReportLook(v153))
						NavigationUtils.closeOverlay(p21)
					end
				})
			end

			return t5
		end

		return {
			if v218 then {
				icon = v81,
				text = v159.viewDetailsPageLabel,
				onActivated = v180
			} else nil,
			if not GetFFlagEnableLookFavoriting() or v175 then nil else v172,
			if v56 or (v175 or v177) then nil else v178,
			if not v181 or not v177 then nil else {
				icon = v82,
				text = v159.deleteAvatarLabel,
				onActivated = v183
			},
			if not v181 then {
				icon = v80,
				text = v159.reportText,
				onActivated = function(p22) --[[ onActivated ]] -- line: 620
					-- upvalues: v148 (copy), ReportLook (copy), v153 (copy), NavigationUtils (copy)
					v148(ReportLook(v153))
					NavigationUtils.closeOverlay(p22)
				end
			} else nil
		}
	end, {
		v153,
		v159,
		v180,
		v183,
		v181,
		v148,
		v178,
		if not GetFFlagEnableLookFavoriting() then nil else v172,
		if not GetFFlagEnableLookFavoriting() then nil else v151,
		if not GetFFlagEnableLookFavoriting() then nil else v170,
		v175,
		v177
	})
	local v185 = React.useCallback(function() -- line: 644
		-- upvalues: v143 (copy), v182 (copy)
		v143(false)
		v182()
	end, { v182 })
	local v186 = React.useCallback(function() -- line: 650
		-- upvalues: v184 (copy), v80 (copy), v159 (copy), v148 (copy), ReportLook (copy), v153 (copy), NavigationUtils (copy), v56 (copy), v175 (copy), v177 (copy), v178 (copy), v152 (copy), AvatarScreen (copy), t3 (copy), v185 (copy), NavigateWithLock (copy)
		v148(NavigateWithLock(function() -- line: 651
			-- upvalues: v184 (copy), v80 (copy), v159 (copy), v148 (copy), ReportLook (copy), v153 (copy), NavigationUtils (copy), v56 (copy), v175 (copy), v177 (copy), v178 (copy), v152 (copy), AvatarScreen (copy), t3 (copy), v185 (copy)
			local v259 = if not v184 then {
				{
					icon = v80,
					text = v159.reportText,
					onActivated = function(p23) --[[ onActivated ]] -- line: 658
						-- upvalues: v148 (copy), ReportLook (copy), v153 (copy), NavigationUtils (copy)
						v148(ReportLook(v153))
						NavigationUtils.closeOverlay(p23)
					end
				},
				if v56 or (v175 or v177) then nil else v178
			} else v184()

			v152.navigate(AvatarScreen.ContextMenu, {
				centered = t3.centered,
				contextButtons = v259,
				onOverlayClosed = v185
			})
		end))
	end, {
		v152,
		v148,
		v185,
		v159,
		v153,
		v178,
		v184
	})
	local v187 = nil
	local v188 = nil
	local v189 = nil
	local v190, v192, v193, v194, u195

	if FFlagAXMISEnableMultiShopping and t3.alwaysBuyAll then
		local v191

		v190, v187, v188, v191, v192, v193, v194 = LookDetailsBottomBarUtils.getBottomBarInfoMIS(v173, v167, v168, v169, v149, v150, v164)
		u195 = v191
	else
		local v196

		v190, v189, v192, v196, v193, v194 = v94(v164, v167, v168, v169, v149, v150)
		u195 = v196
	end

	local u197 = if not FFlagAXMISEnableMultiShopping or (not v173 or not t3.alwaysBuyAll) then React.useCallback(function() -- line: 827
		-- upvalues: v94 (copy), v164 (copy), v167 (copy), v168 (copy), v169 (copy), v149 (copy), v150 (copy), FFlagAddPerformanceMetricsToUnifiedPurchaseModal (copy), getTTIEventName (copy), ProductPurchaseSurface (copy), TimeToInteractiveTracker (copy), v166 (copy), AvatarScreen (copy), v182 (copy), v155 (copy), Constants2 (copy), Cryo (copy), FFlagAXFixLookLinkToCustomize (copy), Utils (copy), Constants (copy), AvatarEditorSubcategories (copy), AvatarEditorCategories (copy), Constants3 (copy), GetAvatarEditorCategories (copy), LookDetailsBottomBarUtils (copy), v147 (copy), t3 (copy), NavigationUtils (copy), v152 (copy), v148 (copy), NavigateWithLock (copy)
		local v232, _, v234 = v94(v164, v167, v168, v169, v149, v150)
		local InsufficientRobuxPrompt = nil

		if FFlagAddPerformanceMetricsToUnifiedPurchaseModal then
			local v236 = getTTIEventName(ProductPurchaseSurface.Catalog)

			TimeToInteractiveTracker.trackStart(v236)
			TimeToInteractiveTracker.updateMetadata(v236, {
				page = ProductPurchaseSurface.Catalog,
				category = "legacy_purchase_modal"
			})
		end

		local t6

		if v232 > v166 then
			InsufficientRobuxPrompt = AvatarScreen.InsufficientRobuxPrompt
			t6 = {
				onOverlayClosed = v182
			}
			v155.sendAXCounter(Constants2.Counter.AvatarWidget.AvatarsWidgetBuyClickedInsufficientRobux)
		elseif Cryo.isEmpty(v234) and v150 ~= nil then
			local v238, v239

			if FFlagAXFixLookLinkToCustomize then
				v238, v239 = Utils.GetAvatarEditorCategoryIdsFromNavKey(if v149[v150].lookType ~= Constants.LookType.Makeup then AvatarEditorCategories.Avatars else AvatarEditorSubcategories.MakeupLooks)
			else
				local CharacterKey = Constants3.CharacterKey

				v238 = nil

				for v241, v242 in (GetAvatarEditorCategories()) do
					if CharacterKey == v242.Name then
						v238 = v241

						break
					end
				end

				v239 = nil
			end

			InsufficientRobuxPrompt = AvatarScreen.LeaveCatalogToAvatarPrompt
			t6 = {
				onOverlayClosed = v182,
				categoryOverride = v238,
				subcategoryOverride = v239
			}
			v155.sendAXCounter(Constants2.Counter.AvatarWidget.AvatarsWidgetBuyClickedNoItemsToPurchase)
		else
			local v243 = LookDetailsBottomBarUtils.getOwnedTryOnItems(v164, v149, v150)

			if v150 ~= nil then
				InsufficientRobuxPrompt = AvatarScreen.PurchaseLookPrompt
				t6 = {
					itemsToPurchase = v234,
					lookId = v150,
					ownedTryOnItems = v243,
					priceInRobux = v232,
					showSaveAsCharacter = true,
					showWearAfterPurchase = true,
					fromAvatarRoute = v147,
					isTryOnFromOutsideAX = t3.isTryOnFromOutsideAX
				}

				if NavigationUtils.isWithinViewContext(v147, AvatarScreen.CatalogSearch) then
					v155.sendAXCounter(Constants2.Counter.AvatarWidget.AvatarsWidgetSearchBuyClicked)
				else
					v155.sendAXCounter(Constants2.Counter.AvatarWidget.AvatarsWidgetHomeBuyClicked)
				end
			else
				v155.sendAXCounter(Constants2.Counter.AvatarWidget.AvatarsWidgetBuyClickedMissingLookId)
				t6 = {
					onOverlayClosed = v182
				}
			end
		end

		v148(NavigateWithLock(function() -- line: 925
			-- upvalues: v152 (copy), InsufficientRobuxPrompt (ref), t6 (ref)
			v152.navigate(InsufficientRobuxPrompt, t6)
		end))
	end, {
		v164,
		v167,
		v168,
		v169,
		v149,
		v150,
		v166,
		v148,
		v152,
		v182,
		v155,
		v147
	}) else React.useCallback(function() -- line: 715
		-- upvalues: LookDetailsBottomBarUtils (copy), v173 (copy), v167 (copy), v168 (copy), v169 (copy), v149 (copy), v150 (copy), v164 (copy), v166 (copy), AvatarScreen (copy), v182 (copy), v155 (copy), Constants2 (copy), FFlagAXFixLookLinkToCustomize (copy), Utils (copy), Constants (copy), AvatarEditorSubcategories (copy), AvatarEditorCategories (copy), Constants3 (copy), GetAvatarEditorCategories (copy), v147 (copy), t3 (copy), NavigationUtils (copy), v152 (copy), v148 (copy), NavigateWithLock (copy)
		local v220, _, v222, _ = LookDetailsBottomBarUtils.getBottomBarInfoMIS(v173, v167, v168, v169, v149, v150, v164)
		local InsufficientRobuxPrompt = nil
		local t7

		if v220 > v166 then
			InsufficientRobuxPrompt = AvatarScreen.InsufficientRobuxPrompt
			t7 = {
				onOverlayClosed = v182
			}
			v155.sendAXCounter(Constants2.Counter.AvatarWidget.AvatarsWidgetBuyClickedInsufficientRobux)
		elseif v222 == 0 and v150 ~= nil then
			local v226, v227

			if FFlagAXFixLookLinkToCustomize then
				v226, v227 = Utils.GetAvatarEditorCategoryIdsFromNavKey(if v149[v150].lookType ~= Constants.LookType.Makeup then AvatarEditorCategories.Avatars else AvatarEditorSubcategories.MakeupLooks)
			else
				local CharacterKey = Constants3.CharacterKey

				v226 = nil

				for v229, v230 in (GetAvatarEditorCategories()) do
					if CharacterKey == v230.Name then
						v226 = v229

						break
					end
				end

				v227 = nil
			end

			InsufficientRobuxPrompt = AvatarScreen.LeaveCatalogToAvatarPrompt
			t7 = {
				onOverlayClosed = v182,
				categoryOverride = v226,
				subcategoryOverride = v227
			}
			v155.sendAXCounter(Constants2.Counter.AvatarWidget.AvatarsWidgetBuyClickedNoItemsToPurchase)
		else
			local v231 = LookDetailsBottomBarUtils.getOwnedItemsInLook(v173, v149, v150)

			if v150 ~= nil then
				InsufficientRobuxPrompt = AvatarScreen.PurchaseLookPrompt
				t7 = {
					lookId = v150,
					priceInRobux = v220,
					showSaveAsCharacter = true,
					showWearAfterPurchase = true,
					fromAvatarRoute = v147,
					allLookItems = v173,
					ownedItemsInLook = v231,
					isTryOnFromOutsideAX = t3.isTryOnFromOutsideAX
				}

				if NavigationUtils.isWithinViewContext(v147, AvatarScreen.CatalogSearch) then
					v155.sendAXCounter(Constants2.Counter.AvatarWidget.AvatarsWidgetSearchBuyClicked)
				else
					v155.sendAXCounter(Constants2.Counter.AvatarWidget.AvatarsWidgetHomeBuyClicked)
				end
			else
				v155.sendAXCounter(Constants2.Counter.AvatarWidget.AvatarsWidgetBuyClickedMissingLookId)
				t7 = {
					onOverlayClosed = v182
				}
			end
		end

		v148(NavigateWithLock(function() -- line: 805
			-- upvalues: v152 (copy), InsufficientRobuxPrompt (ref), t7 (ref)
			v152.navigate(InsufficientRobuxPrompt, t7)
		end))
	end, {
		v167,
		v168,
		v169,
		v149,
		v150,
		v166,
		v148,
		v152,
		v182,
		v155,
		v147,
		v173,
		v164
	})

	if FFlagAXEnableUnifiedPurchaseFlowForLooks then
		local onButtonPressWithUnifiedPurchaseFlow = useLookUnifiedPurchaseFlow({
			lookId = v150,
			totalPrice = v190,
			originalPrice = if not FFlagAXBlackbirdRoot then nil else v193,
			tryOnItems = v164,
			lookDetailsObj = v149,
			lookAnalyticsInfo = if not FFlagAXMISEnableMultiShoppingUnifiedEvents or not v157 then v156 else v158,
			localized = v159,
			isTryOnFromOutsideAX = t3.isTryOnFromOutsideAX,
			itemsToPurchase = v192,
			userRobux = v166,
			onOverlayClosed = v182,
			hasNonDiscountedItems = v194
		}).onButtonPressWithUnifiedPurchaseFlow

		if FFlagAXLaunchUnifiedPurchaseFlowMarketplaceLooks then
			u197 = onButtonPressWithUnifiedPurchaseFlow
		elseif v144 then
			u197 = onButtonPressWithUnifiedPurchaseFlow
		end
	end

	local v199 = if not FFlagAXMISEnableMultiShopping or not t3.alwaysBuyAll then React.useCallback(function() -- line: 975
		-- upvalues: v164 (copy), LookDetailsBottomBarUtils (copy), v149 (copy), v150 (copy)
		local n4 = 0

		for _, v246 in v164 do
			if not v246.selectedInTryOnManager then
				continue
			end

			local v247 = LookDetailsBottomBarUtils.getItemInfo(v246.itemId, v246.itemType, v149, v150)

			if not v247 or not v247.quantityOwned or v247.quantityOwned == 0 then
				return false
			end

			n4 += 1
		end

		return n4 > 0
	end, {
		v164,
		v149,
		v150
	}) else nil
	local v200 = if not FFlagAXMISEnableMultiShopping then nil else React.useCallback(function(p24) -- line: 998
		-- upvalues: v173 (copy), t3 (copy), LookDetailsBottomBarUtils (copy), v149 (copy)
		if v173 == nil or not t3.alwaysBuyAll then
			return false
		end

		local n5 = 0

		for _, v251 in v173 do
			local v252 = if not v251.itemType then nil else LookDetailsBottomBarUtils.getItemInfo(v251.id, v251.itemType, v149, p24)

			if not v252 or not v252.quantityOwned or v252.quantityOwned == 0 then
				return false
			end

			n5 += 1
		end

		return n5 > 0
	end, {
		v149,
		v173,
		t3.alwaysBuyAll
	})
	local u201 = v77
	local u202 = false
	local v203 = v192 and Cryo.isEmpty(v192)

	if FFlagAXMISEnableMultiShopping and t3.alwaysBuyAll then
		v203 = v188 == 0
	end

	local s2

	if v203 then
		s2 = ""

		local v205 = v199 and v199()

		if FFlagAXMISEnableMultiShopping and t3.alwaysBuyAll then
			v205 = v200 and v200(v150) ~= nil
		end

		if v150 ~= nil and v205 then
			u201 = v79
		else
			u201 = v78
			u202 = true
		end
	elseif v190 == 0 then
		u201 = nil
		s2 = v159.freeText
	else
		s2 = NumberLocalization.localize(string.format("%.0f", v190), v154:GetLocale())
	end

	if v166 == nil then
		u202 = true
	end

	local v206 = v154:Format("Feature.Avatar.Label.TryOnManagerDescriptor", {
		numItems = if not FFlagAXMISEnableMultiShopping or not t3.alwaysBuyAll then v189 else v187
	})
	local hideDescriptor = t3.hideDescriptor
	local v208 = Roact.createElement("TextLabel", {
		LayoutOrder = 1,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, v163.Global.Size_400),
		Text = v206,
		TextSize = Font.BaseSize * Font.Header2.RelativeSize,
		Font = Font.Header2.Font,
		TextColor3 = Theme.SecondaryContent.Color,
		TextTransparency = Theme.SecondaryContent.Transparency,
		TextTruncate = Enum.TextTruncate.AtEnd,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top
	})
	local v209 = React.useCallback(function() -- line: 1078
		-- upvalues: v186 (copy), v143 (copy)
		v186()
		v143(true)
	end, {
		v186,
		v143
	})
	local v210 = React.useMemo(function() -- line: 1083
		-- upvalues: s2 (ref), u201 (ref), u195 (ref), u202 (ref), v163 (copy), FFlagAXMISEnableMultiShopping (copy), v160 (copy), u197 (ref)
		return {
			buttonText = s2,
			buttonIcon = u201,
			buttonIsLoading = u195,
			buttonIsDisabled = u202,
			buttonIconPadding = v163.Global.Space_50,
			buttonIconSize = if not FFlagAXMISEnableMultiShopping then v163.Global.Size_400 else v163.Global.Size_250,
			buttonColor = v160.Theme.ContextualPrimaryDefault.Color,
			buttonTextColor = v160.Theme.ContextualPrimaryContent.Color,
			onActivated = not u202 and u197 or nil
		}
	end, {
		s2,
		u201,
		u195,
		u202,
		v163,
		v160,
		u197
	})
	local v211 = v177 and (not v175 and v178 ~= nil)

	return Roact.createElement(ActionBar, {
		bottomPadding = 0,
		buttonProps = v210,
		hideGradient = true,
		isMoreButtonSelected = v142,
		leftPadding = 0,
		onMoreButtonActivated = v209,
		rightPadding = 0,
		showMoreButton = true,
		showMiddleButton = v211,
		onMiddleButtonActivated = if not v211 then nil else v178.onActivated,
		middleButtonIcon = if not v211 then nil else v178.icon,
		topComponent = if not hideDescriptor then v208 else nil,
		topComponentHeight = if not hideDescriptor then v163.Global.Size_400 else 0,
		ZIndex = 1
	})
end

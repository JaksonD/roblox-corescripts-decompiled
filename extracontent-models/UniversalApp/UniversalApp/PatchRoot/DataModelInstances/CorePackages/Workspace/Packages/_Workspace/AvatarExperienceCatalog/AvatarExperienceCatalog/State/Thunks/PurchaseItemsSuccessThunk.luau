local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local AvatarExperienceCatalogParent = AvatarExperienceCatalog.Parent
local mutedError = require(AvatarExperienceCatalogParent.Loggers).mutedError
local PurchaseItemsSuccess = require(AvatarExperienceCatalog.State.Actions.PurchaseItemsSuccess)
local AvatarExperienceAnalytics = require(AvatarExperienceCatalogParent.AvatarExperienceAnalytics)
local AvatarExperienceNavigation = require(AvatarExperienceCatalogParent.AvatarExperienceNavigation)
local UnifiedSelectionListStore = AvatarExperienceAnalytics.Store.UnifiedSelectionListStore
local sendUnifiedEventsForMultiItemShopping = AvatarExperienceAnalytics.sendUnifiedEventsForMultiItemShopping
local UnifiedEventLogEnums = AvatarExperienceAnalytics.UnifiedEventLogEnums
local getUnifiedEventsForMIS = AvatarExperienceAnalytics.Utils.getUnifiedEventsForMIS
local CartIdService = AvatarExperienceAnalytics.Lib.CartIdService
local AvatarScreenProperties = AvatarExperienceNavigation.AvatarRoute.AvatarScreenProperties
local AvatarExperienceFlags = require(AvatarExperienceCatalogParent.AvatarExperienceFlags)
local FFlagAXMISEnableMultiShoppingUnifiedEvents = AvatarExperienceFlags.FFlagAXMISEnableMultiShoppingUnifiedEvents
local FFlagAXFixAvatarLooksSaveWithMakeupItems = AvatarExperienceFlags.FFlagAXFixAvatarLooksSaveWithMakeupItems
local FFlagAXMISSaveWearFix = AvatarExperienceFlags.FFlagAXMISSaveWearFix

if FFlagAXMISEnableMultiShoppingUnifiedEvents then
	return function(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12: ((...any) -> ...any)?) -- line: 22
		-- upvalues: AvatarScreenProperties (copy), sendUnifiedEventsForMultiItemShopping (copy), getUnifiedEventsForMIS (copy), UnifiedEventLogEnums (copy), mutedError (copy), CartIdService (copy), UnifiedSelectionListStore (copy), FFlagAXMISSaveWearFix (copy), PurchaseItemsSuccess (copy)
		return function(p13, _) -- line: 36
			-- upvalues: AvatarScreenProperties (copy), p10 (copy), p11 (copy), sendUnifiedEventsForMultiItemShopping (copy), getUnifiedEventsForMIS (copy), p1 (copy), p7 (copy), UnifiedEventLogEnums (copy), mutedError (copy), CartIdService (copy), UnifiedSelectionListStore (copy), FFlagAXMISSaveWearFix (copy), p12 (copy), p5 (ref), p8 (copy), PurchaseItemsSuccess (copy), p2 (copy), p3 (copy), p9 (copy), p4 (copy), p6 (copy)
			local v42 = p13:getState()
			local v43 = AvatarScreenProperties[v42.Navigation and (v42.Navigation.currentRoute and v42.Navigation.currentRoute.routeName)]
			local v44 = if not v43 or not v43.analyticsData then nil else v43.analyticsData.unifiedLoggingSurface

			if not pcall(function() -- line: 47
				-- upvalues: p10 (copy), v42 (copy), p11 (copy), sendUnifiedEventsForMultiItemShopping (copy), getUnifiedEventsForMIS (copy), p1 (copy), p7 (copy), UnifiedEventLogEnums (copy), v44 (copy)
				if p10 then
					p10.isOrganicLook = v42.AvatarExperience.AvatarScene.OutfitTryOn.LookAnalyticsInfo == nil
				end

				if p11 then
					p11.isOrganicLook = v42.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookAnalyticsInfo == nil
				end

				sendUnifiedEventsForMultiItemShopping(getUnifiedEventsForMIS(p1, p7, p10, p11, UnifiedEventLogEnums.MarketplaceUnifiedAction.PURCHASE_SUCCESS), v44)
			end) then
				mutedError("Failed to send unified events for multi-item shopping purchase success")
			end

			CartIdService.refreshCartId()
			UnifiedSelectionListStore.clearSelectionList()

			local v45 = if not FFlagAXMISSaveWearFix or not p12 then nil else p12(v42, p7)
			local t1 = {}

			if FFlagAXMISSaveWearFix and v45 then
				for _, v48 in v45:GetChildren() do
					if v48:IsA("MakeupDescription") then
						t1[tostring(v48.assetId)] = v48.order
					end
				end
			end

			if p5 == nil then
				local v49 = p8(v42, p7)

				p5 = if not v49 then nil else v49.scales
			end

			p13:dispatch(PurchaseItemsSuccess({
				items = p1,
				equippableAssets = p2,
				replaceAllEquippedAssets = p3,
				shouldClearEquippedMakeup = if not FFlagAXMISSaveWearFix then nil else p9,
				bodyColor3s = p4,
				bodyScales = p5,
				bodyPartColorRangeIds = p6,
				makeupAssetsOnHumanoid = if not FFlagAXMISSaveWearFix then nil else t1
			}))
		end
	end
end

return function(p15, p16, p17, p18, p19, p20, p21, p22, p23) -- line: 118
	-- upvalues: PurchaseItemsSuccess (copy), FFlagAXFixAvatarLooksSaveWithMakeupItems (copy)
	return function(p24, _) -- line: 129
		-- upvalues: p19 (ref), p22 (copy), p21 (copy), PurchaseItemsSuccess (copy), p15 (copy), p16 (copy), p17 (copy), FFlagAXFixAvatarLooksSaveWithMakeupItems (copy), p23 (copy), p18 (copy), p20 (copy)
		local v52 = p24:getState()

		if p19 == nil then
			local v53 = p22(v52, p21)

			p19 = if not v53 then nil else v53.scales
		end

		p24:dispatch(PurchaseItemsSuccess({
			items = p15,
			equippableAssets = p16,
			replaceAllEquippedAssets = p17,
			shouldClearEquippedMakeup = if not FFlagAXFixAvatarLooksSaveWithMakeupItems then nil else p23,
			bodyColor3s = p18,
			bodyScales = p19,
			bodyPartColorRangeIds = p20
		}))
	end
end

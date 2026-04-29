local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local Modules = CoreGui.RobloxGui.Modules
local Roact = require(CorePackages.Packages.Roact)
local RoactRodux = require(CorePackages.Packages.RoactRodux)
local CatalogConstants = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local Constants = require(Modules.AvatarExperience.Common.Constants)
local ItemData = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local CatalogItemCardContainer = require(Modules.AvatarExperience.Catalog.Components.ItemsList.CatalogItemCardContainer)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local RetrievalStatus = require(Modules.LuaApp.Enum.RetrievalStatus)
local ClearTryOns = require(Modules.AvatarExperience.Common.Actions.ClearTryOns)

require(Modules.AvatarExperience.Common.AvatarExperienceState)

local v13 = Roact.PureComponent:extend("RecommendedItemCard")

function v13.didUpdate(p1, p2) -- line: 23
	-- upvalues: RetrievalStatus (copy)
	local getRecommendedItems = p1.props.getRecommendedItems
	local clearTryOns = p1.props.clearTryOns

	if p2.purchasingStatus == RetrievalStatus.Fetching and p1.props.purchasingStatus == RetrievalStatus.Done then
		getRecommendedItems()
		clearTryOns()
	end
end
function v13.render(p3) -- line: 36
	-- upvalues: Roact (copy), CatalogItemCardContainer (copy), Constants (copy), CatalogConstants (copy)
	local itemId = p3.props.itemId
	local itemType = p3.props.itemType
	local index = p3.props.index
	local itemDetailsPeekViewRefs = p3.props.itemDetailsPeekViewRefs
	local resultsListRef = p3.props.resultsListRef

	return Roact.createElement(CatalogItemCardContainer, {
		itemId = itemId,
		itemType = itemType,
		index = index,
		analyticsItemCountPerPage = Constants.NumRecommendedItems,
		analyticsContext = CatalogConstants.AnalyticsContext.AvatarEditorRecommendedItem,
		itemDetailsPeekViewRefs = itemDetailsPeekViewRefs,
		resultsListRef = resultsListRef,
		isTitleVisible = true,
		isPriceVisible = true,
		gridInformation = p3.props.gridInformation
	})
end

return RoactRodux.connect(function(p4, p5) --[[ mapStateToProps ]] -- line: 57
	-- upvalues: ItemData (copy), PerformFetch (copy), CatalogConstants (copy)
	local v26 = ItemData(p4.AvatarExperience.Common, p5.itemId, p5.itemType)
	local v27 = v26 and (not not v26.product and tostring(v26.product.id)) or ""
	local v28 = nil

	if v27 then
		v28 = PerformFetch.GetStatus(p4, CatalogConstants.PurchaseProductKey .. v27)
	end

	return {
		purchasingStatus = v28
	}
end, function(p6) --[[ mapDispatchToProps ]] -- line: 72
	-- upvalues: ClearTryOns (copy)
	return {
		clearTryOns = function() --[[ clearTryOns ]] -- line: 74
			-- upvalues: p6 (copy), ClearTryOns (copy)
			p6(ClearTryOns())
		end
	}
end)(v13)

local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local NotificationService = game:GetService("NotificationService")
local Modules = CoreGui.RobloxGui.Modules
local Cryo = require(CorePackages.Packages.Cryo)
local Roact = require(CorePackages.Packages.Roact)
local RoactRodux = require(CorePackages.Packages.RoactRodux)
local UIBlox = require(CorePackages.Packages.UIBlox)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworking = require(Modules.LuaApp.Services.RoactNetworking)
local Utils = require(Modules.AvatarExperience.Common.Utils)
local Constants = require(Modules.AvatarExperience.Common.Constants)
local DeepLinkUtils = require(Modules.AvatarExperience.Common.DeepLinkUtils)
local FetchDataWithErrorToasts = require(Modules.LuaApp.Thunks.FetchDataWithErrorToasts)
local SetSearchParameters = require(Modules.LuaApp.Actions.SetSearchParameters)

require(Modules.AvatarExperience.Common.AvatarExperienceState)

local CatalogCategories = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.CatalogCategories
local Images = UIBlox.App.ImageSet.Images
local PageButton = require(Modules.AvatarExperience.Common.Components.Landing.PageButton)
local RetrievalStatus = require(Modules.LuaApp.Enum.RetrievalStatus)
local withLocalization = require(CorePackages.Workspace.Packages.Localization).withLocalization
local t = require(CorePackages.Packages.t)
local FetchCatalogSearchWithSponsoredItems = require(Modules.AvatarExperience.Catalog.Thunks.FetchCatalogSearchWithSponsoredItems)
local UserLib = require(CorePackages.Workspace.Packages.UserLib)
local Constants2 = UserLib.Utils.Constants
local getRbxthumbWithTypeSizeAndOptions = UserLib.Utils.getRbxthumbWithTypeSizeAndOptions

require(Modules.AvatarExperience.Catalog.SearchTypes)
require(CorePackages.Packages.LuauPolyfill)

local Asset = Constants2.RbxthumbTypes.Asset
local BundleThumbnail = Constants2.RbxthumbTypes.BundleThumbnail
local v29 = Images["icons/menu/shop_large"]
local v30 = CatalogCategories.Recommended:rawValue()
local GetFFlagAXDisableCatalogFetchOnDeepLinkForConsole = require(Modules.AvatarExperience.Flags.GetFFlagAXDisableCatalogFetchOnDeepLinkForConsole)
local v32 = Roact.PureComponent:extend("CatalogPageButton")
local AvatarExperienceFlags = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXCatalogCategoriesStore = AvatarExperienceFlags.FFlagAXCatalogCategoriesStore
local FFlagAXDefaultCatalogCategoryId = AvatarExperienceFlags.FFlagAXDefaultCatalogCategoryId
local FFlagAXMigrateAllTabToSduiDev = AvatarExperienceFlags.FFlagAXMigrateAllTabToSduiDev
local FFlagAXFixCatalogPageButtonSduiCrash = AvatarExperienceFlags.FFlagAXFixCatalogPageButtonSduiCrash
local GetCatalogCategoriesStore = require(Modules.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore)

v32.validateProps = t.strictInterface({
	transparencyModifier = t.number,
	NextSelectionLeft = t.optional(t.table),
	NextSelectionRight = t.optional(t.table),
	NextSelectionUp = t.optional(t.table),
	NextSelectionDown = t.optional(t.table),
	onActivated = t.callback,
	networking = t.callback,
	forwardRef = t.optional(t.table),
	catalogItem = t.optional(t.table),
	dataStatus = t.string,
	externalNavigationRequest = if not GetFFlagAXDisableCatalogFetchOnDeepLinkForConsole() then nil else t.optional(t.table),
	setSearchParameters = t.callback,
	fetchCatalogData = t.callback
})
v32.defaultProps = {
	transparencyModifier = 0
}

local vector2 = Vector2.new(0, 0)

function v32.init(p1) -- line: 98
	-- upvalues: NotificationService (copy), FFlagAXFixCatalogPageButtonSduiCrash (copy), Utils (copy), FFlagAXMigrateAllTabToSduiDev (copy), FFlagAXDefaultCatalogCategoryId (copy), Constants (copy), v30 (copy), GetCatalogCategoriesStore (copy), FFlagAXCatalogCategoriesStore (copy)
	p1.state = {
		style = string.lower(NotificationService.SelectedTheme)
	}

	function p1.fetchInitialCatalogItems() -- line: 103
		-- upvalues: p1 (copy), FFlagAXFixCatalogPageButtonSduiCrash (copy), Utils (copy), FFlagAXMigrateAllTabToSduiDev (copy), FFlagAXDefaultCatalogCategoryId (copy), Constants (copy), v30 (copy), GetCatalogCategoriesStore (copy), FFlagAXCatalogCategoriesStore (copy)
		local networking = p1.props.networking

		if not FFlagAXFixCatalogPageButtonSduiCrash then
			Utils.getCatalogCategoryInfo(1, 0)
		end

		local v75

		if FFlagAXMigrateAllTabToSduiDev then
			local v74 = if not FFlagAXDefaultCatalogCategoryId then v30 else Constants.DefaultCatalogCategoryId

			v75 = GetCatalogCategoriesStore.getCatalogCategoriesStore().getCategoriesMap(false)[v74] or Utils.getCatalogCategoryInfoById(v74, nil)
		elseif FFlagAXCatalogCategoriesStore then
			local v76 = if not FFlagAXDefaultCatalogCategoryId then v30 else Constants.DefaultCatalogCategoryId

			v75 = Utils.getCatalogCategoryInfoById(v76, nil)
		else
			local v77 = if not FFlagAXDefaultCatalogCategoryId then v30 else Constants.DefaultCatalogCategoryId

			v75 = Utils.getCatalogCategoryInfoById(v77, nil)
		end

		local t1 = {
			searchUuid = v75.SearchUuid,
			categoryInfo = v75
		}

		p1.props.setSearchParameters(t1.searchUuid, t1)

		return p1.props.fetchCatalogData(networking, t1)
	end
end
function v32.render(p2) -- line: 156
	-- upvalues: Constants (copy), getRbxthumbWithTypeSizeAndOptions (copy), BundleThumbnail (copy), Asset (copy), withLocalization (copy), Roact (copy), PageButton (copy), vector2 (copy), v29 (copy)
	local catalogItem = p2.props.catalogItem
	local style = p2.state.style
	local transparencyModifier = p2.props.transparencyModifier
	local NextSelectionLeft = p2.props.NextSelectionLeft
	local NextSelectionRight = p2.props.NextSelectionRight
	local NextSelectionUp = p2.props.NextSelectionUp
	local NextSelectionDown = p2.props.NextSelectionDown
	local s1 = "rbxasset://textures/AvatarEditorImages/Catalog_LightTheme.png"

	if style == "dark" then
		s1 = "rbxasset://textures/AvatarEditorImages/Catalog.png"
	end

	local u52 = nil
	local n1 = 420

	if catalogItem then
		if catalogItem.type == Constants.ItemType.Bundle then
			u52 = getRbxthumbWithTypeSizeAndOptions(catalogItem.id, BundleThumbnail, 420)
			n1 = 420
		else
			u52 = getRbxthumbWithTypeSizeAndOptions(catalogItem.id, Asset, 420)
			n1 = 420
		end
	end

	local forwardRef = p2.props.forwardRef

	return withLocalization({
		catalogText = "Feature.Avatar.Action.Marketplace"
	})(function(p3) -- line: 194
		-- upvalues: Roact (copy), PageButton (copy), s1 (ref), u52 (ref), n1 (ref), vector2 (copy), v29 (copy), transparencyModifier (copy), NextSelectionLeft (copy), NextSelectionRight (copy), NextSelectionUp (copy), NextSelectionDown (copy), forwardRef (copy), p2 (copy)
		return Roact.createElement(PageButton, {
			Size = UDim2.new(1, 0, 1, 0),
			backgroundImage = s1,
			thumbnailImage = u52,
			thumbnailSize = n1,
			thumbnailScaleOffset = vector2,
			icon = v29,
			text = p3.catalogText,
			transparencyModifier = transparencyModifier,
			NextSelectionLeft = NextSelectionLeft,
			NextSelectionRight = NextSelectionRight,
			NextSelectionUp = NextSelectionUp,
			NextSelectionDown = NextSelectionDown,
			[Roact.Ref] = forwardRef,
			onActivated = p2.props.onActivated
		})
	end)
end
function v32.checkFetchSortData(p4) -- line: 217
	-- upvalues: GetFFlagAXDisableCatalogFetchOnDeepLinkForConsole (copy), DeepLinkUtils (copy), RetrievalStatus (copy)
	if GetFFlagAXDisableCatalogFetchOnDeepLinkForConsole() and DeepLinkUtils.catalogDeepLinkExists(p4.props.externalNavigationRequest) then
		return
	end

	local v56 = p4.props.dataStatus == RetrievalStatus.NotStarted

	if p4.props.catalogItem == nil and v56 then
		p4.fetchInitialCatalogItems()
	end
end
function v32.didUpdate(p5) -- line: 239
	p5:checkFetchSortData()
end
function v32.didMount(p6) -- line: 243
	-- upvalues: NotificationService (copy)
	p6.themeChangedConn = NotificationService:GetPropertyChangedSignal("SelectedTheme"):Connect(function() -- line: 244
		-- upvalues: p6 (copy), NotificationService (copy)
		p6:setState({
			style = string.lower(NotificationService.SelectedTheme)
		})
	end)
	p6:checkFetchSortData()
end
function v32.willUnmount(p7) -- line: 253
	if p7.themeChangedConn then
		p7.themeChangedConn:Disconnect()
		p7.themeChangedConn = nil
	end
end

local v40 = RoactServices.connect({
	networking = RoactNetworking
})(v32)
local u41 = RoactRodux.connect(function(p8) --[[ mapStateToProps ]] -- line: 260
	-- upvalues: FFlagAXMigrateAllTabToSduiDev (copy), FFlagAXDefaultCatalogCategoryId (copy), Constants (copy), v30 (copy), GetCatalogCategoriesStore (copy), Utils (copy), PerformFetch (copy), GetFFlagAXDisableCatalogFetchOnDeepLinkForConsole (copy)
	local v62

	if FFlagAXMigrateAllTabToSduiDev then
		local v61 = if not FFlagAXDefaultCatalogCategoryId then v30 else Constants.DefaultCatalogCategoryId

		v62 = GetCatalogCategoriesStore.getCatalogCategoriesStore().getCategoriesMap(false)[v61] or Utils.getCatalogCategoryInfoById(v61, nil)
	else
		v62 = Utils.getCatalogCategoryInfo(1, 0)
	end

	local SearchUuid = v62.SearchUuid

	assert(SearchUuid ~= nil, "searchUuid is not nil. Silence type checker")

	local v64 = p8.Search.SearchesInCatalog[SearchUuid] or {}
	local v65 = v64 and v64.items or {}
	local v66 = Utils.getSearchKey(p8, SearchUuid)
	local v67 = v65[1]
	local v68 = PerformFetch.GetStatus(p8, v66)
	local v69 = if not GetFFlagAXDisableCatalogFetchOnDeepLinkForConsole() then {} else p8.AvatarExperience.ExternalNavigationRequest

	return {
		catalogItem = v67,
		dataStatus = v68,
		externalNavigationRequest = if not GetFFlagAXDisableCatalogFetchOnDeepLinkForConsole() then nil else v69
	}
end, function(p9) --[[ mapDispatchToProps ]] -- line: 301
	-- upvalues: FetchDataWithErrorToasts (copy), FetchCatalogSearchWithSponsoredItems (copy), SetSearchParameters (copy)
	return {
		fetchCatalogData = function(p10: ((...any) -> ...any), p11) --[[ fetchCatalogData ]] -- line: 303
			-- upvalues: p9 (copy), FetchDataWithErrorToasts (copy), FetchCatalogSearchWithSponsoredItems (copy)
			return p9(FetchDataWithErrorToasts(FetchCatalogSearchWithSponsoredItems(p10, p11)))
		end,
		setSearchParameters = function(p12, p13) --[[ setSearchParameters ]] -- line: 312
			-- upvalues: p9 (copy), SetSearchParameters (copy)
			return p9(SetSearchParameters(p12, p13))
		end
	}
end)(v40)

return Roact.forwardRef(function(p14, p15) -- line: 324
	-- upvalues: Roact (copy), u41 (ref), Cryo (copy)
	return Roact.createElement(u41, Cryo.Dictionary.join(p14, {
		forwardRef = p15
	}))
end)

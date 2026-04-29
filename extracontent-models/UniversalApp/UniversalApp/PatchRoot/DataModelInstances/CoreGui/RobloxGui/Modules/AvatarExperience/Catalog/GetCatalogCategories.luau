local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local AvatarExperienceCommon = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local Constants = AvatarExperienceCommon.Constants
local Modules = CoreGui.RobloxGui.Modules
local Constants2 = require(Modules.AvatarExperience.Common.Constants)
local SearchUuid = require(Modules.LuaApp.SearchUuid)
local getClothingCategories = require(Modules.AvatarExperience.Common.getClothingCategories)
local ArgCheck = require(CorePackages.Workspace.Packages.ArgCheck)
local AvatarExperienceCommon2 = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local CatalogCategories = AvatarExperienceCommon2.Enums.CatalogCategories
local CatalogSubcategories = AvatarExperienceCommon2.Enums.CatalogSubcategories
local CatalogCategoryIds = AvatarExperienceCommon2.Enums.CatalogCategoryIds
local CatalogSubcategoryIds = AvatarExperienceCommon2.Enums.CatalogSubcategoryIds
local CatalogCategoryTaxonomyUUIDs = require(Modules.AvatarExperience.Common.Enum.CatalogCategoryTaxonomyUUIDs)
local IxpUtils = require(CorePackages.Workspace.Packages.IxpUtils)
local AXAvatarsTabIXP = AvatarExperienceCommon.Experiments.AXAvatarsTabIXP
local GetFIntMinSecsToRefreshRecommendedCatalogPage = require(Modules.AvatarExperience.Flags.GetFIntMinSecsToRefreshRecommendedCatalogPage)
local AvatarExperienceFlags = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagRemoveClassicHeadsAndFaces = AvatarExperienceFlags.FFlagRemoveClassicHeadsAndFaces
local FFlagAXCatalogCategoryTooltip = AvatarExperienceFlags.FFlagAXCatalogCategoryTooltip
local FFlagAXMigrateCategoryTooltip = AvatarExperienceFlags.FFlagAXMigrateCategoryTooltip
local FFlagAXRemoveCatalogCategoryNavKey = AvatarExperienceFlags.FFlagAXRemoveCatalogCategoryNavKey
local FFlagAXCatalogSupportDisableFilters = AvatarExperienceFlags.FFlagAXCatalogSupportDisableFilters
local FFlagAXLooksWidgetContextForOrganicContent = AvatarExperienceFlags.FFlagAXLooksWidgetContextForOrganicContent
local FFlagAXCatalogMakeupSupport = AvatarExperienceFlags.FFlagAXCatalogMakeupSupport
local FIntAXMakeupCategoryPosition = AvatarExperienceFlags.FIntAXMakeupCategoryPosition
local FFlagAXMakeupCategoryPositionExperiment = AvatarExperienceFlags.FFlagAXMakeupCategoryPositionExperiment
local FFlagAXCatalogMakeupTaxonomy = AvatarExperienceFlags.FFlagAXCatalogMakeupTaxonomy
local FFlagAXCatalogCategoriesSDUI = AvatarExperienceFlags.FFlagAXCatalogCategoriesSDUI
local FFlagAXFixWidgetOnlyTabNoItemsFound = AvatarExperienceFlags.FFlagAXFixWidgetOnlyTabNoItemsFound
local FFlagAXCatalogM41Props = AvatarExperienceFlags.FFlagAXCatalogM41Props
local FFlagAXCatalogM41FullMasks = AvatarExperienceFlags.FFlagAXCatalogM41FullMasks
local FFlagAXCatalogM41HandAndArm = AvatarExperienceFlags.FFlagAXCatalogM41HandAndArm
local FFlagAXCatalogCategoriesFlaggedMap = AvatarExperienceFlags.FFlagAXCatalogCategoriesFlaggedMap
local FFlagAXM41AllCategoriesToTaxonomy = AvatarExperienceFlags.FFlagAXM41AllCategoriesToTaxonomy
local FFlagAXAddHDCatalogTab = AvatarExperienceFlags.FFlagAXAddHDCatalogTab
local v38 = game:DefineFastInt("AXHDCatalogTabPosition", 2)
local v39 = game:DefineFastString("AXBodyCategoryTooltipKey", "BodyCategoryCatalogTooltip")

local function buildCategoriesMap() -- line: 53
	-- upvalues: FFlagAXCatalogCategoriesFlaggedMap (copy), AXAvatarsTabIXP (copy), IxpUtils (copy), CatalogCategories (copy), FFlagAXRemoveCatalogCategoryNavKey (copy), FFlagAXCatalogSupportDisableFilters (copy), SearchUuid (copy), GetFIntMinSecsToRefreshRecommendedCatalogPage (copy), CatalogCategoryIds (copy), FFlagAXCatalogCategoriesSDUI (copy), FFlagAXFixWidgetOnlyTabNoItemsFound (copy), FFlagAXM41AllCategoriesToTaxonomy (copy), CatalogCategoryTaxonomyUUIDs (copy), Constants2 (copy), FFlagAXCatalogM41Props (copy), FFlagAXAddHDCatalogTab (copy), FFlagAXCatalogMakeupSupport (copy), CatalogSubcategories (copy), Constants (copy), FFlagAXCatalogMakeupTaxonomy (copy), CatalogSubcategoryIds (copy), FFlagAXCatalogM41FullMasks (copy), FFlagAXCatalogM41HandAndArm (copy), FFlagRemoveClassicHeadsAndFaces (copy), FFlagAXLooksWidgetContextForOrganicContent (copy), FFlagAXMigrateCategoryTooltip (copy), v39 (copy), FFlagAXCatalogCategoryTooltip (copy), getClothingCategories (copy), v38 (copy), FFlagAXMakeupCategoryPositionExperiment (copy), FIntAXMakeupCategoryPosition (copy)
	if not FFlagAXCatalogCategoriesFlaggedMap then
		return {}
	end

	local v44 = if not AXAvatarsTabIXP.isEnabled() then nil else IxpUtils.readTestVariable(AXAvatarsTabIXP.EnabledForUser)
	local t1 = {
		Id = CatalogCategories.Recommended:rawValue(),
		Name = "All",
		NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogCategories.Recommended else nil,
		Title = "Feature.Avatar.Heading.All",
		CategoryFilter = "Recommended",
		DisableFilters = not FFlagAXCatalogSupportDisableFilters or nil,
		ShowSponsored = true,
		ShowWidgets = true,
		ShowTopics = true,
		CanAnimateCameraBasedMood = true,
		SearchUuid = SearchUuid(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
		CategoryId = CatalogCategoryIds.All:rawValue(),
		WidgetContext = if not FFlagAXCatalogCategoriesSDUI and not FFlagAXFixWidgetOnlyTabNoItemsFound then nil else "catalog-tab:all",
		TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.AllItems:rawValue()
	}
	local t2 = {
		Id = CatalogCategories.Characters:rawValue(),
		Name = "Characters",
		NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogCategories.Characters else nil,
		Title = "Feature.Catalog.Label.Characters",
		BundleTypes = { Constants2.BundleTypeIdStrings.BodyParts },
		CanAnimateCameraBasedMood = true,
		SearchUuid = SearchUuid(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
		CategoryId = CatalogCategoryIds.Characters:rawValue()
	}
	local v47 = if not FFlagAXCatalogM41Props then nil else {
		Id = CatalogCategories.Props:rawValue(),
		Name = "Props",
		NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogCategories.Props else nil,
		Title = "Feature.Avatar.Label.Props",
		SearchUuid = SearchUuid(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
		TaxonomyUuid = CatalogCategoryTaxonomyUUIDs.Props:rawValue()
	}
	local v48 = if not FFlagAXAddHDCatalogTab then nil else {
		Id = CatalogCategories.HighDefinition:rawValue(),
		Name = "HighDefinition",
		Title = "Feature.Catalog.Label.HD",
		CategoryFilter = "HighDefinition",
		SearchUuid = SearchUuid(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage()
	}
	local t3 = {}
	local t4 = nil

	if FFlagAXCatalogMakeupSupport then
		table.insert(t3, {
			Id = CatalogSubcategories.MakeupLooks:rawValue(),
			Name = "Looks",
			NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.MakeupLooks else nil,
			Title = "Feature.Catalog.Label.MakeupLooks",
			CameraFocus = Constants2.FocusType.Face,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Makeup.FaceMakeup,
			DisableFilters = true,
			SearchUuid = SearchUuid(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
			LooksWidgetContextForOrganicContent = "makeup-tab",
			isSubcategory = true
		})
		table.insert(t3, {
			Id = CatalogSubcategories.EyeMakeup:rawValue(),
			Name = "Eyes",
			NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.EyeMakeup else nil,
			Title = "Feature.Catalog.Label.EyeMakeup",
			CameraFocus = Constants2.FocusType.Face,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Makeup.EyeMakeup,
			AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.EyeMakeup },
			SearchUuid = SearchUuid(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
			isSubcategory = true,
			TaxonomyUuid = if not FFlagAXCatalogMakeupTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.EyeMakeup:rawValue()
		})
		table.insert(t3, {
			Id = CatalogSubcategories.LipMakeup:rawValue(),
			Name = "Lips",
			NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.LipMakeup else nil,
			Title = "Feature.Catalog.Label.LipMakeup",
			CameraFocus = Constants2.FocusType.Face,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Makeup.LipMakeup,
			AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.LipMakeup },
			SearchUuid = SearchUuid(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
			isSubcategory = true,
			TaxonomyUuid = if not FFlagAXCatalogMakeupTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.LipMakeup:rawValue()
		})
		table.insert(t3, {
			Id = CatalogSubcategories.FaceMakeup:rawValue(),
			Name = "Face",
			NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.FaceMakeup else nil,
			Title = "Feature.Catalog.Label.FaceMakeup",
			CameraFocus = Constants2.FocusType.Face,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Makeup.FaceMakeup,
			AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.FaceMakeup },
			SearchUuid = SearchUuid(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
			isSubcategory = true,
			TaxonomyUuid = if not FFlagAXCatalogMakeupTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.FaceMakeup:rawValue()
		})
		table.insert(t3, {
			Id = CatalogSubcategories.Eyelashes:rawValue(),
			Name = "Eyelashes",
			NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.Eyelashes else nil,
			Title = "Feature.Catalog.Label.EyelashMakeup",
			CameraFocus = Constants2.FocusType.Face,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Makeup.Eyelashes,
			AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.EyelashAccessory },
			SearchUuid = SearchUuid(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
			isSubcategory = true,
			TaxonomyUuid = if not FFlagAXCatalogMakeupTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.Eyelashes:rawValue()
		})
		table.insert(t3, {
			Id = CatalogSubcategories.Eyebrows:rawValue(),
			Name = "Eyebrows",
			NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.Eyebrows else nil,
			Title = "Feature.Catalog.Label.EyebrowMakeup",
			CameraFocus = Constants2.FocusType.Face,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Makeup.Eyebrows,
			AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.EyebrowAccessory },
			SearchUuid = SearchUuid(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
			isSubcategory = true,
			TaxonomyUuid = if not FFlagAXCatalogMakeupTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.Eyebrows:rawValue()
		})
		t4 = {
			Id = CatalogCategories.Makeup:rawValue(),
			Name = "Makeup",
			NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogCategories.Makeup else nil,
			Title = "Feature.Catalog.Label.Makeup",
			CameraFocus = Constants2.FocusType.Face,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Makeup.Makeup,
			AssetTypeIdStrings = {
				Constants2.AssetTypeIdStrings.EyelashAccessory,
				Constants2.AssetTypeIdStrings.EyebrowAccessory,
				Constants2.AssetTypeIdStrings.FaceMakeup,
				Constants2.AssetTypeIdStrings.LipMakeup,
				Constants2.AssetTypeIdStrings.EyeMakeup
			},
			CanAnimateCameraBasedMood = true,
			SearchUuid = SearchUuid(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
			Subcategories = t3,
			TaxonomyUuid = if not FFlagAXCatalogMakeupTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.Makeup:rawValue()
		}
	end

	local t5 = {}

	table.insert(t5, {
		Id = CatalogSubcategories.Hats:rawValue(),
		Name = "Hats",
		NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.Hats else nil,
		Title = "Feature.Avatar.Label.Head",
		CameraFocus = Constants2.FocusType.Head,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.CatalogAccessories.Hats,
		AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.Hat },
		SearchUuid = SearchUuid(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
		SubcategoryId = CatalogSubcategoryIds.Hats:rawValue(),
		isSubcategory = true,
		TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.HeadAccessories:rawValue()
	})
	table.insert(t5, {
		Id = CatalogSubcategories.Face:rawValue(),
		Name = "Face",
		NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.Face else nil,
		Title = "Feature.Avatar.Label.Face",
		CameraFocus = Constants2.FocusType.Face,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.CatalogAccessories.Face,
		AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.FaceAccessory },
		SearchUuid = SearchUuid(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
		SubcategoryId = CatalogSubcategoryIds.Face:rawValue(),
		isSubcategory = true,
		TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.FaceAccessories:rawValue()
	})

	if FFlagAXCatalogM41FullMasks then
		table.insert(t5, {
			Id = CatalogSubcategories.FullMasks:rawValue(),
			Name = "Full Masks",
			NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.FullMasks else nil,
			Title = "Feature.Avatar.Label.FullMasks",
			CameraFocus = Constants2.FocusType.Face,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.CatalogAccessories.Face,
			SearchUuid = SearchUuid(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
			isSubcategory = true,
			TaxonomyUuid = CatalogCategoryTaxonomyUUIDs.FullMasks:rawValue()
		})
	end

	table.insert(t5, {
		Id = CatalogSubcategories.Neck:rawValue(),
		Name = "Neck",
		NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.Neck else nil,
		Title = "Feature.Avatar.Label.Neck",
		CameraFocus = Constants2.FocusType.Neck,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.CatalogAccessories.Neck,
		AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.NeckAccessory },
		SearchUuid = SearchUuid(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
		SubcategoryId = CatalogSubcategoryIds.Neck:rawValue(),
		isSubcategory = true,
		TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.NeckAccessories:rawValue()
	})
	table.insert(t5, {
		Id = CatalogSubcategories.Shoulder:rawValue(),
		Name = "Shoulder",
		NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.Shoulder else nil,
		Title = "Feature.Avatar.Label.Shoulder",
		CameraFocus = Constants2.FocusType.Shoulders,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.CatalogAccessories.Shoulder,
		AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.ShoulderAccessory },
		SearchUuid = SearchUuid(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
		SubcategoryId = CatalogSubcategoryIds.Shoulder:rawValue(),
		isSubcategory = true,
		TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.ShoulderAccessories:rawValue()
	})

	if FFlagAXCatalogM41HandAndArm then
		table.insert(t5, {
			Id = CatalogSubcategories.HandAndArm:rawValue(),
			Name = "Hand & Arm",
			NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.HandAndArm else nil,
			Title = "Feature.Avatar.Label.HandAndArm",
			CameraFocus = Constants2.FocusType.Arms,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.CatalogAccessories.Shoulder,
			SearchUuid = SearchUuid(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
			isSubcategory = true,
			TaxonomyUuid = CatalogCategoryTaxonomyUUIDs.HandAndArm:rawValue()
		})
	end

	table.insert(t5, {
		Id = CatalogSubcategories.Front:rawValue(),
		Name = "Front",
		NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.Front else nil,
		Title = "Feature.Avatar.Label.Front",
		CameraFocus = Constants2.FocusType.Arms,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.CatalogAccessories.Front,
		AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.FrontAccessory },
		SearchUuid = SearchUuid(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
		SubcategoryId = CatalogSubcategoryIds.Front:rawValue(),
		isSubcategory = true,
		TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.FrontAccessories:rawValue()
	})
	table.insert(t5, {
		Id = CatalogSubcategories.Back:rawValue(),
		Name = "Back",
		NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.Back else nil,
		Title = "Feature.Avatar.Label.Back",
		CameraFocus = Constants2.FocusType.Arms,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.CatalogAccessories.Back,
		AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.BackAccessory },
		SearchUuid = SearchUuid(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
		SubcategoryId = CatalogSubcategoryIds.Back:rawValue(),
		isSubcategory = true,
		TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.BackAccessories:rawValue()
	})
	table.insert(t5, {
		Id = CatalogSubcategories.Waist:rawValue(),
		Name = "Waist",
		NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.Waist else nil,
		Title = "Feature.Avatar.Label.Waist",
		CameraFocus = Constants2.FocusType.Waist,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.CatalogAccessories.Waist,
		AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.WaistAccessory },
		SearchUuid = SearchUuid(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
		SubcategoryId = CatalogSubcategoryIds.Waist:rawValue(),
		isSubcategory = true,
		TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.WaistAccessories:rawValue()
	})
	table.insert(t5, {
		Id = CatalogSubcategories.Gear:rawValue(),
		Name = "Gear",
		NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.Gear else nil,
		Title = "Feature.Catalog.Label.Gear",
		AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.Gear },
		SearchUuid = SearchUuid(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
		SubcategoryId = CatalogSubcategoryIds.Gear:rawValue(),
		isSubcategory = true,
		TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.Gear:rawValue()
	})

	local t6 = {
		Id = CatalogCategories.Accessories:rawValue(),
		Name = "Accessories",
		NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogCategories.Accessories else nil,
		Title = "Feature.Catalog.LabelAccessories",
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
		AssetTypeIdStrings = {
			Constants2.AssetTypeIdStrings.Hat,
			Constants2.AssetTypeIdStrings.FaceAccessory,
			Constants2.AssetTypeIdStrings.NeckAccessory,
			Constants2.AssetTypeIdStrings.ShoulderAccessory,
			Constants2.AssetTypeIdStrings.FrontAccessory,
			Constants2.AssetTypeIdStrings.BackAccessory,
			Constants2.AssetTypeIdStrings.WaistAccessory,
			Constants2.AssetTypeIdStrings.Gear
		},
		CanAnimateCameraBasedMood = true,
		SearchUuid = SearchUuid(),
		CategoryId = CatalogCategoryIds.Accessories:rawValue(),
		Subcategories = t5,
		TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.Accessories:rawValue()
	}
	local t7 = {}

	table.insert(t7, {
		Id = CatalogSubcategories.Heads:rawValue(),
		Name = "Heads",
		NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.Heads else nil,
		Title = "Feature.Avatar.Label.Heads",
		CameraFocus = Constants2.FocusType.Head,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.BodyCategories.Heads,
		BundleTypes = { Constants2.BundleTypeIdStrings.DynamicHead },
		SearchUuid = SearchUuid(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
		isSubcategory = true,
		TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.DynamicHeads:rawValue()
	})
	table.insert(t7, {
		Id = CatalogSubcategories.Hair:rawValue(),
		Name = "Hair",
		NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.Hair else nil,
		Title = "Feature.Catalog.Label.Hair",
		CameraFocus = Constants2.FocusType.Head,
		CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.BodyCategories.Hair,
		AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.HairAccessory },
		SearchUuid = SearchUuid(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
		isSubcategory = true,
		TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.Hair:rawValue()
	})

	if not FFlagRemoveClassicHeadsAndFaces then
		table.insert(t7, {
			Id = CatalogSubcategories.ClassicHeads:rawValue(),
			Name = "Classic Heads",
			NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.ClassicHeads else nil,
			Title = "Feature.Avatar.Label.ClassicHeads",
			CameraFocus = Constants2.FocusType.Head,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.BodyCategories.ClassicHeads,
			AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.Head },
			SearchUuid = SearchUuid(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
			isSubcategory = true,
			TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.ClassicHeads:rawValue()
		})
		table.insert(t7, {
			Id = CatalogSubcategories.ClassicFaces:rawValue(),
			Name = "Classic Faces",
			NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.ClassicFaces else nil,
			Title = "Feature.Avatar.Label.ClassicFaces",
			CameraFocus = Constants2.FocusType.Face,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.BodyCategories.ClassicFaces,
			AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.Face },
			SearchUuid = SearchUuid(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
			isSubcategory = true,
			TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.ClassicFaces:rawValue()
		})
	end

	local t8 = {
		Id = CatalogCategories.Head:rawValue(),
		Name = "Heads",
		NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogCategories.Head else nil,
		Title = "Feature.Avatar.Label.Heads",
		AssetTypeIdStrings = {
			Constants2.AssetTypeIdStrings.HairAccessory,
			Constants2.AssetTypeIdStrings.Head,
			Constants2.AssetTypeIdStrings.Face,
			Constants2.AssetTypeIdStrings.DynamicHead
		},
		BundleTypes = { Constants2.BundleTypeIdStrings.DynamicHead },
		CanAnimateCameraBasedMood = true,
		SearchUuid = SearchUuid(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
		CategoryId = CatalogCategoryIds.Heads:rawValue(),
		Subcategories = t7
	}
	local t9 = {}

	table.insert(t9, {
		Id = CatalogSubcategories.AnimationBundles:rawValue(),
		Name = "AnimationBundles",
		NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.AnimationBundles else nil,
		Title = "Feature.Catalog.Label.Bundles",
		CameraZoomRadius = Constants2.AnimationCategoryCameraZoomRadius,
		CanAnimateCameraBasedMood = true,
		BundleTypes = { Constants2.BundleTypeIdStrings.Animations },
		PageType = Constants2.PageType.Animation,
		SearchUuid = SearchUuid(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
		SubcategoryId = CatalogSubcategoryIds.AnimationBundles:rawValue(),
		isSubcategory = true,
		TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.AnimationBundles:rawValue()
	})
	table.insert(t9, {
		Id = CatalogSubcategories.Emotes:rawValue(),
		Name = "Emotes",
		NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.Emotes else nil,
		Title = "Feature.Catalog.Label.Emotes",
		CameraZoomRadius = Constants2.AnimationCategoryCameraZoomRadius,
		CanAnimateCameraBasedMood = false,
		AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.EmoteAnimation },
		PageType = Constants2.PageType.Emotes,
		SearchUuid = SearchUuid(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
		SubcategoryId = CatalogSubcategoryIds.Emotes:rawValue(),
		isSubcategory = true,
		TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.Emotes:rawValue()
	})

	local t10 = {
		Id = CatalogCategories.AllAnimations:rawValue(),
		Name = "AllAnimations",
		NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogCategories.AllAnimations else nil,
		Title = "Feature.Avatar.Heading.Animations",
		CategoryId = CatalogCategoryIds.AllAnimations:rawValue(),
		CameraZoomRadius = Constants2.AnimationCategoryCameraZoomRadius,
		AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.EmoteAnimation },
		BundleTypes = { Constants2.BundleTypeIdStrings.Animations },
		PageType = Constants2.PageType.AllAnimation,
		CanAnimateCameraBasedMood = true,
		SearchUuid = SearchUuid(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
		Subcategories = t9,
		TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.Animations:rawValue()
	}
	local t12 = nil
	local t11 = {}
	local t13 = nil

	if v44 then
		t12 = {
			Id = CatalogCategories.Avatars:rawValue(),
			Name = "Avatars",
			NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogCategories.Avatars else nil,
			Title = "Feature.Catalog.Label.Avatars",
			ShowLooksAsOrganicContent = not FFlagAXLooksWidgetContextForOrganicContent or nil,
			LooksWidgetContextForOrganicContent = if not FFlagAXLooksWidgetContextForOrganicContent then nil else "avatarTab",
			CanAnimateCameraBasedMood = true,
			SearchUuid = SearchUuid(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
			DisableFilters = not not FFlagAXCatalogSupportDisableFilters or nil
		}
		table.insert(t11, {
			Id = CatalogSubcategories.FullBodies:rawValue(),
			Name = "Full Bodies",
			NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.FullBodies else nil,
			Title = "Feature.Catalog.Label.FullBodies",
			BundleTypes = { Constants2.BundleTypeIdStrings.BodyParts },
			SearchUuid = SearchUuid(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
			SubcategoryId = CatalogSubcategoryIds.FullBodies:rawValue(),
			isSubcategory = true,
			TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.FullBodies:rawValue()
		})
		table.insert(t11, {
			Id = CatalogSubcategories.Hair:rawValue(),
			Name = "Hair",
			NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.Hair else nil,
			Title = "Feature.Catalog.Label.Hair",
			CameraFocus = Constants2.FocusType.Head,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.BodyCategories.Hair,
			AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.HairAccessory },
			SearchUuid = SearchUuid(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
			SubcategoryId = CatalogSubcategoryIds.Hair:rawValue(),
			isSubcategory = true,
			TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.Hair:rawValue()
		})
		table.insert(t11, {
			Id = CatalogSubcategories.Heads:rawValue(),
			Name = "Heads",
			NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.Heads else nil,
			Title = "Feature.Avatar.Label.Heads",
			CameraFocus = Constants2.FocusType.Head,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.BodyCategories.Heads,
			BundleTypes = { Constants2.BundleTypeIdStrings.DynamicHead },
			SearchUuid = SearchUuid(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
			SubcategoryId = CatalogSubcategoryIds.Head:rawValue(),
			isSubcategory = true,
			TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.DynamicHeads:rawValue()
		})

		if not FFlagRemoveClassicHeadsAndFaces then
			table.insert(t11, {
				Id = CatalogSubcategories.ClassicHeads:rawValue(),
				Name = "Classic Heads",
				NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.ClassicHeads else nil,
				Title = "Feature.Avatar.Label.ClassicHeads",
				CameraFocus = Constants2.FocusType.Head,
				CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.BodyCategories.ClassicHeads,
				AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.Head },
				SearchUuid = SearchUuid(),
				TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
				SubcategoryId = CatalogSubcategoryIds.ClassicHeads:rawValue(),
				isSubcategory = true,
				TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.ClassicHeads:rawValue()
			})
			table.insert(t11, {
				Id = CatalogSubcategories.ClassicFaces:rawValue(),
				Name = "Classic Faces",
				NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.ClassicFaces else nil,
				Title = "Feature.Avatar.Label.ClassicFaces",
				CameraFocus = Constants2.FocusType.Face,
				CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.BodyCategories.ClassicFaces,
				AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.Face },
				SearchUuid = SearchUuid(),
				TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
				SubcategoryId = CatalogSubcategoryIds.ClassicFaces:rawValue(),
				isSubcategory = true,
				TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.ClassicFaces:rawValue()
			})
		end

		t13 = {
			Id = CatalogCategories.Body:rawValue(),
			Name = "Body",
			NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogCategories.Body else nil,
			Title = "Feature.Catalog.Label.Body",
			TooltipKey = if not FFlagAXMigrateCategoryTooltip then if not FFlagAXCatalogCategoryTooltip then nil else "BodyCategoryCatalogTooltip" else v39,
			TooltipLocalizationKey = if not FFlagAXMigrateCategoryTooltip then nil else "Feature.Catalog.Message.BodyCategoryTooltip",
			AssetTypeIdStrings = {
				Constants2.AssetTypeIdStrings.HairAccessory,
				Constants2.AssetTypeIdStrings.Head,
				Constants2.AssetTypeIdStrings.Face,
				Constants2.AssetTypeIdStrings.DynamicHead
			},
			BundleTypes = {
				Constants2.BundleTypeIdStrings.BodyParts,
				Constants2.BundleTypeIdStrings.DynamicHead
			},
			CanAnimateCameraBasedMood = true,
			SearchUuid = SearchUuid(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
			CategoryId = CatalogCategoryIds.Body:rawValue(),
			Subcategories = t11,
			TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.Body:rawValue()
		}
	end

	local t14 = {}

	table.insert(t14, t1)

	if v44 then
		table.insert(t14, t12)
		table.insert(t14, t13)
	else
		table.insert(t14, t2)
	end

	if FFlagAXCatalogMakeupSupport then
		table.insert(t14, t4)
	end

	table.insert(t14, getClothingCategories().catalogCategories)
	table.insert(t14, t6)

	if not v44 then
		table.insert(t14, t8)
	end

	table.insert(t14, t10)

	if FFlagAXCatalogM41Props then
		table.insert(t14, v47)
	end

	if FFlagAXAddHDCatalogTab then
		table.insert(t14, math.clamp(v38, 1, #t14 + 1), v48)
	end

	if FFlagAXCatalogMakeupSupport and FFlagAXMakeupCategoryPositionExperiment and FIntAXMakeupCategoryPosition > 0 then
		local n1 = 0

		for v62, v63 in t14 do
			if v63 == t4 then
				n1 = v62

				break
			end
		end

		if n1 > 0 then
			table.remove(t14, n1)
			table.insert(t14, math.clamp(FIntAXMakeupCategoryPosition, 1, #t14 + 1), t4)
		end
	end

	return t14
end
local function buildCategories() -- line: 741
	-- upvalues: FFlagAXCatalogCategoriesFlaggedMap (copy), buildCategoriesMap (copy), CatalogCategories (copy), FFlagAXRemoveCatalogCategoryNavKey (copy), FFlagAXCatalogSupportDisableFilters (copy), SearchUuid (copy), GetFIntMinSecsToRefreshRecommendedCatalogPage (copy), CatalogCategoryIds (copy), FFlagAXCatalogCategoriesSDUI (copy), FFlagAXFixWidgetOnlyTabNoItemsFound (copy), FFlagAXM41AllCategoriesToTaxonomy (copy), CatalogCategoryTaxonomyUUIDs (copy), FFlagAXCatalogMakeupSupport (copy), Constants2 (copy), Constants (copy), FFlagAXCatalogMakeupTaxonomy (copy), CatalogSubcategories (copy), FFlagAXCatalogM41Props (copy), FFlagAXCatalogM41FullMasks (copy), FFlagAXCatalogM41HandAndArm (copy), CatalogSubcategoryIds (copy), FFlagRemoveClassicHeadsAndFaces (copy), AXAvatarsTabIXP (copy), IxpUtils (copy), FFlagAXLooksWidgetContextForOrganicContent (copy), FFlagAXMigrateCategoryTooltip (copy), v39 (copy), FFlagAXCatalogCategoryTooltip (copy), getClothingCategories (copy)
	if FFlagAXCatalogCategoriesFlaggedMap then
		return (buildCategoriesMap())
	end

	local t15 = {
		Id = CatalogCategories.Recommended:rawValue(),
		Name = "All",
		NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogCategories.Recommended else nil,
		Title = "Feature.Avatar.Heading.All",
		CategoryFilter = "Recommended",
		DisableFilters = not FFlagAXCatalogSupportDisableFilters or nil,
		ShowSponsored = true,
		ShowWidgets = true,
		ShowTopics = true,
		CanAnimateCameraBasedMood = true,
		SearchUuid = SearchUuid(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
		CategoryId = CatalogCategoryIds.All:rawValue(),
		WidgetContext = if not FFlagAXCatalogCategoriesSDUI and not FFlagAXFixWidgetOnlyTabNoItemsFound then nil else "catalog-tab:all",
		TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.AllItems:rawValue()
	}
	local t16 = nil

	if FFlagAXCatalogMakeupSupport then
		t16 = {
			Id = CatalogCategories.Makeup:rawValue(),
			Name = "Makeup",
			NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogCategories.Makeup else nil,
			Title = "Feature.Catalog.Label.Makeup",
			CameraFocus = Constants2.FocusType.Face,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Makeup.Makeup,
			AssetTypeIdStrings = {
				Constants2.AssetTypeIdStrings.EyelashAccessory,
				Constants2.AssetTypeIdStrings.EyebrowAccessory,
				Constants2.AssetTypeIdStrings.FaceMakeup,
				Constants2.AssetTypeIdStrings.LipMakeup,
				Constants2.AssetTypeIdStrings.EyeMakeup
			},
			CanAnimateCameraBasedMood = true,
			SearchUuid = SearchUuid(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
			TaxonomyUuid = if not FFlagAXCatalogMakeupTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.Makeup:rawValue(),
			Subcategories = {
				[1] = {
					Id = CatalogSubcategories.MakeupLooks:rawValue(),
					Name = "Looks",
					NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.MakeupLooks else nil,
					Title = "Feature.Catalog.Label.MakeupLooks",
					CameraFocus = Constants2.FocusType.Face,
					CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Makeup.FaceMakeup,
					DisableFilters = true,
					SearchUuid = SearchUuid(),
					TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
					LooksWidgetContextForOrganicContent = "makeup-tab",
					isSubcategory = true
				},
				[2] = {
					Id = CatalogSubcategories.EyeMakeup:rawValue(),
					Name = "Eyes",
					NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.EyeMakeup else nil,
					Title = "Feature.Catalog.Label.EyeMakeup",
					CameraFocus = Constants2.FocusType.Face,
					CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Makeup.EyeMakeup,
					AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.EyeMakeup },
					SearchUuid = SearchUuid(),
					TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
					isSubcategory = true,
					TaxonomyUuid = if not FFlagAXCatalogMakeupTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.EyeMakeup:rawValue()
				},
				[3] = {
					Id = CatalogSubcategories.LipMakeup:rawValue(),
					Name = "Lips",
					NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.LipMakeup else nil,
					Title = "Feature.Catalog.Label.LipMakeup",
					CameraFocus = Constants2.FocusType.Face,
					CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Makeup.LipMakeup,
					AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.LipMakeup },
					SearchUuid = SearchUuid(),
					TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
					isSubcategory = true,
					TaxonomyUuid = if not FFlagAXCatalogMakeupTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.LipMakeup:rawValue()
				},
				[4] = {
					Id = CatalogSubcategories.FaceMakeup:rawValue(),
					Name = "Face",
					NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.FaceMakeup else nil,
					Title = "Feature.Catalog.Label.FaceMakeup",
					CameraFocus = Constants2.FocusType.Face,
					CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Makeup.FaceMakeup,
					AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.FaceMakeup },
					SearchUuid = SearchUuid(),
					TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
					isSubcategory = true,
					TaxonomyUuid = if not FFlagAXCatalogMakeupTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.FaceMakeup:rawValue()
				},
				[5] = {
					Id = CatalogSubcategories.Eyelashes:rawValue(),
					Name = "Eyelashes",
					NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.Eyelashes else nil,
					Title = "Feature.Catalog.Label.EyelashMakeup",
					CameraFocus = Constants2.FocusType.Face,
					CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Makeup.Eyelashes,
					AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.EyelashAccessory },
					SearchUuid = SearchUuid(),
					TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
					isSubcategory = true,
					TaxonomyUuid = if not FFlagAXCatalogMakeupTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.Eyelashes:rawValue()
				},
				[6] = {
					Id = CatalogSubcategories.Eyebrows:rawValue(),
					Name = "Eyebrows",
					NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.Eyebrows else nil,
					Title = "Feature.Catalog.Label.EyebrowMakeup",
					CameraFocus = Constants2.FocusType.Face,
					CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.Makeup.Eyebrows,
					AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.EyebrowAccessory },
					SearchUuid = SearchUuid(),
					TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
					isSubcategory = true,
					TaxonomyUuid = if not FFlagAXCatalogMakeupTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.Eyebrows:rawValue()
				}
			}
		}
	end

	local t17 = {
		Id = CatalogCategories.Characters:rawValue(),
		Name = "Characters",
		NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogCategories.Characters else nil,
		Title = "Feature.Catalog.Label.Characters",
		BundleTypes = { Constants2.BundleTypeIdStrings.BodyParts },
		CanAnimateCameraBasedMood = true,
		SearchUuid = SearchUuid(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
		CategoryId = CatalogCategoryIds.Characters:rawValue()
	}
	local t18 = nil
	local t19 = nil
	local t20 = nil

	if FFlagAXCatalogM41Props then
		t18 = {
			Id = CatalogCategories.Props:rawValue(),
			Name = "Props",
			NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogCategories.Props else nil,
			Title = "Feature.Avatar.Label.Props",
			SearchUuid = SearchUuid(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
			TaxonomyUuid = CatalogCategoryTaxonomyUUIDs.Props:rawValue()
		}
	end

	if FFlagAXCatalogM41FullMasks then
		t19 = {
			Id = CatalogSubcategories.FullMasks:rawValue(),
			Name = "Full Masks",
			NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.FullMasks else nil,
			Title = "Feature.Avatar.Label.FullMasks",
			CameraFocus = Constants2.FocusType.Face,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.CatalogAccessories.Face,
			SearchUuid = SearchUuid(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
			isSubcategory = true,
			TaxonomyUuid = CatalogCategoryTaxonomyUUIDs.FullMasks:rawValue()
		}
	end

	if FFlagAXCatalogM41HandAndArm then
		t20 = {
			Id = CatalogSubcategories.HandAndArm:rawValue(),
			Name = "Hand & Arm",
			NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.HandAndArm else nil,
			Title = "Feature.Avatar.Label.HandAndArm",
			CameraFocus = Constants2.FocusType.Arms,
			CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.CatalogAccessories.Shoulder,
			SearchUuid = SearchUuid(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
			isSubcategory = true,
			TaxonomyUuid = CatalogCategoryTaxonomyUUIDs.HandAndArm:rawValue()
		}
	end

	local t21 = {
		Id = CatalogCategories.Accessories:rawValue(),
		Name = "Accessories",
		NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogCategories.Accessories else nil,
		Title = "Feature.Catalog.LabelAccessories",
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
		AssetTypeIdStrings = {
			Constants2.AssetTypeIdStrings.Hat,
			Constants2.AssetTypeIdStrings.FaceAccessory,
			Constants2.AssetTypeIdStrings.NeckAccessory,
			Constants2.AssetTypeIdStrings.ShoulderAccessory,
			Constants2.AssetTypeIdStrings.FrontAccessory,
			Constants2.AssetTypeIdStrings.BackAccessory,
			Constants2.AssetTypeIdStrings.WaistAccessory,
			Constants2.AssetTypeIdStrings.Gear
		},
		CanAnimateCameraBasedMood = true,
		SearchUuid = SearchUuid(),
		CategoryId = CatalogCategoryIds.Accessories:rawValue(),
		TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.Accessories:rawValue(),
		Subcategories = {
			[1] = {
				Id = CatalogSubcategories.Hats:rawValue(),
				Name = "Hats",
				NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.Hats else nil,
				Title = "Feature.Avatar.Label.Head",
				CameraFocus = Constants2.FocusType.Head,
				CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.CatalogAccessories.Hats,
				AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.Hat },
				SearchUuid = SearchUuid(),
				TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
				SubcategoryId = CatalogSubcategoryIds.Hats:rawValue(),
				isSubcategory = true,
				TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.HeadAccessories:rawValue()
			},
			[2] = {
				Id = CatalogSubcategories.Face:rawValue(),
				Name = "Face",
				NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.Face else nil,
				Title = "Feature.Avatar.Label.Face",
				CameraFocus = Constants2.FocusType.Face,
				CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.CatalogAccessories.Face,
				AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.FaceAccessory },
				SearchUuid = SearchUuid(),
				TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
				SubcategoryId = CatalogSubcategoryIds.Face:rawValue(),
				isSubcategory = true,
				TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.FaceAccessories:rawValue()
			},
			[3] = {
				Id = CatalogSubcategories.Neck:rawValue(),
				Name = "Neck",
				NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.Neck else nil,
				Title = "Feature.Avatar.Label.Neck",
				CameraFocus = Constants2.FocusType.Neck,
				CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.CatalogAccessories.Neck,
				AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.NeckAccessory },
				SearchUuid = SearchUuid(),
				TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
				SubcategoryId = CatalogSubcategoryIds.Neck:rawValue(),
				isSubcategory = true,
				TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.NeckAccessories:rawValue()
			},
			[4] = {
				Id = CatalogSubcategories.Shoulder:rawValue(),
				Name = "Shoulder",
				NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.Shoulder else nil,
				Title = "Feature.Avatar.Label.Shoulder",
				CameraFocus = Constants2.FocusType.Shoulders,
				CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.CatalogAccessories.Shoulder,
				AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.ShoulderAccessory },
				SearchUuid = SearchUuid(),
				TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
				SubcategoryId = CatalogSubcategoryIds.Shoulder:rawValue(),
				isSubcategory = true,
				TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.ShoulderAccessories:rawValue()
			},
			[5] = {
				Id = CatalogSubcategories.Front:rawValue(),
				Name = "Front",
				NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.Front else nil,
				Title = "Feature.Avatar.Label.Front",
				CameraFocus = Constants2.FocusType.Arms,
				CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.CatalogAccessories.Front,
				AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.FrontAccessory },
				SearchUuid = SearchUuid(),
				TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
				SubcategoryId = CatalogSubcategoryIds.Front:rawValue(),
				isSubcategory = true,
				TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.FrontAccessories:rawValue()
			},
			[6] = {
				Id = CatalogSubcategories.Back:rawValue(),
				Name = "Back",
				NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.Back else nil,
				Title = "Feature.Avatar.Label.Back",
				CameraFocus = Constants2.FocusType.Arms,
				CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.CatalogAccessories.Back,
				AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.BackAccessory },
				SearchUuid = SearchUuid(),
				TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
				SubcategoryId = CatalogSubcategoryIds.Back:rawValue(),
				isSubcategory = true,
				TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.BackAccessories:rawValue()
			},
			[7] = {
				Id = CatalogSubcategories.Waist:rawValue(),
				Name = "Waist",
				NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.Waist else nil,
				Title = "Feature.Avatar.Label.Waist",
				CameraFocus = Constants2.FocusType.Waist,
				CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.CatalogAccessories.Waist,
				AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.WaistAccessory },
				SearchUuid = SearchUuid(),
				TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
				SubcategoryId = CatalogSubcategoryIds.Waist:rawValue(),
				isSubcategory = true,
				TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.WaistAccessories:rawValue()
			},
			[8] = {
				Id = CatalogSubcategories.Gear:rawValue(),
				Name = "Gear",
				NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.Gear else nil,
				Title = "Feature.Catalog.Label.Gear",
				AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.Gear },
				SearchUuid = SearchUuid(),
				TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
				SubcategoryId = CatalogSubcategoryIds.Gear:rawValue(),
				isSubcategory = true,
				TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.Gear:rawValue()
			}
		}
	}

	if FFlagAXCatalogM41FullMasks and t21.Subcategories then
		local n2 = 2

		for k, v in pairs(t21.Subcategories) do
			if v.Name == "Face" then
				n2 = k

				break
			end
		end

		table.insert(t21.Subcategories, n2 + 1, t19)
	end

	if FFlagAXCatalogM41HandAndArm and t21.Subcategories then
		local n3 = 5

		for k, v in pairs(t21.Subcategories) do
			if v.Name == "Shoulder" then
				n3 = k

				break
			end
		end

		table.insert(t21.Subcategories, n3 + 1, t20)
	end

	local t22 = {
		Id = CatalogCategories.Head:rawValue(),
		Name = "Heads",
		NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogCategories.Head else nil,
		Title = "Feature.Avatar.Label.Heads",
		AssetTypeIdStrings = {
			Constants2.AssetTypeIdStrings.HairAccessory,
			Constants2.AssetTypeIdStrings.Head,
			Constants2.AssetTypeIdStrings.Face,
			Constants2.AssetTypeIdStrings.DynamicHead
		},
		BundleTypes = { Constants2.BundleTypeIdStrings.DynamicHead },
		CanAnimateCameraBasedMood = true,
		SearchUuid = SearchUuid(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
		CategoryId = CatalogCategoryIds.Heads:rawValue(),
		Subcategories = {
			[1] = {
				Id = CatalogSubcategories.Heads:rawValue(),
				Name = "Heads",
				NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.Heads else nil,
				Title = "Feature.Avatar.Label.Heads",
				CameraFocus = Constants2.FocusType.Head,
				CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.BodyCategories.Heads,
				BundleTypes = { Constants2.BundleTypeIdStrings.DynamicHead },
				SearchUuid = SearchUuid(),
				TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
				isSubcategory = true,
				TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.DynamicHeads:rawValue()
			},
			[2] = {
				Id = CatalogSubcategories.Hair:rawValue(),
				Name = "Hair",
				NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.Hair else nil,
				Title = "Feature.Catalog.Label.Hair",
				CameraFocus = Constants2.FocusType.Head,
				CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.BodyCategories.Hair,
				AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.HairAccessory },
				SearchUuid = SearchUuid(),
				TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
				isSubcategory = true,
				TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.Hair:rawValue()
			},
			[3] = if FFlagRemoveClassicHeadsAndFaces then nil else {
				Id = CatalogSubcategories.ClassicHeads:rawValue(),
				Name = "Classic Heads",
				NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.ClassicHeads else nil,
				Title = "Feature.Avatar.Label.ClassicHeads",
				CameraFocus = Constants2.FocusType.Head,
				CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.BodyCategories.ClassicHeads,
				AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.Head },
				SearchUuid = SearchUuid(),
				TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
				isSubcategory = true,
				TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.ClassicHeads:rawValue()
			},
			[4] = if FFlagRemoveClassicHeadsAndFaces then nil else {
				Id = CatalogSubcategories.ClassicFaces:rawValue(),
				Name = "Classic Faces",
				NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.ClassicFaces else nil,
				Title = "Feature.Avatar.Label.ClassicFaces",
				CameraFocus = Constants2.FocusType.Face,
				CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.BodyCategories.ClassicFaces,
				AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.Face },
				SearchUuid = SearchUuid(),
				TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
				isSubcategory = true,
				TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.ClassicFaces:rawValue()
			}
		}
	}
	local t23 = {
		Id = CatalogCategories.AllAnimations:rawValue(),
		Name = "AllAnimations",
		NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogCategories.AllAnimations else nil,
		Title = "Feature.Avatar.Heading.Animations",
		CategoryId = CatalogCategoryIds.AllAnimations:rawValue(),
		CameraZoomRadius = Constants2.AnimationCategoryCameraZoomRadius,
		AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.EmoteAnimation },
		BundleTypes = { Constants2.BundleTypeIdStrings.Animations },
		PageType = Constants2.PageType.AllAnimation,
		CanAnimateCameraBasedMood = true,
		SearchUuid = SearchUuid(),
		TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
		TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.Animations:rawValue(),
		Subcategories = {
			[1] = {
				Id = CatalogSubcategories.AnimationBundles:rawValue(),
				Name = "AnimationBundles",
				NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.AnimationBundles else nil,
				Title = "Feature.Catalog.Label.Bundles",
				CameraZoomRadius = Constants2.AnimationCategoryCameraZoomRadius,
				CanAnimateCameraBasedMood = true,
				BundleTypes = { Constants2.BundleTypeIdStrings.Animations },
				PageType = Constants2.PageType.Animation,
				SearchUuid = SearchUuid(),
				TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
				SubcategoryId = CatalogSubcategoryIds.AnimationBundles:rawValue(),
				isSubcategory = true,
				TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.AnimationBundles:rawValue()
			},
			[2] = {
				Id = CatalogSubcategories.Emotes:rawValue(),
				Name = "Emotes",
				NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.Emotes else nil,
				Title = "Feature.Catalog.Label.Emotes",
				CameraZoomRadius = Constants2.AnimationCategoryCameraZoomRadius,
				CanAnimateCameraBasedMood = false,
				AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.EmoteAnimation },
				PageType = Constants2.PageType.Emotes,
				SearchUuid = SearchUuid(),
				TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
				SubcategoryId = CatalogSubcategoryIds.Emotes:rawValue(),
				isSubcategory = true,
				TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.Emotes:rawValue()
			}
		}
	}

	if if not AXAvatarsTabIXP.isEnabled() then nil else IxpUtils.readTestVariable(AXAvatarsTabIXP.EnabledForUser) then
		local t24 = {
			Id = CatalogCategories.Avatars:rawValue(),
			Name = "Avatars",
			NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogCategories.Avatars else nil,
			Title = "Feature.Catalog.Label.Avatars",
			ShowLooksAsOrganicContent = not FFlagAXLooksWidgetContextForOrganicContent or nil,
			LooksWidgetContextForOrganicContent = if not FFlagAXLooksWidgetContextForOrganicContent then nil else "avatarTab",
			CanAnimateCameraBasedMood = true,
			SearchUuid = SearchUuid(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
			DisableFilters = not not FFlagAXCatalogSupportDisableFilters or nil
		}
		local t25 = {
			Id = CatalogCategories.Body:rawValue(),
			Name = "Body",
			NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogCategories.Body else nil,
			Title = "Feature.Catalog.Label.Body",
			TooltipKey = if not FFlagAXMigrateCategoryTooltip then if not FFlagAXCatalogCategoryTooltip then nil else "BodyCategoryCatalogTooltip" else v39,
			TooltipLocalizationKey = if not FFlagAXMigrateCategoryTooltip then nil else "Feature.Catalog.Message.BodyCategoryTooltip",
			AssetTypeIdStrings = {
				Constants2.AssetTypeIdStrings.HairAccessory,
				Constants2.AssetTypeIdStrings.Head,
				Constants2.AssetTypeIdStrings.Face,
				Constants2.AssetTypeIdStrings.DynamicHead
			},
			BundleTypes = {
				Constants2.BundleTypeIdStrings.BodyParts,
				Constants2.BundleTypeIdStrings.DynamicHead
			},
			CanAnimateCameraBasedMood = true,
			SearchUuid = SearchUuid(),
			TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
			CategoryId = CatalogCategoryIds.Body:rawValue(),
			TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.Body:rawValue(),
			Subcategories = {
				[1] = {
					Id = CatalogSubcategories.FullBodies:rawValue(),
					Name = "Full Bodies",
					NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.FullBodies else nil,
					Title = "Feature.Catalog.Label.FullBodies",
					BundleTypes = { Constants2.BundleTypeIdStrings.BodyParts },
					SearchUuid = SearchUuid(),
					TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
					SubcategoryId = CatalogSubcategoryIds.FullBodies:rawValue(),
					isSubcategory = true,
					TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.FullBodies:rawValue()
				},
				[2] = {
					Id = CatalogSubcategories.Hair:rawValue(),
					Name = "Hair",
					NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.Hair else nil,
					Title = "Feature.Catalog.Label.Hair",
					CameraFocus = Constants2.FocusType.Head,
					CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.BodyCategories.Hair,
					AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.HairAccessory },
					SearchUuid = SearchUuid(),
					TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
					SubcategoryId = CatalogSubcategoryIds.Hair:rawValue(),
					isSubcategory = true,
					TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.Hair:rawValue()
				},
				[3] = {
					Id = CatalogSubcategories.Heads:rawValue(),
					Name = "Heads",
					NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.Heads else nil,
					Title = "Feature.Avatar.Label.Heads",
					CameraFocus = Constants2.FocusType.Head,
					CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.BodyCategories.Heads,
					BundleTypes = { Constants2.BundleTypeIdStrings.DynamicHead },
					SearchUuid = SearchUuid(),
					TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
					SubcategoryId = CatalogSubcategoryIds.Head:rawValue(),
					isSubcategory = true,
					TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.DynamicHeads:rawValue()
				},
				[4] = if FFlagRemoveClassicHeadsAndFaces then nil else {
					Id = CatalogSubcategories.ClassicHeads:rawValue(),
					Name = "Classic Heads",
					NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.ClassicHeads else nil,
					Title = "Feature.Avatar.Label.ClassicHeads",
					CameraFocus = Constants2.FocusType.Head,
					CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.BodyCategories.ClassicHeads,
					AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.Head },
					SearchUuid = SearchUuid(),
					TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
					SubcategoryId = CatalogSubcategoryIds.ClassicHeads:rawValue(),
					isSubcategory = true,
					TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.ClassicHeads:rawValue()
				},
				[5] = if FFlagRemoveClassicHeadsAndFaces then nil else {
					Id = CatalogSubcategories.ClassicFaces:rawValue(),
					Name = "Classic Faces",
					NavigationKey = if not FFlagAXRemoveCatalogCategoryNavKey then CatalogSubcategories.ClassicFaces else nil,
					Title = "Feature.Avatar.Label.ClassicFaces",
					CameraFocus = Constants2.FocusType.Face,
					CameraZoomRadius = Constants.CAMERA_ZOOM_RADIUS.BodyCategories.ClassicFaces,
					AssetTypeIdStrings = { Constants2.AssetTypeIdStrings.Face },
					SearchUuid = SearchUuid(),
					TimeToRefresh = GetFIntMinSecsToRefreshRecommendedCatalogPage(),
					SubcategoryId = CatalogSubcategoryIds.ClassicFaces:rawValue(),
					isSubcategory = true,
					TaxonomyUuid = if not FFlagAXM41AllCategoriesToTaxonomy then nil else CatalogCategoryTaxonomyUUIDs.ClassicFaces:rawValue()
				}
			}
		}

		if FFlagAXCatalogMakeupSupport then
			local t26 = {
				t15,
				t24,
				t25,
				t16,
				getClothingCategories().catalogCategories,
				t21,
				t23
			}

			if FFlagAXCatalogM41Props then
				table.insert(t26, t18)
			end

			return t26
		end

		local t27 = {
			t15,
			t24,
			t25,
			getClothingCategories().catalogCategories,
			t21,
			t23
		}

		if FFlagAXCatalogM41Props then
			table.insert(t27, t18)
		end

		return t27
	end

	if FFlagAXCatalogMakeupSupport then
		local t28 = {
			t15,
			t17,
			t16,
			getClothingCategories().catalogCategories,
			t21,
			t22,
			t23
		}

		if FFlagAXCatalogM41Props then
			table.insert(t28, t18)
		end

		return t28
	end

	local t29 = {
		t15,
		t17,
		getClothingCategories().catalogCategories,
		t21,
		t22,
		t23
	}

	if FFlagAXCatalogM41Props then
		table.insert(t29, t18)
	end

	return t29
end

local u42 = nil

local function sanityCheck(p1) -- line: 1564
	-- upvalues: ArgCheck (copy), FFlagAXRemoveCatalogCategoryNavKey (copy)
	local t30 = {}

	for _, v91 in p1 do
		ArgCheck.isNotNil(v91.SearchUuid, "category  " .. v91.Name .. " is missing SearchUuid")
		ArgCheck.isNotNil(v91.Id, "category  " .. v91.Name .. " is missing Id")

		if FFlagAXRemoveCatalogCategoryNavKey then
			ArgCheck.isTypeOrNil(v91.NavigationKey, "nil", "NavigationKey")
		end

		local Id = v91.Id

		if Id then
			if t30[Id] then
				error("Duplicate Id found: " .. Id)
			else
				t30[Id] = true
			end
		end

		if v91.Subcategories then
			for _, v94 in v91.Subcategories do
				ArgCheck.isNotNil(v94.SearchUuid, "category  " .. v94.Name .. " is missing SearchUuid")
				ArgCheck.isNotNil(v94.Id, "category  " .. v94.Name .. " is missing Id")

				if FFlagAXRemoveCatalogCategoryNavKey then
					ArgCheck.isTypeOrNil(v94.NavigationKey, "nil", "NavigationKey")
				end

				local Id2 = v94.Id

				if Id2 then
					if t30[Id2] then
						error("Duplicate Id found: " .. Id2)
					else
						t30[Id2] = true
					end
				end

				ArgCheck.isNotNil(v94.isSubcategory, "subcategory  " .. v94.Id .. " is missing isSubcategory")
			end
		end
	end
end

return function(b1: boolean?) -- line: 1582
	-- upvalues: buildCategories (copy), sanityCheck (copy), u42 (ref)
	if b1 then
		local v97 = buildCategories()

		sanityCheck(v97)

		return v97
	end

	if not u42 then
		u42 = buildCategories()
		sanityCheck(u42)
	end

	return u42
end

local AvatarExperienceNavigation = script:FindFirstAncestor("AvatarExperienceNavigation")
local AvatarExperienceNavigationParent = AvatarExperienceNavigation.Parent
local AvatarScreen = require(AvatarExperienceNavigation.Enums.AvatarScreen)
local UnifiedLoggingSurface = require(AvatarExperienceNavigation.Enums.UnifiedLoggingSurface)
local Cryo = require(AvatarExperienceNavigationParent.Cryo)

require(AvatarExperienceNavigationParent.Dash)

local AvatarExperienceFlags = require(AvatarExperienceNavigationParent.AvatarExperienceFlags)
local FFlagAXEditorSubcategoryFilters = AvatarExperienceFlags.FFlagAXEditorSubcategoryFilters
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlags.FFlagAXMISEnableMultiShopping
local FFlagAXEnableExpiredUserLookCheckout = AvatarExperienceFlags.FFlagAXEnableExpiredUserLookCheckout
local FFlagAXFixGamepadNavigationOnOutfitManagement = AvatarExperienceFlags.FFlagAXFixGamepadNavigationOnOutfitManagement
local v11 = game:DefineFastFlag("AXEnableMultiTryOnUI", false)
local v12 = game:DefineFastFlag("AXKeepTryOnsInAvatarEditor", false)
local FFlagAXFixAvatarScreenVR = AvatarExperienceFlags.FFlagAXFixAvatarScreenVR
local FFlagAXMakeupReleaseFTUX = AvatarExperienceFlags.FFlagAXMakeupReleaseFTUX
local FFlagAXCatalogMakeupSupport = AvatarExperienceFlags.FFlagAXCatalogMakeupSupport
local t1 = {
	isTransparent = false,
	coversSceneWhenExpanded = false,
	isMultiTryOn = not not FFlagAXMISEnableMultiShopping and nil,
	isTryOnOutfitResetPage = false,
	isRefinementPage = false,
	refinementButtonVisible = false,
	VRPanelRoundedCorners = false,
	VRPanelPlacement = "Center"
}
local t2 = {
	[AvatarScreen.AccessoryAdjustment] = {
		isRefinementPage = true,
		isMultiTryOn = if not FFlagAXMISEnableMultiShopping then v11 else nil,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurface.CUSTOMIZE
		}
	},
	[AvatarScreen.AvatarExperienceLandingPage] = {
		isTryOnOutfitResetPage = true
	},
	[AvatarScreen.AvatarExperienceRoot] = {},
	[AvatarScreen.AvatarBackground] = {
		isTransparent = false
	},
	[AvatarScreen.Catalog] = {
		refinementButtonVisible = true,
		VRPanelPlacement = "None",
		VRPanelRoundedCorners = true,
		isMultiTryOn = if not FFlagAXMISEnableMultiShopping then v11 else nil,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurface.CATALOG
		}
	},
	[AvatarScreen.CatalogContextMenu] = {
		VRPanelPlacement = "Right"
	},
	[AvatarScreen.CatalogSearch] = {
		refinementButtonVisible = true,
		VRPanelPlacement = "None",
		VRPanelRoundedCorners = true,
		isMultiTryOn = if not FFlagAXMISEnableMultiShopping then v11 else nil,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurface.SEARCH_RESULTS
		}
	},
	[AvatarScreen.CatalogSearchLanding] = {
		refinementButtonVisible = true,
		VRPanelPlacement = "None",
		VRPanelRoundedCorners = true,
		isMultiTryOn = if not FFlagAXMISEnableMultiShopping then v11 else nil,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurface.SEARCH_LANDING_PAGE
		}
	},
	[AvatarScreen.ItemDetails] = {
		isTransparent = true,
		coversSceneWhenExpanded = true,
		VRPanelPlacement = "Right",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurface.ITEM_DETAILS
		}
	},
	[AvatarScreen.OutfitDetails] = {
		isTransparent = true,
		coversSceneWhenExpanded = true,
		VRPanelPlacement = "Right",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurface.ITEM_DETAILS
		}
	},
	[AvatarScreen.ItemOwnershipPage] = {
		isTransparent = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurface.ITEM_DETAILS
		}
	},
	[AvatarScreen.CreateOrUpdateOutfitMenu] = {
		VRPanelPlacement = "Left"
	},
	[AvatarScreen.LayeredClothingSort] = {
		isRefinementPage = true,
		VRPanelPlacement = "Center",
		isMultiTryOn = if not FFlagAXMISEnableMultiShopping then v11 else nil,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurface.CUSTOMIZE
		}
	},
	[AvatarScreen.LCSortContextMenu] = {
		VRPanelPlacement = "Right"
	},
	[AvatarScreen.AvatarEditor] = {
		isTryOnOutfitResetPage = not v12,
		refinementButtonVisible = true,
		VRPanelPlacement = "None",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurface.CUSTOMIZE
		}
	},
	[AvatarScreen.AvatarRefinement] = {
		VRPanelPlacement = "Right",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurface.CUSTOMIZE
		}
	},
	[AvatarScreen.ManageOutfitPage] = {
		isTransparent = not FFlagAXFixGamepadNavigationOnOutfitManagement,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurface.CUSTOMIZE
		}
	},
	[AvatarScreen.ProfilePictureEditorEmotes] = {
		isTryOnOutfitResetPage = true
	},
	[AvatarScreen.ResellersPage] = {
		isTransparent = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurface.ITEM_DETAILS
		}
	},
	[AvatarScreen.SellItemPage] = {
		isTransparent = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurface.ITEM_DETAILS
		}
	},
	[AvatarScreen.SellItemPeekView] = {
		isTransparent = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurface.ITEM_DETAILS
		}
	},
	[AvatarScreen.SortAndFilters] = {
		isTransparent = true,
		VRPanelPlacement = "Left"
	},
	[AvatarScreen.TryOnItem] = {
		isTransparent = false,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurface.ITEM_DETAILS
		}
	},
	[AvatarScreen.UpdateOutfitPage] = {
		isTransparent = true,
		VRPanelPlacement = "Left",
		VRPanelRoundedCorners = true
	},
	[AvatarScreen.AdjustAccessoryView] = {
		isTransparent = false,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurface.CUSTOMIZE
		}
	},
	[AvatarScreen.HeadRefinement] = {
		isRefinementPage = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurface.CUSTOMIZE
		}
	},
	[AvatarScreen.LookDetails] = {
		isTransparent = true,
		coversSceneWhenExpanded = true,
		VRPanelPlacement = "Right",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurface.ITEM_DETAILS
		}
	},
	[AvatarScreen.ContextMenu] = {
		VRPanelPlacement = "Right"
	},
	[AvatarScreen.MySharedAvatars] = {
		isTryOnOutfitResetPage = true,
		refinementButtonVisible = true,
		VRPanelPlacement = "None",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurface.CUSTOMIZE
		}
	},
	[AvatarScreen.CommunityAvatarEntryMenu] = {
		VRPanelPlacement = "Left"
	},
	[AvatarScreen.SearchLandingFocusedWidgetPage] = {
		refinementButtonVisible = true,
		VRPanelPlacement = "None",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurface.SEARCH_LANDING_PAGE
		}
	},
	[AvatarScreen.BodyShape] = {
		isRefinementPage = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurface.CUSTOMIZE
		}
	},
	[AvatarScreen.AvatarSwitcher] = {
		isTransparent = false,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurface.CUSTOMIZE
		}
	},
	[AvatarScreen.EditEmotes] = {
		isTransparent = false,
		isTryOnOutfitResetPage = true,
		VRPanelPlacement = "None",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurface.CUSTOMIZE
		}
	}
}

if FFlagAXFixAvatarScreenVR then
	if FFlagAXCatalogMakeupSupport then
		t2[AvatarScreen.MakeupMax6LayersPrompt] = {
			isTransparent = false,
			VRPanelPlacement = "Left",
			VRPanelRoundedCorners = true
		}
	end

	if FFlagAXMakeupReleaseFTUX then
		t2[AvatarScreen.MakeupReleaseFtuxPrompt] = {
			isTransparent = false,
			VRPanelPlacement = "Left",
			VRPanelRoundedCorners = true
		}
	end
end

if FFlagAXEditorSubcategoryFilters then
	t2[AvatarScreen.SubcategoryFiltersDropdown] = {
		isTransparent = true,
		VRPanelPlacement = "Left"
	}
end

if FFlagAXMISEnableMultiShopping then
	t2[AvatarScreen.Checkout] = {
		isTransparent = true,
		coversSceneWhenExpanded = true,
		VRPanelPlacement = "Right",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurface.CATALOG
		}
	}
end

if FFlagAXEnableExpiredUserLookCheckout then
	t2[AvatarScreen.ExpiredUserLookActionBar] = {
		isTransparent = true,
		VRPanelPlacement = "Right",
		VRPanelRoundedCorners = true
	}
	t2[AvatarScreen.ExpiredUserLookCheckout] = {
		isTransparent = true,
		coversSceneWhenExpanded = true,
		VRPanelPlacement = "Right",
		VRPanelRoundedCorners = true,
		analyticsData = {
			unifiedLoggingSurface = UnifiedLoggingSurface.CUSTOMIZE
		}
	}
end

local t3 = {}

for _, v20 in AvatarScreen do
	t3[v20] = Cryo.Dictionary.join(t1, t2[v20] or {})
end

return t3

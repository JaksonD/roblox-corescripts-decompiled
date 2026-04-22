local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceNavigation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Enums.AvatarScreen);
local v3 = require(l_script_FirstAncestor_0.Enums.UnifiedLoggingSurface);
local v4 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.Dash);
local v6 = require(l_Parent_0.AvatarExperienceFlags);
local l_FFlagAXEditorSubcategoryFilters_0 = v6.FFlagAXEditorSubcategoryFilters;
local l_FFlagAXMISEnableMultiShopping_0 = v6.FFlagAXMISEnableMultiShopping;
local l_FFlagAXEnableExpiredUserLookCheckout_0 = v6.FFlagAXEnableExpiredUserLookCheckout;
local l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 = v6.FFlagAXFixGamepadNavigationOnOutfitManagement;
local v11 = game:DefineFastFlag("AXEnableMultiTryOnUI", false);
local v12 = game:DefineFastFlag("AXKeepTryOnsInAvatarEditor", false);
local l_FFlagAXFixAvatarScreenVR_0 = v6.FFlagAXFixAvatarScreenVR;
local l_FFlagAXMakeupReleaseFTUX_0 = v6.FFlagAXMakeupReleaseFTUX;
local l_FFlagAXCatalogMakeupSupport_0 = v6.FFlagAXCatalogMakeupSupport;
local v16 = {
    isTransparent = false, 
    coversSceneWhenExpanded = false, 
    isMultiTryOn = if l_FFlagAXMISEnableMultiShopping_0 then nil else false, 
    isTryOnOutfitResetPage = false, 
    isRefinementPage = false, 
    refinementButtonVisible = false, 
    VRPanelRoundedCorners = false, 
    VRPanelPlacement = "Center"
};
local v17 = {
    [v2.AccessoryAdjustment] = {
        isRefinementPage = true, 
        isMultiTryOn = if l_FFlagAXMISEnableMultiShopping_0 then nil else v11, 
        analyticsData = {
            unifiedLoggingSurface = v3.CUSTOMIZE
        }
    }, 
    [v2.AvatarExperienceLandingPage] = {
        isTryOnOutfitResetPage = true
    }, 
    [v2.AvatarExperienceRoot] = {}, 
    [v2.AvatarBackground] = {
        isTransparent = false
    }, 
    [v2.Catalog] = {
        refinementButtonVisible = true, 
        VRPanelPlacement = "None", 
        VRPanelRoundedCorners = true, 
        isMultiTryOn = if l_FFlagAXMISEnableMultiShopping_0 then nil else v11, 
        analyticsData = {
            unifiedLoggingSurface = v3.CATALOG
        }
    }, 
    [v2.CatalogContextMenu] = {
        VRPanelPlacement = "Right"
    }, 
    [v2.CatalogSearch] = {
        refinementButtonVisible = true, 
        VRPanelPlacement = "None", 
        VRPanelRoundedCorners = true, 
        isMultiTryOn = if l_FFlagAXMISEnableMultiShopping_0 then nil else v11, 
        analyticsData = {
            unifiedLoggingSurface = v3.SEARCH_RESULTS
        }
    }, 
    [v2.CatalogSearchLanding] = {
        refinementButtonVisible = true, 
        VRPanelPlacement = "None", 
        VRPanelRoundedCorners = true, 
        isMultiTryOn = if l_FFlagAXMISEnableMultiShopping_0 then nil else v11, 
        analyticsData = {
            unifiedLoggingSurface = v3.SEARCH_LANDING_PAGE
        }
    }, 
    [v2.ItemDetails] = {
        isTransparent = true, 
        coversSceneWhenExpanded = true, 
        VRPanelPlacement = "Right", 
        VRPanelRoundedCorners = true, 
        analyticsData = {
            unifiedLoggingSurface = v3.ITEM_DETAILS
        }
    }, 
    [v2.OutfitDetails] = {
        isTransparent = true, 
        coversSceneWhenExpanded = true, 
        VRPanelPlacement = "Right", 
        VRPanelRoundedCorners = true, 
        analyticsData = {
            unifiedLoggingSurface = v3.ITEM_DETAILS
        }
    }, 
    [v2.ItemOwnershipPage] = {
        isTransparent = true, 
        analyticsData = {
            unifiedLoggingSurface = v3.ITEM_DETAILS
        }
    }, 
    [v2.CreateOrUpdateOutfitMenu] = {
        VRPanelPlacement = "Left"
    }, 
    [v2.LayeredClothingSort] = {
        isRefinementPage = true, 
        VRPanelPlacement = "Center", 
        isMultiTryOn = if l_FFlagAXMISEnableMultiShopping_0 then nil else v11, 
        analyticsData = {
            unifiedLoggingSurface = v3.CUSTOMIZE
        }
    }, 
    [v2.LCSortContextMenu] = {
        VRPanelPlacement = "Right"
    }, 
    [v2.AvatarEditor] = {
        isTryOnOutfitResetPage = not v12 or false, 
        refinementButtonVisible = true, 
        VRPanelPlacement = "None", 
        VRPanelRoundedCorners = true, 
        analyticsData = {
            unifiedLoggingSurface = v3.CUSTOMIZE
        }
    }, 
    [v2.AvatarRefinement] = {
        VRPanelPlacement = "Right", 
        VRPanelRoundedCorners = true, 
        analyticsData = {
            unifiedLoggingSurface = v3.CUSTOMIZE
        }
    }, 
    [v2.ManageOutfitPage] = {
        isTransparent = not l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 or false, 
        analyticsData = {
            unifiedLoggingSurface = v3.CUSTOMIZE
        }
    }, 
    [v2.ProfilePictureEditorEmotes] = {
        isTryOnOutfitResetPage = true
    }, 
    [v2.ResellersPage] = {
        isTransparent = true, 
        analyticsData = {
            unifiedLoggingSurface = v3.ITEM_DETAILS
        }
    }, 
    [v2.SellItemPage] = {
        isTransparent = true, 
        analyticsData = {
            unifiedLoggingSurface = v3.ITEM_DETAILS
        }
    }, 
    [v2.SellItemPeekView] = {
        isTransparent = true, 
        analyticsData = {
            unifiedLoggingSurface = v3.ITEM_DETAILS
        }
    }, 
    [v2.SortAndFilters] = {
        isTransparent = true, 
        VRPanelPlacement = "Left"
    }, 
    [v2.TryOnItem] = {
        isTransparent = false, 
        analyticsData = {
            unifiedLoggingSurface = v3.ITEM_DETAILS
        }
    }, 
    [v2.UpdateOutfitPage] = {
        isTransparent = true, 
        VRPanelPlacement = "Left", 
        VRPanelRoundedCorners = true
    }, 
    [v2.AdjustAccessoryView] = {
        isTransparent = false, 
        analyticsData = {
            unifiedLoggingSurface = v3.CUSTOMIZE
        }
    }, 
    [v2.HeadRefinement] = {
        isRefinementPage = true, 
        analyticsData = {
            unifiedLoggingSurface = v3.CUSTOMIZE
        }
    }, 
    [v2.LookDetails] = {
        isTransparent = true, 
        coversSceneWhenExpanded = true, 
        VRPanelPlacement = "Right", 
        VRPanelRoundedCorners = true, 
        analyticsData = {
            unifiedLoggingSurface = v3.ITEM_DETAILS
        }
    }, 
    [v2.ContextMenu] = {
        VRPanelPlacement = "Right"
    }, 
    [v2.MySharedAvatars] = {
        isTryOnOutfitResetPage = true, 
        refinementButtonVisible = true, 
        VRPanelPlacement = "None", 
        VRPanelRoundedCorners = true, 
        analyticsData = {
            unifiedLoggingSurface = v3.CUSTOMIZE
        }
    }, 
    [v2.CommunityAvatarEntryMenu] = {
        VRPanelPlacement = "Left"
    }, 
    [v2.SearchLandingFocusedWidgetPage] = {
        refinementButtonVisible = true, 
        VRPanelPlacement = "None", 
        VRPanelRoundedCorners = true, 
        analyticsData = {
            unifiedLoggingSurface = v3.SEARCH_LANDING_PAGE
        }
    }, 
    [v2.BodyShape] = {
        isRefinementPage = true, 
        analyticsData = {
            unifiedLoggingSurface = v3.CUSTOMIZE
        }
    }, 
    [v2.AvatarSwitcher] = {
        isTransparent = false, 
        analyticsData = {
            unifiedLoggingSurface = v3.CUSTOMIZE
        }
    }, 
    [v2.EditEmotes] = {
        isTransparent = false, 
        isTryOnOutfitResetPage = true, 
        VRPanelPlacement = "None", 
        VRPanelRoundedCorners = true, 
        analyticsData = {
            unifiedLoggingSurface = v3.CUSTOMIZE
        }
    }
};
if l_FFlagAXFixAvatarScreenVR_0 then
    if l_FFlagAXCatalogMakeupSupport_0 then
        v17[v2.MakeupMax6LayersPrompt] = {
            isTransparent = false, 
            VRPanelPlacement = "Left", 
            VRPanelRoundedCorners = true
        };
    end;
    if l_FFlagAXMakeupReleaseFTUX_0 then
        v17[v2.MakeupReleaseFtuxPrompt] = {
            isTransparent = false, 
            VRPanelPlacement = "Left", 
            VRPanelRoundedCorners = true
        };
    end;
end;
if l_FFlagAXEditorSubcategoryFilters_0 then
    v17[v2.SubcategoryFiltersDropdown] = {
        isTransparent = true, 
        VRPanelPlacement = "Left"
    };
end;
if l_FFlagAXMISEnableMultiShopping_0 then
    v17[v2.Checkout] = {
        isTransparent = true, 
        coversSceneWhenExpanded = true, 
        VRPanelPlacement = "Right", 
        VRPanelRoundedCorners = true
    };
end;
if l_FFlagAXEnableExpiredUserLookCheckout_0 then
    v17[v2.ExpiredUserLookActionBar] = {
        isTransparent = true, 
        VRPanelPlacement = "Right", 
        VRPanelRoundedCorners = true
    };
    v17[v2.ExpiredUserLookCheckout] = {
        isTransparent = true, 
        coversSceneWhenExpanded = true, 
        VRPanelPlacement = "Right", 
        VRPanelRoundedCorners = true
    };
end;
local v18 = {};
for _, v20 in v2 do
    v18[v20] = v4.Dictionary.join(v16, v17[v20] or {});
end;
return v18;
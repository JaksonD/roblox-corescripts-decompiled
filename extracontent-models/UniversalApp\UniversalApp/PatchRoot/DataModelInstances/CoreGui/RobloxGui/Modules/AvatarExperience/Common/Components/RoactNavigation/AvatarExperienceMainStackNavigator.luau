local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.RoactNavigation);
local l_Components_0 = l_Modules_0.AvatarExperience.Common.Components;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v7 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v8 = require(l_Components_0.RoactNavigation.BackButtonAction);
local v9 = require(l_Components_0.RoactNavigation.LandingPageSwitchNavigator);
local v10 = require(l_Components_0.ItemDetails.ItemDetailsScreen);
local v11 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.OutfitDetailsScreen);
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.MySharedAvatars.MySharedAvatarsPage);
local v13 = require(l_Components_0.RoactNavigation.createAvatarExperienceStackNavigator);
local v14 = require(l_Components_0.AvatarBackground);
local v15 = require(l_Components_0.RoactNavigation.AvatarRefinementSwitchNavigator);
local v16 = require(l_Components_0.ItemDetails.SellPage.SellPage);
local v17 = require(l_Components_0.ItemDetails.ItemOwnershipPage.ItemOwnershipPage);
local v18 = require(l_Components_0.ItemDetails.SellPage.SellItemPeekView);
local l_Components_1 = l_Modules_0.AvatarExperience.Catalog.Components;
local v20 = require(l_Components_1.Search.CatalogSearchPage);
local v21 = require(l_Components_1.Search.CatalogSearchLandingPage);
local v22 = require(l_Components_1.Resellers.ResellersPage);
local v23 = require(l_Components_1.LookDetails.LookDetailsScreen);
local v24 = require(l_Components_0.RoactNavigation.CheckoutScreen);
local v25 = require(l_Modules_0.AvatarExperience.Catalog.Components.Search.LandingPage.SearchLandingFocusedWidgetPage);
local l_Components_2 = l_Modules_0.AvatarExperience.ProfilePictureEditor.Components;
local v27 = require(l_Components_2.ProfilePictureEditorCameraPage);
local v28 = require(l_Components_2.ProfilePictureEditorFinalPage);
local l_Components_3 = l_Modules_0.AvatarExperience.AvatarEditor.Components;
local v30 = require(l_Components_3.AssetManagement.UpdateOutfitPage);
local v31 = require(l_Components_3.AssetManagement.ManageOutfitPage);
local v32 = require(l_Components_3.AssetManagement.ManageOutfitPage_DEPRECATED);
local v33 = require(l_Components_3.LookComposer.LookComposerPage);
local v34 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Components.SubcategoryFilters.SubcategoryFiltersDropdown);
local v35 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Components.LayeredClothingSortPage);
local v36 = require(l_Modules_0.AvatarExperience.LayeredMakeupSort.Components.LayeredMakeupSortScreen);
local v37 = if require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableInventorySortsAndFilters)() then require(l_Components_1.Filters.SortAndFiltersScreenV2) else require(l_Components_1.Filters.SortAndFiltersScreen);
local v38 = require(l_Modules_0.AvatarExperience.AvatarSwitcher.AvatarSwitcherPageContainer);
local v39 = require(l_Modules_0.AvatarExperience.EditEmotes.EditEmotesPageContainer);
local v40 = require(l_Modules_0.AvatarExperience.Photobooth.PhotoboothPageContainer);
local l_FFlagAXPhotoboothFunctionality_0 = v6.FFlagAXPhotoboothFunctionality;
local v42 = require(l_CorePackages_0.Workspace.Packages.TenFootUiCommon);
local l_ScreenKind_0 = v42.TenFootUiRNTypes.ScreenKind;
local l_GlobalNavDisplayOption_0 = v42.TenFootUiRNTypes.GlobalNavDisplayOption;
local l_AXRecentlyViewedSearchItemsIXPTest_0 = v7.Experiments.AXRecentlyViewedSearchItemsIXPTest;
local v46 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local l_FFlagAXEditorSubcategoryFilters_0 = v6.FFlagAXEditorSubcategoryFilters;
local l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXMISEnableMultiShopping_0 = v6.FFlagAXMISEnableMultiShopping;
local l_FFlagAXCustomizeMakeupSupport_0 = v6.FFlagAXCustomizeMakeupSupport;
local l_FFlagAXEnableExpiredUserLookCheckout_0 = v6.FFlagAXEnableExpiredUserLookCheckout;
local v56 = {
    {
        [l_AvatarScreen_0.LandingPageSwitchNavigator] = {
            screen = v9, 
            navigationOptions = function(v53) --[[ Line: 91 ]] --[[ Name: navigationOptions ]]
                -- upvalues: v3 (copy)
                local l_navigation_0 = v53.navigation;
                local v55 = v3.getActiveChildNavigationOptions(l_navigation_0);
                return {
                    tabBarVisible = v55.tabBarVisible, 
                    backButtonAction = v55.backButtonAction
                };
            end
        }
    }, 
    {
        [l_AvatarScreen_0.AvatarBackground] = {
            screen = v14, 
            navigationOptions = {
                backButtonAction = v8.NoOp
            }
        }
    }, 
    {
        [l_AvatarScreen_0.ItemDetails] = v10
    }, 
    {
        [l_AvatarScreen_0.CatalogSearch] = v20
    }, 
    {
        [l_AvatarScreen_0.SellItemPage] = v16
    }, 
    {
        [l_AvatarScreen_0.ResellersPage] = v22
    }, 
    {
        [l_AvatarScreen_0.UpdateOutfitPage] = v30
    }, 
    {
        [l_AvatarScreen_0.ManageOutfitPage] = if l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 then v31 else v32
    }, 
    {
        [l_AvatarScreen_0.ProfilePictureEditorCamera] = v27
    }, 
    {
        [l_AvatarScreen_0.ProfilePictureEditorFinal] = v28
    }, 
    {
        [l_AvatarScreen_0.SortAndFilters] = v37
    }, 
    {
        [l_AvatarScreen_0.ItemOwnershipPage] = v17
    }, 
    {
        [l_AvatarScreen_0.SellItemPeekView] = v18
    }, 
    {
        [l_AvatarScreen_0.LookDetails] = v23
    }, 
    {
        [l_AvatarScreen_0.AvatarRefinementSwitchNavigator] = {
            screen = v15
        }
    }, 
    {
        [l_AvatarScreen_0.OutfitDetails] = v11
    }, 
    {
        [l_AvatarScreen_0.CatalogSearchLanding] = v21
    }
};
table.insert(v56, {
    [l_AvatarScreen_0.LayeredClothingSort] = v35
});
if l_FFlagAXCustomizeMakeupSupport_0 then
    table.insert(v56, {
        [l_AvatarScreen_0.LayeredMakeupSort] = v36
    });
end;
if l_FFlagAXEnableExpiredUserLookCheckout_0 then
    table.insert(v56, {
        [l_AvatarScreen_0.ExpiredUserLookCheckout] = v24
    });
end;
table.insert(v56, {
    [l_AvatarScreen_0.LookComposerPage] = v33
});
table.insert(v56, {
    [l_AvatarScreen_0.MySharedAvatars] = v12
});
if l_FFlagAXPhotoboothFunctionality_0 then
    table.insert(v56, {
        [l_AvatarScreen_0.Photobooth] = v40
    });
end;
if l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() then
    table.insert(v56, {
        [l_AvatarScreen_0.SearchLandingFocusedWidgetPage] = v25
    });
end;
if v46() then
    table.insert(v56, {
        [l_AvatarScreen_0.AvatarSwitcher] = v38
    });
    table.insert(v56, {
        [l_AvatarScreen_0.EditEmotes] = v39
    });
end;
if l_FFlagAXEditorSubcategoryFilters_0 then
    table.insert(v56, {
        [l_AvatarScreen_0.SubcategoryFiltersDropdown] = v34
    });
end;
if l_FFlagAXMISEnableMultiShopping_0 then
    table.insert(v56, {
        [l_AvatarScreen_0.Checkout] = v24
    });
end;
return v13(v56, {
    defaultNavigationOptions = {
        overlayEnabled = true, 
        overlayTransparency = 1, 
        absorbInput = false, 
        screenKind = l_ScreenKind_0.FullScreen, 
        globalNavDisplayOption = l_GlobalNavDisplayOption_0.HideAll, 
        hasSelectionGroup = not l_FFlagAXMigrateAXToGlobalAutofocus_0 and nil
    }, 
    mode = v3.StackPresentationStyle.Overlay
});
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactNavigation);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v8 = require(l_Modules_0.AvatarExperience.Common.Actions.CompleteExternalNavigation);
local v9 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v10 = require(l_Modules_0.AvatarExperience.Common.DeepLinkUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Actions.NavigatedToDeepLinkCatalogFilter);
local v15 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.NavigateToDeepLinkCatalogFilterThunk);
local v16 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.NavigateToSearch);
local v17 = require(l_Modules_0.AvatarExperience.Common.Thunks.TryOnLookV2);
local v18 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v19 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v20 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v21 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLookDetailsDeepLink);
local v22 = require(l_Modules_0.LuaApp.Flags.FFlagEnableProfilePictureEditorDeepLink);
local l_FFlagAXFixPrefetchMarketplaceStartupCrash_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixPrefetchMarketplaceStartupCrash;
local v24 = v4.PureComponent:extend("ExternalNavigationHandler");
local v25 = require(l_CorePackages_0.Workspace.Packages.AppDebug).LogTree.logger("ax.rn.externalnav");
v24.render = function(_) --[[ Line: 39 ]] --[[ Name: render ]]
    return nil;
end;
v24.didMount = function(v27) --[[ Line: 43 ]] --[[ Name: didMount ]]
    v27:processNavigationRequest();
end;
v24.didUpdate = function(v28, _) --[[ Line: 47 ]] --[[ Name: didUpdate ]]
    v28:processNavigationRequest();
end;
local function v32(v30, v31) --[[ Line: 52 ]] --[[ Name: editorCatalogSwitchAction ]]
    -- upvalues: v5 (copy), l_AvatarScreen_0 (copy)
    return v5.Actions.navigate({
        routeName = l_AvatarScreen_0.LandingPageSwitchNavigator, 
        action = v5.Actions.navigate({
            routeName = v30, 
            params = v31
        })
    });
end;
local function v34(v33) --[[ Line: 62 ]] --[[ Name: itemDetailsAction ]]
    -- upvalues: v3 (copy), v5 (copy), l_AvatarScreen_0 (copy)
    v33 = v3.Dictionary.join(v33, {
        category = v3.None, 
        subcategory = v3.None, 
        opaquePage = v3.None
    });
    return v5.Actions.navigate({
        routeName = l_AvatarScreen_0.ItemDetails, 
        params = v3.Dictionary.join(v33, {
            isFirstItemDetails = true
        })
    });
end;
local function v37(v35, v36) --[[ Line: 78 ]] --[[ Name: outfitDetailsAction ]]
    -- upvalues: v5 (copy), l_AvatarScreen_0 (copy)
    return v5.Actions.navigate({
        routeName = l_AvatarScreen_0.OutfitDetails, 
        params = {
            outfitId = v35.itemId, 
            ZIndex = 2, 
            showFullWithNoPeekView = not v36, 
            renderBottomBar = false
        }
    });
end;
v24.processNavigationRequest = function(v38) --[[ Line: 90 ]] --[[ Name: processNavigationRequest ]]
    local l_completeExternalNavigation_0 = v38.props.completeExternalNavigation;
    local l_externalNavigationRequest_0 = v38.props.externalNavigationRequest;
    if l_externalNavigationRequest_0.completedRequestId ~= l_externalNavigationRequest_0.requestId then
        l_completeExternalNavigation_0(l_externalNavigationRequest_0.requestId);
        v38:navigateToScreen(l_externalNavigationRequest_0.screen, l_externalNavigationRequest_0.params);
    end;
end;
v24.navigateToScreen = function(v41, v42, v43) --[[ Line: 100 ]] --[[ Name: navigateToScreen ]]
    -- upvalues: v25 (copy), l_AvatarScreen_0 (copy), v5 (copy), v32 (copy), v34 (copy), v37 (copy), v21 (copy), l_PeekViewState_0 (copy), v22 (copy), v9 (copy), v10 (copy)
    v25:info("navigateToScreen: {}, params: {}", v42, v43);
    local l_navigation_0 = v41.props.navigation;
    local l_isPortrait_0 = v41.props.isPortrait;
    local function v47(v46) --[[ Line: 105 ]]
        -- upvalues: l_navigation_0 (copy), l_AvatarScreen_0 (ref), v5 (ref)
        l_navigation_0.navigate(l_AvatarScreen_0.AvatarExperienceMainStackNavigator, {}, v5.StackActions.reset({
            actions = v46, 
            index = 2
        }));
    end;
    if v42 == l_AvatarScreen_0.ItemDetails then
        local l_Catalog_0 = l_AvatarScreen_0.Catalog;
        if v43.opaquePage then
            l_Catalog_0 = v43.opaquePage;
        end;
        v47({
            v32(l_Catalog_0, {}), 
            v34(v43)
        });
        return;
    elseif v42 == l_AvatarScreen_0.OutfitDetails then
        v47({
            v32(l_AvatarScreen_0.AvatarEditor, {}), 
            v37(v43, l_isPortrait_0)
        });
        return;
    elseif v21 and v42 == l_AvatarScreen_0.LookDetails then
        v41.props.dispatchTryOnLookV2(v41.props.networking, v41.props.navigation, v41.props.catalogAnalytics, v43.itemId, l_PeekViewState_0.Full);
        v47({
            v32(l_AvatarScreen_0.Catalog, {}), 
            v5.Actions.navigate({
                routeName = l_AvatarScreen_0.LookDetails
            })
        });
        return;
    elseif v42 == l_AvatarScreen_0.LayeredClothingSort then
        v47({
            v32(l_AvatarScreen_0.Catalog, {}), 
            v5.Actions.navigate({
                routeName = v42
            })
        });
        return;
    elseif v42 == l_AvatarScreen_0.AvatarExperienceLandingPage or v42 == l_AvatarScreen_0.AvatarEditor or v22 and v42 == l_AvatarScreen_0.ProfilePictureEditorEmotes then
        l_navigation_0.navigate(v42);
        return;
    elseif v9.isAvatarBackground(v42) or v42 == l_AvatarScreen_0.Catalog then
        l_navigation_0.navigate(v42, v43);
        return;
    elseif v42 == l_AvatarScreen_0.CatalogSearch then
        local v49 = v10.buildCatalogFilterFromDeepLinkParams(v43);
        local v50 = {
            searchKeyword = v43.keyword
        };
        v41.props.applyDeepLinkCatalogFilters(v49);
        v41.props.navigateToSearch(v41.props.navigation, v50);
        return;
    else
        warn("[ExternalNavigationHandler] Invalid screen:", v42);
        return;
    end;
end;
local function v53(v51, _) --[[ Line: 187 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v20 (copy)
    return {
        externalNavigationRequest = v51.AvatarExperience.ExternalNavigationRequest, 
        isPortrait = v20(v51)
    };
end;
local function v64(v54) --[[ Line: 194 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v8 (copy), v21 (copy), v17 (copy), l_FFlagAXFixPrefetchMarketplaceStartupCrash_0 (copy), v15 (copy), v14 (copy), v16 (copy)
    return {
        completeExternalNavigation = function(v55) --[[ Line: 196 ]] --[[ Name: completeExternalNavigation ]]
            -- upvalues: v54 (copy), v8 (ref)
            v54(v8(v55));
        end, 
        dispatchTryOnLookV2 = v21 and function(v56, v57, v58, v59, v60) --[[ Line: 201 ]]
            -- upvalues: v54 (copy), v17 (ref)
            v54(v17(v56, v57, v58, v59, v60, 1));
        end or nil, 
        applyDeepLinkCatalogFilters = function(v61) --[[ Line: 205 ]] --[[ Name: applyDeepLinkCatalogFilters ]]
            -- upvalues: l_FFlagAXFixPrefetchMarketplaceStartupCrash_0 (ref), v54 (copy), v15 (ref), v14 (ref)
            if l_FFlagAXFixPrefetchMarketplaceStartupCrash_0 then
                v54(v15(v61));
                return;
            else
                v54(v14(v61));
                return;
            end;
        end, 
        navigateToSearch = function(v62, v63) --[[ Line: 212 ]] --[[ Name: navigateToSearch ]]
            -- upvalues: v54 (copy), v16 (ref)
            return v54(v16(v62, v63));
        end
    };
end;
if v21 then
    v24 = l_RoactServices_0.connect({
        catalogAnalytics = v18, 
        networking = v19
    })(v24);
end;
return (v6.connect(v53, v64)(v24));
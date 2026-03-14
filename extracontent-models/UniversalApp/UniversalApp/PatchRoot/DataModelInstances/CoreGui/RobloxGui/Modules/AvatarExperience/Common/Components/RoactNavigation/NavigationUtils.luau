local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Actions_0 = require(l_CorePackages_0.Packages.RoactNavigation).Actions;
local v3 = require(l_CorePackages_0.Packages.Cryo);
local _ = require(l_CorePackages_0.Packages.Dash);
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v7 = require(l_CorePackages_0.Workspace.Packages.AppDebug).LogTree.logger("ax.rn.navutils");
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.AvatarExperienceActions);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local _ = require(l_Modules_0.AvatarExperience.Catalog.SearchTypes);
local v12 = {
    instantTransitionConfig = function() --[[ Line: 27 ]] --[[ Name: instantTransitionConfig ]]
        return {
            transitionSpec = {
                frequency = 100000, 
                dampingRatio = 1
            }
        };
    end
};
v12.navigateToSearch = function(v13, v14, v15) --[[ Line: 36 ]] --[[ Name: navigateToSearch ]]
    -- upvalues: v12 (copy), l_AvatarScreen_0 (copy), v8 (copy), l_Actions_0 (copy)
    v12.closeFiltersAndItemDetails(v13);
    v12.closeTryOnManager(v13);
    local v16 = {
        l_AvatarScreen_0.CatalogSearch, 
        l_AvatarScreen_0.CatalogSearchLanding
    };
    v13.dispatch(v8.clearScreens(v16));
    v13.dispatch(l_Actions_0.navigate({
        routeName = l_AvatarScreen_0.CatalogSearch, 
        params = {
            detail = v14, 
            searchParams = v15
        }, 
        key = tostring(v14)
    }));
end;
v12.isWithinViewContext = function(v17, v18) --[[ Line: 63 ]] --[[ Name: isWithinViewContext ]]
    -- upvalues: v3 (copy), l_Logging_0 (copy)
    if v17 and v17.previousPages and #v18 > 0 then
        local l_previousPages_0 = v17.previousPages;
        return #v3.List.filter(l_previousPages_0, function(v20) --[[ Line: 66 ]]
            -- upvalues: v18 (copy)
            return v20.name == v18;
        end) > 0;
    else
        l_Logging_0.warn("NavigationUtils.isWithinViewContext() failed because you forget to provide a valid avatarRoute");
        return false;
    end;
end;
v12.isFirstItemDetailsPage = function(v21) --[[ Line: 82 ]] --[[ Name: isFirstItemDetailsPage ]]
    return v21 and v21.getParam("isFirstItemDetails");
end;
v12.closeFocusedScreen = function(v22) --[[ Line: 94 ]] --[[ Name: closeFocusedScreen ]]
    -- upvalues: l_Actions_0 (copy)
    v22.dispatch(l_Actions_0.back(nil));
end;
v12.closeFiltersAndItemDetails = function(v23) --[[ Line: 106 ]] --[[ Name: closeFiltersAndItemDetails ]]
    -- upvalues: l_AvatarScreen_0 (copy), v8 (copy)
    local v24 = {
        l_AvatarScreen_0.ItemDetails, 
        l_AvatarScreen_0.SortAndFilters, 
        l_AvatarScreen_0.OutfitDetails, 
        l_AvatarScreen_0.LookDetails
    };
    v23.dispatch(v8.clearScreens(v24));
end;
v12.closeMySharedAvatars = function(v25) --[[ Line: 117 ]] --[[ Name: closeMySharedAvatars ]]
    -- upvalues: l_AvatarScreen_0 (copy), v8 (copy)
    local v26 = {
        l_AvatarScreen_0.MySharedAvatars, 
        l_AvatarScreen_0.LookDetails
    };
    v25.dispatch(v8.clearScreens(v26));
end;
v12.closeLookComposer = function(v27) --[[ Line: 126 ]] --[[ Name: closeLookComposer ]]
    -- upvalues: l_AvatarScreen_0 (copy), v8 (copy)
    local v28 = {
        l_AvatarScreen_0.LookComposerPage, 
        l_AvatarScreen_0.LookDetails
    };
    v27.dispatch(v8.clearScreens(v28));
end;
v12.closeSearchLandingPageFocusedWidget = function(v29) --[[ Line: 135 ]] --[[ Name: closeSearchLandingPageFocusedWidget ]]
    -- upvalues: l_AvatarScreen_0 (copy), v8 (copy)
    local v30 = {
        l_AvatarScreen_0.SearchLandingFocusedWidgetPage
    };
    v29.dispatch(v8.clearScreens(v30));
end;
v12.closeSearchLandingPage = function(v31) --[[ Line: 142 ]] --[[ Name: closeSearchLandingPage ]]
    -- upvalues: l_AvatarScreen_0 (copy), v8 (copy)
    local v32 = {
        l_AvatarScreen_0.CatalogSearchLanding
    };
    v31.dispatch(v8.clearScreens(v32));
end;
v12.closeTryOnManager = function(v33, v34) --[[ Line: 153 ]] --[[ Name: closeTryOnManager ]]
    -- upvalues: l_AvatarScreen_0 (copy), v8 (copy)
    local v35 = {
        l_AvatarScreen_0.TryOnManager, 
        l_AvatarScreen_0.LookDetails
    };
    if v34 then
        v35 = v34;
    end;
    v33.dispatch(v8.clearScreens(v35));
end;
v12.getRootNavigation = function(v36) --[[ Line: 169 ]] --[[ Name: getRootNavigation ]]
    local l_v36_0 = v36;
    while l_v36_0 do
        v36 = l_v36_0;
        l_v36_0 = v36._dangerouslyGetParent and v36._dangerouslyGetParent() or nil;
    end;
    return v36;
end;
v12.closeAllDialogs = function(v38) --[[ Line: 178 ]] --[[ Name: closeAllDialogs ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    v38.navigate(l_AvatarScreen_0.AvatarExperienceMainStackNavigator);
end;
local function v39() --[[ Line: 182 ]]

end;
local function _(v40) --[[ Line: 184 ]] --[[ Name: getRouteName ]]
    return v40 and v40.state and v40.state.routeName or "<UnknownRoute>";
end;
local function _(v42) --[[ Line: 188 ]] --[[ Name: callbackToString ]]
    -- upvalues: v39 (copy)
    if v42 == v39 then
        return "no-op";
    elseif v42 == nil then
        return "nil";
    else
        return "callback";
    end;
end;
v12.removeOnOverlayClosed = function(v44) --[[ Line: 201 ]] --[[ Name: removeOnOverlayClosed ]]
    -- upvalues: v39 (copy), v7 (copy)
    local l_onOverlayClosed_0 = (v44.state.params or {}).onOverlayClosed;
    if l_onOverlayClosed_0 then
        v44.setParams({
            onOverlayClosed = v39
        });
    end;
    if v7.active[v7.Levels.Debug] then
        v7:debug("removeOnOverlayClosed, routeName={}", v44 and v44.state and v44.state.routeName or "<UnknownRoute>");
    end;
    return l_onOverlayClosed_0;
end;
v12.invokeOnOverlayClosed = function(v46) --[[ Line: 215 ]] --[[ Name: invokeOnOverlayClosed ]]
    -- upvalues: v7 (copy), v39 (copy)
    local v47 = v46.getParam("onOverlayClosed");
    if v7.active[v7.Levels.Debug] then
        v7:debug("invokeOnOverlayClosed, routeName={}, onOverlayClosed={}", v46 and v46.state and v46.state.routeName or "<UnknownRoute>", v47 == v39 and "no-op" or v47 == nil and "nil" or "callback");
    end;
    if v47 then
        v47();
    end;
end;
v12.closeOverlay = function(v48) --[[ Line: 240 ]] --[[ Name: closeOverlay ]]
    -- upvalues: v12 (copy)
    v12.invokeOnOverlayClosed(v48);
    v48.goBack();
end;
v12.navigateFromOverlay = function(v49, ...) --[[ Line: 255 ]] --[[ Name: navigateFromOverlay ]]
    -- upvalues: v12 (copy)
    v12.invokeOnOverlayClosed(v49);
    v49.navigate(...);
end;
v12.navigateToNextOverlay = function(v50, v51, v52, ...) --[[ Line: 268 ]] --[[ Name: navigateToNextOverlay ]]
    -- upvalues: v12 (copy), v7 (copy), v39 (copy), v3 (copy)
    local v53 = v12.removeOnOverlayClosed(v50);
    if v7.active[v7.Levels.Debug] then
        v7:debug("navigateToNextOverlay {} -> {}, onOverlayClosed={}", v50 and v50.state and v50.state.routeName or "<UnknownRoute>", v51, v53 == v39 and "no-op" or v53 == nil and "nil" or "callback");
    end;
    local v54 = v3.Dictionary.join(v52 or {}, {
        onOverlayClosed = v53
    });
    v50.replace(v51, v54, ...);
end;
v12.getActiveScreenNavigationState = function(v55) --[[ Line: 285 ]] --[[ Name: getActiveScreenNavigationState ]]
    while v55.routes do
        v55 = v55.routes[v55.index];
    end;
    return v55;
end;
return v12;
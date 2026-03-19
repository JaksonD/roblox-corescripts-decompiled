local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.React);
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useRouteSessionManager);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.BackButtonHandler);
local v8 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarRouteUpdater);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.ExternalNavigationHandler);
local v10 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarExperienceTransitionManager);
local v11 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Components.LayeredClothingSortHandler);
local v12 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v15 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v16 = game:DefineFastInt("AXTopLevelCountersThrottleInterval", 800);
local l_usePrevious_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.usePrevious;
local function v23(v18, v19) --[[ Line: 42 ]] --[[ Name: trackTopLevelCounters ]]
    -- upvalues: v12 (copy), l_AvatarScreen_0 (copy), v14 (copy)
    local l_name_0 = v18.current.name;
    local l_Counter_0 = v12.Counter;
    local v22 = ({
        [l_AvatarScreen_0.Catalog] = l_Counter_0.CatalogView, 
        [l_AvatarScreen_0.CatalogSearch] = l_Counter_0.SearchView, 
        [l_AvatarScreen_0.AvatarEditor] = l_Counter_0.EditorView, 
        [l_AvatarScreen_0.ItemDetails] = function() --[[ Line: 49 ]]
            -- upvalues: v14 (ref), v18 (copy), l_AvatarScreen_0 (ref), l_Counter_0 (copy)
            return v14.isWithinViewContext(v18, l_AvatarScreen_0.CatalogSearch) and l_Counter_0.SearchItemDetailsView or l_Counter_0.CatalogItemDetailsView;
        end, 
        [l_AvatarScreen_0.SortAndFilters] = function() --[[ Line: 53 ]]
            -- upvalues: v14 (ref), v18 (copy), l_AvatarScreen_0 (ref), l_Counter_0 (copy)
            return v14.isWithinViewContext(v18, l_AvatarScreen_0.CatalogSearch) and l_Counter_0.SearchFiltersView or l_Counter_0.CatalogFiltersView;
        end, 
        [l_AvatarScreen_0.CatalogSearchLanding] = l_Counter_0.SearchLandingView
    })[l_name_0] or l_Counter_0.OthersView;
    if type(v22) == "function" then
        v22 = v22();
    end;
    v19.sendAXCounter(v22);
    v19.sendAXCounterV2(l_Counter_0.TopLevelViews, {
        Page = v22
    });
end;
return function(v24) --[[ Line: 68 ]] --[[ Name: AvatarExperienceAlwaysMounted ]]
    -- upvalues: v6 (copy), l_useRoactService_0 (copy), v15 (copy), v4 (copy), l_usePrevious_0 (copy), v16 (copy), v23 (copy), v3 (copy), v7 (copy), v9 (copy), v10 (copy), v8 (copy), v11 (copy)
    local l_avatarRoute_0 = v24.avatarRoute;
    local l_navigation_0 = v24.navigation;
    v6(l_avatarRoute_0);
    local v27 = l_useRoactService_0(v15);
    local v28 = v4.useRef(0);
    local v29 = l_usePrevious_0(l_avatarRoute_0);
    v4.useEffect(function() --[[ Line: 79 ]]
        -- upvalues: l_avatarRoute_0 (copy), v29 (copy), v28 (copy), v16 (ref), v23 (ref), v27 (copy)
        if l_avatarRoute_0.current.name ~= (v29 and v29.current.name or nil) then
            local v30 = os.clock() * 1000;
            if v30 and v28 and v28.current and v30 - v28.current >= v16 then
                v23(l_avatarRoute_0, v27);
                v28.current = v30;
            end;
        end;
    end, {
        v29, 
        l_avatarRoute_0, 
        v27
    });
    return v3.createFragment({
        BackButtonHandler = v3.createElement(v7, {
            navigation = l_navigation_0
        }), 
        ExternalNavigationHandler = v3.createElement(v9, {
            navigation = l_navigation_0
        }), 
        AvatarExperienceTransitionManager = v3.createElement(v10, {
            navigation = l_navigation_0
        }), 
        AvatarRouteUpdater = v3.createElement(v8, {
            avatarRoute = l_avatarRoute_0
        }), 
        LayeredClothingSortHandler = v3.createElement(v11, {
            avatarRoute = l_avatarRoute_0
        })
    });
end;
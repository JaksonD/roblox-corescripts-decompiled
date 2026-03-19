local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v9 = require(l_CorePackages_0.Packages.React);
local v10 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local l_useUserExperiment_0 = v10.useUserExperiment;
local l_SearchTypes_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).SearchTypes;
local v14 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_VerticalEfficiencyExperimentation_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryUtils).VerticalEfficiencyExperimentation;
local l_useSelector_0 = v14.Hooks.RoactRodux.useSelector;
local v17 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v18 = require(l_Modules_0.LuaApp.Components.TopBar.TopBarConstants);
local v19 = require(l_Modules_0.LuaApp.Components.GridHome.Header.UserInfo);
local v20 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagLuaAppMoveProfileIntoTopBar_0 = v20.FFlagLuaAppMoveProfileIntoTopBar;
local l_FFlagLuaAppMoveProfileIntoTopBarIXP_0 = v20.FFlagLuaAppMoveProfileIntoTopBarIXP;
local l_FFlagSearchTopResultsTabEnabledForAll_0 = v20.FFlagSearchTopResultsTabEnabledForAll;
local l_FFlagLuaAppEnableChartsPageProfileLink_0 = v20.FFlagLuaAppEnableChartsPageProfileLink;
local v25 = require(l_Modules_0.LuaApp.Flags.FFlagEnableFlyoutSidePanel);
local l_FFlagLuaAppChartsStickyHeader_0 = v20.FFlagLuaAppChartsStickyHeader;
local function _(v27) --[[ Line: 34 ]] --[[ Name: makePadding ]]
    -- upvalues: v9 (copy)
    return function() --[[ Line: 35 ]]
        -- upvalues: v9 (ref), v27 (copy)
        return v9.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, v27, 1, 0)
        });
    end;
end;
local v29 = nil;
if l_FFlagLuaAppEnableChartsPageProfileLink_0 then
    v29 = function(v30) --[[ Line: 45 ]]
        -- upvalues: v9 (copy), v19 (copy)
        return function(_) --[[ Line: 46 ]]
            -- upvalues: v9 (ref), v19 (ref), v30 (copy)
            return v9.createElement(v19, {
                source = v30
            });
        end;
    end;
end;
return function(v32) --[[ Line: 57 ]]
    -- upvalues: l_useUserExperiment_0 (copy), l_AppUserLayers_0 (copy), l_FFlagSearchTopResultsTabEnabledForAll_0 (copy), l_useSelector_0 (copy), l_FFlagLuaAppEnableChartsPageProfileLink_0 (copy), v29 (ref), v19 (copy), v9 (copy), v17 (copy), v18 (copy), l_FFlagLuaAppMoveProfileIntoTopBar_0 (copy), l_FFlagLuaAppMoveProfileIntoTopBarIXP_0 (copy), l_VerticalEfficiencyExperimentation_0 (copy), l_FFlagLuaAppChartsStickyHeader_0 (copy), v25 (copy), l_SearchTypes_0 (copy)
    local v36, v37 = l_useUserExperiment_0({
        l_AppUserLayers_0.OmniSearchResultsPageUXExposureLayer
    }, function(v33) --[[ Line: 60 ]]
        -- upvalues: l_AppUserLayers_0 (ref), l_FFlagSearchTopResultsTabEnabledForAll_0 (ref)
        local v34 = v33[l_AppUserLayers_0.OmniSearchResultsPageUXExposureLayer] or {};
        local l_isSearchTypeAuto_0 = v34.isSearchTypeAuto;
        if not l_FFlagSearchTopResultsTabEnabledForAll_0 then
            return l_isSearchTypeAuto_0, v34.isTopPageEnabled;
        else
            return l_isSearchTypeAuto_0, nil;
        end;
    end, false);
    local v38 = nil;
    local v39 = nil;
    local v41 = l_useSelector_0(function(v40) --[[ Line: 74 ]]
        return v40.ScreenSize;
    end);
    if v32.useGridPageLayout then
        local v42 = if l_FFlagLuaAppEnableChartsPageProfileLink_0 then v29(v32.profileSource) else v19;
        local v43 = {};
        local l_v42_0 = v42;
        local v45 = 0;
        local l_v45_0 = v45 --[[ copy: 10 -> 13 ]];
        local function v47() --[[ Line: 35 ]]
            -- upvalues: v9 (ref), l_v45_0 (copy)
            return v9.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, l_v45_0, 1, 0)
            });
        end;
        v45 = v17.SearchButton;
        local l_BuyRobuxButton_0 = v17.BuyRobuxButton;
        local l_NotificationsButton_0 = v17.NotificationsButton;
        v6(v43, 1, l_v42_0, v47, v45, l_BuyRobuxButton_0, l_NotificationsButton_0);
        v38 = v43;
        v39 = v41.X < v18.COMPACT_WIDTH_BREAKPOINT;
    else
        v38 = {
            v17.SearchButton, 
            v17.BuyRobuxButton, 
            v17.NotificationsButton
        };
    end;
    local v50 = nil;
    if l_FFlagLuaAppMoveProfileIntoTopBar_0 then
        v50 = not v32.useGridPageLayout and (not l_FFlagLuaAppMoveProfileIntoTopBarIXP_0 or l_VerticalEfficiencyExperimentation_0.getIsProfileMovedToTopBar());
    end;
    return v9.createElement(v17.Container, {
        titleText = v32.titleText, 
        ZIndex = if l_FFlagLuaAppChartsStickyHeader_0 and v32.zIndexOverride then v32.zIndexOverride else 2, 
        forceCompactMode = v39, 
        leftItem = if l_FFlagLuaAppMoveProfileIntoTopBar_0 and v50 or v25 then v17.PersonalizationLeftItem else v17.BackButton, 
        rightItems = v38, 
        searchType = if not not l_FFlagSearchTopResultsTabEnabledForAll_0 or v37 then l_SearchTypes_0.TopResults else if v36 then l_SearchTypes_0.Auto else nil
    });
end;
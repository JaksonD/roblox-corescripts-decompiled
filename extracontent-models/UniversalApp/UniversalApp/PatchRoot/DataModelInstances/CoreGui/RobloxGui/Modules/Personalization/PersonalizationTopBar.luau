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
local l_FFlagEnableHomeRobloxLogo_0 = v20.FFlagEnableHomeRobloxLogo;
local v26 = require(l_Modules_0.LuaApp.Flags.FFlagEnableFlyoutSidePanel);
local l_FFlagLuaAppChartsStickyHeader_0 = v20.FFlagLuaAppChartsStickyHeader;
local l_FFlagLuaAppCompositionSupport_0 = v20.FFlagLuaAppCompositionSupport;
local function _(v29) --[[ Line: 38 ]] --[[ Name: makePadding ]]
    -- upvalues: v9 (copy)
    return function() --[[ Line: 39 ]]
        -- upvalues: v9 (ref), v29 (copy)
        return v9.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, v29, 1, 0)
        });
    end;
end;
local v31 = nil;
if l_FFlagLuaAppEnableChartsPageProfileLink_0 then
    v31 = function(v32) --[[ Line: 49 ]]
        -- upvalues: v9 (copy), v19 (copy)
        return function(_) --[[ Line: 50 ]]
            -- upvalues: v9 (ref), v19 (ref), v32 (copy)
            return v9.createElement(v19, {
                source = v32
            });
        end;
    end;
end;
return function(v34) --[[ Line: 61 ]]
    -- upvalues: l_useUserExperiment_0 (copy), l_AppUserLayers_0 (copy), l_FFlagSearchTopResultsTabEnabledForAll_0 (copy), l_useSelector_0 (copy), l_FFlagLuaAppEnableChartsPageProfileLink_0 (copy), v31 (ref), v19 (copy), v9 (copy), v17 (copy), v18 (copy), l_FFlagLuaAppMoveProfileIntoTopBar_0 (copy), l_FFlagLuaAppMoveProfileIntoTopBarIXP_0 (copy), l_VerticalEfficiencyExperimentation_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_FFlagLuaAppChartsStickyHeader_0 (copy), v26 (copy), l_FFlagEnableHomeRobloxLogo_0 (copy), l_SearchTypes_0 (copy)
    local v38, v39 = l_useUserExperiment_0({
        l_AppUserLayers_0.OmniSearchResultsPageUXExposureLayer
    }, function(v35) --[[ Line: 64 ]]
        -- upvalues: l_AppUserLayers_0 (ref), l_FFlagSearchTopResultsTabEnabledForAll_0 (ref)
        local v36 = v35[l_AppUserLayers_0.OmniSearchResultsPageUXExposureLayer] or {};
        local l_isSearchTypeAuto_0 = v36.isSearchTypeAuto;
        if not l_FFlagSearchTopResultsTabEnabledForAll_0 then
            return l_isSearchTypeAuto_0, v36.isTopPageEnabled;
        else
            return l_isSearchTypeAuto_0, nil;
        end;
    end, false);
    local v40 = nil;
    local v41 = nil;
    local v43 = l_useSelector_0(function(v42) --[[ Line: 78 ]]
        return v42.ScreenSize;
    end);
    if v34.useGridPageLayout then
        local v44 = if l_FFlagLuaAppEnableChartsPageProfileLink_0 then v31(v34.profileSource) else v19;
        local v45 = {};
        local l_v44_0 = v44;
        local v47 = 0;
        local l_v47_0 = v47 --[[ copy: 10 -> 13 ]];
        local function v49() --[[ Line: 39 ]]
            -- upvalues: v9 (ref), l_v47_0 (copy)
            return v9.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, l_v47_0, 1, 0)
            });
        end;
        v47 = v17.SearchButton;
        local l_BuyRobuxButton_0 = v17.BuyRobuxButton;
        local l_NotificationsButton_0 = v17.NotificationsButton;
        v6(v45, 1, l_v44_0, v49, v47, l_BuyRobuxButton_0, l_NotificationsButton_0);
        v40 = v45;
        v41 = v43.X < v18.COMPACT_WIDTH_BREAKPOINT;
    else
        v40 = {
            v17.SearchButton, 
            v17.BuyRobuxButton, 
            v17.NotificationsButton
        };
    end;
    local v52 = nil;
    if l_FFlagLuaAppMoveProfileIntoTopBar_0 then
        v52 = not v34.useGridPageLayout and (not l_FFlagLuaAppMoveProfileIntoTopBarIXP_0 or l_VerticalEfficiencyExperimentation_0.getIsProfileMovedToTopBar());
    end;
    return v9.createElement(v17.Container, {
        tag = if l_FFlagLuaAppCompositionSupport_0 then v34.tag else nil, 
        titleText = v34.titleText, 
        ZIndex = if l_FFlagLuaAppChartsStickyHeader_0 and v34.zIndexOverride then v34.zIndexOverride else 2, 
        forceCompactMode = v41, 
        leftItem = if l_FFlagLuaAppMoveProfileIntoTopBar_0 and v52 or v26 or l_FFlagEnableHomeRobloxLogo_0 then v17.PersonalizationLeftItem else v17.BackButton, 
        rightItems = v40, 
        searchType = if not not l_FFlagSearchTopResultsTabEnabledForAll_0 or v39 then l_SearchTypes_0.TopResults else if v38 then l_SearchTypes_0.Auto else nil, 
        sideMarginOverride = if l_FFlagLuaAppCompositionSupport_0 then v34.sideMarginOverride else nil
    });
end;
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
local l_FFlagLuaAppCompositionSupport_0 = v20.FFlagLuaAppCompositionSupport;
local function _(v28) --[[ Line: 37 ]] --[[ Name: makePadding ]]
    -- upvalues: v9 (copy)
    return function() --[[ Line: 38 ]]
        -- upvalues: v9 (ref), v28 (copy)
        return v9.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, v28, 1, 0)
        });
    end;
end;
local v30 = nil;
if l_FFlagLuaAppEnableChartsPageProfileLink_0 then
    v30 = function(v31) --[[ Line: 48 ]]
        -- upvalues: v9 (copy), v19 (copy)
        return function(_) --[[ Line: 49 ]]
            -- upvalues: v9 (ref), v19 (ref), v31 (copy)
            return v9.createElement(v19, {
                source = v31
            });
        end;
    end;
end;
return function(v33) --[[ Line: 60 ]]
    -- upvalues: l_useUserExperiment_0 (copy), l_AppUserLayers_0 (copy), l_FFlagSearchTopResultsTabEnabledForAll_0 (copy), l_useSelector_0 (copy), l_FFlagLuaAppEnableChartsPageProfileLink_0 (copy), v30 (ref), v19 (copy), v9 (copy), v17 (copy), v18 (copy), l_FFlagLuaAppMoveProfileIntoTopBar_0 (copy), l_FFlagLuaAppMoveProfileIntoTopBarIXP_0 (copy), l_VerticalEfficiencyExperimentation_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_FFlagLuaAppChartsStickyHeader_0 (copy), v25 (copy), l_SearchTypes_0 (copy)
    local v37, v38 = l_useUserExperiment_0({
        l_AppUserLayers_0.OmniSearchResultsPageUXExposureLayer
    }, function(v34) --[[ Line: 63 ]]
        -- upvalues: l_AppUserLayers_0 (ref), l_FFlagSearchTopResultsTabEnabledForAll_0 (ref)
        local v35 = v34[l_AppUserLayers_0.OmniSearchResultsPageUXExposureLayer] or {};
        local l_isSearchTypeAuto_0 = v35.isSearchTypeAuto;
        if not l_FFlagSearchTopResultsTabEnabledForAll_0 then
            return l_isSearchTypeAuto_0, v35.isTopPageEnabled;
        else
            return l_isSearchTypeAuto_0, nil;
        end;
    end, false);
    local v39 = nil;
    local v40 = nil;
    local v42 = l_useSelector_0(function(v41) --[[ Line: 77 ]]
        return v41.ScreenSize;
    end);
    if v33.useGridPageLayout then
        local v43 = if l_FFlagLuaAppEnableChartsPageProfileLink_0 then v30(v33.profileSource) else v19;
        local v44 = {};
        local l_v43_0 = v43;
        local v46 = 0;
        local l_v46_0 = v46 --[[ copy: 10 -> 13 ]];
        local function v48() --[[ Line: 38 ]]
            -- upvalues: v9 (ref), l_v46_0 (copy)
            return v9.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, l_v46_0, 1, 0)
            });
        end;
        v46 = v17.SearchButton;
        local l_BuyRobuxButton_0 = v17.BuyRobuxButton;
        local l_NotificationsButton_0 = v17.NotificationsButton;
        v6(v44, 1, l_v43_0, v48, v46, l_BuyRobuxButton_0, l_NotificationsButton_0);
        v39 = v44;
        v40 = v42.X < v18.COMPACT_WIDTH_BREAKPOINT;
    else
        v39 = {
            v17.SearchButton, 
            v17.BuyRobuxButton, 
            v17.NotificationsButton
        };
    end;
    local v51 = nil;
    if l_FFlagLuaAppMoveProfileIntoTopBar_0 then
        v51 = not v33.useGridPageLayout and (not l_FFlagLuaAppMoveProfileIntoTopBarIXP_0 or l_VerticalEfficiencyExperimentation_0.getIsProfileMovedToTopBar());
    end;
    return v9.createElement(v17.Container, {
        tag = if l_FFlagLuaAppCompositionSupport_0 then v33.tag else nil, 
        titleText = v33.titleText, 
        ZIndex = if l_FFlagLuaAppChartsStickyHeader_0 and v33.zIndexOverride then v33.zIndexOverride else 2, 
        forceCompactMode = v40, 
        leftItem = if l_FFlagLuaAppMoveProfileIntoTopBar_0 and v51 or v25 then v17.PersonalizationLeftItem else v17.BackButton, 
        rightItems = v39, 
        searchType = if not not l_FFlagSearchTopResultsTabEnabledForAll_0 or v38 then l_SearchTypes_0.TopResults else if v37 then l_SearchTypes_0.Auto else nil, 
        sideMarginOverride = if l_FFlagLuaAppCompositionSupport_0 then v33.sideMarginOverride else nil
    });
end;
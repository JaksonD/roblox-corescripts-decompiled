local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local l_getTestId_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).getTestId;
local l_useStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Core.Style.useStyle;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_AppNotificationService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppNotificationService;
local v7 = require(l_CorePackages_0.Workspace.Packages.AppNavBar);
local l_VisibilityControl_0 = v7.VisibilityControl;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_OmniFeedPageSection_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).OmniFeedConstants.OmniFeedPageSection;
local v11 = require(l_CorePackages_0.Packages.Foundation);
local l_useTokens_0 = v11.Hooks.useTokens;
local l_Divider_0 = v11.Divider;
local l_Orientation_0 = v11.Enums.Orientation;
local v15 = require(l_CorePackages_0.Workspace.Packages.ServerDrivenUi);
local l_useCollectionLayoutConfig_0 = require(l_CorePackages_0.Workspace.Packages.CollectionViews).useCollectionLayoutConfig;
local v17 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v18 = require(l_Modules_0.Personalization.PersonalizationTopBar);
local v19 = require(l_Modules_0.LuaApp.Components.TopBar.TopBar);
local v20 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local v21 = require(l_Modules_0.Personalization.Games.GamesOmniFeed);
local v22 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v23 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v24 = require(l_Modules_0.Personalization.OmniFeed.FeedViews.OmniFeedView);
local l_FlyoutSidePanelIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedExperimentDefinition).FlyoutSidePanelIXP;
local l_Sources_0 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics).Analytics.Enums.Sources;
local v27 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagAppIaScrollAway_0 = v27.FFlagAppIaScrollAway;
local l_FFlagAppIaHomeSubTab_0 = v27.FFlagAppIaHomeSubTab;
local l_FFlagLuaAppEnableChartsPageProfileLink_0 = v27.FFlagLuaAppEnableChartsPageProfileLink;
local l_FFlagLuaAppAddTestIdsForArrow_0 = v27.FFlagLuaAppAddTestIdsForArrow;
local l_FFlagLuaAppChartsStickyHeader_0 = v27.FFlagLuaAppChartsStickyHeader;
local l_FFlagLuaAppLayoutParamsInContext_0 = v27.FFlagLuaAppLayoutParamsInContext;
local l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 = v27.FFlagLuaAppChartsResetFetchingStatusOnFilterChange;
local v35 = if l_FFlagLuaAppChartsStickyHeader_0 then l_AppPage_0.Games else nil;
local v36 = l_FFlagLuaAppChartsStickyHeader_0 and "HEADER_GAMESFEEDITEM_IMPRESSIONS" or nil;
local v37 = if l_FFlagLuaAppChartsStickyHeader_0 then {} else nil;
local function v74(v38) --[[ Line: 57 ]]
    -- upvalues: v20 (copy), l_FFlagLuaAppEnableChartsPageProfileLink_0 (copy), v17 (copy), v23 (copy), l_AppNotificationService_0 (copy), l_useSelector_0 (copy), l_useStyle_0 (copy), l_FFlagLuaAppChartsStickyHeader_0 (copy), l_useTokens_0 (copy), l_FFlagAppIaScrollAway_0 (copy), v2 (copy), l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 (copy), v22 (copy), v35 (copy), v37 (copy), l_OmniFeedPageSection_0 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_useCollectionLayoutConfig_0 (copy), v15 (copy), l_FFlagAppIaHomeSubTab_0 (copy), l_FlyoutSidePanelIXP_0 (copy), v7 (copy), l_VisibilityControl_0 (copy), v21 (copy), v18 (copy), l_Sources_0 (copy), l_Divider_0 (copy), l_Orientation_0 (copy), v24 (copy), v36 (copy), v19 (copy), l_FFlagLuaAppAddTestIdsForArrow_0 (copy), l_getTestId_0 (copy)
    local v40 = v20(function(v39) --[[ Line: 58 ]]
        return v39.getGamesPageCreationCenterTitle();
    end);
    local v42 = if l_FFlagLuaAppEnableChartsPageProfileLink_0 then v20(function(v41) --[[ Line: 65 ]]
        return v41.useGridPageLayout();
    end) else nil;
    local v43 = v17({
        creationCenter = "CommonUI.Features.Label.CreationCenter", 
        chartsTitle = "CommonUI.Features.Label.Charts"
    });
    local l_creationCenter_0 = v43.creationCenter;
    local v45 = v23(l_AppNotificationService_0);
    local v47 = l_useSelector_0(function(v46) --[[ Line: 77 ]]
        return v46.Startup.GamesPageDataStatus;
    end);
    local l_Theme_0 = l_useStyle_0().Theme;
    local l_Color_0 = l_Theme_0.BackgroundDefault.Color;
    local l_Transparency_0 = l_Theme_0.BackgroundDefault.Transparency;
    local v51 = if l_FFlagLuaAppChartsStickyHeader_0 then l_useTokens_0() else nil;
    local v53 = if not not l_FFlagLuaAppChartsStickyHeader_0 or l_FFlagAppIaScrollAway_0 then l_useSelector_0(function(v52) --[[ Line: 88 ]]
        return v52.TopBar.topBarHeight;
    end) else nil;
    v2.useEffect(function() --[[ Line: 93 ]]
        -- upvalues: l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 (ref), v47 (copy), v22 (ref), v45 (copy)
        if (if l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 then v47.status else v47) == v22.Done then
            v45:ActionEnabled(Enum.AppShellActionType.GamePageLoaded);
        end;
    end, {
        if l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 then v47.status else v47, 
        v45
    });
    local v54 = nil;
    v54 = if v40 then l_creationCenter_0 else v43.chartsTitle;
    local v55 = nil;
    local v56 = nil;
    local v57 = nil;
    local v58 = nil;
    local v59 = nil;
    local v60 = nil;
    local v61 = nil;
    if l_FFlagLuaAppChartsStickyHeader_0 then
        local v63 = l_useSelector_0(function(v62) --[[ Line: 120 ]]
            -- upvalues: v35 (ref)
            return v62.Personalization.OrderedOmniItems[v35];
        end);
        v55 = v63 and v63.allItems or v37;
        v56 = v55 and #v55 > 0 and v55[1].pageSection == l_OmniFeedPageSection_0.Header;
        local v64, v65 = v2.useState(nil);
        v57 = v64;
        v58 = v65;
        v64, v65 = v2.useState(0);
        v59 = v64;
        v60 = v65;
        v2.useEffect(function() --[[ Line: 131 ]]
            -- upvalues: v57 (ref), v60 (ref)
            if not v57 then
                return;
            else
                v60(v57.AbsoluteSize.Y);
                local v66 = v57:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 137 ]]
                    -- upvalues: v60 (ref), v57 (ref)
                    v60(v57.AbsoluteSize.Y);
                end);
                return function() --[[ Line: 141 ]]
                    -- upvalues: v66 (copy)
                    v66:Disconnect();
                end;
            end;
        end, {
            v57
        });
        v64 = if l_FFlagLuaAppLayoutParamsInContext_0 then l_useCollectionLayoutConfig_0(v57) else nil;
        v61 = v15.useSduiContextFromRoduxAndProcessConfigs(v35, if l_FFlagLuaAppLayoutParamsInContext_0 then v64 else nil, (("%*_Header"):format(v35)));
    end;
    local v67 = if l_FFlagAppIaHomeSubTab_0 and l_FlyoutSidePanelIXP_0.isHomeSubTabEnabled() and l_FFlagAppIaScrollAway_0 then if v38.screenProps then v38.screenProps.headerHeight else nil else if v7.getScrollAwayEnabled() then v53 else nil;
    local v71 = if l_FFlagLuaAppChartsStickyHeader_0 then v2.useMemo(function() --[[ Line: 163 ]]
        -- upvalues: v38 (copy), l_FFlagAppIaScrollAway_0 (ref), v7 (ref), l_VisibilityControl_0 (ref), v53 (copy)
        if v38.screenProps and v38.screenProps.headerHeightBinding then
            return v38.screenProps.headerHeightBinding:map(function(v68) --[[ Line: 166 ]]
                return UDim2.fromOffset(0, v68);
            end);
        elseif l_FFlagAppIaScrollAway_0 and v7.getScrollAwayEnabled() then
            return l_VisibilityControl_0.getHeaderBinding():map(function(v69) --[[ Line: 171 ]]
                -- upvalues: v53 (ref)
                local v70 = v69 * v53;
                return UDim2.fromOffset(0, v70);
            end);
        else
            return UDim2.fromOffset(0, v53);
        end;
    end, {
        v38.screenProps and v38.screenProps.headerHeightBinding, 
        v53
    }) else nil;
    local v72 = if l_FFlagAppIaScrollAway_0 then v2.createElement(v21, {
        canvasTopPadding = if l_FFlagLuaAppChartsStickyHeader_0 then (v67 or 0) + v59 else v67, 
        topPadding = if l_FFlagLuaAppChartsStickyHeader_0 and v56 then v51.Gap.Medium else nil
    }) else v2.createElement(v21, if l_FFlagLuaAppChartsStickyHeader_0 then {
        topPadding = if v56 then v51.Gap.Medium else nil
    } else nil);
    local v73 = {
        TopBar = if l_FFlagAppIaHomeSubTab_0 and l_FlyoutSidePanelIXP_0.isHomeSubTabEnabled() then nil else v2.createElement(v18, {
            titleText = v54, 
            useGridPageLayout = if l_FFlagLuaAppEnableChartsPageProfileLink_0 then v42 else nil, 
            profileSource = if l_FFlagLuaAppEnableChartsPageProfileLink_0 then l_Sources_0.ChartsPageSelfWidget else nil, 
            zIndexOverride = l_FFlagLuaAppChartsStickyHeader_0 and 3 or nil
        }), 
        HeaderContent = if l_FFlagLuaAppChartsStickyHeader_0 and v56 then v2.createElement("Frame", {
            ref = v58, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Position = v71, 
            ZIndex = 2
        }, {
            Divider = v2.createElement(l_Divider_0, {
                orientation = l_Orientation_0.Horizontal, 
                Position = UDim2.fromScale(0, 1), 
                AnchorPoint = Vector2.new(0, 1), 
                ZIndex = 2
            }), 
            OmniFeedView = v2.createElement(v24, {
                pageContext = v35, 
                omniFeedPageSection = l_OmniFeedPageSection_0.Header, 
                omniFeedItems = v55, 
                impressionsTag = v36, 
                analyticsContext = "GamesOmniFeed", 
                sduiContext = v61, 
                topPadding = v51.Gap.Medium, 
                bottomPadding = v51.Gap.Medium
            })
        }) else nil, 
        Content = v2.createElement(if l_FFlagAppIaHomeSubTab_0 and l_FlyoutSidePanelIXP_0.isHomeSubTabEnabled() then v19.PageWrapper else v19.PageContent, {
            BackgroundColor3 = l_Color_0, 
            BackgroundTransparency = l_Transparency_0, 
            ZIndex = l_FFlagLuaAppChartsStickyHeader_0 and 1 or nil
        }, {
            GamesOmniFeed = v72
        })
    };
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_Color_0, 
        BackgroundTransparency = l_Transparency_0, 
        BorderSizePixel = 0, 
        [v2.Tag] = if l_FFlagLuaAppAddTestIdsForArrow_0 then l_getTestId_0("page-discover") else nil
    }, v73);
end;
return function(v75) --[[ Line: 260 ]]
    -- upvalues: v2 (copy), v74 (copy)
    return v2.createElement(v74, v75);
end;
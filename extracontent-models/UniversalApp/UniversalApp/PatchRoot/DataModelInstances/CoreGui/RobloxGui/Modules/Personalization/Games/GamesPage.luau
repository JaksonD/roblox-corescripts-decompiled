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
local l_CompositionTags_0 = require(l_CorePackages_0.Workspace.Packages.AppComposition).CompositionTags;
local v28 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagAppIaScrollAway_0 = v28.FFlagAppIaScrollAway;
local l_FFlagAppIaHomeSubTab_0 = v28.FFlagAppIaHomeSubTab;
local l_FFlagLuaAppEnableChartsPageProfileLink_0 = v28.FFlagLuaAppEnableChartsPageProfileLink;
local l_FFlagLuaAppAddTestIdsForArrow_0 = v28.FFlagLuaAppAddTestIdsForArrow;
local l_FFlagLuaAppChartsStickyHeader_0 = v28.FFlagLuaAppChartsStickyHeader;
local l_FFlagLuaAppCompositionCharts_0 = v28.FFlagLuaAppCompositionCharts;
local l_FFlagLuaAppLayoutParamsInContext_0 = v28.FFlagLuaAppLayoutParamsInContext;
local l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 = v28.FFlagLuaAppChartsResetFetchingStatusOnFilterChange;
local v37 = if l_FFlagLuaAppChartsStickyHeader_0 then l_AppPage_0.Games else nil;
local v38 = l_FFlagLuaAppChartsStickyHeader_0 and "HEADER_GAMESFEEDITEM_IMPRESSIONS" or nil;
local v39 = if l_FFlagLuaAppChartsStickyHeader_0 then {} else nil;
local function v76(v40) --[[ Line: 60 ]]
    -- upvalues: v20 (copy), l_FFlagLuaAppEnableChartsPageProfileLink_0 (copy), v17 (copy), v23 (copy), l_AppNotificationService_0 (copy), l_useSelector_0 (copy), l_useStyle_0 (copy), l_FFlagLuaAppChartsStickyHeader_0 (copy), l_useTokens_0 (copy), l_FFlagAppIaScrollAway_0 (copy), v2 (copy), l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 (copy), v22 (copy), v37 (copy), v39 (copy), l_OmniFeedPageSection_0 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_useCollectionLayoutConfig_0 (copy), v15 (copy), l_FFlagAppIaHomeSubTab_0 (copy), l_FlyoutSidePanelIXP_0 (copy), v7 (copy), l_VisibilityControl_0 (copy), v21 (copy), v18 (copy), l_FFlagLuaAppCompositionCharts_0 (copy), l_CompositionTags_0 (copy), l_Sources_0 (copy), l_Divider_0 (copy), l_Orientation_0 (copy), v24 (copy), v38 (copy), v19 (copy), l_FFlagLuaAppAddTestIdsForArrow_0 (copy), l_getTestId_0 (copy)
    local v42 = v20(function(v41) --[[ Line: 61 ]]
        return v41.getGamesPageCreationCenterTitle();
    end);
    local v44 = if l_FFlagLuaAppEnableChartsPageProfileLink_0 then v20(function(v43) --[[ Line: 68 ]]
        return v43.useGridPageLayout();
    end) else nil;
    local v45 = v17({
        creationCenter = "CommonUI.Features.Label.CreationCenter", 
        chartsTitle = "CommonUI.Features.Label.Charts"
    });
    local l_creationCenter_0 = v45.creationCenter;
    local v47 = v23(l_AppNotificationService_0);
    local v49 = l_useSelector_0(function(v48) --[[ Line: 80 ]]
        return v48.Startup.GamesPageDataStatus;
    end);
    local l_Theme_0 = l_useStyle_0().Theme;
    local l_Color_0 = l_Theme_0.BackgroundDefault.Color;
    local l_Transparency_0 = l_Theme_0.BackgroundDefault.Transparency;
    local v53 = if l_FFlagLuaAppChartsStickyHeader_0 then l_useTokens_0() else nil;
    local v55 = if not not l_FFlagLuaAppChartsStickyHeader_0 or l_FFlagAppIaScrollAway_0 then l_useSelector_0(function(v54) --[[ Line: 91 ]]
        return v54.TopBar.topBarHeight;
    end) else nil;
    v2.useEffect(function() --[[ Line: 96 ]]
        -- upvalues: l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 (ref), v49 (copy), v22 (ref), v47 (copy)
        if (if l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 then v49.status else v49) == v22.Done then
            v47:ActionEnabled(Enum.AppShellActionType.GamePageLoaded);
        end;
    end, {
        if l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 then v49.status else v49, 
        v47
    });
    local v56 = nil;
    v56 = if v42 then l_creationCenter_0 else v45.chartsTitle;
    local v57 = nil;
    local v58 = nil;
    local v59 = nil;
    local v60 = nil;
    local v61 = nil;
    local v62 = nil;
    local v63 = nil;
    if l_FFlagLuaAppChartsStickyHeader_0 then
        local v65 = l_useSelector_0(function(v64) --[[ Line: 123 ]]
            -- upvalues: v37 (ref)
            return v64.Personalization.OrderedOmniItems[v37];
        end);
        v57 = v65 and v65.allItems or v39;
        v58 = v57 and #v57 > 0 and v57[1].pageSection == l_OmniFeedPageSection_0.Header;
        local v66, v67 = v2.useState(nil);
        v59 = v66;
        v60 = v67;
        v66, v67 = v2.useState(0);
        v61 = v66;
        v62 = v67;
        v2.useEffect(function() --[[ Line: 134 ]]
            -- upvalues: v59 (ref), v62 (ref)
            if not v59 then
                return;
            else
                v62(v59.AbsoluteSize.Y);
                local v68 = v59:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 140 ]]
                    -- upvalues: v62 (ref), v59 (ref)
                    v62(v59.AbsoluteSize.Y);
                end);
                return function() --[[ Line: 144 ]]
                    -- upvalues: v68 (copy)
                    v68:Disconnect();
                end;
            end;
        end, {
            v59
        });
        v66 = if l_FFlagLuaAppLayoutParamsInContext_0 then l_useCollectionLayoutConfig_0(v59) else nil;
        v63 = v15.useSduiContextFromRoduxAndProcessConfigs(v37, if l_FFlagLuaAppLayoutParamsInContext_0 then v66 else nil, (("%*_Header"):format(v37)));
    end;
    local v69 = if l_FFlagAppIaHomeSubTab_0 and l_FlyoutSidePanelIXP_0.isHomeSubTabEnabled() and l_FFlagAppIaScrollAway_0 then if v40.screenProps then v40.screenProps.headerHeight else nil else if v7.getScrollAwayEnabled() then v55 else nil;
    local v73 = if l_FFlagLuaAppChartsStickyHeader_0 then v2.useMemo(function() --[[ Line: 166 ]]
        -- upvalues: v40 (copy), l_FFlagAppIaScrollAway_0 (ref), v7 (ref), l_VisibilityControl_0 (ref), v55 (copy)
        if v40.screenProps and v40.screenProps.headerHeightBinding then
            return v40.screenProps.headerHeightBinding:map(function(v70) --[[ Line: 169 ]]
                return UDim2.fromOffset(0, v70);
            end);
        elseif l_FFlagAppIaScrollAway_0 and v7.getScrollAwayEnabled() then
            return l_VisibilityControl_0.getHeaderBinding():map(function(v71) --[[ Line: 174 ]]
                -- upvalues: v55 (ref)
                local v72 = v71 * v55;
                return UDim2.fromOffset(0, v72);
            end);
        else
            return UDim2.fromOffset(0, v55);
        end;
    end, {
        v40.screenProps and v40.screenProps.headerHeightBinding, 
        v55
    }) else nil;
    local v74 = if l_FFlagAppIaScrollAway_0 then v2.createElement(v21, {
        canvasTopPadding = if l_FFlagLuaAppChartsStickyHeader_0 then (v69 or 0) + v61 else v69, 
        topPadding = if l_FFlagLuaAppChartsStickyHeader_0 and v58 then v53.Gap.Medium else nil
    }) else v2.createElement(v21, if l_FFlagLuaAppChartsStickyHeader_0 then {
        topPadding = if v58 then v53.Gap.Medium else nil
    } else nil);
    local v75 = {
        TopBar = if l_FFlagAppIaHomeSubTab_0 and l_FlyoutSidePanelIXP_0.isHomeSubTabEnabled() then nil else v2.createElement(v18, {
            tag = if l_FFlagLuaAppCompositionCharts_0 then l_CompositionTags_0.ContentRegion.Header else nil, 
            titleText = v56, 
            useGridPageLayout = if l_FFlagLuaAppEnableChartsPageProfileLink_0 then v44 else nil, 
            profileSource = if l_FFlagLuaAppEnableChartsPageProfileLink_0 then l_Sources_0.ChartsPageSelfWidget else nil, 
            sideMarginOverride = l_FFlagLuaAppCompositionCharts_0 and 0 or nil, 
            zIndexOverride = l_FFlagLuaAppChartsStickyHeader_0 and 3 or nil
        }), 
        HeaderContent = if l_FFlagLuaAppChartsStickyHeader_0 and v58 then v2.createElement("Frame", {
            ref = v60, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Position = v73, 
            ZIndex = 2
        }, {
            Divider = if l_FFlagLuaAppCompositionCharts_0 then v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Position = UDim2.fromScale(0.5, 1), 
                AnchorPoint = Vector2.new(0.5, 1), 
                ZIndex = 2, 
                [v2.Tag] = l_CompositionTags_0.ContentRegion.Header
            }, {
                Line = v2.createElement(l_Divider_0, {
                    orientation = l_Orientation_0.Horizontal
                })
            }) else v2.createElement(l_Divider_0, {
                orientation = l_Orientation_0.Horizontal, 
                Position = UDim2.fromScale(0, 1), 
                AnchorPoint = Vector2.new(0, 1), 
                ZIndex = 2
            }), 
            OmniFeedView = v2.createElement(v24, {
                pageContext = v37, 
                omniFeedPageSection = l_OmniFeedPageSection_0.Header, 
                omniFeedItems = v57, 
                impressionsTag = v38, 
                analyticsContext = "GamesOmniFeed", 
                sduiContext = v63, 
                topPadding = v53.Gap.Medium, 
                bottomPadding = v53.Gap.Medium, 
                appCompositionEnabled = l_FFlagLuaAppCompositionCharts_0 and true or nil, 
                contentTag = if l_FFlagLuaAppCompositionCharts_0 then l_CompositionTags_0.ContentRegion.Header else nil
            })
        }) else nil, 
        Content = v2.createElement(if l_FFlagAppIaHomeSubTab_0 and l_FlyoutSidePanelIXP_0.isHomeSubTabEnabled() then v19.PageWrapper else v19.PageContent, {
            BackgroundColor3 = l_Color_0, 
            BackgroundTransparency = l_Transparency_0, 
            ZIndex = l_FFlagLuaAppChartsStickyHeader_0 and 1 or nil
        }, {
            GamesOmniFeed = v74
        })
    };
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_Color_0, 
        BackgroundTransparency = l_Transparency_0, 
        BorderSizePixel = 0, 
        [v2.Tag] = if l_FFlagLuaAppAddTestIdsForArrow_0 then l_getTestId_0("page-discover") else nil
    }, v75);
end;
return function(v77) --[[ Line: 281 ]]
    -- upvalues: v2 (copy), v76 (copy)
    return v2.createElement(v76, v77);
end;
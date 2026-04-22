local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local _ = require(l_CorePackages_0.Packages.Dash);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Foundation);
local l_View_0 = v4.View;
local l_Tabs_0 = v4.Tabs;
local l_FillBehavior_0 = v4.Enums.FillBehavior;
local l_InputSize_0 = v4.Enums.InputSize;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local _ = require(l_CorePackages_0.Workspace.Packages.Navigation);
local v15 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_FocusNavigableSurfaceWrapper_0 = v15.FocusNavigableSurfaceWrapper;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v15.FocusNavigableSurfaceIdentifierEnum;
local l_usePageSideMargin_0 = require(l_CorePackages_0.Workspace.Packages.CollectionViews).usePageSideMargin;
local l_AppNotificationService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppNotificationService;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v22 = require(l_Modules_0.Personalization.PersonalizationTopBar);
local v23 = require(script.Parent.createHomeSubTabNavigator);
local l_CompositionTags_0 = require(l_CorePackages_0.Workspace.Packages.AppComposition).CompositionTags;
local v25 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagAppIaScrollAway_0 = v25.FFlagAppIaScrollAway;
local l_FFlagAppIaHomeSubTabAnalytics_0 = v25.FFlagAppIaHomeSubTabAnalytics;
local l_FFlagAppIaStatusBar_0 = v25.FFlagAppIaStatusBar;
local l_FFlagLuaAppChartsStickyHeader_0 = v25.FFlagLuaAppChartsStickyHeader;
local l_FFlagLuaAppCompositionHome_0 = v25.FFlagLuaAppCompositionHome;
local v31 = game:DefineFastFlag("AppIaHomeSubTabFrame", false);
local v32 = v23();
local v33 = if l_FFlagAppIaHomeSubTabAnalytics_0 then {
    [l_AppPage_0.Home] = Enum.AppShellActionType.TapHomePageTab, 
    [l_AppPage_0.Games] = Enum.AppShellActionType.TapGamePageTab
} else nil;
local function _(v34) --[[ Line: 63 ]]
    local l_state_0 = v34.state;
    return l_state_0.routes[l_state_0.index].routeName;
end;
local v60 = v3.forwardRef(function(v37, v38) --[[ Line: 68 ]]
    -- upvalues: l_useLocalization_0 (copy), l_FFlagAppIaHomeSubTabAnalytics_0 (copy), l_useRoactService_0 (copy), l_AppNotificationService_0 (copy), v3 (copy), v33 (copy), l_AppPage_0 (copy), l_useDesignTokens_0 (copy), l_useSelector_0 (copy), l_FormFactor_0 (copy), l_FillBehavior_0 (copy), l_FFlagLuaAppCompositionHome_0 (copy), l_usePageSideMargin_0 (copy), l_FFlagAppIaStatusBar_0 (copy), l_FFlagAppIaScrollAway_0 (copy), l_FFlagLuaAppChartsStickyHeader_0 (copy), v31 (copy), l_View_0 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_CompositionTags_0 (copy), v22 (copy), l_Tabs_0 (copy), l_InputSize_0 (copy), v32 (copy)
    local v39 = l_useLocalization_0({
        Charts = "CommonUI.Features.Label.Charts", 
        ForYou = "CommonUI.Features.Label.ForYou"
    });
    local v40 = if l_FFlagAppIaHomeSubTabAnalytics_0 then l_useRoactService_0(l_AppNotificationService_0) else nil;
    local l_state_1 = v37.navigation.state;
    local l_routeName_0 = l_state_1.routes[l_state_1.index].routeName;
    local v45 = v3.useCallback(function(v43) --[[ Line: 78 ]]
        -- upvalues: l_FFlagAppIaHomeSubTabAnalytics_0 (ref), l_routeName_0 (copy), v37 (copy), v33 (ref), v40 (copy)
        if l_FFlagAppIaHomeSubTabAnalytics_0 then
            if v43 == l_routeName_0 then
                return;
            else
                v37.navigation.navigate(v43);
                local v44 = v33[v43];
                if v44 then
                    v40:ActionTaken(v44);
                    return;
                end;
            end;
        else
            v37.navigation.navigate(v43);
        end;
    end, {
        v37.navigation, 
        if l_FFlagAppIaHomeSubTabAnalytics_0 then v40 else nil
    });
    l_state_1 = {
        {
            id = l_AppPage_0.Home, 
            text = v39.ForYou
        }, 
        {
            id = l_AppPage_0.Games, 
            text = v39.Charts
        }
    };
    local v46 = l_useDesignTokens_0();
    local v48 = if l_useSelector_0(function(v47) --[[ Line: 106 ]]
        return v47.FormFactor;
    end) == l_FormFactor_0.COMPACT then l_FillBehavior_0.Fill else l_FillBehavior_0.Fit;
    local v49 = nil;
    if not l_FFlagLuaAppCompositionHome_0 then
        v49 = l_usePageSideMargin_0();
    end;
    local v51 = if l_FFlagAppIaStatusBar_0 then l_useSelector_0(function(v50) --[[ Line: 118 ]]
        return v50.TopBar.statusBarHeight;
    end) else nil;
    local v52 = nil;
    local v53 = nil;
    local v54 = nil;
    local v55 = nil;
    local v56 = nil;
    if l_FFlagAppIaScrollAway_0 then
        local v57, v58 = v3.useState(0);
        v52 = v57;
        v53 = v58;
        if l_FFlagLuaAppChartsStickyHeader_0 then
            v57, v58 = v3.useBinding(0);
            v55 = v57;
            v56 = v58;
        end;
        v54 = v3.useCallback(function(v59) --[[ Line: 132 ]]
            -- upvalues: v53 (ref), l_FFlagLuaAppChartsStickyHeader_0 (ref), v56 (ref)
            v53(v59.AbsoluteSize.Y);
            if l_FFlagLuaAppChartsStickyHeader_0 then
                v56(v59.AbsoluteSize.Y);
            end;
        end, {});
    end;
    return v3.createElement(v31 and "Frame" or l_View_0, {
        BackgroundColor3 = if v31 then v46.LuaApps.App.Page.BackgroundColor else nil, 
        BackgroundTransparency = if v31 then v46.LuaApps.App.Page.BackgroundTransparency else nil, 
        BorderSizePixel = v31 and 0 or nil, 
        Size = if v31 then UDim2.fromScale(1, 1) else nil, 
        backgroundStyle = if not v31 then {
            Color3 = v46.LuaApps.App.Page.BackgroundColor, 
            Transparency = v46.LuaApps.App.Page.BackgroundTransparency
        } else nil, 
        tag = if not v31 then {
            ["size-full"] = true, 
            col = not l_FFlagAppIaScrollAway_0
        } else nil, 
        ref = v38
    }, {
        UIListLayout = if not v31 or l_FFlagAppIaScrollAway_0 then nil else v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        HeaderFocusRoot = v3.createElement(l_FocusNavigableSurfaceWrapper_0, {
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.HeaderView, 
            frameProps = {
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = v31 and -1 or nil, 
                Size = UDim2.fromScale(1, 0), 
                ZIndex = 2, 
                [v3.Tag] = if l_FFlagLuaAppCompositionHome_0 then l_CompositionTags_0.ContentRegion.Header else nil
            }
        }, {
            StatusBarBackground = if l_FFlagAppIaStatusBar_0 then v3.createElement(v31 and "Frame" or l_View_0, {
                BackgroundColor3 = if v31 then v46.LuaApps.App.Page.BackgroundColor else nil, 
                BorderSizePixel = v31 and 0 or nil, 
                backgroundStyle = if not v31 then {
                    Color3 = v46.LuaApps.App.Page.BackgroundColor, 
                    Transparency = 0
                } else nil, 
                Size = UDim2.new(1, 0, 0, v51), 
                ZIndex = 2
            }) else nil, 
            Header = v3.createElement(v31 and "Frame" or l_View_0, {
                AutomaticSize = if v31 then Enum.AutomaticSize.Y else nil, 
                BackgroundColor3 = if v31 then v46.LuaApps.App.Page.BackgroundColor else nil, 
                BorderSizePixel = v31 and 0 or nil, 
                Size = if v31 then UDim2.fromScale(1, 0) else nil, 
                [v3.Change.AbsoluteSize] = if v31 and l_FFlagAppIaScrollAway_0 then v54 else nil, 
                tag = not v31 and "col size-full-0 auto-y" or nil, 
                backgroundStyle = if not v31 then {
                    Color3 = v46.LuaApps.App.Page.BackgroundColor, 
                    Transparency = 0
                } else nil, 
                onAbsoluteSizeChanged = if not v31 and l_FFlagAppIaScrollAway_0 then v54 else nil
            }, {
                UIListLayout = if v31 then v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }) else nil, 
                AppHeaderBar = v3.createElement(v31 and "Frame" or l_View_0, {
                    AutomaticSize = if v31 then Enum.AutomaticSize.Y else nil, 
                    BackgroundTransparency = v31 and 1 or nil, 
                    Size = if v31 then UDim2.fromScale(1, 0) else nil, 
                    tag = not v31 and "size-full-0 auto-y" or nil, 
                    LayoutOrder = 1
                }, {
                    PersonalizationTopBar = v3.createElement(v22, {
                        sideMarginOverride = l_FFlagLuaAppCompositionHome_0 and 0 or nil
                    })
                }), 
                SubTabs = v3.createElement(v31 and "Frame" or l_View_0, {
                    AutomaticSize = if v31 then Enum.AutomaticSize.Y else nil, 
                    BackgroundTransparency = v31 and 1 or nil, 
                    Size = if v31 then UDim2.fromScale(1, 0) else nil, 
                    tag = not v31 and "size-full-0 auto-y" or nil, 
                    LayoutOrder = 2
                }, {
                    UIPadding = if not l_FFlagLuaAppCompositionHome_0 then v3.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v49), 
                        PaddingRight = UDim.new(0, v49)
                    }) else nil, 
                    Tabs = v3.createElement(l_Tabs_0, {
                        activeTabId = l_routeName_0, 
                        onActivated = v45, 
                        tabs = l_state_1, 
                        size = l_InputSize_0.Medium, 
                        fillBehavior = v48
                    })
                })
            })
        }), 
        HomeSubTabNavigator = v3.createElement(v32, {
            navigation = v37.navigation, 
            screenProps = if l_FFlagAppIaScrollAway_0 then {
                headerHeight = v52, 
                headerHeightBinding = if l_FFlagLuaAppChartsStickyHeader_0 then v55 else nil
            } else nil
        })
    });
end);
v60.router = v32.router;
return v60;
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
local v31 = v23();
local v32 = if l_FFlagAppIaHomeSubTabAnalytics_0 then {
    [l_AppPage_0.Home] = Enum.AppShellActionType.TapHomePageTab, 
    [l_AppPage_0.Games] = Enum.AppShellActionType.TapGamePageTab
} else nil;
local function _(v33) --[[ Line: 62 ]]
    local l_state_0 = v33.state;
    return l_state_0.routes[l_state_0.index].routeName;
end;
local v59 = v3.forwardRef(function(v36, v37) --[[ Line: 67 ]]
    -- upvalues: l_useLocalization_0 (copy), l_FFlagAppIaHomeSubTabAnalytics_0 (copy), l_useRoactService_0 (copy), l_AppNotificationService_0 (copy), v3 (copy), v32 (copy), l_AppPage_0 (copy), l_useDesignTokens_0 (copy), l_useSelector_0 (copy), l_FormFactor_0 (copy), l_FillBehavior_0 (copy), l_FFlagLuaAppCompositionHome_0 (copy), l_usePageSideMargin_0 (copy), l_FFlagAppIaStatusBar_0 (copy), l_FFlagAppIaScrollAway_0 (copy), l_FFlagLuaAppChartsStickyHeader_0 (copy), l_View_0 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), l_CompositionTags_0 (copy), v22 (copy), l_Tabs_0 (copy), l_InputSize_0 (copy), v31 (copy)
    local v38 = l_useLocalization_0({
        Charts = "CommonUI.Features.Label.Charts", 
        ForYou = "CommonUI.Features.Label.ForYou"
    });
    local v39 = if l_FFlagAppIaHomeSubTabAnalytics_0 then l_useRoactService_0(l_AppNotificationService_0) else nil;
    local l_state_1 = v36.navigation.state;
    local l_routeName_0 = l_state_1.routes[l_state_1.index].routeName;
    local v44 = v3.useCallback(function(v42) --[[ Line: 77 ]]
        -- upvalues: l_FFlagAppIaHomeSubTabAnalytics_0 (ref), l_routeName_0 (copy), v36 (copy), v32 (ref), v39 (copy)
        if l_FFlagAppIaHomeSubTabAnalytics_0 then
            if v42 == l_routeName_0 then
                return;
            else
                v36.navigation.navigate(v42);
                local v43 = v32[v42];
                if v43 then
                    v39:ActionTaken(v43);
                    return;
                end;
            end;
        else
            v36.navigation.navigate(v42);
        end;
    end, {
        v36.navigation, 
        if l_FFlagAppIaHomeSubTabAnalytics_0 then v39 else nil
    });
    l_state_1 = {
        {
            id = l_AppPage_0.Home, 
            text = v38.ForYou
        }, 
        {
            id = l_AppPage_0.Games, 
            text = v38.Charts
        }
    };
    local v45 = l_useDesignTokens_0();
    local v47 = if l_useSelector_0(function(v46) --[[ Line: 105 ]]
        return v46.FormFactor;
    end) == l_FormFactor_0.COMPACT then l_FillBehavior_0.Fill else l_FillBehavior_0.Fit;
    local v48 = nil;
    if not l_FFlagLuaAppCompositionHome_0 then
        v48 = l_usePageSideMargin_0();
    end;
    local v50 = if l_FFlagAppIaStatusBar_0 then l_useSelector_0(function(v49) --[[ Line: 117 ]]
        return v49.TopBar.statusBarHeight;
    end) else nil;
    local v51 = nil;
    local v52 = nil;
    local v53 = nil;
    local v54 = nil;
    local v55 = nil;
    if l_FFlagAppIaScrollAway_0 then
        local v56, v57 = v3.useState(0);
        v51 = v56;
        v52 = v57;
        if l_FFlagLuaAppChartsStickyHeader_0 then
            v56, v57 = v3.useBinding(0);
            v54 = v56;
            v55 = v57;
        end;
        v53 = v3.useCallback(function(v58) --[[ Line: 131 ]]
            -- upvalues: v52 (ref), l_FFlagLuaAppChartsStickyHeader_0 (ref), v55 (ref)
            v52(v58.AbsoluteSize.Y);
            if l_FFlagLuaAppChartsStickyHeader_0 then
                v55(v58.AbsoluteSize.Y);
            end;
        end, {});
    end;
    return v3.createElement(l_View_0, {
        backgroundStyle = {
            Color3 = v45.LuaApps.App.Page.BackgroundColor, 
            Transparency = v45.LuaApps.App.Page.BackgroundTransparency
        }, 
        tag = {
            ["size-full"] = true, 
            col = not l_FFlagAppIaScrollAway_0
        }, 
        ref = v37
    }, {
        HeaderFocusRoot = v3.createElement(l_FocusNavigableSurfaceWrapper_0, {
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.HeaderView, 
            frameProps = {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromScale(1, 0), 
                ZIndex = 2, 
                [v3.Tag] = if l_FFlagLuaAppCompositionHome_0 then l_CompositionTags_0.ContentRegion.Header else nil
            }
        }, {
            StatusBarBackground = if l_FFlagAppIaStatusBar_0 then v3.createElement(l_View_0, {
                backgroundStyle = {
                    Color3 = v45.LuaApps.App.Page.BackgroundColor, 
                    Transparency = 0
                }, 
                Size = UDim2.new(1, 0, 0, v50), 
                ZIndex = 2
            }) else nil, 
            Header = v3.createElement(l_View_0, {
                tag = "size-full-0 auto-y col", 
                backgroundStyle = {
                    Color3 = v45.LuaApps.App.Page.BackgroundColor, 
                    Transparency = 0
                }, 
                onAbsoluteSizeChanged = if l_FFlagAppIaScrollAway_0 then v53 else nil
            }, {
                AppHeaderBar = v3.createElement(l_View_0, {
                    tag = "size-full-0 auto-y", 
                    LayoutOrder = 1
                }, {
                    PersonalizationTopBar = v3.createElement(v22, {
                        sideMarginOverride = l_FFlagLuaAppCompositionHome_0 and 0 or nil
                    })
                }), 
                SubTabs = v3.createElement(l_View_0, {
                    tag = "size-full-0 auto-y", 
                    LayoutOrder = 2
                }, {
                    UIPadding = if not l_FFlagLuaAppCompositionHome_0 then v3.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v48), 
                        PaddingRight = UDim.new(0, v48)
                    }) else nil, 
                    Tabs = v3.createElement(l_Tabs_0, {
                        activeTabId = l_routeName_0, 
                        onActivated = v44, 
                        tabs = l_state_1, 
                        size = l_InputSize_0.Medium, 
                        fillBehavior = v47
                    })
                })
            })
        }), 
        HomeSubTabNavigator = v3.createElement(v31, {
            navigation = v36.navigation, 
            screenProps = if l_FFlagAppIaScrollAway_0 then {
                headerHeight = v51, 
                headerHeightBinding = if l_FFlagLuaAppChartsStickyHeader_0 then v54 else nil
            } else nil
        })
    });
end);
v59.router = v31.router;
return v59;
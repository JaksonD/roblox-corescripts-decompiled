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
local v24 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagAppIaScrollAway_0 = v24.FFlagAppIaScrollAway;
local l_FFlagAppIaHomeSubTabAnalytics_0 = v24.FFlagAppIaHomeSubTabAnalytics;
local l_FFlagAppIaStatusBar_0 = v24.FFlagAppIaStatusBar;
local l_FFlagLuaAppChartsStickyHeader_0 = v24.FFlagLuaAppChartsStickyHeader;
local v29 = v23();
local v30 = if l_FFlagAppIaHomeSubTabAnalytics_0 then {
    [l_AppPage_0.Home] = Enum.AppShellActionType.TapHomePageTab, 
    [l_AppPage_0.Games] = Enum.AppShellActionType.TapGamePageTab
} else nil;
local function _(v31) --[[ Line: 58 ]]
    local l_state_0 = v31.state;
    return l_state_0.routes[l_state_0.index].routeName;
end;
local v57 = v3.forwardRef(function(v34, v35) --[[ Line: 63 ]]
    -- upvalues: l_useLocalization_0 (copy), l_FFlagAppIaHomeSubTabAnalytics_0 (copy), l_useRoactService_0 (copy), l_AppNotificationService_0 (copy), v3 (copy), v30 (copy), l_AppPage_0 (copy), l_useDesignTokens_0 (copy), l_useSelector_0 (copy), l_FormFactor_0 (copy), l_FillBehavior_0 (copy), l_usePageSideMargin_0 (copy), l_FFlagAppIaStatusBar_0 (copy), l_FFlagAppIaScrollAway_0 (copy), l_FFlagLuaAppChartsStickyHeader_0 (copy), l_View_0 (copy), l_FocusNavigableSurfaceWrapper_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy), v22 (copy), l_Tabs_0 (copy), l_InputSize_0 (copy), v29 (copy)
    local v36 = l_useLocalization_0({
        Charts = "CommonUI.Features.Label.Charts", 
        ForYou = "CommonUI.Features.Label.ForYou"
    });
    local v37 = if l_FFlagAppIaHomeSubTabAnalytics_0 then l_useRoactService_0(l_AppNotificationService_0) else nil;
    local l_state_1 = v34.navigation.state;
    local l_routeName_0 = l_state_1.routes[l_state_1.index].routeName;
    local v42 = v3.useCallback(function(v40) --[[ Line: 73 ]]
        -- upvalues: l_FFlagAppIaHomeSubTabAnalytics_0 (ref), l_routeName_0 (copy), v34 (copy), v30 (ref), v37 (copy)
        if l_FFlagAppIaHomeSubTabAnalytics_0 then
            if v40 == l_routeName_0 then
                return;
            else
                v34.navigation.navigate(v40);
                local v41 = v30[v40];
                if v41 then
                    v37:ActionTaken(v41);
                    return;
                end;
            end;
        else
            v34.navigation.navigate(v40);
        end;
    end, {
        v34.navigation, 
        if l_FFlagAppIaHomeSubTabAnalytics_0 then v37 else nil
    });
    l_state_1 = {
        {
            id = l_AppPage_0.Home, 
            text = v36.ForYou
        }, 
        {
            id = l_AppPage_0.Games, 
            text = v36.Charts
        }
    };
    local v43 = l_useDesignTokens_0();
    local v45 = if l_useSelector_0(function(v44) --[[ Line: 101 ]]
        return v44.FormFactor;
    end) == l_FormFactor_0.COMPACT then l_FillBehavior_0.Fill else l_FillBehavior_0.Fit;
    local v46 = l_usePageSideMargin_0();
    local v48 = if l_FFlagAppIaStatusBar_0 then l_useSelector_0(function(v47) --[[ Line: 110 ]]
        return v47.TopBar.statusBarHeight;
    end) else nil;
    local v49 = nil;
    local v50 = nil;
    local v51 = nil;
    local v52 = nil;
    local v53 = nil;
    if l_FFlagAppIaScrollAway_0 then
        local v54, v55 = v3.useState(0);
        v49 = v54;
        v50 = v55;
        if l_FFlagLuaAppChartsStickyHeader_0 then
            v54, v55 = v3.useBinding(0);
            v52 = v54;
            v53 = v55;
        end;
        v51 = v3.useCallback(function(v56) --[[ Line: 124 ]]
            -- upvalues: v50 (ref), l_FFlagLuaAppChartsStickyHeader_0 (ref), v53 (ref)
            v50(v56.AbsoluteSize.Y);
            if l_FFlagLuaAppChartsStickyHeader_0 then
                v53(v56.AbsoluteSize.Y);
            end;
        end, {});
    end;
    return v3.createElement(l_View_0, {
        backgroundStyle = {
            Color3 = v43.LuaApps.App.Page.BackgroundColor, 
            Transparency = v43.LuaApps.App.Page.BackgroundTransparency
        }, 
        tag = {
            ["size-full"] = true, 
            col = not l_FFlagAppIaScrollAway_0
        }, 
        ref = v35
    }, {
        HeaderFocusRoot = v3.createElement(l_FocusNavigableSurfaceWrapper_0, {
            surfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.HeaderView, 
            frameProps = {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromScale(1, 0), 
                ZIndex = 2
            }
        }, {
            StatusBarBackground = if l_FFlagAppIaStatusBar_0 then v3.createElement(l_View_0, {
                backgroundStyle = {
                    Color3 = v43.LuaApps.App.Page.BackgroundColor, 
                    Transparency = 0
                }, 
                Size = UDim2.new(1, 0, 0, v48), 
                ZIndex = 2
            }) else nil, 
            Header = v3.createElement(l_View_0, {
                tag = "size-full-0 auto-y col", 
                backgroundStyle = {
                    Color3 = v43.LuaApps.App.Page.BackgroundColor, 
                    Transparency = 0
                }, 
                onAbsoluteSizeChanged = if l_FFlagAppIaScrollAway_0 then v51 else nil
            }, {
                AppHeaderBar = v3.createElement(l_View_0, {
                    tag = "size-full-0 auto-y", 
                    LayoutOrder = 1
                }, {
                    PersonalizationTopBar = v3.createElement(v22, {})
                }), 
                SubTabs = v3.createElement(l_View_0, {
                    tag = "size-full-0 auto-y", 
                    LayoutOrder = 2
                }, {
                    UIPadding = v3.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v46), 
                        PaddingRight = UDim.new(0, v46)
                    }), 
                    Tabs = v3.createElement(l_Tabs_0, {
                        activeTabId = l_routeName_0, 
                        onActivated = v42, 
                        tabs = l_state_1, 
                        size = l_InputSize_0.Medium, 
                        fillBehavior = v45
                    })
                })
            })
        }), 
        HomeSubTabNavigator = v3.createElement(v29, {
            navigation = v34.navigation, 
            screenProps = if l_FFlagAppIaScrollAway_0 then {
                headerHeight = v49, 
                headerHeightBinding = if l_FFlagLuaAppChartsStickyHeader_0 then v52 else nil
            } else nil
        })
    });
end);
v57.router = v29.router;
return v57;
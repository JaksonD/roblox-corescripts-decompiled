local l_Parent_0 = script:FindFirstAncestor("FlyoutSidePanel").Parent;
local v1 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_useLocalRobuxBalance_0 = require(l_Parent_0.RobloxAppHooks).useLocalRobuxBalance;
local v6 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v6.Hooks.useTokens;
local l_Divider_0 = v6.Divider;
local l_createNextOrder_0 = require(l_Parent_0.ReactUtils).createNextOrder;
local v10 = require(script.Parent.Parent.Constants);
local v11 = require(script.Parent.Parent.Hooks.useFlyoutNavigationItems);
local l_DrawerContainer_0 = require(l_Parent_0.Drawer).DrawerContainer;
local v13 = require(script.Parent.RobuxPill);
local v14 = require(script.Parent.FlyoutNavigationList);
local v15 = require(script.Parent.FlyoutQuickSigninButton);
local v16 = require(script.Parent.FlyoutReportLogs);
local v17 = require(script.Parent.FlyoutSwitchAccountButton);
local v18 = require(script.Parent.FlyoutProfileCard);
local v19 = require(script.Parent.Parent.Hooks.useDismissFlyoutOnPartyTopBanner);
local l_useSetDrawerVisible_0 = require(l_Parent_0.Drawer).Hooks.useSetDrawerVisible;
local v21 = require(script.Parent.Parent.Analytics.FlyoutAnalytics);
local v22 = require(l_Parent_0.SharedFlags);
local l_FFlagEnableBlackbird_0 = v22.FFlagEnableBlackbird;
local l_FFlagEnableBlackbirdOnFlyoutMenu_0 = v22.FFlagEnableBlackbirdOnFlyoutMenu;
local l_FFlagEnableBlackbirdCheckDev_0 = v22.FFlagEnableBlackbirdCheckDev;
local v26 = if l_FFlagEnableBlackbirdCheckDev_0 then require(script.Parent.Parent.Hooks.useHasRobloxSubscription) else nil;
local v27 = if l_FFlagEnableBlackbird_0 and l_FFlagEnableBlackbirdOnFlyoutMenu_0 then require(script.Parent.BlackbirdUpsellBanner) else nil;
local function v29(v28) --[[ Line: 56 ]] --[[ Name: selectStatusBarHeight ]]
    return v28.TopBar.statusBarHeight or 0;
end;
local function v31(v30) --[[ Line: 60 ]] --[[ Name: selectGlobalGuiInset ]]
    return v30.GlobalGuiInset or {
        left = 0, 
        top = 0, 
        right = 0, 
        bottom = 0
    };
end;
return v1.memo(function(v32, _) --[[ Line: 64 ]]
    -- upvalues: l_useTokens_0 (copy), l_useLocalRobuxBalance_0 (copy), l_useSelector_0 (copy), v29 (copy), v31 (copy), l_useScreenSize_0 (copy), v10 (copy), l_useAppPolicy_0 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy), v26 (copy), l_FFlagEnableBlackbird_0 (copy), l_FFlagEnableBlackbirdOnFlyoutMenu_0 (copy), v11 (copy), l_createNextOrder_0 (copy), l_useSetDrawerVisible_0 (copy), v1 (copy), v21 (copy), v18 (copy), v13 (copy), v27 (copy), v14 (copy), l_Divider_0 (copy), v17 (copy), v15 (copy), v16 (copy), v19 (copy), l_DrawerContainer_0 (copy)
    local v34 = l_useTokens_0();
    local v35 = l_useLocalRobuxBalance_0();
    local v36 = l_useSelector_0(v29);
    local v37 = l_useSelector_0(v31);
    local v38 = v37.top + v36;
    local l_bottom_0 = v37.bottom;
    local l_left_0 = v37.left;
    local v41 = l_useScreenSize_0();
    local v42 = nil;
    v42 = if v41.X - v10.FLYOUT_SIDE_PADDING < v10.FLYOUT_SIDE_PANEL_WIDTH then v41.X - v10.FLYOUT_SIDE_PADDING else v10.FLYOUT_SIDE_PANEL_WIDTH;
    local v44 = l_useAppPolicy_0(function(v43) --[[ Line: 79 ]]
        return v43.getDisableBlackbirdEntrypoints() or false;
    end);
    local v45 = if l_FFlagEnableBlackbirdCheckDev_0 then v26() else false;
    local v46 = l_FFlagEnableBlackbird_0 and l_FFlagEnableBlackbirdOnFlyoutMenu_0 and not v44 and not (l_FFlagEnableBlackbirdCheckDev_0 and v45);
    local v47 = v11();
    local v48 = l_createNextOrder_0();
    local v49 = l_useSetDrawerVisible_0();
    local v50 = v1.useCallback(function() --[[ Line: 91 ]]
        -- upvalues: v49 (copy)
        v49(false);
    end, {
        v49
    });
    local v52 = v1.useCallback(function(v51) --[[ Line: 94 ]]
        -- upvalues: v21 (ref)
        v21.onFlyoutSidePanelClosed(v51);
    end, {});
    local v53 = v1.createElement(v1.Fragment, nil, {
        UIPadding = v1.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v34.Padding.XLarge), 
            PaddingBottom = UDim.new(0, v34.Padding.XLarge), 
            PaddingLeft = UDim.new(0, v34.Padding.XLarge), 
            PaddingRight = UDim.new(0, v34.Padding.XLarge)
        }), 
        UIListLayout = v1.createElement("UIListLayout", {
            Padding = UDim.new(0, v34.Gap.Large), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        ProfileCard = v1.createElement(v18, {
            layoutOrder = v48(), 
            localUserModel = v32.localUserModel, 
            isRobloxSubscriber = if l_FFlagEnableBlackbirdCheckDev_0 then v45 else nil, 
            onProfileActivated = v32.onProfileActivated, 
            closeDrawer = v50
        }), 
        RobuxPill = if v35 and v35 >= 0 then v1.createElement(v13, {
            layoutOrder = v48(), 
            openPurchaseRobuxPage = v32.openPurchaseRobuxPage, 
            robuxBalance = v35, 
            closeDrawer = v50
        }) else nil, 
        BlackbirdUpsellBanner = if v46 then v1.createElement(v27, {
            layoutOrder = v48(), 
            closeDrawer = v50
        }) else nil, 
        MyLibrary = v1.createElement(v14, {
            layoutOrder = v48(), 
            navigationItems = v47.myLibraryItems, 
            closeDrawer = v50
        }), 
        Divider = v1.createElement(l_Divider_0, {
            LayoutOrder = v48()
        }), 
        AdditionalNavigation = v1.createElement(v14, {
            layoutOrder = v48(), 
            navigationItems = v47.additionalNavigationItems, 
            closeDrawer = v50
        }), 
        SwitchAccountButton = if v32.onSwitchAccountActivated then v1.createElement(v17, {
            layoutOrder = v48(), 
            onSwitchAccountActivated = v32.onSwitchAccountActivated, 
            closeDrawer = v50
        }) else nil, 
        QuickSigninButton = v1.createElement(v15, {
            layoutOrder = v48(), 
            closeDrawer = v50
        }), 
        LogOut = v32.renderLogOut(v48()), 
        ReportLogs = if v32.openReportLogConfirmation then v1.createElement(v16, {
            layoutOrder = v48(), 
            openReportLogConfirmation = v32.openReportLogConfirmation, 
            closeDrawer = v50
        }) else nil
    });
    v19();
    return v1.createElement(l_DrawerContainer_0, {
        displayOrder = v32.displayOrder, 
        menuWidth = v42, 
        children = v53, 
        leftOffset = l_left_0, 
        topOffset = v38, 
        bottomOffset = l_bottom_0, 
        backgroundColor = v34.Color.Surface.Surface_0.Color3, 
        backgroundTransparency = v34.Color.Surface.Surface_0.Transparency, 
        onDrawerClosedAnalytics = v52
    });
end);
local l_Parent_0 = script:FindFirstAncestor("FlyoutSidePanel").Parent;
local v1 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDeviceInsets_0 = require(l_Parent_0.AppCommonResponsive).useDeviceInsets;
local l_useScreenSize_0 = require(l_Parent_0.RobloxAppHooks).useScreenSize;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_useLocalRobuxBalance_0 = require(l_Parent_0.RobloxAppHooks).useLocalRobuxBalance;
local v7 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v7.Hooks.useTokens;
local l_Divider_0 = v7.Divider;
local l_createNextOrder_0 = require(l_Parent_0.ReactUtils).createNextOrder;
local v11 = require(script.Parent.Parent.Constants);
local v12 = require(script.Parent.Parent.Hooks.useFlyoutNavigationItems);
local l_DrawerContainer_0 = require(l_Parent_0.Drawer).DrawerContainer;
local v14 = require(script.Parent.RobuxPill);
local v15 = require(script.Parent.FlyoutNavigationList);
local v16 = require(script.Parent.FlyoutQuickSigninButton);
local v17 = require(script.Parent.FlyoutReportLogs);
local v18 = require(script.Parent.FlyoutSwitchAccountButton);
local v19 = require(script.Parent.FlyoutProfileCard);
local v20 = require(script.Parent.Parent.Hooks.useDismissFlyoutOnPartyTopBanner);
local l_useSetDrawerVisible_0 = require(l_Parent_0.Drawer).Hooks.useSetDrawerVisible;
local v22 = require(script.Parent.Parent.Analytics.FlyoutAnalytics);
local v23 = require(script.Parent.Parent.Flags.FFlagFixFlyoutTopOverlapIssue);
local v24 = require(l_Parent_0.SharedFlags);
local l_FFlagLuaAppSupportDeviceSafeInsets_0 = v24.FFlagLuaAppSupportDeviceSafeInsets;
local l_FFlagEnableBlackbird_0 = v24.FFlagEnableBlackbird;
local l_FFlagEnableBlackbirdOnFlyoutMenu_0 = v24.FFlagEnableBlackbirdOnFlyoutMenu;
local l_FFlagEnableBlackbirdCheckDev_0 = v24.FFlagEnableBlackbirdCheckDev;
local v29 = if l_FFlagEnableBlackbirdCheckDev_0 then require(script.Parent.Parent.Hooks.useHasRobloxSubscription) else nil;
local v30 = if l_FFlagEnableBlackbird_0 and l_FFlagEnableBlackbirdOnFlyoutMenu_0 then require(script.Parent.BlackbirdUpsellBanner) else nil;
return v1.memo(function(v31, _) --[[ Line: 53 ]]
    -- upvalues: l_useTokens_0 (copy), l_useDeviceInsets_0 (copy), l_useSelector_0 (copy), l_useLocalRobuxBalance_0 (copy), l_FFlagLuaAppSupportDeviceSafeInsets_0 (copy), l_useScreenSize_0 (copy), v11 (copy), l_useAppPolicy_0 (copy), l_FFlagEnableBlackbirdCheckDev_0 (copy), v29 (copy), l_FFlagEnableBlackbird_0 (copy), l_FFlagEnableBlackbirdOnFlyoutMenu_0 (copy), v12 (copy), l_createNextOrder_0 (copy), l_useSetDrawerVisible_0 (copy), v1 (copy), v22 (copy), v19 (copy), v14 (copy), v30 (copy), v15 (copy), l_Divider_0 (copy), v18 (copy), v16 (copy), v17 (copy), v20 (copy), l_DrawerContainer_0 (copy), v23 (copy)
    local v33 = l_useTokens_0();
    local v34 = l_useDeviceInsets_0();
    local v36 = l_useSelector_0(function(v35) --[[ Line: 56 ]]
        return v35.TopBar.statusBarHeight or 0;
    end);
    local v37 = l_useLocalRobuxBalance_0();
    local v39 = if l_FFlagLuaAppSupportDeviceSafeInsets_0 then l_useSelector_0(function(v38) --[[ Line: 61 ]]
        return v38.GlobalGuiInset;
    end) else nil;
    local v40 = l_useScreenSize_0();
    local v41 = nil;
    v41 = if v40.X - v11.FLYOUT_SIDE_PADDING < v11.FLYOUT_SIDE_PANEL_WIDTH then v40.X - v11.FLYOUT_SIDE_PADDING else v11.FLYOUT_SIDE_PANEL_WIDTH;
    local v43 = l_useAppPolicy_0(function(v42) --[[ Line: 72 ]]
        return v42.getDisableBlackbirdEntrypoints() or false;
    end);
    local v44 = if l_FFlagEnableBlackbirdCheckDev_0 then v29() else false;
    local v45 = l_FFlagEnableBlackbird_0 and l_FFlagEnableBlackbirdOnFlyoutMenu_0 and not v43 and not (l_FFlagEnableBlackbirdCheckDev_0 and v44);
    local v46 = v12();
    local v47 = l_createNextOrder_0();
    local v48 = l_useSetDrawerVisible_0();
    local v49 = v1.useCallback(function() --[[ Line: 84 ]]
        -- upvalues: v48 (copy)
        v48(false);
    end, {
        v48
    });
    local v51 = v1.useCallback(function(v50) --[[ Line: 87 ]]
        -- upvalues: v22 (ref)
        v22.onFlyoutSidePanelClosed(v50);
    end, {});
    local v52 = v33.Padding.XLarge + (if l_FFlagLuaAppSupportDeviceSafeInsets_0 then v39.top else v34.top) + v36;
    local v53 = v1.createElement(v1.Fragment, nil, {
        UIPadding = v1.createElement("UIPadding", {
            PaddingTop = UDim.new(0, v52), 
            PaddingBottom = UDim.new(0, v33.Padding.XLarge + v34.bottom), 
            PaddingLeft = UDim.new(0, v33.Padding.XLarge), 
            PaddingRight = UDim.new(0, v33.Padding.XLarge)
        }), 
        UIListLayout = v1.createElement("UIListLayout", {
            Padding = UDim.new(0, v33.Gap.Large), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        ProfileCard = v1.createElement(v19, {
            layoutOrder = v47(), 
            localUserModel = v31.localUserModel, 
            isRobloxSubscriber = if l_FFlagEnableBlackbirdCheckDev_0 then v44 else nil, 
            onProfileActivated = v31.onProfileActivated, 
            closeDrawer = v49
        }), 
        RobuxPill = if v37 and v37 >= 0 then v1.createElement(v14, {
            layoutOrder = v47(), 
            openPurchaseRobuxPage = v31.openPurchaseRobuxPage, 
            robuxBalance = v37, 
            closeDrawer = v49
        }) else nil, 
        BlackbirdUpsellBanner = if v45 then v1.createElement(v30, {
            layoutOrder = v47(), 
            closeDrawer = v49
        }) else nil, 
        MyLibrary = v1.createElement(v15, {
            layoutOrder = v47(), 
            navigationItems = v46.myLibraryItems, 
            closeDrawer = v49
        }), 
        Divider = v1.createElement(l_Divider_0, {
            LayoutOrder = v47()
        }), 
        AdditionalNavigation = v1.createElement(v15, {
            layoutOrder = v47(), 
            navigationItems = v46.additionalNavigationItems, 
            closeDrawer = v49
        }), 
        SwitchAccountButton = if v31.onSwitchAccountActivated then v1.createElement(v18, {
            layoutOrder = v47(), 
            onSwitchAccountActivated = v31.onSwitchAccountActivated, 
            closeDrawer = v49
        }) else nil, 
        QuickSigninButton = v1.createElement(v16, {
            layoutOrder = v47(), 
            closeDrawer = v49
        }), 
        LogOut = v31.renderLogOut(v47()), 
        ReportLogs = if v31.openReportLogConfirmation then v1.createElement(v17, {
            layoutOrder = v47(), 
            openReportLogConfirmation = v31.openReportLogConfirmation, 
            closeDrawer = v49
        }) else nil
    });
    v20();
    return v1.createElement(l_DrawerContainer_0, {
        displayOrder = v31.displayOrder, 
        menuWidth = v41, 
        children = v53, 
        topOffset = if v23 then v52 else nil, 
        backgroundColor = v33.Color.Surface.Surface_0.Color3, 
        backgroundTransparency = v33.Color.Surface.Surface_0.Transparency, 
        onDrawerClosedAnalytics = v51
    });
end);
local l_CorePackages_0 = game:GetService("CorePackages");
local l_NavigationEvents_0 = require(l_CorePackages_0.Packages.RoactNavigation).NavigationEvents;
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v5 = require(l_CorePackages_0.Workspace.Packages.AppNavBar);
local l_UserInputService_0 = game:GetService("UserInputService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v9 = require(l_Modules_0.LuaApp.Components.More.MoreGrid);
local v10 = require(l_Modules_0.LuaApp.Components.More.MoreGridItem);
local v11 = require(l_Modules_0.LuaApp.Components.More.MoreLogOut);
local l_FFlagEnableMorePageExitButtonSupport_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableMorePageExitButtonSupport;
local v13 = if l_FFlagEnableMorePageExitButtonSupport_0 then require(l_Modules_0.LuaApp.Components.More.MoreExitApp) else nil;
local v14 = require(l_Modules_0.LuaApp.Components.More.TenFootMoreHeader);
local v15 = require(l_Modules_0.LuaApp.Components.More.MoreSwitchAccount);
local v16 = require(l_Modules_0.Common.Roact);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_FFlagAppIaScrollAway_0 = v4.FFlagAppIaScrollAway;
local l_GetFFlagUIBloxUseFoundationButton_0 = v4.UIBlox.GetFFlagUIBloxUseFoundationButton;
local v20 = require(l_Modules_0.LuaApp.Constants);
local l_AppStorageUtilities_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Utils.AppStorageUtilities;
local l_authPageload_0 = require(l_CorePackages_0.Workspace.Packages.AuthAnalytics).Events.authPageload;
local v23 = require(l_Modules_0.LuaApp.Flags.FFlagEnableLuaAccountSwitch);
local v24 = require(l_Modules_0.LuaApp.Flags.FFlagLuaAccountSwitchExperimentBypassBackdoorDev);
local v25 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_AppBtidLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppBtidLayers;
local v27 = game:DefineFastFlag("FixMorePageContentValidateProps", false);
local v28 = require(l_Modules_0.LuaApp.Flags.FFlagFixMorePageLogOutCutOff);
local l_FFlagAuthSecExclusions_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAuthSecExclusions;
local l_FFlagEnableMorePageDirectionalLayoutRolloutFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableMorePageDirectionalLayoutRolloutFix;
local l_FFlagEnableLeftNavOnConsole_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole;
local l_FFlagMorePageGateAccountSwitcherByCachedVariantId_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagMorePageGateAccountSwitcherByCachedVariantId;
local l_GetFStringAccountSwitcherTruthyVariantId_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFStringAccountSwitcherTruthyVariantId;
local l_GetFStringAccountSwitcherFalsyVariantId_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFStringAccountSwitcherFalsyVariantId;
local l_GetFFlagEnableAccountSwitcherRedesignIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAccountSwitcherRedesignIXP;
local l_GridMetrics_0 = v2.App.Grid.GridMetrics;
local l_VerticalScrollViewWithMargin_0 = v2.App.Container.VerticalScrollViewWithMargin;
local v38 = l_GetFFlagUIBloxUseFoundationButton_0() and 2 or 0;
local v39 = v16.PureComponent:extend("MorePageContent");
local v40 = require(script.Parent.Parent.Parent.Thunks.Authentication.User);
v39.validateProps = v3.strictInterface({
    isWideView = v3.boolean, 
    itemTable = v3.table, 
    topBarHeight = v3.integer, 
    isDirectional = v3.optional(v3.boolean), 
    isExitButtonSupported = v3.optional(v3.boolean), 
    isAccountSwitcherEnabled = if v27 and v23 then v3.optional(v3.boolean) else nil, 
    enableFoundationDesign = v3.optional(v3.boolean), 
    enableSignedOutAccounts = v3.optional(v3.boolean), 
    navBarPlacement = if v28 then v3.valueOf(v5.Placement) else nil, 
    excludeAccountSwitcher = v3.optional(v3.boolean)
});
v39.init = function(v41) --[[ Line: 96 ]] --[[ Name: init ]]
    -- upvalues: v16 (copy), l_GridMetrics_0 (copy), v10 (copy), l_FFlagEnableMorePageDirectionalLayoutRolloutFix_0 (copy), l_UserInputService_0 (copy), l_UserGameSettings_0 (copy)
    v41.shouldResize = true;
    v41.scrollviewRef = v16.createRef();
    v41.contentRef = v16.createRef();
    v41.onWillFocus = function() --[[ Line: 103 ]]
        -- upvalues: v41 (copy)
        if v41.scrollviewRef.current then
            local _ = v41.scrollviewRef.current.AbsoluteCanvasSize;
        end;
    end;
    v41.onResize = function(v43) --[[ Line: 112 ]]
        -- upvalues: v41 (copy), l_GridMetrics_0 (ref)
        if not v41.shouldResize then
            return;
        else
            local v44 = nil;
            if v41.contentRef.current then
                v44 = v41.contentRef.current.AbsoluteSize.X;
            elseif v43 then
                v44 = v43.AbsoluteSize.X;
            else
                return;
            end;
            local l_isWideView_0 = v41.props.isWideView;
            local v46 = nil;
            local v47 = nil;
            if v41.props.isDirectional then
                local v48 = v41.props.itemTable[1];
                local v49 = nil;
                if #v48 <= 4 then
                    v47 = 36;
                    v49 = 4;
                else
                    v47 = 48;
                    v49 = 5;
                end;
                v46 = 96;
                local v50 = (v44 - (v49 - 1) * v47 - 2 * v46) / v49;
                v41:setState({
                    gridCellSize = math.floor(v50), 
                    gridCellsInARow = v49, 
                    gutter = v47, 
                    paddingHorizontal = v46
                });
                return;
            else
                if l_isWideView_0 then
                    v47 = 24;
                    v46 = if v44 > 1020 then (v44 - 924) / 2 else 48;
                else
                    v47 = 12;
                    v46 = v44 < 360 and 12 or 24;
                end;
                local v51 = v44 - 2 * v46;
                if v51 <= 0 then
                    return;
                else
                    local v52 = l_GridMetrics_0.getMediumMetrics(v51, v47);
                    v41:setState({
                        gridCellSize = v52.itemWidth, 
                        gridCellsInARow = v52.itemsPerRow, 
                        gutter = v47, 
                        paddingHorizontal = v46
                    });
                    return;
                end;
            end;
        end;
    end;
    v41.renderGridItem = function(v53, v54) --[[ Line: 182 ]]
        -- upvalues: v16 (ref), v10 (ref), l_FFlagEnableMorePageDirectionalLayoutRolloutFix_0 (ref), v41 (copy)
        return v16.createElement(v10, {
            item = v53, 
            layoutOrder = v54, 
            isDirectional = if l_FFlagEnableMorePageDirectionalLayoutRolloutFix_0 then v41.props.isDirectional else nil
        });
    end;
    v41.statusBarTappedConnection = l_UserInputService_0.StatusBarTapped:Connect(function() --[[ Line: 190 ]]
        -- upvalues: v41 (copy), l_UserGameSettings_0 (ref)
        local l_current_0 = v41.scrollviewRef.current;
        if not l_current_0 then
            return;
        elseif l_UserGameSettings_0.ReducedMotion then
            l_current_0.CanvasPosition = Vector2.new(0, 0);
            return;
        else
            l_current_0:ScrollToTop();
            return;
        end;
    end);
    v41:setState({
        gridCellSize = 1, 
        gridCellsInARow = 1, 
        gutter = 12, 
        paddingHorizontal = 12
    });
end;
v39.willUnmount = function(v56) --[[ Line: 211 ]] --[[ Name: willUnmount ]]
    v56.shouldResize = false;
    v56.statusBarTappedConnection:Disconnect();
end;
v39.didUpdate = function(v57, v58, _) --[[ Line: 216 ]] --[[ Name: didUpdate ]]
    if v58.isWideView ~= v57.props.isWideView then
        v57.onResize(nil);
    end;
end;
v39.render = function(v60) --[[ Line: 222 ]] --[[ Name: render ]]
    -- upvalues: v40 (copy), v23 (copy), v24 (copy), l_FFlagMorePageGateAccountSwitcherByCachedVariantId_0 (copy), l_AppStorageUtilities_0 (copy), l_GetFStringAccountSwitcherTruthyVariantId_0 (copy), l_GetFStringAccountSwitcherFalsyVariantId_0 (copy), l_authPageload_0 (copy), l_FFlagAuthSecExclusions_0 (copy), l_GetFFlagUIBloxUseFoundationButton_0 (copy), v38 (copy), l_FFlagEnableMorePageExitButtonSupport_0 (copy), l_FFlagAppIaScrollAway_0 (copy), v5 (copy), v16 (copy), v15 (copy), v28 (copy), v20 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), l_NavigationEvents_0 (copy), l_VerticalScrollViewWithMargin_0 (copy), v14 (copy), v9 (copy), v11 (copy), v13 (copy)
    local l_gridCellSize_0 = v60.state.gridCellSize;
    local l_gridCellsInARow_0 = v60.state.gridCellsInARow;
    local l_gutter_0 = v60.state.gutter;
    local l_paddingHorizontal_0 = v60.state.paddingHorizontal;
    local v65 = v60.props.itemTable[1];
    local v66 = v60.props.itemTable[2][1];
    local l_topBarHeight_0 = v60.props.topBarHeight;
    local v68 = #v65;
    local l_isDirectional_0 = v60.props.isDirectional;
    if l_isDirectional_0 then
        l_gridCellsInARow_0 = #v65 <= 4 and 4 or 5;
    end;
    local v70 = math.ceil(v68 / l_gridCellsInARow_0) * (l_gridCellSize_0 + l_gutter_0) - l_gutter_0;
    local v71 = v40.fromLocalStorage().isUnder13 ~= true;
    local v72 = false;
    if v23 then
        local v73 = v60.props.isAccountSwitcherEnabled or v24 == true;
        if l_FFlagMorePageGateAccountSwitcherByCachedVariantId_0 then
            local v74 = l_AppStorageUtilities_0.getAccountSwitcherAvailableByVariantId();
            if v74 == nil then
                local v75 = if v73 then l_GetFStringAccountSwitcherTruthyVariantId_0() else l_GetFStringAccountSwitcherFalsyVariantId_0();
                l_AppStorageUtilities_0.setAccountSwitcherExperimentVariantId(v75);
                l_AppStorageUtilities_0.flush();
                l_authPageload_0("userEnrolledInCachedAs", (tostring(v73)));
            else
                v73 = v74;
                l_authPageload_0("morePageCachedAsValue", (tostring(v74)));
            end;
        end;
        v72 = not (v60.props.excludeAccountSwitcher and l_FFlagAuthSecExclusions_0) and v71 and v73;
    end;
    local v76 = if l_isDirectional_0 then if l_GetFFlagUIBloxUseFoundationButton_0() then v38 + 72 else 72 else if l_GetFFlagUIBloxUseFoundationButton_0() then v38 + 48 else 48;
    local v77 = l_isDirectional_0 and 1024 or 640;
    local v78 = nil;
    v78 = if v72 then v70 + 2 * l_gutter_0 + v76 * 2 else v70 + 2 * l_gutter_0 + v76;
    if l_FFlagEnableMorePageExitButtonSupport_0 and v60.props.isExitButtonSupported then
        v78 = v78 + v76;
    end;
    if l_isDirectional_0 then
        v78 = v78 + 200;
    end;
    if l_FFlagAppIaScrollAway_0 and v5.getScrollAwayEnabled() then
        v78 = v78 + l_topBarHeight_0;
    end;
    local v79 = nil;
    if v72 then
        local v80 = v60.props.itemTable[2][1];
        v79 = v16.createElement(v15, {
            buttonHeight = v76, 
            buttonMaxWidth = v77, 
            item = v80, 
            layoutOrder = 2, 
            enableFoundationDesign = v60.props.enableFoundationDesign, 
            enableSignedOutAccounts = v60.props.enableSignedOutAccounts
        });
    end;
    local v81 = if v28 and v60.props.navBarPlacement == v5.Placement.Bottom then v20.BOTTOM_BAR_SIZE else 0;
    return v16.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = if l_FFlagAppIaScrollAway_0 and v5.getScrollAwayEnabled() then nil else UDim2.fromOffset(0, l_topBarHeight_0), 
        Size = if l_FFlagAppIaScrollAway_0 and v5.getScrollAwayEnabled() then UDim2.new(1, 0, 1, 0) else if v28 then UDim2.new(1, 0, 1, -l_topBarHeight_0 - v81) else UDim2.new(1, 0, 1, -l_topBarHeight_0 - v20.BOTTOM_BAR_SIZE)
    }, {
        UIPadding = v16.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_gutter_0)
        }), 
        Content = v16.createElement("Frame", {
            BackgroundTransparency = (not l_isDirectional_0 or l_FFlagEnableLeftNavOnConsole_0) and 1 or 0, 
            Size = UDim2.new(1, 0, 1, 0), 
            [v16.Ref] = v60.contentRef, 
            [v16.Change.AbsoluteSize] = v60.onResize
        }, {
            UIGradient = if not l_isDirectional_0 or l_FFlagEnableLeftNavOnConsole_0 then nil else v16.createElement("UIGradient", {
                Color = ColorSequence.new(Color3.new(0, 0, 0)), 
                Transparency = NumberSequence.new(1, 0.4), 
                Rotation = 90
            }), 
            NavigationEvents = v16.createElement(l_NavigationEvents_0, {
                onWillFocus = v60.onWillFocus
            }), 
            VerticalScrollViewWithMargin = v16.createElement(l_VerticalScrollViewWithMargin_0, {
                canvasSizeY = UDim.new(0, v78), 
                paddingHorizontal = l_paddingHorizontal_0, 
                paddingTop = if l_FFlagAppIaScrollAway_0 and v5.getScrollAwayEnabled() then l_topBarHeight_0 else nil, 
                [v16.Ref] = v60.scrollviewRef, 
                Selectable = false
            }, {
                UIListLayout = v16.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, l_gutter_0), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                TenFootMoreHeader = if l_isDirectional_0 then v16.createElement(v14) else nil, 
                MoreGrid = v16.createElement(v9, {
                    size = UDim2.new(1, 0, 0, v70), 
                    gridCellPadding = l_gutter_0, 
                    gridCellSize = l_gridCellSize_0, 
                    items = v65, 
                    renderItem = v60.renderGridItem, 
                    layoutOrder = 1
                }), 
                MoreSwitchAccount = v79, 
                MoreLogOut = v16.createElement(v11, {
                    buttonHeight = v76, 
                    buttonMaxWidth = v77, 
                    item = v66, 
                    layoutOrder = 3
                }), 
                MoreExitAppButton = if l_FFlagEnableMorePageExitButtonSupport_0 and v13 and v60.props.isExitButtonSupported then v16.createElement(v13, {
                    layoutOrder = 4, 
                    buttonMaxWidth = v77, 
                    buttonHeight = v76
                }) else nil
            })
        })
    });
end;
v39 = l_RoactAppPolicy_0.connect(function(v82, _) --[[ Line: 401 ]]
    return {
        excludeAccountSwitcher = v82.getExcludeAccountSwitcher()
    };
end)(v39);
if v23 == true then
    v39 = v25.connectBrowserTrackerLayer({
        l_AppBtidLayers_0.AccountSwitcherLayer
    }, function(v84, _) --[[ Line: 410 ]]
        -- upvalues: l_AppBtidLayers_0 (copy), l_GetFFlagEnableAccountSwitcherRedesignIXP_0 (copy)
        local v86 = v84[l_AppBtidLayers_0.AccountSwitcherLayer] or {};
        local v87 = {
            isAccountSwitcherEnabled = v86.isAccountSwitcherEnabled
        };
        if l_GetFFlagEnableAccountSwitcherRedesignIXP_0() then
            v87.enableFoundationDesign = v86.enableAccountSwitcherFoundationDesign == true;
            v87.enableSignedOutAccounts = v86.enableAccountSwitcherSignedOutAccounts == true;
            return v87;
        else
            v87.enableFoundationDesign = true;
            v87.enableSignedOutAccounts = true;
            return v87;
        end;
    end)(v39);
end;
return v39;
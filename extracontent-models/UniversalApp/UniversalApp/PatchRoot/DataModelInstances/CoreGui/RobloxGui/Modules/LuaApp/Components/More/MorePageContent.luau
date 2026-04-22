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
local v29 = game:DefineFastFlag("FixMorePageExitButtonCutOff", false);
local l_FFlagAuthSecExclusions_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAuthSecExclusions;
local l_FFlagEnableMorePageDirectionalLayoutRolloutFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableMorePageDirectionalLayoutRolloutFix;
local l_FFlagEnableLeftNavOnConsole_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole;
local l_FFlagMorePageGateAccountSwitcherByCachedVariantId_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagMorePageGateAccountSwitcherByCachedVariantId;
local l_GetFStringAccountSwitcherTruthyVariantId_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFStringAccountSwitcherTruthyVariantId;
local l_GetFStringAccountSwitcherFalsyVariantId_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFStringAccountSwitcherFalsyVariantId;
local l_GetFFlagEnableAccountSwitcherRedesignIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagEnableAccountSwitcherRedesignIXP;
local l_FFlagEnableLuaLoginRevamp_0 = v4.FFlagEnableLuaLoginRevamp;
local l_FStringLuaLoginRevampIxpLayer_0 = v4.FStringLuaLoginRevampIxpLayer;
local l_FFlagEnableAccountSwitcherLoginV2Correction_0 = v4.FFlagEnableAccountSwitcherLoginV2Correction;
local l_GridMetrics_0 = v2.App.Grid.GridMetrics;
local l_VerticalScrollViewWithMargin_0 = v2.App.Container.VerticalScrollViewWithMargin;
local v42 = l_GetFFlagUIBloxUseFoundationButton_0() and 2 or 0;
local v43 = v16.PureComponent:extend("MorePageContent");
local v44 = require(script.Parent.Parent.Parent.Thunks.Authentication.User);
v43.validateProps = v3.strictInterface({
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
v43.init = function(v45) --[[ Line: 100 ]] --[[ Name: init ]]
    -- upvalues: v16 (copy), l_GridMetrics_0 (copy), v10 (copy), l_FFlagEnableMorePageDirectionalLayoutRolloutFix_0 (copy), l_UserInputService_0 (copy), l_UserGameSettings_0 (copy)
    v45.shouldResize = true;
    v45.scrollviewRef = v16.createRef();
    v45.contentRef = v16.createRef();
    v45.onWillFocus = function() --[[ Line: 107 ]]
        -- upvalues: v45 (copy)
        if v45.scrollviewRef.current then
            local _ = v45.scrollviewRef.current.AbsoluteCanvasSize;
        end;
    end;
    v45.onResize = function(v47) --[[ Line: 116 ]]
        -- upvalues: v45 (copy), l_GridMetrics_0 (ref)
        if not v45.shouldResize then
            return;
        else
            local v48 = nil;
            if v45.contentRef.current then
                v48 = v45.contentRef.current.AbsoluteSize.X;
            elseif v47 then
                v48 = v47.AbsoluteSize.X;
            else
                return;
            end;
            local l_isWideView_0 = v45.props.isWideView;
            local v50 = nil;
            local v51 = nil;
            if v45.props.isDirectional then
                local v52 = v45.props.itemTable[1];
                local v53 = nil;
                if #v52 <= 4 then
                    v51 = 36;
                    v53 = 4;
                else
                    v51 = 48;
                    v53 = 5;
                end;
                v50 = 96;
                local v54 = (v48 - (v53 - 1) * v51 - 2 * v50) / v53;
                v45:setState({
                    gridCellSize = math.floor(v54), 
                    gridCellsInARow = v53, 
                    gutter = v51, 
                    paddingHorizontal = v50
                });
                return;
            else
                if l_isWideView_0 then
                    v51 = 24;
                    v50 = if v48 > 1020 then (v48 - 924) / 2 else 48;
                else
                    v51 = 12;
                    v50 = v48 < 360 and 12 or 24;
                end;
                local v55 = v48 - 2 * v50;
                if v55 <= 0 then
                    return;
                else
                    local v56 = l_GridMetrics_0.getMediumMetrics(v55, v51);
                    v45:setState({
                        gridCellSize = v56.itemWidth, 
                        gridCellsInARow = v56.itemsPerRow, 
                        gutter = v51, 
                        paddingHorizontal = v50
                    });
                    return;
                end;
            end;
        end;
    end;
    v45.renderGridItem = function(v57, v58) --[[ Line: 186 ]]
        -- upvalues: v16 (ref), v10 (ref), l_FFlagEnableMorePageDirectionalLayoutRolloutFix_0 (ref), v45 (copy)
        return v16.createElement(v10, {
            item = v57, 
            layoutOrder = v58, 
            isDirectional = if l_FFlagEnableMorePageDirectionalLayoutRolloutFix_0 then v45.props.isDirectional else nil
        });
    end;
    v45.statusBarTappedConnection = l_UserInputService_0.StatusBarTapped:Connect(function() --[[ Line: 194 ]]
        -- upvalues: v45 (copy), l_UserGameSettings_0 (ref)
        local l_current_0 = v45.scrollviewRef.current;
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
    v45:setState({
        gridCellSize = 1, 
        gridCellsInARow = 1, 
        gutter = 12, 
        paddingHorizontal = 12
    });
end;
v43.willUnmount = function(v60) --[[ Line: 215 ]] --[[ Name: willUnmount ]]
    v60.shouldResize = false;
    v60.statusBarTappedConnection:Disconnect();
end;
v43.didUpdate = function(v61, v62, _) --[[ Line: 220 ]] --[[ Name: didUpdate ]]
    if v62.isWideView ~= v61.props.isWideView then
        v61.onResize(nil);
    end;
end;
v43.render = function(v64) --[[ Line: 226 ]] --[[ Name: render ]]
    -- upvalues: v44 (copy), v23 (copy), v24 (copy), l_FFlagMorePageGateAccountSwitcherByCachedVariantId_0 (copy), l_AppStorageUtilities_0 (copy), l_GetFStringAccountSwitcherTruthyVariantId_0 (copy), l_GetFStringAccountSwitcherFalsyVariantId_0 (copy), l_authPageload_0 (copy), l_FFlagAuthSecExclusions_0 (copy), l_GetFFlagUIBloxUseFoundationButton_0 (copy), v42 (copy), l_FFlagEnableMorePageExitButtonSupport_0 (copy), v29 (copy), l_FFlagAppIaScrollAway_0 (copy), v5 (copy), v16 (copy), v15 (copy), v28 (copy), v20 (copy), l_FFlagEnableLeftNavOnConsole_0 (copy), l_NavigationEvents_0 (copy), l_VerticalScrollViewWithMargin_0 (copy), v14 (copy), v9 (copy), v11 (copy), v13 (copy)
    local l_gridCellSize_0 = v64.state.gridCellSize;
    local l_gridCellsInARow_0 = v64.state.gridCellsInARow;
    local l_gutter_0 = v64.state.gutter;
    local l_paddingHorizontal_0 = v64.state.paddingHorizontal;
    local v69 = v64.props.itemTable[1];
    local v70 = v64.props.itemTable[2][1];
    local l_topBarHeight_0 = v64.props.topBarHeight;
    local v72 = #v69;
    local l_isDirectional_0 = v64.props.isDirectional;
    if l_isDirectional_0 then
        l_gridCellsInARow_0 = #v69 <= 4 and 4 or 5;
    end;
    local v74 = math.ceil(v72 / l_gridCellsInARow_0) * (l_gridCellSize_0 + l_gutter_0) - l_gutter_0;
    local v75 = v44.fromLocalStorage().isUnder13 ~= true;
    local v76 = false;
    if v23 then
        local v77 = v64.props.isAccountSwitcherEnabled or v24 == true;
        if l_FFlagMorePageGateAccountSwitcherByCachedVariantId_0 then
            local v78 = l_AppStorageUtilities_0.getAccountSwitcherAvailableByVariantId();
            if v78 == nil then
                local v79 = if v77 then l_GetFStringAccountSwitcherTruthyVariantId_0() else l_GetFStringAccountSwitcherFalsyVariantId_0();
                l_AppStorageUtilities_0.setAccountSwitcherExperimentVariantId(v79);
                l_AppStorageUtilities_0.flush();
                l_authPageload_0("userEnrolledInCachedAs", (tostring(v77)));
            else
                v77 = v78;
                l_authPageload_0("morePageCachedAsValue", (tostring(v78)));
            end;
        end;
        v76 = not (v64.props.excludeAccountSwitcher and l_FFlagAuthSecExclusions_0) and v75 and v77;
    end;
    local v80 = if l_isDirectional_0 then if l_GetFFlagUIBloxUseFoundationButton_0() then v42 + 72 else 72 else if l_GetFFlagUIBloxUseFoundationButton_0() then v42 + 48 else 48;
    local v81 = l_isDirectional_0 and 1024 or 640;
    local v82 = nil;
    v82 = if v76 then v74 + 2 * l_gutter_0 + v80 * 2 else v74 + 2 * l_gutter_0 + v80;
    if l_FFlagEnableMorePageExitButtonSupport_0 and v64.props.isExitButtonSupported then
        v82 = v82 + v80 + if v29 and v76 then l_gutter_0 else 0;
    end;
    if l_isDirectional_0 then
        v82 = v82 + 200;
    end;
    if l_FFlagAppIaScrollAway_0 and v5.getScrollAwayEnabled() then
        v82 = v82 + l_topBarHeight_0;
    end;
    local v83 = nil;
    if v76 then
        local v84 = v64.props.itemTable[2][1];
        v83 = v16.createElement(v15, {
            buttonHeight = v80, 
            buttonMaxWidth = v81, 
            item = v84, 
            layoutOrder = 2, 
            enableFoundationDesign = v64.props.enableFoundationDesign, 
            enableSignedOutAccounts = v64.props.enableSignedOutAccounts, 
            showLoginRevamp = v64.props.showLoginRevamp
        });
    end;
    local v85 = if v28 and v64.props.navBarPlacement == v5.Placement.Bottom then v20.BOTTOM_BAR_SIZE else 0;
    return v16.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = if l_FFlagAppIaScrollAway_0 and v5.getScrollAwayEnabled() then nil else UDim2.fromOffset(0, l_topBarHeight_0), 
        Size = if l_FFlagAppIaScrollAway_0 and v5.getScrollAwayEnabled() then UDim2.new(1, 0, 1, 0) else if v28 then UDim2.new(1, 0, 1, -l_topBarHeight_0 - v85) else UDim2.new(1, 0, 1, -l_topBarHeight_0 - v20.BOTTOM_BAR_SIZE)
    }, {
        UIPadding = v16.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_gutter_0)
        }), 
        Content = v16.createElement("Frame", {
            BackgroundTransparency = (not l_isDirectional_0 or l_FFlagEnableLeftNavOnConsole_0) and 1 or 0, 
            Size = UDim2.new(1, 0, 1, 0), 
            [v16.Ref] = v64.contentRef, 
            [v16.Change.AbsoluteSize] = v64.onResize
        }, {
            UIGradient = if not l_isDirectional_0 or l_FFlagEnableLeftNavOnConsole_0 then nil else v16.createElement("UIGradient", {
                Color = ColorSequence.new(Color3.new(0, 0, 0)), 
                Transparency = NumberSequence.new(1, 0.4), 
                Rotation = 90
            }), 
            NavigationEvents = v16.createElement(l_NavigationEvents_0, {
                onWillFocus = v64.onWillFocus
            }), 
            VerticalScrollViewWithMargin = v16.createElement(l_VerticalScrollViewWithMargin_0, {
                canvasSizeY = UDim.new(0, v82), 
                paddingHorizontal = l_paddingHorizontal_0, 
                paddingTop = if l_FFlagAppIaScrollAway_0 and v5.getScrollAwayEnabled() then l_topBarHeight_0 else nil, 
                [v16.Ref] = v64.scrollviewRef, 
                Selectable = false
            }, {
                UIListLayout = v16.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Padding = UDim.new(0, l_gutter_0), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                TenFootMoreHeader = if l_isDirectional_0 then v16.createElement(v14) else nil, 
                MoreGrid = v16.createElement(v9, {
                    size = UDim2.new(1, 0, 0, v74), 
                    gridCellPadding = l_gutter_0, 
                    gridCellSize = l_gridCellSize_0, 
                    items = v69, 
                    renderItem = v64.renderGridItem, 
                    layoutOrder = 1
                }), 
                MoreSwitchAccount = v83, 
                MoreLogOut = v16.createElement(v11, {
                    buttonHeight = v80, 
                    buttonMaxWidth = v81, 
                    item = v70, 
                    layoutOrder = 3
                }), 
                MoreExitAppButton = if l_FFlagEnableMorePageExitButtonSupport_0 and v13 and v64.props.isExitButtonSupported then v16.createElement(v13, {
                    layoutOrder = 4, 
                    buttonMaxWidth = v81, 
                    buttonHeight = v80
                }) else nil
            })
        })
    });
end;
v43 = l_RoactAppPolicy_0.connect(function(v86, _) --[[ Line: 408 ]]
    return {
        excludeAccountSwitcher = v86.getExcludeAccountSwitcher()
    };
end)(v43);
if v23 == true then
    v43 = v25.connectBrowserTrackerLayer({
        l_AppBtidLayers_0.AccountSwitcherLayer
    }, function(v88, _) --[[ Line: 417 ]]
        -- upvalues: l_AppBtidLayers_0 (copy), l_GetFFlagEnableAccountSwitcherRedesignIXP_0 (copy)
        local v90 = v88[l_AppBtidLayers_0.AccountSwitcherLayer] or {};
        local v91 = {
            isAccountSwitcherEnabled = v90.isAccountSwitcherEnabled
        };
        if l_GetFFlagEnableAccountSwitcherRedesignIXP_0() then
            v91.enableFoundationDesign = v90.enableAccountSwitcherFoundationDesign == true;
            v91.enableSignedOutAccounts = v90.enableAccountSwitcherSignedOutAccounts == true;
            return v91;
        else
            v91.enableFoundationDesign = true;
            v91.enableSignedOutAccounts = true;
            return v91;
        end;
    end)(v43);
end;
if l_FFlagEnableLuaLoginRevamp_0 and l_FFlagEnableAccountSwitcherLoginV2Correction_0 then
    v43 = v25.connectBrowserTrackerLayer({
        l_FStringLuaLoginRevampIxpLayer_0
    }, function(v92, _) --[[ Line: 436 ]]
        -- upvalues: l_FStringLuaLoginRevampIxpLayer_0 (copy)
        return {
            showLoginRevamp = (v92[l_FStringLuaLoginRevampIxpLayer_0] or {}).showLoginRevamp
        };
    end)(v43);
end;
return v43;
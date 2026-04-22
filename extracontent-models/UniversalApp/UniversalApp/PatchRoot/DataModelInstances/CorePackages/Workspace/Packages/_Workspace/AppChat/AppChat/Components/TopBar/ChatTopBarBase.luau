local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatTopBarConfigDriven);
local v3 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatPerfTracking);
local v4 = require(l_script_FirstAncestor_0.Telemetry.AppChatPerfTracker);
local v5 = require(script.Parent.createBackFunc);
local v6 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v6.Hooks.useTokens;
local v8 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v10 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v10.Core.Style.useStyle;
local v12 = require(l_Parent_0.AppNavBar);
local l_VisibilityControl_0 = v12.VisibilityControl;
local l_FFlagAppIaScrollAway_0 = require(l_Parent_0.SharedFlags).FFlagAppIaScrollAway;
local l_HeaderBar_0 = v10.App.Bar.HeaderBar;
local v16 = require(l_Parent_0.AppHeaderBar);
local v17 = require(l_script_FirstAncestor_0.Stores.GetTopBarStore);
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local function v19() --[[ Line: 34 ]] --[[ Name: noOp ]]
    return nil;
end;
return function(v20) --[[ Line: 49 ]] --[[ Name: ChatTopBarBase ]]
    -- upvalues: v2 (copy), v8 (copy), v3 (copy), v4 (copy), v17 (copy), l_useSignalState_0 (copy), l_FFlagAppIaScrollAway_0 (copy), v16 (copy), l_useLocalization_0 (copy), l_useStyle_0 (copy), l_useTokens_0 (copy), v19 (copy), v5 (copy), v12 (copy), l_VisibilityControl_0 (copy), v6 (copy), l_HeaderBar_0 (copy)
    if not v2() then
        return nil;
    else
        v8.useEffect(function() --[[ Line: 54 ]]
            -- upvalues: v3 (ref), v4 (ref)
            if v3 then
                v4.finish(v4.Events.TopBarRenderInterval);
            end;
        end, {});
        local l_screenName_0 = v20.screenName;
        local l_navigation_0 = v20.navigation;
        local v23 = v17(false).getScreenTopBar(l_screenName_0);
        local v24 = l_useSignalState_0(v23);
        local v25 = if l_FFlagAppIaScrollAway_0 then l_navigation_0.getScreenProps("isInExperience", false) else nil;
        local v26 = l_navigation_0.getScreenProps("topBarHeight", 0);
        local v27 = l_navigation_0.getScreenProps("navigateToRootStack", nil);
        local v28 = v24.headerText or {};
        local l_backButtonEnabled_0 = v24.backButtonEnabled;
        local l_closeButtonEnabled_0 = v24.closeButtonEnabled;
        local l_isRoot_0 = v24.isRoot;
        local l_shouldBoldHeader_0 = v24.shouldBoldHeader;
        local l_isTitleLeftAligned_0 = v24.isTitleLeftAligned;
        local l_leftPaddingOverride_0 = v24.leftPaddingOverride;
        local l_rightPaddingOverride_0 = v24.rightPaddingOverride;
        local l_closeInputBar_0 = v24.closeInputBar;
        local l_isSecondary_0 = v24.isSecondary;
        local l_makeBackButton_0 = v16.makeBackButton;
        local l_makeCloseButton_0 = v16.makeCloseButton;
        local v40 = l_useLocalization_0({
            headerText = v28.shouldLocalize and v28.raw or nil
        });
        local v41 = v28.shouldLocalize and v40.headerText or v28.raw or "";
        local v42 = l_useStyle_0();
        local v43 = l_useTokens_0();
        local v44 = if v20.renderRight then v20.renderRight else v19;
        local v45 = if v20.renderCenter then v20.renderCenter else nil;
        if v45 then
            v44 = nil;
        end;
        local v46 = nil;
        if v45 then
            v46 = nil;
        elseif v20.renderLeft then
            v46 = v20.renderLeft;
        else
            local v47 = v5({
                navigation = l_navigation_0, 
                navigateToRootStack = v27, 
                isRoot = l_isRoot_0, 
                closeInputBar = l_closeInputBar_0
            });
            v46 = if l_backButtonEnabled_0 then l_makeBackButton_0(v47) else if l_closeButtonEnabled_0 then l_makeCloseButton_0(v47) else v19;
        end;
        local v48 = not l_backButtonEnabled_0 and not l_closeButtonEnabled_0 and v45 == nil;
        if l_shouldBoldHeader_0 and v46 == v19 then
            v46 = nil;
        end;
        local l_Medium_0 = v43.Padding.Medium;
        local v50 = UDim.new(0, if l_leftPaddingOverride_0 ~= nil then l_leftPaddingOverride_0 else l_Medium_0);
        local v51 = UDim.new(0, if l_rightPaddingOverride_0 ~= nil then l_rightPaddingOverride_0 else l_Medium_0);
        local v54 = if not (not l_FFlagAppIaScrollAway_0 or v25) and v12.getScrollAwayEnabled() then l_VisibilityControl_0.getHeaderBinding():map(function(v52) --[[ Line: 136 ]]
            -- upvalues: v26 (copy)
            local v53 = (v52 - 1) * (v26 + 36);
            return UDim2.new(0, 0, 0, v53);
        end) else nil;
        local v55 = if v45 then nil else if v20.renderLeft or v27 then v46 else not v48 and v46 or nil;
        local v56 = v45 and "" or v41;
        return v8.createElement(v6.View, {
            tag = "size-full-0", 
            Size = UDim2.new(1, 0, 0, v26), 
            LayoutOrder = -1, 
            ZIndex = l_FFlagAppIaScrollAway_0 and 2 or nil, 
            Position = if l_FFlagAppIaScrollAway_0 then v54 else nil
        }, {
            headerBar = v8.createElement(l_HeaderBar_0, {
                title = v56, 
                barHeight = v26, 
                renderLeft = v55, 
                isSecondary = l_isSecondary_0, 
                renderCenter = v45, 
                renderRight = v44, 
                paddingLeft = v50, 
                paddingRight = v51, 
                isTitleCentered = not l_isTitleLeftAligned_0, 
                contentPaddingRight = UDim.new(0, 0), 
                backgroundTransparency = if not l_FFlagAppIaScrollAway_0 or v25 then v42.Tokens.Global.Color.None.Transparency else nil
            })
        });
    end;
end;
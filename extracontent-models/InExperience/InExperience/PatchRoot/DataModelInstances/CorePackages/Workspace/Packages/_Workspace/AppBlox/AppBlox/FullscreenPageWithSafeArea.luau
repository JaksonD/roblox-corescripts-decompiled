local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.RoactRodux);
local l_getSafeAreaSize_0 = require(l_Parent_0.InputUi).getSafeAreaSize;
local l_IsVRAppBuild_0 = require(l_Parent_0.AppCommonLib).IsVRAppBuild;
local l_Constants_0 = require(l_Parent_0.AppSystemBar).Constants;
local v6 = v1.PureComponent:extend("FullscreenPageWithSafeArea");
local l_useSignalState_0 = require(l_Parent_0.SignalsReact).useSignalState;
local v8 = require(l_Parent_0.Display);
local v9 = require(l_Parent_0.Cryo);
local v10 = game:DefineFastFlag("VRAlwaysIgnoreSafeMargins", false);
local l_FFlagExtendScrollingFramesBySafeInsets_0 = require(l_Parent_0.SharedFlags).FFlagExtendScrollingFramesBySafeInsets;
v6.render = function(v12) --[[ Line: 19 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_FFlagExtendScrollingFramesBySafeInsets_0 (copy), l_getSafeAreaSize_0 (copy), v10 (copy), l_IsVRAppBuild_0 (copy), l_Constants_0 (copy)
    local l_statusBarHeight_0 = v12.props.statusBarHeight;
    local l_screenSize_0 = v12.props.screenSize;
    local l_globalGuiInset_0 = v12.props.globalGuiInset;
    local l_BackgroundColor3_0 = v12.props.BackgroundColor3;
    local l_BackgroundTransparency_0 = v12.props.BackgroundTransparency;
    local l_includeStatusBar_0 = v12.props.includeStatusBar;
    local l_includeBottomBar_0 = v12.props.includeBottomBar;
    local l_renderFullscreenBackground_0 = v12.props.renderFullscreenBackground;
    local v21 = v12.props[v1.Children];
    local l_buttonRef_0 = v12.props.buttonRef;
    local v23 = if l_FFlagExtendScrollingFramesBySafeInsets_0 then v12.props.deviceSafePadding else nil;
    if l_screenSize_0.X == 0 or l_screenSize_0.Y == 0 then
        return nil;
    else
        local v24 = l_getSafeAreaSize_0(l_screenSize_0, l_globalGuiInset_0);
        local v25 = l_globalGuiInset_0.top + (l_FFlagExtendScrollingFramesBySafeInsets_0 and v23.top or 0);
        local v26 = if v10 then v12.props.useFullScalePage or l_IsVRAppBuild_0() else if v12.props.useFullScalePage ~= nil then v12.props.useFullScalePage else l_IsVRAppBuild_0();
        if l_includeStatusBar_0 then
            v24 = UDim2.new(0, v24.X.Offset, 0, v24.Y.Offset - l_statusBarHeight_0);
            v25 = v25 + l_statusBarHeight_0;
        end;
        if l_includeBottomBar_0 then
            v24 = UDim2.new(0, v24.X.Offset, 0, v24.Y.Offset - l_Constants_0.BOTTOM_BAR_SIZE);
        end;
        return v1.createElement("Frame", {
            Position = if v26 then UDim2.new(0, 0, 0, 0) else UDim2.new(0, -l_globalGuiInset_0.left - (l_FFlagExtendScrollingFramesBySafeInsets_0 and v23.left or 0), 0, -l_globalGuiInset_0.top - (l_FFlagExtendScrollingFramesBySafeInsets_0 and v23.top or 0)), 
            Size = if v26 then UDim2.new(1, 0, 1, 0) else UDim2.new(0, l_screenSize_0.X, 0, l_screenSize_0.Y), 
            BackgroundColor3 = l_BackgroundColor3_0, 
            BackgroundTransparency = l_BackgroundTransparency_0, 
            Active = true, 
            BorderSizePixel = 0, 
            ClipsDescendants = not l_FFlagExtendScrollingFramesBySafeInsets_0 or false, 
            [v1.Ref] = l_buttonRef_0
        }, {
            Background = l_renderFullscreenBackground_0 and l_renderFullscreenBackground_0(v25), 
            SafeAreaFrame = v1.createElement("Frame", {
                Position = if v26 then UDim2.new(0, 0, 0, 0) else UDim2.new(0, l_globalGuiInset_0.left + (l_FFlagExtendScrollingFramesBySafeInsets_0 and v23.left or 0), 0, v25), 
                Size = if v26 then UDim2.new(1, 0, 1, 0) else v24, 
                BackgroundTransparency = 1, 
                ZIndex = l_renderFullscreenBackground_0 and 2 or 1
            }, v21)
        });
    end;
end;
local v29 = v2.connect(function(v27, _) --[[ Line: 90 ]]
    return {
        statusBarHeight = v27.TopBar.statusBarHeight, 
        screenSize = v27.ScreenSize, 
        globalGuiInset = v27.GlobalGuiInset
    };
end)(v6);
if l_FFlagExtendScrollingFramesBySafeInsets_0 then
    return function(v30) --[[ Line: 99 ]] --[[ Name: FullscreenPageWithSafeAreaFunctional ]]
        -- upvalues: l_useSignalState_0 (copy), v8 (copy), v9 (copy), v1 (copy), v29 (copy)
        local v31 = l_useSignalState_0(v8.GetDisplayStore().getDeviceSafePadding);
        local v32 = v9.Dictionary.join(v30, {
            deviceSafePadding = v31
        });
        return v1.createElement(v29, v32);
    end;
else
    return v29;
end;
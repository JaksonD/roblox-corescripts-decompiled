local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local v6 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v8 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v10 = v2.PureComponent:extend("NavOverlayContainer");
v10.validateProps = v4.strictInterface({
    onAbsoluteSizeChanged = v4.optional(v4.callback), 
    onAbsolutePositionChanged = v4.optional(v4.callback), 
    ZIndex = v4.optional(v4.integer), 
    [v2.Children] = v4.table, 
    globalGuiInset = v4.strictInterface({
        left = v4.integer, 
        top = v4.integer, 
        right = v4.integer, 
        bottom = v4.integer
    }), 
    screenSize = v4.Vector2, 
    isPortrait = v4.boolean
});
v10.render = function(v11) --[[ Line: 42 ]] --[[ Name: render ]]
    -- upvalues: l_getSafeAreaSize_0 (copy), v6 (copy), v2 (copy), l_IsVRAppBuild_0 (copy)
    local l_globalGuiInset_0 = v11.props.globalGuiInset;
    local l_screenSize_0 = v11.props.screenSize;
    local v14 = l_getSafeAreaSize_0(l_screenSize_0, l_globalGuiInset_0);
    local v15 = UDim2.fromScale(1, 1);
    local v16 = UDim2.fromOffset(0, 0);
    if not v11.props.isPortrait then
        v15 = UDim2.fromScale(v6.LandscapeNavWidth, 1);
        v16 = UDim2.fromOffset(0, 0);
    end;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Position = UDim2.fromScale(0, 0), 
        Size = if l_IsVRAppBuild_0() then UDim2.fromScale(1, 1) else v14, 
        ZIndex = v11.props.ZIndex
    }, {
        WidthFrame = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = v15, 
            Position = v16, 
            [v2.Change.AbsoluteSize] = v11.props.onAbsoluteSizeChanged, 
            [v2.Change.AbsolutePosition] = v11.props.onAbsolutePositionChanged
        }, v11.props[v2.Children])
    });
end;
return v3.connect(function(v17, _) --[[ Line: 75 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v8 (copy)
    return {
        globalGuiInset = v17.GlobalGuiInset, 
        screenSize = v17.ScreenSize, 
        isPortrait = v8(v17)
    };
end, nil)(v10);
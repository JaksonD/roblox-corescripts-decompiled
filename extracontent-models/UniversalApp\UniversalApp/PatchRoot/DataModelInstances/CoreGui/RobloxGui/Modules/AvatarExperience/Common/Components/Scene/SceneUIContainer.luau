local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.Roact);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v6 = require(l_Modules_0.AvatarExperience.Common.Components.Scene.FullViewIndicator);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Components.RobuxBalance);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v9 = require(l_Modules_0.AvatarExperience.Common.Hooks.useShouldRenderQuickMenuButton);
local v10 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXFixRobuxBalanceButtonPositionSecond);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useDeviceOrientation_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useDeviceOrientation;
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v14 = require(l_Modules_0.AvatarExperience.Flags.FFlagAXMoveRobuxBalanceButtonLower);
local v15 = require(script.Parent.QuickMenuButton);
local v16 = v4.PureComponent:extend("SceneUIContainer");
v16.defaultProps = {
    isVisible = true
};
v16.init = function(v17) --[[ Line: 41 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy)
    v17.robuxBalanceRef = v4.createRef();
    v17.quickMenuRef = v4.createRef();
end;
v16.renderRobloxBalanceContainer = function(v18) --[[ Line: 46 ]] --[[ Name: renderRobloxBalanceContainer ]]
    -- upvalues: v4 (copy), v7 (copy)
    return v4.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        AnchorPoint = Vector2.new(1, 0), 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, 0, 0, 0), 
        LayoutOrder = 2
    }, {
        RobuxBalance = v4.createElement(v7, {
            [v4.Ref] = v18.robuxBalanceRef, 
            NextSelectionLeft = v18.quickMenuRef
        })
    });
end;
v16.getRow1Children = function(v19) --[[ Line: 61 ]] --[[ Name: getRow1Children ]]
    -- upvalues: v4 (copy), v15 (copy), v14 (copy)
    local l_showRobuxBalance_0 = v19.props.showRobuxBalance;
    return {
        UIListLayout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 5)
        }), 
        QuickMenuButton = if v19.props.showQuickMenuButton then v4.createElement(v15, {
            [v4.Ref] = v19.quickMenuRef, 
            NextSelectionRight = v19.robuxBalanceRef
        }) else nil, 
        RobuxBalanceContainer = if v14 then nil else l_showRobuxBalance_0 and v19:renderRobloxBalanceContainer()
    };
end;
v16.render = function(v21) --[[ Line: 84 ]] --[[ Name: render ]]
    -- upvalues: l_DeviceOrientationMode_0 (copy), v10 (copy), v4 (copy), l_Focusable_0 (copy), v6 (copy)
    local l_isVisible_0 = v21.props.isVisible;
    local l_forwardRef_0 = v21.props.forwardRef;
    local v24 = 4;
    if v21.props.deviceOrientation == l_DeviceOrientationMode_0.Landscape then
        local l_designTokens_0 = v21.props.designTokens;
        v24 = if v10() then v21.props.statusBarHeight + l_designTokens_0.Global.Size_150 else ((v21.props.globalGuiInset or {}).top or 0) + l_designTokens_0.Global.Size_150;
    end;
    return v4.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 72), 
        Position = UDim2.new(0, -12, 0, v24), 
        Visible = l_isVisible_0, 
        [v4.Ref] = l_forwardRef_0, 
        restorePreviousChildFocus = true, 
        defaultChild = v21.quickMenuRef
    }, {
        Row1 = v4.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 36), 
            Visible = v21.props.row1ChildrenVisible
        }, v21:getRow1Children()), 
        FullViewIndicator = v4.createElement(v6, {
            AnchorPoint = Vector2.new(1, 0), 
            Position = UDim2.new(1, 0, 0, 40)
        })
    });
end;
return v4.forwardRef(function(v26, v27) --[[ Line: 125 ]]
    -- upvalues: v9 (copy), l_useDesignTokens_0 (copy), l_useDeviceOrientation_0 (copy), v4 (copy), v16 (copy), v3 (copy)
    local v28 = v9();
    local v29 = l_useDesignTokens_0();
    local v30 = l_useDeviceOrientation_0();
    return v4.createElement(v16, v3.Dictionary.join(v26, {
        forwardRef = v27, 
        showQuickMenuButton = v28, 
        designTokens = v29, 
        deviceOrientation = v30
    }));
end);
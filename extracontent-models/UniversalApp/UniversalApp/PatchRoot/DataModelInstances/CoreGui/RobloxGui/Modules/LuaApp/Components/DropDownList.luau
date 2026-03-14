local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local l_withStyle_0 = require(l_CorePackages_0.Packages.UIBlox).Style.withStyle;
local v5 = require(l_Modules_0.LuaApp.Constants);
local v6 = require(l_CorePackages_0.Workspace.Packages.VrCompatibility);
local l_VRConstants_0 = v6.VRConstants;
local l_VRPanelWidthIXP_0 = v6.VRPanelWidthIXP;
local v9 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local v10 = require(l_Modules_0.LuaApp.Components.ContextualMenu);
local v11 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local v12 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetButton);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local v14 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_GetFFlagVRPanelWidthIXPEnabled_0 = v14.GetFFlagVRPanelWidthIXPEnabled;
local l_FFlagLuaAppForceVrAppPanelWidthRollout_0 = v14.FFlagLuaAppForceVrAppPanelWidthRollout;
local l_GRAY1_0 = v5.Color.GRAY1;
local l_SourceSans_0 = Enum.Font.SourceSans;
local l_GRAY1_1 = v5.Color.GRAY1;
local l_SourceSans_1 = Enum.Font.SourceSans;
local v21 = {
    Image = "LuaApp/buttons/buttonFill", 
    SliceCenter = Rect.new(8, 8, 9, 9)
};
local v22 = {
    Image = "LuaApp/buttons/buttonStroke", 
    SliceCenter = Rect.new(8, 8, 9, 9)
};
local v23 = v3.Component:extend("DropDownList");
v23.defaultProps = {
    height = 38, 
    itemHeight = 54, 
    itemTextColor = l_GRAY1_1, 
    itemFont = l_SourceSans_1, 
    itemTextSize = 23, 
    size = UDim2.new(1, 0, 0, 38), 
    textColor = l_GRAY1_0, 
    font = l_SourceSans_0, 
    textSize = 18
};
v23.init = function(v24) --[[ Line: 67 ]] --[[ Name: init ]]
    -- upvalues: l_IsVRAppBuild_0 (copy), l_FFlagLuaAppForceVrAppPanelWidthRollout_0 (copy), l_VRConstants_0 (copy)
    v24.state = {
        isOpen = false
    };
    v24.onActivated = function(v25) --[[ Line: 72 ]]
        -- upvalues: v24 (copy), l_IsVRAppBuild_0 (ref), l_FFlagLuaAppForceVrAppPanelWidthRollout_0 (ref), l_VRConstants_0 (ref)
        local v26 = 0;
        local v27 = 0;
        local l_v25_FirstAncestorOfClass_0 = v25:FindFirstAncestorOfClass("ScreenGui");
        if l_v25_FirstAncestorOfClass_0 ~= nil then
            v26 = l_v25_FirstAncestorOfClass_0.AbsoluteSize.x;
            v27 = l_v25_FirstAncestorOfClass_0.AbsoluteSize.y;
        end;
        v24:setState({
            isOpen = true, 
            screenShape = {
                x = v25.AbsolutePosition.x, 
                y = v25.AbsolutePosition.y, 
                width = v25.AbsoluteSize.x, 
                height = v25.AbsoluteSize.y, 
                parentWidth = if l_IsVRAppBuild_0() then if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and v24.props.vrPanelWidthMultiplier then l_VRConstants_0.MainScreenResolution.x * v24.props.vrPanelWidthMultiplier else l_VRConstants_0.MainScreenResolution.x else v26, 
                parentHeight = if l_IsVRAppBuild_0() then l_VRConstants_0.MainScreenResolution.y else v27
            }
        });
    end;
    v24.callbackCancel = function() --[[ Line: 101 ]]
        -- upvalues: v24 (copy)
        v24:setState({
            isOpen = false
        });
    end;
    v24.callbackSelect = function(v29, v30) --[[ Line: 106 ]]
        -- upvalues: v24 (copy)
        v24:setState({
            isOpen = false
        });
        if v24.props.onSelected then
            v24.props.onSelected(v29, v30);
        end;
    end;
end;
v23.render = function(v31) --[[ Line: 118 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v10 (copy), l_withStyle_0 (copy), v12 (copy), v21 (copy), v11 (copy), v22 (copy), v5 (copy)
    local l_position_0 = v31.props.position;
    local l_anchorPoint_0 = v31.props.anchorPoint;
    local l_height_0 = v31.props.height;
    local l_items_0 = v31.props.items;
    local l_itemSelected_0 = v31.props.itemSelected;
    local l_layoutOrder_0 = v31.props.layoutOrder;
    local l_screenShape_0 = v31.state.screenShape;
    local l_size_0 = v31.props.size;
    local v40 = nil;
    if v31.state.isOpen then
        v40 = v3.createElement(v10, {
            menuItems = l_items_0, 
            screenShape = l_screenShape_0, 
            callbackCancel = v31.callbackCancel, 
            callbackSelect = v31.callbackSelect
        });
    end;
    return l_withStyle_0(function(v41) --[[ Line: 145 ]]
        -- upvalues: v3 (ref), v12 (ref), l_size_0 (copy), l_position_0 (copy), l_anchorPoint_0 (copy), l_layoutOrder_0 (copy), v21 (ref), v31 (copy), v11 (ref), v22 (ref), v5 (ref), l_height_0 (copy), l_itemSelected_0 (copy), v40 (ref)
        return v3.createElement(v12, {
            Size = l_size_0, 
            Position = l_position_0, 
            AnchorPoint = l_anchorPoint_0, 
            LayoutOrder = l_layoutOrder_0, 
            AutoButtonColor = false, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ClipsDescendants = false, 
            Image = v21.Image, 
            ImageColor3 = v41.Theme.BackgroundDefault.Color, 
            ImageTransparency = v41.Theme.BackgroundDefault.Transparency, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v21.SliceCenter, 
            [v3.Event.Activated] = v31.onActivated
        }, {
            Border = v3.createElement(v11, {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                Image = v22.Image, 
                ImageColor3 = v41.Theme.SecondaryDefault.Color, 
                ImageTransparency = v41.Theme.SecondaryDefault.Transparency, 
                LayoutOrder = l_layoutOrder_0, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = v22.SliceCenter
            }), 
            Text = v3.createElement("TextLabel", {
                BackgroundColor3 = v5.Color.WHITE, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, -47, 0, l_height_0), 
                Text = l_itemSelected_0.displayName, 
                Font = v41.Font.Body.Font, 
                TextSize = v41.Font.BaseSize * v41.Font.Body.RelativeSize, 
                TextColor3 = v41.Theme.TextDefault.Color, 
                TextTransparency = v41.Theme.TextDefault.Transparency, 
                Position = UDim2.new(0, 10, 0, 0), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                ClipsDescendants = true, 
                TextTruncate = Enum.TextTruncate.AtEnd
            }), 
            Arrow = v3.createElement(v11, {
                AnchorPoint = Vector2.new(1, 0.5), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Image = "LuaApp/icons/dropdown_arrowDown", 
                ImageColor3 = v41.Theme.IconDefault.Color, 
                ImageTransparency = v41.Theme.IconDefault.Transparency, 
                Position = UDim2.new(1, -7, 0.5, 0), 
                Size = UDim2.new(0, 20, 0, 20)
            }), 
            Items = v40
        });
    end);
end;
if not l_FFlagLuaAppForceVrAppPanelWidthRollout_0 and l_GetFFlagVRPanelWidthIXPEnabled_0() then
    v23 = v9.connectTestVariables({
        vrPanelWidthMultiplier = l_VRPanelWidthIXP_0.VrAppPanelWidthMultiplier
    })(v23);
end;
return v23;
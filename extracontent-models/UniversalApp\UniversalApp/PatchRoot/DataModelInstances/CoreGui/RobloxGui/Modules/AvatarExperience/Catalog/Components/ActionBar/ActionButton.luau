local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.Roact);
local _ = require(l_CorePackages_0.Packages.React);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local v8 = require(l_CorePackages_0.Packages.Foundation);
local l_Radius_0 = v8.Enums.Radius;
local l_Skeleton_0 = v8.Skeleton;
local l_FitTextLabel_0 = require(l_CorePackages_0.Packages.AvatarExperienceDeps).RoactFitComponents.FitTextLabel;
local l_withStyle_0 = v7.Style.withStyle;
local l_withSelectionCursorProvider_0 = v7.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v7.App.SelectionImage.CursorKind;
local l_ImageSetLabel_0 = v7.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v7.App.ImageSet.Images;
local l_Interactable_0 = v7.Core.Control.Interactable;
local l_FFlagAXDurablesSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupport;
local l_FFlagAXMISEnableMultiShopping_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping;
local v20 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v21 = l_Images_0["component_assets/circle_17"];
local v22 = v4.PureComponent:extend("ActionButton");
v22.validateProps = v2.strictInterface({
    NextSelectionLeft = v2.optional(v2.table), 
    NextSelectionDown = v2.optional(v2.table), 
    NextSelectionUp = v2.optional(v2.table), 
    NextSelectionRight = v2.optional(v2.table), 
    Size = v2.UDim2, 
    Position = v2.optional(v2.UDim2), 
    LayoutOrder = v2.optional(v2.number), 
    AnchorPoint = if l_FFlagAXDurablesSupport_0 then v2.optional(v2.Vector2) else nil, 
    buttonProps = v2.table, 
    Font = v2.table, 
    forwardRef = v2.optional(v2.table)
});
v22.init = function(v23) --[[ Line: 55 ]] --[[ Name: init ]]
    v23.state = {
        isButtonPressed = false
    };
    v23.onInputBegan = function() --[[ Line: 60 ]]
        -- upvalues: v23 (copy)
        v23:setState({
            isButtonPressed = true
        });
    end;
    v23.onInputEnded = function() --[[ Line: 66 ]]
        -- upvalues: v23 (copy)
        v23:setState({
            isButtonPressed = false
        });
    end;
end;
v22.renderWithStyle = function(v24, v25, v26) --[[ Line: 73 ]] --[[ Name: renderWithStyle ]]
    -- upvalues: l_FFlagAXDurablesSupport_0 (copy), v20 (copy), v4 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), l_ImageSetLabel_0 (copy), l_FitTextLabel_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_Focusable_0 (copy), l_Interactable_0 (copy), v21 (copy), l_CursorKind_0 (copy)
    local l_Size_0 = v24.props.Size;
    local l_Position_0 = v24.props.Position;
    local v29 = if l_FFlagAXDurablesSupport_0 then v24.props.AnchorPoint else nil;
    local l_LayoutOrder_0 = v24.props.LayoutOrder;
    local l_Font_0 = v24.props.Font;
    local l_buttonProps_0 = v24.props.buttonProps;
    local l_isButtonPressed_0 = v24.state.isButtonPressed;
    local l_Theme_0 = v25.Theme;
    local v35 = 0;
    if l_buttonProps_0.buttonIsDisabled then
        v35 = v20.ActionBar.DisabledButtonTransparency;
    elseif l_isButtonPressed_0 then
        v35 = l_Theme_0.Overlay.Transparency;
    end;
    local v36 = nil;
    v36 = if l_buttonProps_0.buttonIsLoading then v4.createElement(l_Skeleton_0, {
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        radius = l_Radius_0.Medium
    }) else v4.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1
    }, {
        Layout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, l_buttonProps_0.buttonIconPadding)
        }), 
        Icon = l_buttonProps_0.buttonIcon and v4.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(0, l_buttonProps_0.buttonIconSize, 0, l_buttonProps_0.buttonIconSize), 
            BackgroundTransparency = 1, 
            Image = l_buttonProps_0.buttonIcon, 
            ImageTransparency = v35, 
            ImageColor3 = l_buttonProps_0.buttonTextColor, 
            LayoutOrder = 1
        }), 
        Text = v4.createElement(l_FitTextLabel_0, {
            width = l_FitTextLabel_0.Width.FitToText, 
            Size = UDim2.new(0, 0, 0, l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize), 
            BackgroundTransparency = 1, 
            Text = l_buttonProps_0.buttonText or "", 
            Font = if l_FFlagAXMISEnableMultiShopping_0 then l_Font_0.Header2.Font else l_Font_0.Header1.Font, 
            TextSize = if l_FFlagAXMISEnableMultiShopping_0 then (l_Font_0.BaseSize - 2) * l_Font_0.Header2.RelativeSize else l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextWrapped = false, 
            TextColor3 = l_buttonProps_0.buttonTextColor, 
            TextTransparency = v35, 
            LayoutOrder = 2
        })
    });
    local l_forwardRef_0 = v24.props.forwardRef;
    return v4.createElement(l_Focusable_0[l_Interactable_0], {
        Size = l_Size_0, 
        Position = l_Position_0, 
        AnchorPoint = if l_FFlagAXDurablesSupport_0 then v29 else nil, 
        LayoutOrder = l_LayoutOrder_0, 
        AutoButtonColor = false, 
        BackgroundTransparency = 1, 
        Image = v21, 
        ImageColor3 = l_buttonProps_0.buttonColor, 
        ImageTransparency = v35, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(8, 8, 9, 9), 
        ClipsDescendants = true, 
        [v4.Event.InputBegan] = v24.onInputBegan, 
        [v4.Event.InputEnded] = v24.onInputEnded, 
        [v4.Event.Activated] = function() --[[ Line: 156 ]]
            -- upvalues: l_buttonProps_0 (copy)
            if l_buttonProps_0.onActivated ~= nil and not l_buttonProps_0.buttonIsLoading then
                l_buttonProps_0.onActivated();
            end;
        end, 
        NextSelectionLeft = v24.props.NextSelectionLeft, 
        NextSelectionDown = v24.props.NextSelectionDown, 
        NextSelectionUp = v24.props.NextSelectionUp, 
        NextSelectionRight = v24.props.NextSelectionRight, 
        [v4.Ref] = l_forwardRef_0, 
        SelectionImageObject = v26(l_CursorKind_0.RoundedRectNoInset)
    }, {
        ButtonInfo = v36
    });
end;
v22.render = function(v38) --[[ Line: 173 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withSelectionCursorProvider_0 (copy)
    return l_withStyle_0(function(v39) --[[ Line: 174 ]]
        -- upvalues: l_withSelectionCursorProvider_0 (ref), v38 (copy)
        return l_withSelectionCursorProvider_0(function(v40) --[[ Line: 175 ]]
            -- upvalues: v38 (ref), v39 (copy)
            return v38:renderWithStyle(v39, v40);
        end);
    end);
end;
return v4.forwardRef(function(v41, v42) --[[ Line: 181 ]]
    -- upvalues: v4 (copy), v22 (copy), v3 (copy)
    return v4.createElement(v22, v3.Dictionary.join(v41, {
        forwardRef = v42
    }));
end);
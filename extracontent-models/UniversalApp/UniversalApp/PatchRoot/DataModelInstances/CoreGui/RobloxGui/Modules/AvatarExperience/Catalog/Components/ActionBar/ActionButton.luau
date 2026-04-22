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
local l_FFlagAXMISEnableMultiShopping_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping;
local v19 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v20 = l_Images_0["component_assets/circle_17"];
local v21 = v4.PureComponent:extend("ActionButton");
v21.validateProps = v2.strictInterface({
    NextSelectionLeft = v2.optional(v2.table), 
    NextSelectionDown = v2.optional(v2.table), 
    NextSelectionUp = v2.optional(v2.table), 
    NextSelectionRight = v2.optional(v2.table), 
    Size = v2.UDim2, 
    Position = v2.optional(v2.UDim2), 
    LayoutOrder = v2.optional(v2.number), 
    AnchorPoint = v2.optional(v2.Vector2), 
    buttonProps = v2.table, 
    Font = v2.table, 
    forwardRef = v2.optional(v2.table)
});
v21.init = function(v22) --[[ Line: 54 ]] --[[ Name: init ]]
    v22.state = {
        isButtonPressed = false
    };
    v22.onInputBegan = function() --[[ Line: 59 ]]
        -- upvalues: v22 (copy)
        v22:setState({
            isButtonPressed = true
        });
    end;
    v22.onInputEnded = function() --[[ Line: 65 ]]
        -- upvalues: v22 (copy)
        v22:setState({
            isButtonPressed = false
        });
    end;
end;
v21.renderWithStyle = function(v23, v24, v25) --[[ Line: 72 ]] --[[ Name: renderWithStyle ]]
    -- upvalues: v19 (copy), v4 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), l_ImageSetLabel_0 (copy), l_FitTextLabel_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_Focusable_0 (copy), l_Interactable_0 (copy), v20 (copy), l_CursorKind_0 (copy)
    local l_Size_0 = v23.props.Size;
    local l_Position_0 = v23.props.Position;
    local l_AnchorPoint_0 = v23.props.AnchorPoint;
    local l_LayoutOrder_0 = v23.props.LayoutOrder;
    local l_Font_0 = v23.props.Font;
    local l_buttonProps_0 = v23.props.buttonProps;
    local l_isButtonPressed_0 = v23.state.isButtonPressed;
    local l_Theme_0 = v24.Theme;
    local v34 = 0;
    if l_buttonProps_0.buttonIsDisabled then
        v34 = v19.ActionBar.DisabledButtonTransparency;
    elseif l_isButtonPressed_0 then
        v34 = l_Theme_0.Overlay.Transparency;
    end;
    local v35 = nil;
    v35 = if l_buttonProps_0.buttonIsLoading then v4.createElement(l_Skeleton_0, {
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
            ImageTransparency = v34, 
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
            TextTransparency = v34, 
            LayoutOrder = 2
        })
    });
    local l_forwardRef_0 = v23.props.forwardRef;
    return v4.createElement(l_Focusable_0[l_Interactable_0], {
        Size = l_Size_0, 
        Position = l_Position_0, 
        AnchorPoint = l_AnchorPoint_0, 
        LayoutOrder = l_LayoutOrder_0, 
        AutoButtonColor = false, 
        BackgroundTransparency = 1, 
        Image = v20, 
        ImageColor3 = l_buttonProps_0.buttonColor, 
        ImageTransparency = v34, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(8, 8, 9, 9), 
        ClipsDescendants = true, 
        [v4.Event.InputBegan] = v23.onInputBegan, 
        [v4.Event.InputEnded] = v23.onInputEnded, 
        [v4.Event.Activated] = function() --[[ Line: 155 ]]
            -- upvalues: l_buttonProps_0 (copy)
            if l_buttonProps_0.onActivated ~= nil and not l_buttonProps_0.buttonIsLoading then
                l_buttonProps_0.onActivated();
            end;
        end, 
        NextSelectionLeft = v23.props.NextSelectionLeft, 
        NextSelectionDown = v23.props.NextSelectionDown, 
        NextSelectionUp = v23.props.NextSelectionUp, 
        NextSelectionRight = v23.props.NextSelectionRight, 
        [v4.Ref] = l_forwardRef_0, 
        SelectionImageObject = v25(l_CursorKind_0.RoundedRectNoInset)
    }, {
        ButtonInfo = v35
    });
end;
v21.render = function(v37) --[[ Line: 172 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withSelectionCursorProvider_0 (copy)
    return l_withStyle_0(function(v38) --[[ Line: 173 ]]
        -- upvalues: l_withSelectionCursorProvider_0 (ref), v37 (copy)
        return l_withSelectionCursorProvider_0(function(v39) --[[ Line: 174 ]]
            -- upvalues: v37 (ref), v38 (copy)
            return v37:renderWithStyle(v38, v39);
        end);
    end);
end;
return v4.forwardRef(function(v40, v41) --[[ Line: 180 ]]
    -- upvalues: v4 (copy), v21 (copy), v3 (copy)
    return v4.createElement(v21, v3.Dictionary.join(v40, {
        forwardRef = v41
    }));
end);
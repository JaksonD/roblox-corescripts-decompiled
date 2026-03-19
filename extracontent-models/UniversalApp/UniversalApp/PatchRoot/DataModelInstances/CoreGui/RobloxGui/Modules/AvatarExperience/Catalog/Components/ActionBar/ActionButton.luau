local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.Roact);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local l_FitTextLabel_0 = require(l_CorePackages_0.Packages.AvatarExperienceDeps).RoactFitComponents.FitTextLabel;
local l_withStyle_0 = v6.Style.withStyle;
local l_withSelectionCursorProvider_0 = v6.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v6.App.SelectionImage.CursorKind;
local l_ShimmerPanel_0 = v6.App.Loading.ShimmerPanel;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v6.App.ImageSet.Images;
local l_Interactable_0 = v6.Core.Control.Interactable;
local l_FFlagAXDurablesSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupport;
local l_FFlagAXMISEnableMultiShopping_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping;
local v17 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v18 = l_Images_0["component_assets/circle_17"];
local v19 = v4.PureComponent:extend("ActionButton");
v19.validateProps = v2.strictInterface({
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
v19.init = function(v20) --[[ Line: 51 ]] --[[ Name: init ]]
    v20.state = {
        isButtonPressed = false
    };
    v20.onInputBegan = function() --[[ Line: 56 ]]
        -- upvalues: v20 (copy)
        v20:setState({
            isButtonPressed = true
        });
    end;
    v20.onInputEnded = function() --[[ Line: 62 ]]
        -- upvalues: v20 (copy)
        v20:setState({
            isButtonPressed = false
        });
    end;
end;
v19.renderWithStyle = function(v21, v22, v23) --[[ Line: 69 ]] --[[ Name: renderWithStyle ]]
    -- upvalues: l_FFlagAXDurablesSupport_0 (copy), v17 (copy), v4 (copy), l_ShimmerPanel_0 (copy), l_ImageSetLabel_0 (copy), l_FitTextLabel_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_Focusable_0 (copy), l_Interactable_0 (copy), v18 (copy), l_CursorKind_0 (copy)
    local l_Size_0 = v21.props.Size;
    local l_Position_0 = v21.props.Position;
    local v26 = if l_FFlagAXDurablesSupport_0 then v21.props.AnchorPoint else nil;
    local l_LayoutOrder_0 = v21.props.LayoutOrder;
    local l_Font_0 = v21.props.Font;
    local l_buttonProps_0 = v21.props.buttonProps;
    local l_isButtonPressed_0 = v21.state.isButtonPressed;
    local l_Theme_0 = v22.Theme;
    local v32 = 0;
    if l_buttonProps_0.buttonIsDisabled then
        v32 = v17.ActionBar.DisabledButtonTransparency;
    elseif l_isButtonPressed_0 then
        v32 = l_Theme_0.Overlay.Transparency;
    end;
    local v33 = nil;
    v33 = if l_buttonProps_0.buttonIsLoading then v4.createElement(l_ShimmerPanel_0, {
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        shimmerSpeed = 1.5, 
        cornerRadius = UDim.new(0, v22.Tokens.Semantic.Radius.Large)
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
            ImageTransparency = v32, 
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
            TextTransparency = v32, 
            LayoutOrder = 2
        })
    });
    local l_forwardRef_0 = v21.props.forwardRef;
    return v4.createElement(l_Focusable_0[l_Interactable_0], {
        Size = l_Size_0, 
        Position = l_Position_0, 
        AnchorPoint = if l_FFlagAXDurablesSupport_0 then v26 else nil, 
        LayoutOrder = l_LayoutOrder_0, 
        AutoButtonColor = false, 
        BackgroundTransparency = 1, 
        Image = v18, 
        ImageColor3 = l_buttonProps_0.buttonColor, 
        ImageTransparency = v32, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(8, 8, 9, 9), 
        ClipsDescendants = true, 
        [v4.Event.InputBegan] = v21.onInputBegan, 
        [v4.Event.InputEnded] = v21.onInputEnded, 
        [v4.Event.Activated] = function() --[[ Line: 153 ]]
            -- upvalues: l_buttonProps_0 (copy)
            if l_buttonProps_0.onActivated ~= nil and not l_buttonProps_0.buttonIsLoading then
                l_buttonProps_0.onActivated();
            end;
        end, 
        NextSelectionLeft = v21.props.NextSelectionLeft, 
        NextSelectionDown = v21.props.NextSelectionDown, 
        NextSelectionUp = v21.props.NextSelectionUp, 
        NextSelectionRight = v21.props.NextSelectionRight, 
        [v4.Ref] = l_forwardRef_0, 
        SelectionImageObject = v23(l_CursorKind_0.RoundedRectNoInset)
    }, {
        ButtonInfo = v33
    });
end;
v19.render = function(v35) --[[ Line: 170 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withSelectionCursorProvider_0 (copy)
    return l_withStyle_0(function(v36) --[[ Line: 171 ]]
        -- upvalues: l_withSelectionCursorProvider_0 (ref), v35 (copy)
        return l_withSelectionCursorProvider_0(function(v37) --[[ Line: 172 ]]
            -- upvalues: v35 (ref), v36 (copy)
            return v35:renderWithStyle(v36, v37);
        end);
    end);
end;
return v4.forwardRef(function(v38, v39) --[[ Line: 178 ]]
    -- upvalues: v4 (copy), v19 (copy), v3 (copy)
    return v4.createElement(v19, v3.Dictionary.join(v38, {
        forwardRef = v39
    }));
end);
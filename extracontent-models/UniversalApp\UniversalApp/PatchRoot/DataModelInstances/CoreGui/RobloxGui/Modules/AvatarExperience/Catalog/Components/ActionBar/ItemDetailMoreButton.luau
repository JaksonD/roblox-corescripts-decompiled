local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.t);
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.Roact);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v5.Style.withStyle;
local l_withSelectionCursorProvider_0 = v5.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = v5.App.SelectionImage.CursorKind;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v5.App.ImageSet.Images;
local v11 = UDim2.new(0, 44, 0, 44);
local v12 = l_Images_0["icons/menu/more_on"];
local v13 = l_Images_0["icons/menu/more_off"];
local v14 = UDim2.new(0, 37, 0, 37);
local v15 = l_Images_0["component_assets/circle_17"];
local v16 = Rect.new(8, 8, 9, 9);
local v17 = v3.PureComponent:extend("ItemDetailMoreButton");
local l_Interactable_0 = v5.Core.Control.Interactable;
local l_FFlagAXMISEnableMultiShopping_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping;
v17.validateProps = v1.strictInterface({
    NextSelectionRight = v1.table, 
    NextSelectionDown = v1.optional(v1.table), 
    onActivated = v1.callback, 
    isSelected = v1.optional(v1.boolean), 
    forwardRef = v1.table, 
    LayoutOrder = if l_FFlagAXMISEnableMultiShopping_0 then v1.optional(v1.number) else nil
});
v17.init = function(v20) --[[ Line: 42 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy)
    v20.isMounted = false;
    v20.state = {
        isButtonPressed = false
    };
    v20.onInputBegan = function() --[[ Line: 49 ]]
        -- upvalues: v20 (copy)
        if not v20.isMounted then
            return;
        else
            v20:setState({
                isButtonPressed = true
            });
            return;
        end;
    end;
    v20.onInputEnded = function() --[[ Line: 59 ]]
        -- upvalues: v20 (copy)
        if not v20.isMounted then
            return;
        else
            v20:setState({
                isButtonPressed = false
            });
            return;
        end;
    end;
    v20.moreButtonRef = v3.createRef();
end;
v17.renderWithStyle = function(v21, v22, v23) --[[ Line: 72 ]] --[[ Name: renderWithStyle ]]
    -- upvalues: v12 (copy), v13 (copy), v3 (copy), l_Focusable_0 (copy), l_Interactable_0 (copy), v11 (copy), v15 (copy), v16 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_CursorKind_0 (copy), l_ImageSetLabel_0 (copy), v14 (copy)
    local l_Theme_0 = v22.Theme;
    local l_onActivated_0 = v21.props.onActivated;
    local l_isButtonPressed_0 = v21.state.isButtonPressed;
    local l_isSelected_0 = v21.props.isSelected;
    local l_Transparency_0 = l_Theme_0.BackgroundDefault.Transparency;
    if l_isButtonPressed_0 then
        l_Transparency_0 = l_Theme_0.Overlay.Transparency;
    end;
    local l_forwardRef_0 = v21.props.forwardRef;
    local v30 = if l_isSelected_0 then v12 else v13;
    return v3.createElement(l_Focusable_0[l_Interactable_0], {
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        Size = v11, 
        Image = v15, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = v16, 
        ImageTransparency = l_Transparency_0, 
        ImageColor3 = l_Theme_0.BackgroundDefault.Color, 
        LayoutOrder = if l_FFlagAXMISEnableMultiShopping_0 then v21.props.LayoutOrder else 1, 
        ClipsDescendants = false, 
        [v3.Event.Activated] = l_onActivated_0, 
        [v3.Event.InputBegan] = v21.onInputBegan, 
        [v3.Event.InputEnded] = v21.onInputEnded, 
        [v3.Ref] = v21.moreButtonRef, 
        NextSelectionRight = v21.props.NextSelectionRight, 
        NextSelectionDown = v21.props.NextSelectionDown, 
        [v3.Ref] = l_forwardRef_0, 
        SelectionImageObject = v23(l_CursorKind_0.RoundedRectNoInset)
    }, {
        Icon = v3.createElement(l_ImageSetLabel_0, {
            Size = v14, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Image = v30, 
            ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
            ImageColor3 = l_Theme_0.IconEmphasis.Color
        })
    });
end;
v17.didMount = function(v31) --[[ Line: 120 ]] --[[ Name: didMount ]]
    v31.isMounted = true;
end;
v17.willUnmount = function(v32) --[[ Line: 124 ]] --[[ Name: willUnmount ]]
    v32.isMounted = false;
end;
v17.render = function(v33) --[[ Line: 128 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withSelectionCursorProvider_0 (copy)
    return l_withStyle_0(function(v34) --[[ Line: 129 ]]
        -- upvalues: l_withSelectionCursorProvider_0 (ref), v33 (copy)
        return l_withSelectionCursorProvider_0(function(v35) --[[ Line: 130 ]]
            -- upvalues: v33 (ref), v34 (copy)
            return v33:renderWithStyle(v34, v35);
        end);
    end);
end;
return v3.forwardRef(function(v36, v37) --[[ Line: 136 ]]
    -- upvalues: v3 (copy), v17 (copy), v2 (copy)
    return v3.createElement(v17, v2.Dictionary.join(v36, {
        forwardRef = v37
    }));
end);
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.t);
local v4 = require(l_Parent_0.UIBlox.Core.Style.withStyle);
local v5 = require(l_Parent_0.UIBlox.App.ImageSet.Images);
local v6 = require(l_Parent_0.UIBlox.Core.InputButton.InputButton);
local v7 = require(l_Parent_0.UIBlox.App.SelectionImage.CursorKind);
local v8 = require(l_Parent_0.UIBlox.App.SelectionImage.withSelectionCursorProvider);
local v9 = require(l_Parent_0.UIBlox.App.SelectionCursor.useCursorByType);
local v10 = v1.PureComponent:extend("Checkbox");
v10.validateProps = v3.strictInterface({
    text = v3.string, 
    isSelected = v3.optional(v3.boolean), 
    isDisabled = v3.optional(v3.boolean), 
    onActivated = v3.callback, 
    size = v3.optional(v3.UDim2), 
    layoutOrder = v3.optional(v3.number), 
    frameRef = v3.optional(v3.table), 
    NextSelectionDown = v3.optional(v3.table), 
    NextSelectionUp = v3.optional(v3.table), 
    NextSelectionLeft = v3.optional(v3.table), 
    NextSelectionRight = v3.optional(v3.table), 
    cursor = v3.table, 
    isRoactGamepadEnabled = v3.optional(v3.boolean)
});
v10.defaultProps = {
    text = "Checkbox Text", 
    isSelected = false, 
    isDisabled = false, 
    isRoactGamepadEnabled = true
};
v10.init = function(v11) --[[ Line: 55 ]] --[[ Name: init ]]
    v11.state = {
        value = v11.props.isSelected
    };
    v11.onFlip = function() --[[ Line: 60 ]]
        -- upvalues: v11 (copy)
        if v11.props.isDisabled then
            return;
        else
            v11.props.onActivated(not v11.props.isSelected);
            return;
        end;
    end;
end;
v10.render = function(v12) --[[ Line: 68 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v4 (copy)
    return v8(function(v13) --[[ Line: 69 ]]
        -- upvalues: v4 (ref), v12 (copy)
        return v4(function(v14) --[[ Line: 70 ]]
            -- upvalues: v12 (ref), v13 (copy)
            return v12:renderWithProviders(v14, v13, v12.props.cursor);
        end);
    end);
end;
v10.renderWithProviders = function(v15, v16, _, v18) --[[ Line: 76 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v5 (copy), v1 (copy), v6 (copy)
    local v19 = nil;
    local v20 = nil;
    local v21 = nil;
    local v22 = nil;
    local l_Theme_0 = v16.Theme;
    local l_Transparency_0 = l_Theme_0.TextDefault.Transparency;
    local l_Color_0 = l_Theme_0.TextDefault.Color;
    local l_Color_1 = l_Theme_0.SystemPrimaryContent.Color;
    if v15.props.isDisabled then
        l_Transparency_0 = 0.5;
    end;
    if v15.props.isSelected then
        v19 = v5["squircles/fill"];
        v20 = l_Theme_0.SystemPrimaryDefault.Color;
        v21 = v5["icons/status/success_small"];
        v22 = UDim2.new(0, 20, 0, 20);
    else
        v19 = v5["squircles/hollow"];
        v20 = l_Theme_0.TextDefault.Color;
    end;
    return v1.createElement(v6, {
        text = v15.props.text, 
        onActivated = v15.onFlip, 
        size = v15.props.size, 
        image = v19, 
        imageColor = v20, 
        fillImage = v21, 
        fillImageSize = v22, 
        fillImageColor = l_Color_1, 
        selectedColor = l_Theme_0.SystemPrimaryDefault.Color, 
        textColor = l_Color_0, 
        transparency = l_Transparency_0, 
        layoutOrder = v15.props.layoutOrder, 
        isDisabled = v15.props.isDisabled, 
        isRoactGamepadEnabled = v15.props.isRoactGamepadEnabled, 
        [v1.Ref] = v15.props.frameRef, 
        SelectionImageObject = v18
    });
end;
return v1.forwardRef(function(v27, v28) --[[ Line: 118 ]]
    -- upvalues: v9 (copy), v7 (copy), v1 (copy), v10 (copy), v2 (copy)
    local v29 = v9(v7.InputButton);
    return v1.createElement(v10, v2.Dictionary.join(v27, {
        frameRef = v28, 
        cursor = v29
    }));
end);
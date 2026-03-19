local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Checkbox_0 = require(l_Parent_0.Foundation).Checkbox;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.t);
local v5 = require(l_Parent_0.UIBlox.Core.Style.withStyle);
local v6 = require(l_Parent_0.UIBlox.App.ImageSet.Images);
local v7 = require(l_Parent_0.UIBlox.Core.InputButton.InputButton);
local v8 = require(l_Parent_0.UIBlox.App.SelectionImage.CursorKind);
local v9 = require(l_Parent_0.UIBlox.App.SelectionImage.withSelectionCursorProvider);
local v10 = require(l_Parent_0.UIBlox.App.SelectionCursor.useCursorByType);
local v11 = require(l_Parent_0.UIBlox.UIBloxConfig);
local v12 = v2.PureComponent:extend("Checkbox");
v12.validateProps = v4.strictInterface({
    text = v4.string, 
    isSelected = v4.optional(v4.boolean), 
    isDisabled = v4.optional(v4.boolean), 
    onActivated = v4.callback, 
    size = v4.optional(v4.UDim2), 
    layoutOrder = v4.optional(v4.number), 
    frameRef = v4.optional(v4.table), 
    NextSelectionDown = v4.optional(v4.table), 
    NextSelectionUp = v4.optional(v4.table), 
    NextSelectionLeft = v4.optional(v4.table), 
    NextSelectionRight = v4.optional(v4.table), 
    cursor = v4.table, 
    isRoactGamepadEnabled = v4.optional(v4.boolean)
});
v12.defaultProps = {
    text = "Checkbox Text", 
    isSelected = false, 
    isDisabled = false, 
    isRoactGamepadEnabled = true
};
v12.init = function(v13) --[[ Line: 60 ]] --[[ Name: init ]]
    v13.state = {
        value = v13.props.isSelected
    };
    v13.onFlip = function() --[[ Line: 65 ]]
        -- upvalues: v13 (copy)
        if v13.props.isDisabled then
            return;
        else
            v13.props.onActivated(not v13.props.isSelected);
            return;
        end;
    end;
end;
v12.render = function(v14) --[[ Line: 73 ]] --[[ Name: render ]]
    -- upvalues: v9 (copy), v5 (copy)
    return v9(function(v15) --[[ Line: 74 ]]
        -- upvalues: v5 (ref), v14 (copy)
        return v5(function(v16) --[[ Line: 75 ]]
            -- upvalues: v14 (ref), v15 (copy)
            return v14:renderWithProviders(v16, v15, v14.props.cursor);
        end);
    end);
end;
v12.renderWithProviders = function(v17, v18, _, v20) --[[ Line: 81 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v6 (copy), v2 (copy), v7 (copy)
    local v21 = nil;
    local v22 = nil;
    local v23 = nil;
    local v24 = nil;
    local l_Theme_0 = v18.Theme;
    local l_Transparency_0 = l_Theme_0.TextDefault.Transparency;
    local l_Color_0 = l_Theme_0.TextDefault.Color;
    local l_Color_1 = l_Theme_0.SystemPrimaryContent.Color;
    if v17.props.isDisabled then
        l_Transparency_0 = 0.5;
    end;
    if v17.props.isSelected then
        v21 = v6["squircles/fill"];
        v22 = l_Theme_0.SystemPrimaryDefault.Color;
        v23 = v6["icons/status/success_small"];
        v24 = UDim2.new(0, 20, 0, 20);
    else
        v21 = v6["squircles/hollow"];
        v22 = l_Theme_0.TextDefault.Color;
    end;
    return v2.createElement(v7, {
        text = v17.props.text, 
        onActivated = v17.onFlip, 
        size = v17.props.size, 
        image = v21, 
        imageColor = v22, 
        fillImage = v23, 
        fillImageSize = v24, 
        fillImageColor = l_Color_1, 
        selectedColor = l_Theme_0.SystemPrimaryDefault.Color, 
        textColor = l_Color_0, 
        transparency = l_Transparency_0, 
        layoutOrder = v17.props.layoutOrder, 
        isDisabled = v17.props.isDisabled, 
        isRoactGamepadEnabled = v17.props.isRoactGamepadEnabled, 
        [v2.Ref] = v17.props.frameRef, 
        SelectionImageObject = v20
    });
end;
return v2.forwardRef(function(v29, v30) --[[ Line: 123 ]]
    -- upvalues: v11 (copy), v2 (copy), l_Checkbox_0 (copy), v12 (copy), v10 (copy), v8 (copy), v3 (copy)
    if v11.useFoundationCheckbox then
        return v2.createElement(l_Checkbox_0, {
            label = v29.text or v12.defaultProps.text, 
            isChecked = v29.isSelected, 
            isDisabled = v29.isDisabled, 
            onActivated = v29.onActivated, 
            LayoutOrder = v29.layoutOrder, 
            NextSelectionDown = v29.NextSelectionDown, 
            NextSelectionUp = v29.NextSelectionUp, 
            NextSelectionLeft = v29.NextSelectionLeft, 
            NextSelectionRight = v29.NextSelectionRight, 
            ref = v30
        });
    else
        local v31 = v10(v8.InputButton);
        return v2.createElement(v12, v3.Dictionary.join(v29, {
            frameRef = v30, 
            cursor = v31
        }));
    end;
end);
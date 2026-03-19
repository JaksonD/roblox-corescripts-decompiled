local l_Parent_0 = script.Parent.Parent.Parent;
local l_Core_0 = l_Parent_0.Core;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Roact);
local v4 = require(l_Parent_1.t);
local v5 = require(l_Parent_1.Cryo);
local v6 = require(l_Core_0.Control.Interactable);
local v7 = require(l_Core_0.Control.Enum.ControlState);
local v8 = require(l_Core_0.Button.getContentStyle);
local v9 = require(l_Parent_0.Core.Style.withStyle);
local v10 = require(l_Core_0.ImageSet.ImageSetComponent);
local v11 = require(l_Parent_0.App.Loading.ShimmerPanel);
local v12 = require(l_Parent_0.App.ImageSet.Enum.IconSize);
local v13 = require(l_Parent_0.App.ImageSet.getIconSize);
local v14 = require(l_Core_0.Text.GenericTextLabel.GenericTextLabel);
local v15 = require(l_Parent_0.Core.Style.Validator.validateFontInfo);
local v16 = require(l_Core_0.ImageSet.Validator.validateImage);
local v17 = v3.PureComponent:extend("SegmentedControlTabName");
v17.init = function(v18) --[[ Line: 31 ]] --[[ Name: init ]]
    -- upvalues: v7 (copy)
    v18.state = {
        controlState = v7.Initialize
    };
    v18.onStateChanged = function(v19, v20) --[[ Line: 36 ]]
        -- upvalues: v18 (copy)
        v18:setState({
            controlState = v20
        });
        if v18.props.onStateChanged then
            v18.props.onStateChanged(v19, v20);
        end;
    end;
end;
local v21 = v4.interface({
    [v7.Default] = v4.string
});
v17.validateProps = v4.interface({
    icon = v4.optional(v16), 
    text = v4.optional(v4.string), 
    fontStyle = v4.optional(v15), 
    textStateColorMap = v4.optional(v21), 
    iconStateColorMap = v4.optional(v21), 
    isDisabled = v4.optional(v4.boolean), 
    isLoading = v4.optional(v4.boolean), 
    onActivated = v4.callback, 
    onStateChanged = v4.optional(v4.callback), 
    userInteractionEnabled = v4.optional(v4.boolean), 
    isSelectedStyle = v4.optional(v4.boolean)
});
v17.defaultProps = {
    isDisabled = false, 
    isLoading = false, 
    isSelectedStyle = false, 
    SliceCenter = Rect.new(8, 8, 9, 9), 
    textStateColorMap = {
        [v7.Default] = "TextDefault", 
        [v7.Hover] = "TextEmphasis"
    }, 
    buttonStateColorMap = {
        [v7.Default] = "SecondaryContent"
    }
};
v17.render = function(v22) --[[ Line: 100 ]] --[[ Name: render ]]
    -- upvalues: v9 (copy), v7 (copy), v8 (copy), v3 (copy), v11 (copy), v10 (copy), v13 (copy), v12 (copy), v14 (copy), v6 (copy), v5 (copy)
    return v9(function(v23) --[[ Line: 101 ]]
        -- upvalues: v22 (copy), v7 (ref), v8 (ref), v3 (ref), v11 (ref), v10 (ref), v13 (ref), v12 (ref), v14 (ref), v6 (ref), v5 (ref)
        local l_controlState_0 = v22.state.controlState;
        local l_text_0 = v22.props.text;
        local l_icon_0 = v22.props.icon;
        local l_isLoading_0 = v22.props.isLoading;
        local l_isDisabled_0 = v22.props.isDisabled;
        local l_buttonStateColorMap_0 = v22.props.buttonStateColorMap;
        local l_contentStateColorMap_0 = v22.props.contentStateColorMap;
        local v31 = v22.props.textStateColorMap or l_contentStateColorMap_0;
        local v32 = v22.props.iconStateColorMap or l_contentStateColorMap_0;
        if l_isLoading_0 then
            l_isDisabled_0 = true;
        end;
        local l_l_controlState_0_0 = l_controlState_0;
        if v22.props.isDisabled then
            l_l_controlState_0_0 = v7.Disabled;
        elseif v22.props.isSelectedStyle then
            l_l_controlState_0_0 = v7.Hover;
        end;
        local v34 = v8(l_buttonStateColorMap_0, l_controlState_0, v23);
        local v35 = l_text_0 and v8(v31, l_l_controlState_0_0, v23);
        local v36 = l_icon_0 and v8(v32, l_controlState_0, v23);
        local v37 = v22.props.fontStyle or v23.Font.Header2;
        local v38 = nil;
        v38 = if l_isLoading_0 then {
            isLoadingShimmer = v3.createElement(v11, {
                Size = UDim2.new(1, 0, 1, 0)
            })
        } else v22.props[v3.Children] or {
            UIListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 5)
            }), 
            Icon = l_icon_0 and v3.createElement(v10.Label, {
                Size = UDim2.new(0, v13(v12.Medium), 0, v13(v12.Medium)), 
                BackgroundTransparency = 1, 
                Image = l_icon_0, 
                ImageColor3 = v36.Color, 
                ImageTransparency = v36.Transparency, 
                LayoutOrder = 1
            }) or nil, 
            Text = l_text_0 and v3.createElement(v14, {
                AutomaticSize = Enum.AutomaticSize.X, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                BackgroundTransparency = 1, 
                Text = l_text_0, 
                fontStyle = v37, 
                colorStyle = v35, 
                LayoutOrder = 2
            }) or nil
        };
        return v3.createElement(v6, v5.Dictionary.join(v22.props, {
            icon = v5.None, 
            text = v5.None, 
            buttonStateColorMap = v5.None, 
            contentStateColorMap = v5.None, 
            textStateColorMap = v5.None, 
            iconStateColorMap = v5.None, 
            onActivated = v5.None, 
            isLoading = v5.None, 
            isSelectedStyle = v5.None, 
            [v3.Children] = v5.None, 
            isDisabled = l_isDisabled_0, 
            onStateChanged = v22.onStateChanged, 
            userInteractionEnabled = v22.props.userInteractionEnabled, 
            Image = v5.None, 
            ScaleType = Enum.ScaleType.Slice, 
            ImageColor3 = v34.Color, 
            ImageTransparency = v34.Transparency, 
            BackgroundTransparency = 1, 
            AutoButtonColor = false, 
            [v3.Event.Activated] = v22.props.onActivated
        }), {
            ButtonContent = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, v38)
        });
    end);
end;
return v17;
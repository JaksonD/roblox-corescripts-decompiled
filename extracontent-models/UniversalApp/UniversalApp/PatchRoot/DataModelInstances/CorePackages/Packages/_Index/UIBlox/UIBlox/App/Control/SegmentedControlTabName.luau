local l_Parent_0 = script.Parent.Parent.Parent;
local l_Core_0 = l_Parent_0.Core;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.Roact);
local v4 = require(l_Parent_1.t);
local v5 = require(l_Parent_1.Cryo);
local v6 = require(l_Parent_1.Foundation);
local v7 = require(l_Core_0.Control.Interactable);
local v8 = require(l_Core_0.Control.Enum.ControlState);
local v9 = require(l_Core_0.Button.getContentStyle);
local v10 = require(l_Parent_0.Core.Style.withStyle);
local v11 = require(l_Core_0.ImageSet.ImageSetComponent);
local l_Skeleton_0 = v6.Skeleton;
local v13 = require(l_Parent_0.App.ImageSet.Enum.IconSize);
local v14 = require(l_Parent_0.App.ImageSet.getIconSize);
local v15 = require(l_Core_0.Text.GenericTextLabel.GenericTextLabel);
local v16 = require(l_Parent_0.Core.Style.Validator.validateFontInfo);
local v17 = require(l_Core_0.ImageSet.Validator.validateImage);
local v18 = v3.PureComponent:extend("SegmentedControlTabName");
v18.init = function(v19) --[[ Line: 32 ]] --[[ Name: init ]]
    -- upvalues: v8 (copy)
    v19.state = {
        controlState = v8.Initialize
    };
    v19.onStateChanged = function(v20, v21) --[[ Line: 37 ]]
        -- upvalues: v19 (copy)
        v19:setState({
            controlState = v21
        });
        if v19.props.onStateChanged then
            v19.props.onStateChanged(v20, v21);
        end;
    end;
end;
local v22 = v4.interface({
    [v8.Default] = v4.string
});
v18.validateProps = v4.interface({
    icon = v4.optional(v17), 
    text = v4.optional(v4.string), 
    fontStyle = v4.optional(v16), 
    textStateColorMap = v4.optional(v22), 
    iconStateColorMap = v4.optional(v22), 
    isDisabled = v4.optional(v4.boolean), 
    isLoading = v4.optional(v4.boolean), 
    onActivated = v4.callback, 
    onStateChanged = v4.optional(v4.callback), 
    userInteractionEnabled = v4.optional(v4.boolean), 
    isSelectedStyle = v4.optional(v4.boolean)
});
v18.defaultProps = {
    isDisabled = false, 
    isLoading = false, 
    isSelectedStyle = false, 
    SliceCenter = Rect.new(8, 8, 9, 9), 
    textStateColorMap = {
        [v8.Default] = "TextDefault", 
        [v8.Hover] = "TextEmphasis"
    }, 
    buttonStateColorMap = {
        [v8.Default] = "SecondaryContent"
    }
};
v18.render = function(v23) --[[ Line: 101 ]] --[[ Name: render ]]
    -- upvalues: v10 (copy), v8 (copy), v9 (copy), v3 (copy), l_Skeleton_0 (copy), v11 (copy), v14 (copy), v13 (copy), v15 (copy), v7 (copy), v5 (copy)
    return v10(function(v24) --[[ Line: 102 ]]
        -- upvalues: v23 (copy), v8 (ref), v9 (ref), v3 (ref), l_Skeleton_0 (ref), v11 (ref), v14 (ref), v13 (ref), v15 (ref), v7 (ref), v5 (ref)
        local l_controlState_0 = v23.state.controlState;
        local l_text_0 = v23.props.text;
        local l_icon_0 = v23.props.icon;
        local l_isLoading_0 = v23.props.isLoading;
        local l_isDisabled_0 = v23.props.isDisabled;
        local l_buttonStateColorMap_0 = v23.props.buttonStateColorMap;
        local l_contentStateColorMap_0 = v23.props.contentStateColorMap;
        local v32 = v23.props.textStateColorMap or l_contentStateColorMap_0;
        local v33 = v23.props.iconStateColorMap or l_contentStateColorMap_0;
        if l_isLoading_0 then
            l_isDisabled_0 = true;
        end;
        local l_l_controlState_0_0 = l_controlState_0;
        if v23.props.isDisabled then
            l_l_controlState_0_0 = v8.Disabled;
        elseif v23.props.isSelectedStyle then
            l_l_controlState_0_0 = v8.Hover;
        end;
        local v35 = v9(l_buttonStateColorMap_0, l_controlState_0, v24);
        local v36 = l_text_0 and v9(v32, l_l_controlState_0_0, v24);
        local v37 = l_icon_0 and v9(v33, l_controlState_0, v24);
        local v38 = v23.props.fontStyle or v24.Font.Header2;
        local v39 = nil;
        v39 = if l_isLoading_0 then {
            isLoadingShimmer = v3.createElement(l_Skeleton_0, {
                Size = UDim2.fromScale(1, 1)
            })
        } else v23.props[v3.Children] or {
            UIListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 5)
            }), 
            Icon = l_icon_0 and v3.createElement(v11.Label, {
                Size = UDim2.new(0, v14(v13.Medium), 0, v14(v13.Medium)), 
                BackgroundTransparency = 1, 
                Image = l_icon_0, 
                ImageColor3 = v37.Color, 
                ImageTransparency = v37.Transparency, 
                LayoutOrder = 1
            }) or nil, 
            Text = l_text_0 and v3.createElement(v15, {
                AutomaticSize = Enum.AutomaticSize.X, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                BackgroundTransparency = 1, 
                Text = l_text_0, 
                fontStyle = v38, 
                colorStyle = v36, 
                LayoutOrder = 2
            }) or nil
        };
        return v3.createElement(v7, v5.Dictionary.join(v23.props, {
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
            onStateChanged = v23.onStateChanged, 
            userInteractionEnabled = v23.props.userInteractionEnabled, 
            Image = v5.None, 
            ScaleType = Enum.ScaleType.Slice, 
            ImageColor3 = v35.Color, 
            ImageTransparency = v35.Transparency, 
            BackgroundTransparency = 1, 
            AutoButtonColor = false, 
            [v3.Event.Activated] = v23.props.onActivated
        }), {
            ButtonContent = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, v39)
        });
    end);
end;
return v18;
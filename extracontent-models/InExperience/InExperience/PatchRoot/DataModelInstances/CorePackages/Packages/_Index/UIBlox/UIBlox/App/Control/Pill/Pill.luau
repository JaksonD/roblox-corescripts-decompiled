local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Core_0 = l_Parent_1.Core;
local v4 = require(l_Parent_2.Roact);
local v5 = require(l_Parent_2.t);
local v6 = require(l_Parent_2.Foundation);
local v7 = require(l_Parent_0.ImageSet.Enum.IconSize);
local v8 = require(l_Parent_0.ImageSet.getIconSize);
local v9 = require(l_Core_0.Style.withStyle);
local v10 = require(l_Core_0.ImageSet.Validator.validateImageSetData);
local v11 = require(l_Core_0.Control.Enum.ControlState);
local v12 = require(l_Core_0.Control.Interactable);
local v13 = require(l_Core_0.Button.getContentStyle);
local v14 = require(l_Core_0.Text.GenericTextLabel.GenericTextLabel);
local v15 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local l_Skeleton_0 = v6.Skeleton;
local l_Radius_0 = v6.Enums.Radius;
local v18 = require(l_Parent_1.Core.Text.GetTextSize);
local v19 = v4.PureComponent:extend("Pill");
v19.validateProps = v5.strictInterface({
    text = v5.optional(v5.string), 
    isSelected = v5.optional(v5.boolean), 
    isDisabled = v5.optional(v5.boolean), 
    isLoading = v5.optional(v5.boolean), 
    icon = v5.union(v5.string, v10), 
    onActivated = v5.callback
});
v19.defaultProps = {
    text = "", 
    isSelected = false, 
    isDisabled = false, 
    isLoading = false
};
v19.init = function(v20) --[[ Line: 55 ]] --[[ Name: init ]]
    -- upvalues: v11 (copy)
    v20.state = {
        controlState = v11.Initialize
    };
end;
v19.render = function(v21) --[[ Line: 61 ]] --[[ Name: render ]]
    -- upvalues: v9 (copy), v11 (copy), v13 (copy), v8 (copy), v7 (copy), v18 (copy), v4 (copy), v12 (copy), v15 (copy), v14 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy)
    return v9(function(v22) --[[ Line: 62 ]]
        -- upvalues: v21 (copy), v11 (ref), v13 (ref), v8 (ref), v7 (ref), v18 (ref), v4 (ref), v12 (ref), v15 (ref), v14 (ref), l_Skeleton_0 (ref), l_Radius_0 (ref)
        local v23 = false;
        local l_Font_0 = v22.Font;
        local l_isSelected_0 = v21.props.isSelected;
        local l_isDisabled_0 = v21.props.isDisabled;
        local l_isLoading_0 = v21.props.isLoading;
        local l_icon_0 = v21.props.icon;
        local l_text_0 = v21.props.text;
        local l_onActivated_0 = v21.props.onActivated;
        local v31 = {
            [v11.Default] = l_isSelected_0 and "SystemPrimaryContent" or "IconDefault", 
            [v11.Hover] = l_isSelected_0 and "SystemPrimaryContent" or "IconEmphasis"
        };
        local v32 = {
            [v11.Default] = l_isSelected_0 and "SystemPrimaryContent" or "TextDefault", 
            [v11.Hover] = l_isSelected_0 and "SystemPrimaryContent" or "TextEmphasis"
        };
        local v33 = {
            [v11.Default] = l_isSelected_0 and "SystemPrimaryDefault" or "BackgroundUIDefault", 
            [v11.Hover] = l_isSelected_0 and "SystemPrimaryOnHover" or "BackgroundUIDefault"
        };
        local v34 = v13(v31, v21.state.controlState, v22);
        local v35 = v13(v32, v21.state.controlState, v22);
        local v36 = v13(v33, v21.state.controlState, v22);
        local v37 = v8(v7.Small);
        local l_BaseSize_0 = l_Font_0.BaseSize;
        local v39 = l_Font_0.CaptionHeader.RelativeSize * l_BaseSize_0;
        local l_X_0 = v18(l_text_0, v39, l_Font_0.CaptionHeader.Font, Vector2.new(10000, 10000)).X;
        local v41 = l_X_0 + 24;
        local v42 = 240 - (28 + v37);
        local v43;
        if not l_isLoading_0 then
            v43 = v4.createElement;
            local l_v12_0 = v12;
            local v47 = {
                Size = UDim2.new(0, v41 + 4 + v37, 0, 28), 
                BackgroundColor3 = v36.Color, 
                BackgroundTransparency = v36.Transparency, 
                AutoButtonColor = false, 
                BorderSizePixel = 0, 
                LayoutOrder = 1, 
                isDisabled = l_isDisabled_0, 
                [v4.Event.Activated] = not l_isLoading_0 and l_onActivated_0 or nil, 
                onStateChanged = function(_, v46) --[[ Line: 106 ]] --[[ Name: onStateChanged ]]
                    -- upvalues: v21 (ref)
                    v21:setState({
                        controlState = v46
                    });
                end
            };
            local v48 = {
                UIListLayout = v4.createElement("UIListLayout", {
                    Padding = UDim.new(0, 0), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                })
            };
            local l_createElement_0 = v4.createElement;
            local v50 = "Frame";
            local v51 = {
                Size = UDim2.new(0, l_X_0 + 4 + v37, 1, 0), 
                ClipsDescendants = true, 
                BackgroundTransparency = 1
            };
            local v52 = {
                UIListLayout = v4.createElement("UIListLayout", {
                    Padding = UDim.new(0, 4), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                Icon = v4.createElement(v15.Label, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Size = UDim2.fromOffset(v37, v37), 
                    BackgroundTransparency = 1, 
                    Image = l_icon_0, 
                    ImageColor3 = v34.Color, 
                    ImageTransparency = v34.Transparency
                })
            };
            local v53 = false;
            if string.len(l_text_0) > 0 then
                v53 = v4.createElement("Frame", {
                    Size = UDim2.fromOffset(l_X_0, v39), 
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1
                }, {
                    PillText = v4.createElement(v14, {
                        Text = l_text_0, 
                        BackgroundTransparency = 1, 
                        fontStyle = l_Font_0.CaptionHeader, 
                        colorStyle = v35, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        Size = UDim2.fromOffset(v42, v39), 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        [v4.Ref] = v21.PillText
                    }); 
                    v4.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(v42, 28)
                    })
                });
            end;
            v52.TextArea = v53;
            v52.UISizeConstraint = v4.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(216, 28)
            });
            v48.Content = l_createElement_0(v50, v51, v52);
            v48.UICorner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            });
            v48.UISizeConstraint = v4.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(240, 28)
            });
            v43 = v43(l_v12_0, v47, v48);
            v23 = v43;
        end;
        if not v23 then
            v43 = v4.createElement(l_Skeleton_0, {
                Size = UDim2.fromOffset(v41 + 4 + v37, 28), 
                radius = l_Radius_0.Circle
            });
        end;
        v23 = false;
        return v43;
    end);
end;
return v19;
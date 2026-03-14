local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Core_0 = l_Parent_1.Core;
local v4 = require(l_Parent_2.Roact);
local v5 = require(l_Parent_2.t);
local v6 = require(l_Parent_0.ImageSet.Enum.IconSize);
local v7 = require(l_Parent_0.ImageSet.getIconSize);
local v8 = require(l_Core_0.Style.withStyle);
local v9 = require(l_Core_0.ImageSet.Validator.validateImageSetData);
local v10 = require(l_Core_0.Control.Enum.ControlState);
local v11 = require(l_Core_0.Control.Interactable);
local v12 = require(l_Core_0.Button.getContentStyle);
local v13 = require(l_Core_0.Text.GenericTextLabel.GenericTextLabel);
local v14 = require(l_Parent_1.Core.ImageSet.ImageSetComponent);
local v15 = require(l_Parent_1.App.Loading.ShimmerPanel);
local v16 = require(l_Parent_1.Core.Text.GetTextSize);
local v17 = v4.PureComponent:extend("Pill");
v17.validateProps = v5.strictInterface({
    text = v5.optional(v5.string), 
    isSelected = v5.optional(v5.boolean), 
    isDisabled = v5.optional(v5.boolean), 
    isLoading = v5.optional(v5.boolean), 
    icon = v5.union(v5.string, v9), 
    onActivated = v5.callback
});
v17.defaultProps = {
    text = "", 
    isSelected = false, 
    isDisabled = false, 
    isLoading = false
};
v17.init = function(v18) --[[ Line: 53 ]] --[[ Name: init ]]
    -- upvalues: v10 (copy)
    v18.state = {
        controlState = v10.Initialize
    };
end;
v17.render = function(v19) --[[ Line: 59 ]] --[[ Name: render ]]
    -- upvalues: v8 (copy), v10 (copy), v12 (copy), v7 (copy), v6 (copy), v16 (copy), v4 (copy), v11 (copy), v14 (copy), v13 (copy), v15 (copy)
    return v8(function(v20) --[[ Line: 60 ]]
        -- upvalues: v19 (copy), v10 (ref), v12 (ref), v7 (ref), v6 (ref), v16 (ref), v4 (ref), v11 (ref), v14 (ref), v13 (ref), v15 (ref)
        local v21 = false;
        local l_Font_0 = v20.Font;
        local l_isSelected_0 = v19.props.isSelected;
        local l_isDisabled_0 = v19.props.isDisabled;
        local l_isLoading_0 = v19.props.isLoading;
        local l_icon_0 = v19.props.icon;
        local l_text_0 = v19.props.text;
        local l_onActivated_0 = v19.props.onActivated;
        local v29 = {
            [v10.Default] = l_isSelected_0 and "SystemPrimaryContent" or "IconDefault", 
            [v10.Hover] = l_isSelected_0 and "SystemPrimaryContent" or "IconEmphasis"
        };
        local v30 = {
            [v10.Default] = l_isSelected_0 and "SystemPrimaryContent" or "TextDefault", 
            [v10.Hover] = l_isSelected_0 and "SystemPrimaryContent" or "TextEmphasis"
        };
        local v31 = {
            [v10.Default] = l_isSelected_0 and "SystemPrimaryDefault" or "BackgroundUIDefault", 
            [v10.Hover] = l_isSelected_0 and "SystemPrimaryOnHover" or "BackgroundUIDefault"
        };
        local v32 = v12(v29, v19.state.controlState, v20);
        local v33 = v12(v30, v19.state.controlState, v20);
        local v34 = v12(v31, v19.state.controlState, v20);
        local v35 = v7(v6.Small);
        local l_BaseSize_0 = l_Font_0.BaseSize;
        local v37 = l_Font_0.CaptionHeader.RelativeSize * l_BaseSize_0;
        local l_X_0 = v16(l_text_0, v37, l_Font_0.CaptionHeader.Font, Vector2.new(10000, 10000)).X;
        local v39 = l_X_0 + 24;
        local v40 = 240 - (28 + v35);
        local v41;
        if not l_isLoading_0 then
            v41 = v4.createElement;
            local l_v11_0 = v11;
            local v45 = {
                Size = UDim2.new(0, v39 + 4 + v35, 0, 28), 
                BackgroundColor3 = v34.Color, 
                BackgroundTransparency = v34.Transparency, 
                AutoButtonColor = false, 
                BorderSizePixel = 0, 
                LayoutOrder = 1, 
                isDisabled = l_isDisabled_0, 
                [v4.Event.Activated] = not l_isLoading_0 and l_onActivated_0 or nil, 
                onStateChanged = function(_, v44) --[[ Line: 104 ]] --[[ Name: onStateChanged ]]
                    -- upvalues: v19 (ref)
                    v19:setState({
                        controlState = v44
                    });
                end
            };
            local v46 = {
                UIListLayout = v4.createElement("UIListLayout", {
                    Padding = UDim.new(0, 0), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                })
            };
            local l_createElement_0 = v4.createElement;
            local v48 = "Frame";
            local v49 = {
                Size = UDim2.new(0, l_X_0 + 4 + v35, 1, 0), 
                ClipsDescendants = true, 
                BackgroundTransparency = 1
            };
            local v50 = {
                UIListLayout = v4.createElement("UIListLayout", {
                    Padding = UDim.new(0, 4), 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }), 
                Icon = v4.createElement(v14.Label, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Size = UDim2.fromOffset(v35, v35), 
                    BackgroundTransparency = 1, 
                    Image = l_icon_0, 
                    ImageColor3 = v32.Color, 
                    ImageTransparency = v32.Transparency
                })
            };
            local v51 = false;
            if string.len(l_text_0) > 0 then
                v51 = v4.createElement("Frame", {
                    Size = UDim2.fromOffset(l_X_0, v37), 
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1
                }, {
                    PillText = v4.createElement(v13, {
                        Text = l_text_0, 
                        BackgroundTransparency = 1, 
                        fontStyle = l_Font_0.CaptionHeader, 
                        colorStyle = v33, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        Size = UDim2.fromOffset(v40, v37), 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center, 
                        [v4.Ref] = v19.PillText
                    }); 
                    v4.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(v40, 28)
                    })
                });
            end;
            v50.TextArea = v51;
            v50.UISizeConstraint = v4.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(216, 28)
            });
            v46.Content = l_createElement_0(v48, v49, v50);
            v46.UICorner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            });
            v46.UISizeConstraint = v4.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(240, 28)
            });
            v41 = v41(l_v11_0, v45, v46);
            v21 = v41;
        end;
        if not v21 then
            v41 = v4.createElement(v15, {
                Size = UDim2.new(0, v39 + 4 + v35, 0, 28), 
                cornerRadius = UDim.new(1, 0)
            });
        end;
        v21 = false;
        return v41;
    end);
end;
return v17;
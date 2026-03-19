local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Core_0 = l_Parent_1.Core;
local l_Parent_2 = l_Parent_1.Parent;
local v4 = require(l_Parent_2.Roact);
local v5 = require(l_Parent_2.t);
local v6 = require(l_Parent_2.Cryo);
local v7 = require(l_Parent_0.ImageSet.Images);
local v8 = require(l_Core_0.ImageSet.ImageSetComponent);
local v9 = require(l_Core_0.Control.Controllable);
local v10 = require(l_Core_0.Text.GenericTextLabel.GenericTextLabel);
local v11 = require(l_Parent_1.Core.Style.withStyle);
local v12 = require(script.Parent.Enum.CloseButtonIcon);
local v13 = v4.PureComponent:extend("ModalTitle");
v13.validateProps = v5.strictInterface({
    title = v5.string, 
    position = v5.optional(v5.UDim2), 
    anchor = v5.optional(v5.Vector2), 
    closeButtonIcon = v5.optional(v12.isEnumValue), 
    onCloseClicked = v5.optional(v5.callback), 
    titleBackgroundImageProps = v5.optional(v5.strictInterface({
        image = v5.string, 
        imageHeight = v5.number, 
        text = v5.optional(v5.string)
    })), 
    onTitleSizeChanged = v5.optional(v5.callback)
});
v13.defaultProps = {
    title = "", 
    position = UDim2.new(0.5, 0, 0, 0), 
    anchor = Vector2.new(0.5, 0), 
    closeButtonIcon = v12.Close
};
v13.GetHeight = function(_) --[[ Line: 53 ]] --[[ Name: GetHeight ]]
    return 48;
end;
local function _(v15) --[[ Line: 57 ]] --[[ Name: getCloseButtonIcon ]]
    -- upvalues: v12 (copy)
    if v15 == v12.Close then
        return "icons/navigation/close";
    elseif v15 == v12.Back then
        return "icons/actions/cycleLeft";
    else
        return nil;
    end;
end;
local function v25(v17, v18, v19) --[[ Line: 67 ]] --[[ Name: renderBackgroundImage ]]
    -- upvalues: v6 (copy), v4 (copy), v10 (copy), v8 (copy)
    local l_text_0 = v17.text;
    local v21 = l_text_0 and #l_text_0 > 0;
    local v22 = l_text_0 and #l_text_0 > 0;
    local v23 = math.clamp(v17.imageHeight, 48, 261);
    if v21 then
        v23 = v23 + 8;
        v19 = v6.Dictionary.join(v19, {
            UICorner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            })
        });
    end;
    if l_text_0 and #l_text_0 > 0 then
        v19 = v6.Dictionary.join(v19, {
            BackgroundText = v4.createElement(v10, {
                Size = UDim2.new(1, 0, 1, -56), 
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.new(0.5, 0, 0, 48), 
                fontStyle = v18.Font.Body, 
                colorStyle = v18.Theme.TextEmphasis, 
                RichText = true, 
                Text = l_text_0, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                ZIndex = 2
            })
        });
    end;
    if v22 then
        v19 = v6.Dictionary.join(v19, {
            BackgroundTextShadow = v4.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, v21 and -8 or 0), 
                Position = UDim2.new(0, 0, 0, 0), 
                BackgroundTransparency = 0, 
                ZIndex = 1
            }, {
                UIGradient = v4.createElement("UIGradient", {
                    Color = ColorSequence.new(Color3.new(0, 0, 0)), 
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1), 
                        NumberSequenceKeypoint.new(0.6, 0.25), 
                        NumberSequenceKeypoint.new(1, 1)
                    }), 
                    Rotation = 90
                })
            })
        });
    end;
    local v24 = v4.createElement(v8.Label, {
        AnchorPoint = Vector2.new(0, 0), 
        Size = UDim2.new(1, 0, 0, v23), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        ScaleType = Enum.ScaleType.Crop, 
        BorderSizePixel = 0, 
        Image = v17.image, 
        ImageColor3 = Color3.fromRGB(255, 255, 255)
    }, v19);
    if v21 then
        v24 = v4.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.new(1, 0, 0, v23 - 8), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BackgroundTransparency = 1, 
            ClipsDescendants = true
        }, {
            TitleBackground = v24
        });
    end;
    return v24;
end;
v13.render = function(v26) --[[ Line: 147 ]] --[[ Name: render ]]
    -- upvalues: v11 (copy), v4 (copy), v9 (copy), v8 (copy), v7 (copy), v12 (copy), v10 (copy), v25 (copy)
    local l_titleBackgroundImageProps_0 = v26.props.titleBackgroundImageProps;
    return v11(function(v28) --[[ Line: 150 ]]
        -- upvalues: v4 (ref), v26 (copy), v9 (ref), v8 (ref), v7 (ref), v12 (ref), v10 (ref), l_titleBackgroundImageProps_0 (copy), v25 (ref)
        local v29 = false;
        local l_Font_0 = v28.Font;
        local l_Theme_0 = v28.Theme;
        local v32 = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize;
        local l_createElement_0 = v4.createElement;
        local v34 = "Frame";
        local v35 = {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, 0, 0, 48), 
            BackgroundTransparency = 1, 
            [v4.Change.AbsoluteSize] = v26.props.onTitleSizeChanged
        };
        local v36 = {};
        local v37;
        if v26.props.onCloseClicked then
            v37 = v4.createElement;
            local l_v9_0 = v9;
            local v39 = {};
            local v40 = {
                component = v8.Button, 
                props = {
                    BackgroundTransparency = 1, 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.new(0, 32, 0.5, 0), 
                    Size = UDim2.new(0, 48, 0, 48), 
                    [v4.Event.Activated] = v26.props.onCloseClicked
                }
            };
            local v41 = {};
            local l_createElement_1 = v4.createElement;
            local l_Label_0 = v8.Label;
            local v44 = {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 36, 0, 36)
            };
            local l_v7_0 = v7;
            local l_closeButtonIcon_0 = v26.props.closeButtonIcon;
            v44.Image = l_v7_0[l_closeButtonIcon_0 == v12.Close and "icons/navigation/close" or l_closeButtonIcon_0 == v12.Back and "icons/actions/cycleLeft" or nil];
            v44.ImageColor3 = l_Theme_0.IconEmphasis.Color;
            v44.ImageTransparency = l_Theme_0.IconEmphasis.Transparency;
            v44.AnchorPoint = Vector2.new(0.5, 0.5);
            v44.Position = UDim2.new(0.5, 0, 0.5, 0);
            v41.InputFillImage = l_createElement_1(l_Label_0, v44);
            v40.children = v41;
            v39.controlComponent = v40;
            v39.onStateChanged = function(...) --[[ Line: 184 ]] --[[ Name: onStateChanged ]]

            end;
            v37 = v37(l_v9_0, v39);
            v29 = v37;
        end;
        if not v29 then
            v37 = nil;
        end;
        v29 = false;
        v36.CloseButton = v37;
        v36.Title = v4.createElement(v10, {
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.new(0.5, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.new(1, -104, 1, 0), 
            colorStyle = l_Theme_0.TextEmphasis, 
            fontStyle = l_Font_0.Header1, 
            LayoutOrder = 1, 
            Text = v26.props.title, 
            TextSize = v32, 
            TextWrapped = true, 
            TextTruncate = Enum.TextTruncate.AtEnd
        }, {
            Padding = v4.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 8), 
                PaddingBottom = UDim.new(0, 8)
            })
        });
        v36.Underline = not l_titleBackgroundImageProps_0 and v4.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_Theme_0.Divider.Color, 
            BackgroundTransparency = l_Theme_0.Divider.Transparency, 
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, 1)
        });
        l_createElement_0 = l_createElement_0(v34, v35, v36);
        if l_titleBackgroundImageProps_0 then
            return (v25(l_titleBackgroundImageProps_0, v28, {
                TitleText = l_createElement_0
            }));
        else
            return l_createElement_0;
        end;
    end);
end;
return v13;
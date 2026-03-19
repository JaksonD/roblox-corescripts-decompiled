local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.t);
local v3 = require(l_Parent_0.UIBlox.App.ImageSet.Images);
local v4 = require(l_Parent_0.UIBlox.Core.ImageSet.ImageSetComponent);
local v5 = require(l_Parent_0.UIBlox.Core.Style.withStyle);
local v6 = require(l_Parent_0.UIBlox.App.Menu.RoundedFrame);
local v7 = v1.PureComponent:extend("ModalBottomSheetButton");
local l_ImageRectSize_0 = v3["component_assets/circle_17"].ImageRectSize;
local l_ImageRectOffset_0 = v3["component_assets/circle_17"].ImageRectOffset;
local v10 = 8 * v3.ImagesResolutionScale;
local v11 = 8 * v3.ImagesResolutionScale;
local v12 = Rect.new(v10, v11, l_ImageRectSize_0.x - v10, l_ImageRectSize_0.y - v11);
local v13 = 8 * v3.ImagesResolutionScale;
v7.validateProps = v2.strictInterface({
    icon = v2.optional(v2.union(v2.table, v2.string)), 
    text = v2.optional(v2.string), 
    onActivated = v2.optional(v2.callback), 
    renderRightElement = v2.optional(v2.callback), 
    showImage = v2.boolean, 
    isFixed = v2.boolean, 
    onActivatedAndDismissed = v2.callback, 
    elementHeight = v2.integer, 
    hasRoundBottom = v2.boolean, 
    hasRoundTop = v2.boolean, 
    LayoutOrder = v2.integer, 
    stayOnActivated = v2.optional(v2.boolean)
});
v7.defaultProps = {
    icon = {}, 
    text = "", 
    onActivated = function() --[[ Line: 45 ]] --[[ Name: onActivated ]]

    end
};
v7.init = function(v14) --[[ Line: 48 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy)
    local v15, v16 = v1.createBinding(false);
    v14.pressed = v15;
    v14.updatePressed = v16;
    v14.ref = v1.createRef();
    v14.onColorChange = function(v17) --[[ Line: 51 ]]
        -- upvalues: v14 (copy)
        if not v14.ref.current then
            return;
        else
            v14.ref.current.ImageColor3 = v17;
            return;
        end;
    end;
    v14.onInputBegan = function(v18) --[[ Line: 58 ]]
        local v19 = true;
        if v18.UserInputType ~= Enum.UserInputType.MouseButton1 then
            v19 = v18.UserInputType == Enum.UserInputType.Touch;
        end;
        return v19;
    end;
    v14.onInputEnd = function(v20) --[[ Line: 62 ]]
        local v21 = true;
        if v20.UserInputType ~= Enum.UserInputType.MouseButton1 then
            v21 = v20.UserInputType == Enum.UserInputType.Touch;
        end;
        return v21;
    end;
end;
v7.render = function(v22) --[[ Line: 68 ]] --[[ Name: render ]]
    -- upvalues: l_ImageRectSize_0 (copy), l_ImageRectOffset_0 (copy), v12 (copy), v5 (copy), v1 (copy), v3 (copy), v4 (copy), v6 (copy), v13 (copy)
    local l_hasRoundTop_0 = v22.props.hasRoundTop;
    local l_hasRoundBottom_0 = v22.props.hasRoundBottom;
    local v25 = nil;
    local v26 = nil;
    local v27 = nil;
    local l_X_0 = l_ImageRectSize_0.X;
    local v29 = l_X_0 / 2;
    if l_hasRoundTop_0 and l_hasRoundBottom_0 then
        v25 = l_ImageRectSize_0;
        v26 = l_ImageRectOffset_0;
        v27 = v12;
    elseif l_hasRoundTop_0 then
        v25 = Vector2.new(l_X_0, v29);
        v26 = l_ImageRectOffset_0;
        v27 = Rect.new(v29 - 1, v29 - 1, v29 + 1, v29);
    elseif l_hasRoundBottom_0 then
        v25 = Vector2.new(l_X_0, v29);
        v26 = l_ImageRectOffset_0 + Vector2.new(0, v29);
        v27 = Rect.new(v29 - 1, 0, v29 + 1, 1);
    else
        v25 = Vector2.new(1, 1);
        v26 = l_ImageRectOffset_0 + Vector2.new(v29, v29);
    end;
    local l_elementHeight_0 = v22.props.elementHeight;
    local v31 = nil;
    v31 = if v22.props.isFixed then UDim2.new(0, 300, 0, l_elementHeight_0) else UDim2.new(1, -32, 0, l_elementHeight_0);
    local v32 = 24;
    if v22.props.showImage or v22.props.renderRightElement then
        v32 = 12;
    end;
    local l_v32_0 = v32;
    local v34 = l_elementHeight_0 * 0.8;
    if v22.props.showImage then
        l_v32_0 = l_v32_0 + v34 + v32;
    end;
    if v22.props.renderRightElement then
        l_v32_0 = l_v32_0 + v34 + v32;
    end;
    return v5(function(v35) --[[ Line: 120 ]]
        -- upvalues: v22 (copy), v1 (ref), v27 (ref), v3 (ref), v25 (ref), v26 (ref), v32 (ref), v4 (ref), v34 (copy), l_v32_0 (ref), l_hasRoundBottom_0 (copy), v31 (ref), v6 (ref), l_hasRoundTop_0 (copy), v13 (ref)
        local l_Theme_0 = v35.Theme;
        local l_Font_0 = v35.Font;
        local v38 = nil;
        local v39 = nil;
        local v40 = nil;
        local v41 = nil;
        v38 = v22.pressed:map(function(v42) --[[ Line: 128 ]]
            -- upvalues: l_Theme_0 (copy)
            if v42 then
                return l_Theme_0.BackgroundOnPress.Color;
            else
                return l_Theme_0.BackgroundUIDefault.Color;
            end;
        end);
        v39 = v22.pressed:map(function(v43) --[[ Line: 131 ]]
            -- upvalues: l_Theme_0 (copy)
            if v43 then
                return l_Theme_0.BackgroundOnPress.Transparency;
            else
                return l_Theme_0.BackgroundUIDefault.Transparency;
            end;
        end);
        v40 = l_Theme_0.TextEmphasis.Color;
        v41 = l_Theme_0.TextEmphasis.Transparency;
        local v48 = v1.createElement("ImageButton", {
            AutoButtonColor = false, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            ScaleType = Enum.ScaleType.Slice, 
            SliceCenter = v27, 
            Image = v3["component_assets/circle_17"].Image, 
            ImageColor3 = v38, 
            ImageRectSize = v25, 
            ImageRectOffset = v26, 
            ImageTransparency = v39, 
            Size = UDim2.fromScale(1, 1), 
            LayoutOrder = v22.props.LayoutOrder, 
            [v1.Ref] = v22.ref, 
            [v1.Event.Activated] = v22.props.onActivatedAndDismissed, 
            [v1.Event.InputBegan] = function(_, v45) --[[ Line: 152 ]]
                -- upvalues: v22 (ref)
                if v22.onInputBegan(v45) then
                    v22.updatePressed(true);
                end;
            end, 
            [v1.Event.InputEnded] = function(_, v47) --[[ Line: 157 ]]
                -- upvalues: v22 (ref)
                if v22.onInputEnd(v47) then
                    v22.updatePressed(false);
                end;
            end
        }, {
            buttonContents = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, {
                horizontalLayout = v1.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, v32)
                }), 
                padding = v1.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v32), 
                    PaddingTop = UDim.new(0.1, 0), 
                    PaddingBottom = UDim.new(0.1, 0)
                }), 
                icon = v22.props.showImage and v1.createElement(v4.Label, {
                    Image = v22.props.icon, 
                    ImageColor3 = v40, 
                    ImageTransparency = v41, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, v34, 0, v34), 
                    LayoutOrder = 1
                }) or nil, 
                textLabel = v1.createElement("TextLabel", {
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, -l_v32_0, 1, 0), 
                    Text = v22.props.text, 
                    TextTransparency = v41, 
                    Font = l_Font_0.Header2.Font, 
                    TextColor3 = v40, 
                    TextSize = l_Font_0.Header2.RelativeSize * l_Font_0.BaseSize, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    LayoutOrder = 2
                }), 
                rightContainer = v22.props.renderRightElement and v1.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, v34, 0, v34), 
                    LayoutOrder = 3
                }, {
                    hint = v22.props.renderRightElement()
                })
            }), 
            bottomBorder = not l_hasRoundBottom_0 and v1.createElement("Frame", {
                LayoutOrder = 0, 
                BackgroundTransparency = 1, 
                BackgroundColor3 = l_Theme_0.Divider.Color, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 1), 
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.new(0, 0, 1, 0)
            })
        });
        return v1.createElement("Frame", {
            LayoutOrder = v22.props.LayoutOrder, 
            Size = v31, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            Background = v1.createElement(v6, {
                zIndex = -1, 
                background = l_Theme_0.BackgroundUIDefault, 
                topCornerRadius = if l_hasRoundTop_0 then UDim.new(0, v13) else nil, 
                bottomCornerRadius = if l_hasRoundBottom_0 then UDim.new(0, v13) else nil
            }), 
            Button = v48
        });
    end);
end;
return v7;
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Core_0 = l_Parent_1.Core;
local v4 = require(l_Parent_2.Roact);
local v5 = require(l_Parent_2.t);
local v6 = require(l_Parent_2.Cryo);
local l_FitFrameOnAxis_0 = require(l_Parent_2.FitFrame).FitFrameOnAxis;
local v8 = require(l_Parent_1.Core.Text.GenericTextLabel.GenericTextLabel);
local v9 = require(l_Parent_1.Core.Style.withStyle);
local v10 = require(l_Parent_0.ImageSet.Images);
local v11 = require(l_Core_0.ImageSet.ImageSetComponent);
local v12 = require(l_Parent_1.App.SelectionCursor.useCursor);
local v13 = UDim.new(0, 8);
local v14 = v4.PureComponent:extend("AlertTitle");
v14.validateProps = v5.strictInterface({
    layoutOrder = v5.optional(v5.number), 
    margin = v5.optional(v5.table), 
    maxWidth = v5.optional(v5.number), 
    minWidth = v5.optional(v5.number), 
    screenSize = v5.Vector2, 
    title = v5.string, 
    titlePadding = v5.optional(v5.number), 
    titleContent = v5.optional(v5.callback), 
    onCloseClicked = v5.optional(v5.callback), 
    closeCursor = v5.optional(v5.table)
});
v14.defaultProps = {
    margin = {
        top = 0, 
        bottom = 24, 
        left = 24, 
        right = 24
    }, 
    maxWidth = 400, 
    minWidth = 272, 
    titlePadding = 12
};
v14.render = function(v15) --[[ Line: 57 ]] --[[ Name: render ]]
    -- upvalues: v9 (copy), v4 (copy), l_FitFrameOnAxis_0 (copy), v11 (copy), v10 (copy), v8 (copy)
    local v16 = math.clamp(v15.props.screenSize.X - v15.props.margin.left - v15.props.margin.right, v15.props.minWidth, v15.props.maxWidth) - v15.props.margin.left - v15.props.margin.right;
    return v9(function(v17) --[[ Line: 65 ]]
        -- upvalues: v4 (ref), l_FitFrameOnAxis_0 (ref), v15 (copy), v11 (ref), v10 (ref), v8 (ref), v16 (copy)
        local l_Theme_0 = v17.Theme;
        local l_Header_0 = v17.Tokens.Semantic.Typography.Header;
        local l_FontSize_0 = l_Header_0.FontSize;
        return v4.createElement(l_FitFrameOnAxis_0, {
            BackgroundTransparency = 1, 
            contentPadding = UDim.new(0, 8), 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            LayoutOrder = v15.props.layoutOrder, 
            margin = {
                top = 12, 
                bottom = 0, 
                left = 0, 
                right = 0
            }, 
            minimumSize = UDim2.new(1, 0, 0, 0)
        }, {
            TitleContent = v15.props.titleContent and v4.createElement(l_FitFrameOnAxis_0, {
                BackgroundTransparency = 1, 
                LayoutOrder = 0, 
                minimumSize = UDim2.new(1, 0, 0, 0)
            }, {
                Content = v15.props.titleContent()
            }), 
            TitleArea = v4.createElement(l_FitFrameOnAxis_0, {
                BackgroundTransparency = 1, 
                contentPadding = UDim.new(0, 12), 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                LayoutOrder = 1, 
                minimumSize = UDim2.new(1, 0, 0, 0)
            }, {
                Title = if v15.props.onCloseClicked then v4.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, l_FontSize_0)
                }, {
                    CloseButton = v4.createElement(v11.Button, {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, 36, 0, 36), 
                        Image = v10["icons/navigation/close"], 
                        ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                        ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        Position = UDim2.new(0, 0, 0.5, 0), 
                        [v4.Event.Activated] = v15.props.onCloseClicked, 
                        SelectionImageObject = v15.props.closeCursor
                    }), 
                    TitleText = v4.createElement(v8, {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        colorStyle = l_Theme_0.TextEmphasis, 
                        fontStyle = l_Header_0, 
                        Size = UDim2.new(1, -(2 * (36 + v15.props.titlePadding)), 0, l_FontSize_0 * 2), 
                        LayoutOrder = 1, 
                        Text = v15.props.title, 
                        TextSize = l_FontSize_0, 
                        TextTruncate = Enum.TextTruncate.AtEnd
                    })
                }) else v4.createElement(v8, {
                    colorStyle = l_Theme_0.TextEmphasis, 
                    fontStyle = l_Header_0, 
                    maxSize = Vector2.new(v16, l_FontSize_0 * 2), 
                    LayoutOrder = 1, 
                    Text = v15.props.title, 
                    TextSize = l_FontSize_0, 
                    TextTruncate = Enum.TextTruncate.AtEnd
                }), 
                Underline = v4.createElement("Frame", {
                    BorderSizePixel = 0, 
                    BackgroundColor3 = l_Theme_0.Divider.Color, 
                    BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, 1)
                })
            })
        });
    end);
end;
return function(v21) --[[ Line: 149 ]] --[[ Name: AlertTitleFunctionalWrapper ]]
    -- upvalues: v12 (copy), v13 (copy), v4 (copy), v14 (copy), v6 (copy)
    local v22 = v12(v13);
    return v4.createElement(v14, v6.Dictionary.join(v21, {
        closeCursor = v22
    }));
end;
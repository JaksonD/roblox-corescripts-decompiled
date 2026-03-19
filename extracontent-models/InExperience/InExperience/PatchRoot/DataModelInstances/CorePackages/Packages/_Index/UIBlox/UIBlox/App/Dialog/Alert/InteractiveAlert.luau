local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_3.Roact);
local v5 = require(l_Parent_3.t);
local v6 = require(l_Parent_0.Alert);
local v7 = require(l_Parent_0.Enum.AlertType);
local l_FitFrameOnAxis_0 = require(l_Parent_3.FitFrame).FitFrameOnAxis;
local v9 = 272;
local v10 = 400;
local v11 = require(l_Parent_2.Core.Text.GenericTextLabel.GenericTextLabel);
local v12 = require(l_Parent_2.Core.ImageSet.ImageSetComponent);
local v13 = require(l_Parent_2.Core.Text.GetTextHeight);
local v14 = require(l_Parent_2.Core.Style.withStyle);
local v15 = require(l_Parent_1.Button.ButtonStack);
local v16 = v4.PureComponent:extend("InteractiveAlert");
v16.validateProps = v5.strictInterface({
    anchorPoint = v5.optional(v5.Vector2), 
    position = v5.optional(v5.UDim2), 
    screenSize = v5.Vector2, 
    onMounted = v5.optional(v5.callback), 
    onAbsoluteSizeChanged = v5.optional(v5.callback), 
    title = v5.string, 
    titleIcon = v5.optional(v5.union(v5.table, v5.string)), 
    titleContent = v5.optional(v5.callback), 
    bodyText = v5.optional(v5.string), 
    richText = v5.optional(v5.boolean), 
    middleContent = v5.optional(v5.callback), 
    buttonStackInfo = v15.validateProps, 
    footerText = v5.optional(v5.string), 
    footerContent = v5.optional(v5.callback), 
    onCloseClicked = v5.optional(v5.callback), 
    bottomMargin = v5.optional(v5.number), 
    defaultChildRef = v5.optional(v5.union(v5.table, v5.callback)), 
    isMiddleContentFocusable = v5.optional(v5.boolean), 
    isFooterContentFocusable = v5.optional(v5.boolean), 
    isRoactGamepadEnabled = v5.optional(v5.boolean)
});
v16.defaultProps = {
    bottomMargin = 24
};
v16.render = function(v17) --[[ Line: 84 ]] --[[ Name: render ]]
    -- upvalues: v14 (copy), v9 (ref), v10 (ref), v4 (copy), l_FitFrameOnAxis_0 (copy), v12 (copy), v13 (copy), v11 (copy), v6 (copy), v7 (copy)
    return v14(function(v18) --[[ Line: 85 ]]
        -- upvalues: v9 (ref), v10 (ref), v17 (copy), v4 (ref), l_FitFrameOnAxis_0 (ref), v12 (ref), v13 (ref), v11 (ref), v6 (ref), v7 (ref)
        v9 = v18.Tokens.Global.Size_200 * 17;
        v10 = v18.Tokens.Global.Size_500 * 10;
        local l_Theme_0 = v18.Theme;
        local l_Font_0 = v18.Font;
        local l_Font_1 = l_Font_0.Body.Font;
        local v22 = l_Font_0.BaseSize * l_Font_0.Body.RelativeSize;
        local l_titleContent_0 = v17.props.titleContent;
        if v17.props.titleIcon then
            l_titleContent_0 = function() --[[ Line: 96 ]]
                -- upvalues: v4 (ref), l_FitFrameOnAxis_0 (ref), v12 (ref), v17 (ref), l_Theme_0 (copy)
                return v4.createElement(l_FitFrameOnAxis_0, {
                    BackgroundTransparency = 1, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    margin = {
                        top = 12, 
                        bottom = 0, 
                        left = 0, 
                        right = 0
                    }, 
                    minimumSize = UDim2.new(1, 0, 0, 0)
                }, {
                    Icon = v4.createElement(v12.Label, {
                        BackgroundTransparency = 1, 
                        Image = v17.props.titleIcon, 
                        ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                        ImageTransparency = l_Theme_0.IconEmphasis.Transparency, 
                        Size = UDim2.new(0, 48, 0, 48)
                    })
                });
            end;
        end;
        local v24 = math.clamp(v17.props.screenSize.X - 48, v9, v10) - 48;
        local l_footerContent_0 = v17.props.footerContent;
        if v17.props.footerText then
            local v26 = v17.props.footerText and v13(v17.props.footerText, l_Font_0.Footer.Font, l_Font_0.BaseSize * l_Font_0.Footer.RelativeSize, v24, 100) or 0;
            local l_v26_0 = v26 --[[ copy: 9 -> 11 ]];
            l_footerContent_0 = function() --[[ Line: 134 ]]
                -- upvalues: v4 (ref), v11 (ref), l_Theme_0 (copy), l_Font_0 (copy), v17 (ref), v22 (copy), l_v26_0 (copy)
                return v4.createElement(v11, {
                    BackgroundTransparency = 1, 
                    colorStyle = l_Theme_0.TextDefault, 
                    fontStyle = l_Font_0.Footer, 
                    LayoutOrder = 4, 
                    Text = v17.props.footerText, 
                    TextSize = v22, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    Size = UDim2.new(1, 0, 0, l_v26_0)
                });
            end;
        end;
        local v28 = v17.props.bodyText and v13(v17.props.bodyText, l_Font_1, v22, v24, 200) or 0;
        local l_middleContent_0 = v17.props.middleContent;
        if v17.props.bodyText then
            l_middleContent_0 = function() --[[ Line: 154 ]]
                -- upvalues: v4 (ref), l_FitFrameOnAxis_0 (ref), v11 (ref), l_Theme_0 (copy), l_Font_0 (copy), v17 (ref), v22 (copy), v28 (copy)
                return v4.createElement(l_FitFrameOnAxis_0, {
                    BackgroundTransparency = 1, 
                    contentPadding = UDim.new(0, 12), 
                    LayoutOrder = 2, 
                    minimumSize = UDim2.new(1, 0, 0, 0)
                }, {
                    BodyText = v4.createElement(v11, {
                        BackgroundTransparency = 1, 
                        colorStyle = l_Theme_0.TextDefault, 
                        fontStyle = l_Font_0.Body, 
                        LayoutOrder = 1, 
                        Text = v17.props.bodyText, 
                        RichText = v17.props.richText, 
                        TextSize = v22, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        Size = UDim2.new(1, 0, 0, v28)
                    }), 
                    CustomContent = v17.props.middleContent and v4.createElement(l_FitFrameOnAxis_0, {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 2, 
                        minimumSize = UDim2.new(1, 0, 0, 0)
                    }, {
                        Content = v17.props.middleContent()
                    })
                });
            end;
        end;
        return v4.createElement(v6, {
            anchorPoint = v17.props.anchorPoint, 
            alertType = v7.Interactive, 
            margin = {
                top = 0, 
                bottom = v17.props.bottomMargin, 
                left = 24, 
                right = 24
            }, 
            maxWidth = v10, 
            minWidth = v9, 
            buttonStackInfo = v17.props.buttonStackInfo, 
            middleContent = l_middleContent_0, 
            isMiddleContentFocusable = v17.props.isMiddleContentFocusable, 
            onMounted = v17.props.onMounted, 
            onAbsoluteSizeChanged = v17.props.onAbsoluteSizeChanged, 
            position = v17.props.position, 
            screenSize = v17.props.screenSize, 
            title = v17.props.title, 
            titleContent = l_titleContent_0, 
            footerContent = l_footerContent_0, 
            isFooterContentFocusable = v17.props.isFooterContentFocusable, 
            onCloseClicked = v17.props.onCloseClicked, 
            defaultChildRef = v17.props.defaultChildRef, 
            isRoactGamepadEnabled = v17.props.isRoactGamepadEnabled
        });
    end);
end;
return v16;
local l_Parent_0 = script:FindFirstAncestor("AppBlox").Parent;
local v1 = require(l_Parent_0.UIBlox);
local l_withStyle_0 = v1.Core.Style.withStyle;
local l_StyledTextLabel_0 = v1.App.Text.StyledTextLabel;
local v4 = require(l_Parent_0.Roact);
local v5 = require(l_Parent_0.t);
local l_GetTextSize_0 = require(l_Parent_0.Style).GetTextSize;
local v7 = v4.PureComponent:extend("DetailsPageTitleContent");
v7.validateProps = v5.strictInterface({
    titleText = v5.optional(v5.string), 
    subTitleText = v5.optional(v5.string), 
    renderInfoContent = v5.optional(v5.callback), 
    layoutOrder = v5.optional(v5.number), 
    verticalAlignment = v5.optional(v5.enum(Enum.VerticalAlignment))
});
v7.init = function(v8) --[[ Line: 27 ]] --[[ Name: init ]]
    -- upvalues: l_GetTextSize_0 (copy)
    v8.state = {
        containerWidth = nil
    };
    v8.onContainerSizeChange = function(v9) --[[ Line: 31 ]]
        -- upvalues: v8 (copy)
        v8:setState(function(_, _) --[[ Line: 32 ]]
            -- upvalues: v9 (copy)
            return {
                containerWidth = v9.AbsoluteSize.X
            };
        end);
    end;
    v8.getTextSize = function(v12, v13, v14) --[[ Line: 38 ]]
        -- upvalues: l_GetTextSize_0 (ref)
        local l_BaseSize_0 = v14.Font.BaseSize;
        local v16 = v13.RelativeSize * l_BaseSize_0;
        local v17 = Vector2.new(10000, 10000);
        return l_GetTextSize_0(v12, v16, v13.Font, v17);
    end;
end;
v7.render = function(v18) --[[ Line: 46 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v4 (copy), l_StyledTextLabel_0 (copy)
    return l_withStyle_0(function(v19) --[[ Line: 47 ]]
        -- upvalues: v18 (copy), v4 (ref), l_StyledTextLabel_0 (ref)
        local l_Theme_0 = v19.Theme;
        local l_Font_0 = v19.Font;
        local v22 = UDim2.new(0, 0, 1, 0);
        if v18.props.titleText then
            local v23 = v18.getTextSize(v18.props.titleText, l_Font_0.Title, v19);
            local v24 = v23.Y * 1;
            v22 = if v18.state.containerWidth ~= nil and v23.X >= v18.state.containerWidth then UDim2.new(0, 0, 0, v24 * 2) else UDim2.new(0, 0, 0, v24);
        end;
        return v4.createElement("Frame", {
            Size = UDim2.fromScale(1, 0), 
            BackgroundTransparency = 1, 
            [v4.Change.AbsoluteSize] = v18.onContainerSizeChange, 
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v18.props.layoutOrder
        }, {
            ListLayout = v4.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = v18.props.verticalAlignment
            }), 
            Title = v18.props.titleText and v4.createElement(l_StyledTextLabel_0, {
                text = v18.props.titleText, 
                size = v22, 
                automaticSize = Enum.AutomaticSize.X, 
                fontStyle = l_Font_0.Title, 
                colorStyle = l_Theme_0.TextEmphasis, 
                textTruncate = Enum.TextTruncate.AtEnd, 
                lineHeight = 1, 
                fluidSizing = false, 
                layoutOrder = 1, 
                richText = false
            }) or nil, 
            SubTitle = v18.props.subTitleText and v4.createElement(l_StyledTextLabel_0, {
                text = v18.props.subTitleText, 
                fontStyle = l_Font_0.Header2, 
                colorStyle = l_Theme_0.TextMuted, 
                automaticSize = Enum.AutomaticSize.XY, 
                layoutOrder = 2, 
                richText = false
            }) or nil, 
            CustomContentComponentFrame = v18.props.renderInfoContent and v4.createElement("Frame", {
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = 3
            }, {
                CustomContent = v18.props.renderInfoContent()
            }) or nil
        });
    end);
end;
return v7;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local v2 = require(script.Parent.ChatBubbleContainer);
local l_Roact_0 = v1.Roact;
local l_withStyle_0 = v1.UIBlox.Style.withStyle;
local l_FitTextLabel_0 = v1.RoactFitComponents.FitTextLabel;
local v6 = l_Roact_0.PureComponent:extend("PlainText");
v6.defaultProps = {
    text = "", 
    maxWidth = 0, 
    innerPadding = 0, 
    isIncoming = false, 
    hasTail = false, 
    LayoutOrder = 0, 
    isPending = false, 
    [l_Roact_0.Change.AbsoluteSize] = function() --[[ Line: 17 ]]

    end
};
v6.render = function(v7) --[[ Line: 20 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_Roact_0 (copy), v2 (copy), l_FitTextLabel_0 (copy)
    return l_withStyle_0(function(v8) --[[ Line: 21 ]]
        -- upvalues: v7 (copy), l_Roact_0 (ref), v2 (ref), l_FitTextLabel_0 (ref)
        local l_maxWidth_0 = v7.props.maxWidth;
        local l_innerPadding_0 = v7.props.innerPadding;
        local v11 = math.max(0, l_maxWidth_0 - l_innerPadding_0);
        local l_Body_0 = v8.Font.Body;
        local v13 = v8.Font.BaseSize * l_Body_0.RelativeSize;
        return l_Roact_0.createElement(v2, {
            isIncoming = v7.props.isIncoming, 
            hasTail = v7.props.hasTail, 
            isPending = v7.props.isPending, 
            padding = l_innerPadding_0, 
            LayoutOrder = v7.props.LayoutOrder, 
            [l_Roact_0.Change.AbsoluteSize] = v7.props[l_Roact_0.Change.AbsoluteSize]
        }, {
            textContent = l_Roact_0.createElement(l_FitTextLabel_0, {
                Text = v7.props.text, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                TextColor3 = v8.Theme.TextEmphasis.Color, 
                width = l_FitTextLabel_0.Width.FitToText, 
                maximumWidth = v11, 
                Font = v7.props.font or l_Body_0.Font, 
                TextSize = v7.props.textSize or v13, 
                TextTransparency = v7.props.isPending and v8.Theme.TextMuted.Transparency or 0, 
                TextYAlignment = Enum.TextYAlignment.Top
            })
        });
    end);
end;
return v6;
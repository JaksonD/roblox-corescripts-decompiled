local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.UIBlox);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(l_CorePackages_0.Packages.Roact);
local l_withStyle_0 = v1.Core.Style.withStyle;
local l_StyledTextLabel_0 = v1.App.Text.StyledTextLabel;
local v6 = game:DefineFastFlag("FeedbackBarHintSizeAdjustment", false);
local v7 = v3.PureComponent:extend("FeedbackBarHint");
v7.validateProps = v2.strictInterface({
    layoutOrder = v2.optional(v2.integer), 
    text = v2.string, 
    maxWidth = v2.optional(v2.number), 
    hintTextSize = v2.optional(v2.number)
});
v7.render = function(v8) --[[ Line: 32 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), v3 (copy), l_StyledTextLabel_0 (copy), v6 (copy)
    return l_withStyle_0(function(v9) --[[ Line: 33 ]]
        -- upvalues: v3 (ref), v8 (copy), l_StyledTextLabel_0 (ref), v6 (ref)
        local l_Theme_0 = v9.Theme;
        local l_Font_0 = v9.Font;
        return v3.createElement("Frame", {
            LayoutOrder = v8.props.layoutOrder, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.X
        }, {
            Layout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 8)
            }), 
            FeedbackBarHintText = v3.createElement(l_StyledTextLabel_0, {
                textSize = v8.props.hintTextSize, 
                maxSize = if v8.props.maxWidth then if v6 then Vector2.new(1000, v8.props.maxWidth) else Vector2.new(v8.props.maxWidth) else nil, 
                layoutOrder = 2, 
                fontStyle = l_Font_0.Header2, 
                colorStyle = l_Theme_0.TextEmphasis, 
                automaticSize = if not v8.props.maxWidth then Enum.AutomaticSize.X else nil, 
                fluidSizing = v8.props.maxWidth and true or false, 
                text = v8.props.text, 
                textTruncate = if v8.props.maxWidth then Enum.TextTruncate.AtEnd else nil, 
                textXAlignment = Enum.TextXAlignment.Left, 
                textYAlignment = Enum.TextYAlignment.Center
            })
        });
    end);
end;
return v7;
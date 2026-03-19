local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local v5 = require(l_Parent_1.Core.Style.withStyle);
local v6 = require(l_Parent_1.Core.Text.GenericTextLabel.GenericTextLabel);
local v7 = require(l_Parent_0.Menu.KeyLabel.KeyLabel);
local l_ControllerBarHintInternalPadding_0 = require(script.Parent.BarConstants).ControllerBarHintInternalPadding;
local v9 = v3.PureComponent:extend("ControllerBarHint");
v9.validateProps = v4.strictInterface({
    layoutOrder = v4.optional(v4.integer), 
    keyCode = v4.enum(Enum.KeyCode), 
    text = v4.string, 
    maxWidth = v4.optional(v4.number), 
    hintTextSize = v4.optional(v4.number)
});
v9.render = function(v10) --[[ Line: 34 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), v3 (copy), l_ControllerBarHintInternalPadding_0 (copy), v7 (copy), v6 (copy)
    return v5(function(v11) --[[ Line: 35 ]]
        -- upvalues: v3 (ref), v10 (copy), l_ControllerBarHintInternalPadding_0 (ref), v7 (ref), v6 (ref)
        local l_Theme_0 = v11.Theme;
        local l_Font_0 = v11.Font;
        return v3.createElement("Frame", {
            LayoutOrder = v10.props.layoutOrder, 
            BackgroundTransparency = 1, 
            AutomaticSize = Enum.AutomaticSize.X
        }, {
            Layout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, l_ControllerBarHintInternalPadding_0)
            }), 
            ControllerBarHintIcon = v3.createElement(v7, {
                keyCode = v10.props.keyCode, 
                LayoutOrder = 1, 
                iconThemeKey = "IconEmphasis"
            }), 
            ControllerBarHintText = v3.createElement(v6, {
                TextSize = v10.props.hintTextSize, 
                maxSize = v10.props.maxWidth and Vector2.new(v10.props.maxWidth) or nil, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                fontStyle = l_Font_0.Header2, 
                colorStyle = l_Theme_0.TextEmphasis, 
                AutomaticSize = not v10.props.maxWidth and Enum.AutomaticSize.X or nil, 
                TextTransparency = l_Theme_0.TextEmphasis.TextTransparency, 
                fluidSizing = v10.props.maxWidth and true or false, 
                Text = v10.props.text, 
                TextTruncate = v10.props.maxWidth and Enum.TextTruncate.AtEnd or nil, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center
            })
        });
    end);
end;
return v9;
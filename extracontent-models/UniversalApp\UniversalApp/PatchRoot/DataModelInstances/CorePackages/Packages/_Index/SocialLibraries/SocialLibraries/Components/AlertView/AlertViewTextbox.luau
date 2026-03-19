local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_Cryo_0 = v1.Cryo;
local v5 = require(script.Parent.Images);
local v6 = Color3.fromRGB(200, 200, 200);
local v7 = Rect.new(7, 8, 7, 8);
local v8 = l_Roact_0.PureComponent:extend("AlertViewTextbox");
v8.defaultProps = {
    LayoutOrder = 0, 
    Text = "", 
    PlaceholderText = nil
};
v8.render = function(v9) --[[ Line: 19 ]] --[[ Name: render ]]
    -- upvalues: l_UIBlox_0 (copy), v7 (copy), l_Roact_0 (copy), v5 (copy), v6 (copy)
    return l_UIBlox_0.Style.withStyle(function(v10) --[[ Line: 20 ]]
        -- upvalues: v9 (copy), v7 (ref), l_Roact_0 (ref), v5 (ref), v6 (ref)
        local v11 = Vector2.new(0, 0);
        local v12 = Vector2.new(0, 0);
        local v13 = nil;
        local l_Font_0 = v10.Font;
        local l_LayoutOrder_0 = v9.props.LayoutOrder;
        local l_PlaceholderText_0 = v9.props.PlaceholderText;
        local l_Theme_0 = v10.Theme;
        v13 = v7;
        return l_Roact_0.createElement("ImageLabel", {
            ImageRectSize = v12, 
            BackgroundTransparency = 1, 
            Image = v5.buttonStroke.Image, 
            ImageColor3 = l_Theme_0.UIDefault.Color, 
            ImageRectOffset = v11, 
            LayoutOrder = l_LayoutOrder_0, 
            ScaleType = Enum.ScaleType.Slice, 
            Size = UDim2.new(1, 0, 0, 30), 
            SliceCenter = v13
        }, {
            Textbox = l_Roact_0.createElement("TextBox", {
                BackgroundTransparency = 1, 
                ClearTextOnFocus = false, 
                Font = l_Font_0.Header2.Font, 
                PlaceholderText = l_PlaceholderText_0, 
                PlaceholderColor3 = v6, 
                Position = UDim2.new(0, 6, 0, 0), 
                Size = UDim2.new(1, -12, 1, 0), 
                Text = v9.props.Text, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                TextSize = l_Font_0.BaseSize * l_Font_0.CaptionBody.RelativeSize, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                [l_Roact_0.Change.Text] = function(v18) --[[ Line: 57 ]]
                    -- upvalues: v9 (ref)
                    if v9.props.onTextChanged then
                        v9.props.onTextChanged(v18.Text);
                    end;
                end, 
                [l_Roact_0.Ref] = v9.props.forwardRef
            })
        });
    end);
end;
return l_Roact_0.forwardRef(function(v19, v20) --[[ Line: 69 ]]
    -- upvalues: l_Roact_0 (copy), v8 (copy), l_Cryo_0 (copy)
    return l_Roact_0.createElement(v8, l_Cryo_0.Dictionary.join(v19, {
        forwardRef = v20
    }));
end);
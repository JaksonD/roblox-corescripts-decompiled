local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local v4 = l_Roact_0.PureComponent:extend("AlertViewLabel");
v4.defaultProps = {
    BackgroundTransparency = 1, 
    Size = UDim2.new(1, 0, 0, 40), 
    Text = "", 
    TextXAlignment = Enum.TextXAlignment.Center
};
v4.render = function(v5) --[[ Line: 14 ]] --[[ Name: render ]]
    -- upvalues: l_UIBlox_0 (copy), l_Roact_0 (copy)
    return l_UIBlox_0.Style.withStyle(function(v6) --[[ Line: 15 ]]
        -- upvalues: v5 (copy), l_Roact_0 (ref)
        local l_BackgroundTransparency_0 = v5.props.BackgroundTransparency;
        local v8 = v5.props.Font or v6.Font.Body.Font;
        local l_Text_0 = v5.props.Text;
        local v10 = v5.props.TextColor3 or v6.Theme.TextDefault.Color;
        local v11 = v5.props.TextSize or v6.Font.Body.RelativeSize * v6.Font.BaseSize;
        local l_TextXAlignment_0 = v5.props.TextXAlignment;
        return l_Roact_0.createElement("TextLabel", {
            BackgroundTransparency = l_BackgroundTransparency_0, 
            Font = v8, 
            LayoutOrder = v5.props.LayoutOrder, 
            Size = v5.props.Size, 
            Text = l_Text_0, 
            TextColor3 = v10, 
            TextSize = v11, 
            TextWrapped = true, 
            TextXAlignment = l_TextXAlignment_0
        });
    end);
end;
return v4;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local v4 = require(script.Parent.CheckIcon);
local v5 = l_Roact_0.Component:extend("AlertViewCheckbox");
v5.defaultProps = {
    Text = "", 
    LayoutOrder = 0, 
    onActivated = function() --[[ Line: 12 ]] --[[ Name: onActivated ]]

    end, 
    checked = false
};
v5.render = function(v6) --[[ Line: 16 ]] --[[ Name: render ]]
    -- upvalues: l_UIBlox_0 (copy), l_Roact_0 (copy), v4 (copy)
    return l_UIBlox_0.Style.withStyle(function(v7) --[[ Line: 17 ]]
        -- upvalues: l_Roact_0 (ref), v6 (copy), v4 (ref)
        return l_Roact_0.createElement("Frame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = v6.props.LayoutOrder, 
            Size = UDim2.new(1, 0, 0, 35)
        }, {
            List = l_Roact_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 10)
            }), 
            Checkbox = l_Roact_0.createElement(v4, {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 1, 
                checked = v6.props.checked, 
                onActivated = v6.props.onActivated
            }), 
            Label = l_Roact_0.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 2, 
                Size = UDim2.new(0.7, 0, 1, 0), 
                Text = v6.props.Text, 
                TextColor3 = v6.props.TextColor3 or v7.Theme.TextDefault.Color, 
                TextSize = v6.props.TextSize or v7.Font.Body.RelativeSize * v7.Font.BaseSize, 
                Font = v6.props.Font or v7.Font.CaptionSubHeader.Font, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        });
    end);
end;
return v5;
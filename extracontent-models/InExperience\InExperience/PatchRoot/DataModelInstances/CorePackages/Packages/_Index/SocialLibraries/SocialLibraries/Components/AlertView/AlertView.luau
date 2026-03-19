local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local v4 = require(script.Parent.Parent.FitFrameVertical);
local v5 = l_Roact_0.Component:extend("AlertView");
v5.defaultProps = {
    Visible = false, 
    width = UDim.new(0.5, 0), 
    contentPaddingLeft = 12, 
    contentPaddingRight = 12, 
    contentPaddingTop = 12, 
    contentPaddingBottom = 12
};
v5.render = function(v6) --[[ Line: 18 ]] --[[ Name: render ]]
    -- upvalues: l_UIBlox_0 (copy), l_Roact_0 (copy), v4 (copy)
    return l_UIBlox_0.Style.withStyle(function(v7) --[[ Line: 19 ]]
        -- upvalues: l_Roact_0 (ref), v4 (ref), v6 (copy)
        return l_Roact_0.createElement(v4, {
            Visible = v6.props.Visible, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundColor3 = v7.Theme.BackgroundUIDefault.Color, 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            width = v6.props.width
        }, {
            InnerFrame = l_Roact_0.createElement(v4, {
                margin = {
                    top = v6.props.contentPaddingTop, 
                    bottom = v6.props.contentPaddingBottom, 
                    left = v6.props.contentPaddingLeft, 
                    right = v6.props.contentPaddingRight
                }, 
                width = UDim.new(1, 0), 
                BackgroundTransparency = 1, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }, v6.props[l_Roact_0.Children])
        });
    end);
end;
return v5;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local l_Roact_0 = require(l_script_FirstAncestor_0.dependencies).Roact;
local v2 = game:DefineFastFlag("SocialLibrariesSelectableAlertViewShim", false);
local v3 = l_Roact_0.PureComponent:extend("AlertViewSoakArea");
v3.defaultProps = {
    Visible = true, 
    BackgroundTransparency = 0.75, 
    BackgroundColor3 = Color3.fromRGB(255, 0, 255)
};
v3.render = function(v4) --[[ Line: 14 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy), v2 (copy)
    return l_Roact_0.createElement("ImageButton", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = v4.props.BackgroundTransparency, 
        BackgroundColor3 = v4.props.BackgroundColor3, 
        Active = true, 
        AutoButtonColor = false, 
        Selectable = not v2 and nil, 
        Visible = v4.props.Visible
    }, v4.props[l_Roact_0.Children]);
end;
return v3;
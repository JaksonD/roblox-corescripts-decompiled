local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local v6 = l_Roact_0.PureComponent:extend("AlertViewButton");
v6.defaultProps = {
    LayoutOrder = 0, 
    secondary = false, 
    onActivated = function() --[[ Line: 13 ]] --[[ Name: onActivated ]]

    end, 
    Size = UDim2.new(1, 0, 1, 0), 
    Text = ""
};
v6.render = function(v7) --[[ Line: 18 ]] --[[ Name: render ]]
    -- upvalues: l_ButtonType_0 (copy), l_Roact_0 (copy), l_Button_0 (copy)
    local l_PrimarySystem_0 = l_ButtonType_0.PrimarySystem;
    if v7.props.secondary then
        l_PrimarySystem_0 = l_ButtonType_0.Secondary;
    end;
    return l_Roact_0.createElement(l_Button_0, {
        buttonType = l_PrimarySystem_0, 
        size = v7.props.Size, 
        layoutOrder = v7.props.LayoutOrder, 
        text = v7.props.Text, 
        onActivated = v7.props.onActivated
    });
end;
return v6;
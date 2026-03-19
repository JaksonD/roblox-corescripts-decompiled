local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local l_Roact_0 = require(l_script_FirstAncestor_0.dependencies).Roact;
local v2 = l_Roact_0.PureComponent:extend("MaskedIcon");
v2.defaultProps = {
    icon = "rbxasset://textures/ui/LuaChat/icons/share-game-thumbnail.png"
};
v2.render = function(v3) --[[ Line: 13 ]] --[[ Name: render ]]
    -- upvalues: l_Roact_0 (copy)
    local l_props_0 = v3.props;
    return l_Roact_0.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        layout = l_Roact_0.createElement("UIListLayout", {
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        }), 
        button = l_Roact_0.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Image = l_props_0.icon, 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            layout = l_Roact_0.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            mask = l_Roact_0.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                Image = "rbxasset://textures/ui/LuaChat/graphic/gr-mask-game-icon-48x48.png", 
                Size = UDim2.new(1, 0, 1, 0)
            })
        })
    });
end;
return v2;
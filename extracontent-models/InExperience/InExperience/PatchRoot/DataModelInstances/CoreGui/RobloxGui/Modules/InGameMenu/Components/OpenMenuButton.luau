local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local l_UIBlox_0 = v1.UIBlox;
local l_Parent_0 = script.Parent.Parent;
local v6 = require(l_Parent_0.Resources.Assets);
local l_ImageSetButton_0 = l_UIBlox_0.Core.ImageSet.ImageSetButton;
local v8 = require(l_Parent_0.GlobalConfig);
local v9 = l_t_0.strictInterface({
    onClick = l_t_0.callback
});
return function(v10) --[[ Line: 24 ]] --[[ Name: OpenMenuButton ]]
    -- upvalues: v8 (copy), v9 (copy), l_Roact_0 (copy), l_ImageSetButton_0 (copy), v6 (copy)
    if v8.propValidation then
        assert(v9(v10));
    end;
    return l_Roact_0.createElement(l_ImageSetButton_0, {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1, 
        Image = v6.Images.RobloxLogo, 
        Position = UDim2.new(0, 50, 0.5, 0), 
        Size = UDim2.new(0, 32, 0, 32), 
        [l_Roact_0.Event.Activated] = v10.onClick
    });
end;
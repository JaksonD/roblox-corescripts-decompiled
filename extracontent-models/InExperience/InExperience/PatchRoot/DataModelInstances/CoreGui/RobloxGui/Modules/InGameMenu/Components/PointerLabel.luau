local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local l_UIBlox_0 = v1.UIBlox;
local l_Parent_0 = script.Parent.Parent;
local v6 = require(l_Parent_0.Resources.Assets);
local v7 = require(l_Parent_0.GlobalConfig);
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local v9 = {
    [Enum.UserInputType.MouseButton1] = v6.Images.Mouse1Press, 
    [Enum.UserInputType.MouseButton2] = v6.Images.Mouse2Press, 
    [Enum.UserInputType.MouseWheel] = v6.Images.MouseWheelScroll
};
local v10 = l_t_0.strictInterface({
    input = l_t_0.enum(Enum.UserInputType), 
    AnchorPoint = l_t_0.optional(l_t_0.Vector2), 
    Position = l_t_0.optional(l_t_0.UDim2), 
    LayoutOrder = l_t_0.optional(l_t_0.integer)
});
return function(v11) --[[ Line: 29 ]] --[[ Name: PointerLabel ]]
    -- upvalues: v7 (copy), v10 (copy), l_Roact_0 (copy), l_ImageSetLabel_0 (copy), v9 (copy)
    if v7.propValidation then
        assert(v10(v11));
    end;
    return l_Roact_0.createElement(l_ImageSetLabel_0, {
        BackgroundTransparency = 1, 
        Image = v9[v11.input], 
        Size = UDim2.new(0, 36, 0, 36), 
        Position = v11.Position, 
        AnchorPoint = v11.AnchorPoint, 
        LayoutOrder = v11.LayoutOrder
    });
end;
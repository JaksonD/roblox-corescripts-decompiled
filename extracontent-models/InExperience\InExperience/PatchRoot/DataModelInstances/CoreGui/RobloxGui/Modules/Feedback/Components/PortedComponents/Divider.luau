local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_Cryo_0 = v1.Cryo;
local l_t_0 = v1.t;
local l_withStyle_0 = v3.Core.Style.withStyle;
local l_Parent_0 = script.Parent.Parent.Parent;
local v8 = require(l_Parent_0.GlobalConfig);
local v9 = l_t_0.strictInterface({
    Size = l_t_0.optional(l_t_0.UDim2), 
    Position = l_t_0.optional(l_t_0.UDim2), 
    AnchorPoint = l_t_0.optional(l_t_0.Vector2), 
    LayoutOrder = l_t_0.optional(l_t_0.integer), 
    Visible = l_t_0.optional(l_t_0.boolean)
});
return function(v10) --[[ Line: 23 ]] --[[ Name: Divider ]]
    -- upvalues: v8 (copy), v9 (copy), l_withStyle_0 (copy), l_Roact_0 (copy), l_Cryo_0 (copy)
    if v8.propValidation then
        assert(v9(v10));
    end;
    return l_withStyle_0(function(v11) --[[ Line: 28 ]]
        -- upvalues: l_Roact_0 (ref), l_Cryo_0 (ref), v10 (copy)
        return l_Roact_0.createElement("Frame", l_Cryo_0.Dictionary.join({
            Size = UDim2.new(1, 0, 0, 1)
        }, v10, {
            BorderSizePixel = 0, 
            BackgroundColor3 = v11.Theme.Divider.Color, 
            BackgroundTransparency = v11.Theme.Divider.Transparency
        }));
    end);
end;
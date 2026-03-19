local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local l_Parent_0 = script.Parent.Parent.Parent;
local v5 = require(l_Parent_0.GlobalConfig);
local v6 = require(l_Parent_0.Components.ThemedTextLabel);
local v7 = require(l_Parent_0.Localization.withLocalization);
local v8 = l_t_0.strictInterface({
    AnchorPoint = l_t_0.optional(l_t_0.Vector2), 
    Position = l_t_0.optional(l_t_0.UDim2), 
    Size = l_t_0.optional(l_t_0.UDim2), 
    localizationKey = l_t_0.string, 
    LayoutOrder = l_t_0.optional(l_t_0.number)
});
return function(v9) --[[ Line: 22 ]]
    -- upvalues: v5 (copy), v8 (copy), v7 (copy), l_Roact_0 (copy), v6 (copy)
    if v5.propValidation then
        assert(v8(v9));
    end;
    return v7({
        text = v9.localizationKey
    })(function(v10) --[[ Line: 29 ]]
        -- upvalues: l_Roact_0 (ref), v6 (ref), v9 (copy)
        return l_Roact_0.createElement(v6, {
            fontKey = "Body", 
            themeKey = "TextDefault", 
            LayoutOrder = v9.LayoutOrder, 
            AnchorPoint = v9.AnchorPoint or Vector2.new(0, 0.5), 
            Position = v9.Position or UDim2.new(0, 0, 0.5, 0), 
            Size = v9.Size or UDim2.new(1, -72, 0.5, 0), 
            Text = v10.text, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left
        });
    end);
end;
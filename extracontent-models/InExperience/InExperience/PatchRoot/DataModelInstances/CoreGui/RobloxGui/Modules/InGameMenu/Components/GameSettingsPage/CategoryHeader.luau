local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local l_Parent_0 = script.Parent.Parent.Parent;
local v5 = require(l_Parent_0.GlobalConfig);
local v6 = require(script.Parent.Parent.ThemedTextLabel);
local v7 = require(l_Parent_0.Localization.withLocalization);
local v8 = l_t_0.strictInterface({
    LayoutOrder = l_t_0.integer, 
    localizationKey = l_t_0.string
});
return function(v9) --[[ Line: 20 ]]
    -- upvalues: v5 (copy), v8 (copy), l_Roact_0 (copy), v7 (copy), v6 (copy)
    if v5.propValidation then
        assert(v8(v9));
    end;
    return l_Roact_0.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = v9.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, 36)
    }, {
        Label = v7({
            text = v9.localizationKey
        })(function(v10) --[[ Line: 32 ]]
            -- upvalues: l_Roact_0 (ref), v6 (ref)
            return l_Roact_0.createElement(v6, {
                fontKey = "Footer", 
                themeKey = "TextEmphasis", 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Size = UDim2.new(1, -48, 0, 14), 
                Text = v10.text, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Left
            });
        end)
    });
end;
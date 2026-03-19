local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_Cryo_0 = v1.Cryo;
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_t_0 = v1.t;
local l_withStyle_0 = v4.Core.Style.withStyle;
local l_Parent_0 = script.Parent.Parent.Parent;
local v8 = require(l_Parent_0.GlobalConfig);
local v9 = l_t_0.strictInterface({
    themeKey = l_t_0.optional(l_t_0.string), 
    fontKey = l_t_0.optional(l_t_0.string), 
    AnchorPoint = l_t_0.optional(l_t_0.Vector2), 
    LayoutOrder = l_t_0.optional(l_t_0.integer), 
    Position = l_t_0.optional(l_t_0.UDim2), 
    Size = l_t_0.optional(l_t_0.UDim2), 
    Text = l_t_0.string, 
    TextColor3 = l_t_0.optional(l_t_0.Color3), 
    TextTransparency = l_t_0.optional(l_t_0.numberConstrained(0, 1)), 
    TextWrapped = l_t_0.optional(l_t_0.boolean), 
    TextXAlignment = l_t_0.optional(l_t_0.enum(Enum.TextXAlignment)), 
    TextYAlignment = l_t_0.optional(l_t_0.enum(Enum.TextYAlignment)), 
    TextTruncate = l_t_0.optional(l_t_0.enum(Enum.TextTruncate)), 
    Visible = l_t_0.optional(l_t_0.boolean), 
    ZIndex = l_t_0.optional(l_t_0.integer), 
    AutomaticSize = l_t_0.optional(l_t_0.enum(Enum.AutomaticSize)), 
    [l_Roact_0.Children] = l_t_0.optional(l_t_0.table)
});
return function(v10) --[[ Line: 35 ]] --[[ Name: ThemedTextLabel ]]
    -- upvalues: v8 (copy), v9 (copy), l_withStyle_0 (copy), l_Cryo_0 (copy), l_Roact_0 (copy)
    if v8.propValidation then
        assert(v9(v10));
    end;
    return l_withStyle_0(function(v11) --[[ Line: 39 ]]
        -- upvalues: v10 (copy), l_Cryo_0 (ref), l_Roact_0 (ref)
        local v12 = v11.Theme[v10.themeKey or "TextDefault"];
        local v13 = v11.Font[v10.fontKey or "Body"];
        local v14 = l_Cryo_0.Dictionary.join({
            TextColor3 = v12.Color, 
            TextTransparency = v12.Transparency
        }, v10, {
            fontKey = l_Cryo_0.None, 
            themeKey = l_Cryo_0.None, 
            BackgroundTransparency = 1, 
            Font = v13.Font, 
            TextSize = v13.RelativeSize * v11.Font.BaseSize
        });
        return l_Roact_0.createElement("TextLabel", v14);
    end);
end;
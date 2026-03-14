local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local l_Parent_0 = script.Parent.Parent.Parent;
local v5 = require(l_Parent_0.GlobalConfig);
local v6 = require(l_Parent_0.Localization.withLocalization);
local v7 = require(l_Parent_0.Components.ThemedTextLabel);
local v8 = l_t_0.strictInterface({
    Position = l_t_0.UDim2, 
    Size = l_t_0.UDim2, 
    AnchorPoint = l_t_0.Vector2
});
return function(v9) --[[ Line: 20 ]]
    -- upvalues: v5 (copy), v8 (copy), v6 (copy), l_Roact_0 (copy), v7 (copy)
    if v5.propValidation then
        assert(v8(v9));
    end;
    return v6({
        lockedText = "CoreScripts.InGameMenu.GameSettings.LockedByDeveloper"
    })(function(v10) --[[ Line: 27 ]]
        -- upvalues: l_Roact_0 (ref), v7 (ref)
        return l_Roact_0.createElement(v7, {
            themeKey = "TextDefault", 
            fontKey = "CaptionBody", 
            TextTransparency = 0.5, 
            Text = v10.lockedText, 
            Size = UDim2.new(1, -72, 0.25, 0), 
            Position = UDim2.new(0, 0, 1, 0), 
            AnchorPoint = Vector2.new(0, 1), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Bottom
        });
    end);
end;
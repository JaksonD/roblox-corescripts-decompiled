local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.InGameMenuDependencies);
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local l_Parent_0 = script.Parent.Parent.Parent;
local v5 = require(l_Parent_0.GlobalConfig);
local v6 = require(l_Parent_0.Components.ThemedTextLabel);
local v7 = require(l_Parent_0.Localization.withLocalization);
local v8 = l_t_0.strictInterface({
    title = l_t_0.string, 
    LayoutOrder = l_t_0.integer
});
return function(v9) --[[ Line: 26 ]] --[[ Name: ControlEntry ]]
    -- upvalues: v5 (copy), v8 (copy), v7 (copy), l_Roact_0 (copy), v6 (copy)
    if v5.propValidation then
        assert(v8(v9));
    end;
    return v7({
        title = v9.title
    })(function(v10) --[[ Line: 33 ]]
        -- upvalues: l_Roact_0 (ref), v9 (copy), v6 (ref)
        return l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 45), 
            BackgroundTransparency = 1, 
            LayoutOrder = v9.LayoutOrder
        }, {
            HeaderText = l_Roact_0.createElement(v6, {
                fontKey = "CaptionHeader", 
                themeKey = "TextMuted", 
                Text = v10.title, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Position = UDim2.new(0, 0, 0, 20), 
                Size = UDim2.new(1, 0, 0, 17)
            })
        });
    end);
end;
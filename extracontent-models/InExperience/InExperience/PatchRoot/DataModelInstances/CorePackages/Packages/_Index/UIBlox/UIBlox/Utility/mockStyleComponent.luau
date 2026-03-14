local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.App.Style.AppStyleProvider);
local l_FoundationProvider_0 = require(l_Parent_0.Parent.Foundation).FoundationProvider;
local _ = require(l_Parent_0.App.Style.StyleTypes);
return function(v5, v6) --[[ Line: 11 ]]
    -- upvalues: v1 (copy), l_FoundationProvider_0 (copy), v2 (copy)
    return v1.createElement(l_FoundationProvider_0, {
        theme = "Dark", 
        preferences = if v6 then {
            reducedMotion = v6.reducedMotion, 
            preferredTransparency = v6.preferredTransparency
        } else nil
    }, v1.createElement(v2, {
        style = {
            themeName = "Dark", 
            fontName = "Gotham", 
            settings = v6
        }
    }, {
        Content = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0)
        }, v5)
    }));
end;
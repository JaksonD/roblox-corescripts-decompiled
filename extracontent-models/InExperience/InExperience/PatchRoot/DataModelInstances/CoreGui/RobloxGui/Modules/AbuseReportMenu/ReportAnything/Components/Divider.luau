local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.UIBlox);
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local l_withStyle_0 = v1.Core.Style.withStyle;
return function(v5) --[[ Line: 17 ]] --[[ Name: Divider ]]
    -- upvalues: l_withStyle_0 (copy), v2 (copy), v3 (copy)
    return l_withStyle_0(function(v6) --[[ Line: 18 ]]
        -- upvalues: v2 (ref), v3 (ref), v5 (copy)
        return v2.createElement("Frame", v3.Dictionary.join({
            Size = UDim2.new(1, 0, 0, 1)
        }, v5, {
            BorderSizePixel = 0, 
            BackgroundColor3 = v6.Theme.Divider.Color, 
            BackgroundTransparency = v6.Theme.Divider.Transparency
        }));
    end);
end;
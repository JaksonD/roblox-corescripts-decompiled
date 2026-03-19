local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
return function(v2) --[[ Line: 9 ]] --[[ Name: WidgetListSpacer ]]
    -- upvalues: v1 (copy)
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, v2.height)
    });
end;
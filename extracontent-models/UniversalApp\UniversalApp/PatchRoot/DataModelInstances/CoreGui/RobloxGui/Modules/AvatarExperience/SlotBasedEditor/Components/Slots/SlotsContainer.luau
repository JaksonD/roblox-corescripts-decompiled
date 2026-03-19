local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(script.Parent.useSlotProps);
local v3 = require(script.Parent.Slots);
local v4 = require(l_CorePackages_0.Packages.Cryo);
return function(v5) --[[ Line: 13 ]] --[[ Name: SlotsContainer ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy), v4 (copy)
    local v6 = v2(v5);
    return v1.createElement(v3, v4.Dictionary.join(v6, v5));
end;
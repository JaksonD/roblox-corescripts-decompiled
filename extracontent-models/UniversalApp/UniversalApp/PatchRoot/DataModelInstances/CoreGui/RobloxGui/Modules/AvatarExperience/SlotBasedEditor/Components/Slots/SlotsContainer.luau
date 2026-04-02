local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(script.Parent.useSlotProps);
local v3 = require(script.Parent.Slots);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local l_FFlagAXSlotsDisableScrollAwayOnLandscape_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXSlotsDisableScrollAwayOnLandscape;
return function(v6) --[[ Line: 13 ]] --[[ Name: SlotsContainer ]]
    -- upvalues: v2 (copy), v1 (copy), v3 (copy), l_FFlagAXSlotsDisableScrollAwayOnLandscape_0 (copy), v4 (copy)
    local v7 = v2(v6);
    return v1.createElement(v3, if l_FFlagAXSlotsDisableScrollAwayOnLandscape_0 then v7 else v4.Dictionary.join(v7, v6));
end;
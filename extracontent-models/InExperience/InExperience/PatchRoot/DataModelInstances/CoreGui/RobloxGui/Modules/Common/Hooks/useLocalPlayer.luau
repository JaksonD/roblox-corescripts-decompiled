local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_useProperty_0 = require(l_CorePackages_0.Workspace.Packages.GuiObjectUtils).useProperty;
return function() --[[ Line: 5 ]] --[[ Name: useLocalPlayer ]]
    -- upvalues: l_useProperty_0 (copy), l_Players_0 (copy)
    return l_useProperty_0(l_Players_0, "LocalPlayer");
end;
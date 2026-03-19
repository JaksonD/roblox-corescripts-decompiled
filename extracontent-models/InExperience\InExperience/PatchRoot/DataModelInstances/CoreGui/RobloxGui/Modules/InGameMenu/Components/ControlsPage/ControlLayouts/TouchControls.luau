local l_CorePackages_0 = game:GetService("CorePackages");
local l_Roact_0 = require(l_CorePackages_0.Packages.InGameMenuDependencies).Roact;
local v2 = require(script.Parent.KeyboardControls);
return function(v3) --[[ Line: 8 ]] --[[ Name: TouchControls ]]
    -- upvalues: l_Roact_0 (copy), v2 (copy)
    return l_Roact_0.createElement(v2, v3);
end;
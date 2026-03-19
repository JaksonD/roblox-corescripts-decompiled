local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Dash);
local v2 = require(l_CorePackages_0.Packages.React);
local l_useInputType_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useInputType;
return function(v4) --[[ Line: 13 ]] --[[ Name: withLastInputGroup ]]
    -- upvalues: l_useInputType_0 (copy), v2 (copy), v1 (copy)
    return function(v5) --[[ Line: 14 ]]
        -- upvalues: l_useInputType_0 (ref), v2 (ref), v4 (copy), v1 (ref)
        local v6 = l_useInputType_0();
        return v2.createElement(v4, v1.join(v5, {
            lastInputGroup = v6
        }));
    end;
end;
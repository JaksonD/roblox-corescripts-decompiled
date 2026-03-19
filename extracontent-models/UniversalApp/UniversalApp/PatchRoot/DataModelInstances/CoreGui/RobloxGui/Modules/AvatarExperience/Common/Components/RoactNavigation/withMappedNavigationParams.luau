local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v5 = require(l_Modules_0.AvatarExperience.Common.isComponent);
return function(v6, v7) --[[ Line: 13 ]] --[[ Name: withMappedNavigationParams ]]
    -- upvalues: v4 (copy), v5 (copy), v2 (copy), v3 (copy)
    v4.assert(v5(v6), "withMappedNavigationParams must be called with a Roact component (stateful or functional)");
    local v8 = v7 or {};
    if v8.forwardRef == nil then
        v8.forwardRef = true;
    end;
    return function(v9) --[[ Line: 24 ]]
        -- upvalues: v2 (ref), v6 (copy), v3 (ref), v8 (copy)
        local v10 = v9.navigation.state.params or {};
        return v2.createElement(v6, v3.Dictionary.join(v9, v10, {
            [v2.Ref] = v8.forwardRef and v9[v2.Ref] or v3.None
        }));
    end;
end;
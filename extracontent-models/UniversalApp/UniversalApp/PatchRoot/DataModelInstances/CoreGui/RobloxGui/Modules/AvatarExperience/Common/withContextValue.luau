local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v5 = require(l_Modules_0.AvatarExperience.Common.isComponent);
local _ = require(l_CorePackages_0.Packages.Dash);
local v7 = {
    forwardRef = true, 
    required = true
};
return function(v8, v9, v10, v11) --[[ Line: 33 ]] --[[ Name: withContextValue ]]
    -- upvalues: v4 (copy), v5 (copy), v3 (copy), v7 (copy), v2 (copy)
    v4.assert(v5(v8), "withContextValue must be called with a Roact component (stateful or functional)");
    v4.assert(v5(v9), "withContextValue must be called with a Roact component for contextConsumer");
    v4.isType(v10, "string", "withContextValue propName");
    local v12 = v3.Dictionary.join(v7, v11 or {});
    return function(v13) --[[ Line: 46 ]]
        -- upvalues: v10 (copy), v2 (ref), v9 (copy), v12 (copy), v4 (ref), v8 (copy), v3 (ref)
        local v14 = v13[v10];
        return v2.createElement(v9, {
            render = function(v15) --[[ Line: 49 ]] --[[ Name: render ]]
                -- upvalues: v14 (copy), v12 (ref), v4 (ref), v8 (ref), v10 (ref), v2 (ref), v3 (ref), v13 (copy)
                local v16 = v14 or v15;
                if v12.required then
                    v4.assert(v16, string.format("withContextValue can only be used within the context provider hierarchy. The wrapped component %q is unable to get access to %q from props or context.", tostring(v8), v10));
                end;
                return v2.createElement(v8, v3.Dictionary.join(v13, {
                    [v10] = v16, 
                    [v2.Ref] = v12.forwardRef and v13[v2.Ref] or nil
                }));
            end
        });
    end;
end;
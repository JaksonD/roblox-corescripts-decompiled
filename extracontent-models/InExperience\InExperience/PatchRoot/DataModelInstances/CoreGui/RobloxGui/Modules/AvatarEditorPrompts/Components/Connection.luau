local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
local v2 = require(script.ContextActionsBinder);
local v3 = v1.PureComponent:extend("Connection");
v3.render = function(_) --[[ Line: 9 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy)
    return v1.createFragment({
        ContextActionsBinder = v1.createElement(v2)
    });
end;
return v3;
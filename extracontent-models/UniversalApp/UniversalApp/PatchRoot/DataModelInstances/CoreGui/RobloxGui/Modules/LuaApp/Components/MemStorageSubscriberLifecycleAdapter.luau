local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
return function(v2) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    local l_receiverComponents_0 = v2.receiverComponents;
    local v4 = {};
    for v5, v6 in ipairs(l_receiverComponents_0) do
        v4[v5] = v1.createElement(v6, {});
    end;
    return v1.createElement("Folder", {}, v4);
end;
local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Roact);
return function(v2) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    local l_receiverComponents_0 = v2.receiverComponents;
    local l_RobloxEventReceiver_0 = v2.RobloxEventReceiver;
    local v5 = {};
    for v6, v7 in l_receiverComponents_0 do
        v5[v6] = v1.createElement(v7, {
            RobloxEventReceiver = l_RobloxEventReceiver_0
        });
    end;
    return v1.createElement("Folder", {}, v5);
end;
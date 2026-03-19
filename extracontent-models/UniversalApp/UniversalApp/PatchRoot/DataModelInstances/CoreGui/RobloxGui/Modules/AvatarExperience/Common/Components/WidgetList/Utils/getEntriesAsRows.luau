local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Types);
return function(v2, v3, v4) --[[ Line: 5 ]] --[[ Name: getEntriesAsRows ]]
    local v5 = {};
    for v6 = 1, v3 do
        v5[v6] = {};
    end;
    for v7, v8 in v2 do
        local v9 = v5[math.ceil(v7 / v4)];
        if v9 then
            table.insert(v9, v8);
        end;
    end;
    return v5;
end;
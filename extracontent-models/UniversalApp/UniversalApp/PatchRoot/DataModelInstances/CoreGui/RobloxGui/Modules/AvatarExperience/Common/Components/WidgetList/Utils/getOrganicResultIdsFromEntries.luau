local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Types);
return function(v2) --[[ Line: 5 ]] --[[ Name: getOrganicResultIdsFromEntries ]]
    local v3 = {};
    for _, v5 in v2 do
        if v5.id and v5.type then
            table.insert(v3, v5.type .. v5.id);
        end;
    end;
    return v3;
end;
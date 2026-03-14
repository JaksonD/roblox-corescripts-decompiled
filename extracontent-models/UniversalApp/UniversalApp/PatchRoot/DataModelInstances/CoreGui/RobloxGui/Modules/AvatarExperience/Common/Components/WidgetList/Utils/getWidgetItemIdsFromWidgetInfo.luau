local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
return function(v2, v3) --[[ Line: 9 ]] --[[ Name: getWidgetItemIdsFromWidgetInfo ]]
    local v4 = {};
    if v2 and v2.content then
        for _, v6 in v2.content do
            if v6.id then
                table.insert(v4, v6.id);
            end;
        end;
    end;
    if v3 < #v4 then
        v4 = table.move(v4, 1, v3, 1, {});
    end;
    return v4;
end;
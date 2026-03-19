local l_CorePackages_0 = game:GetService("CorePackages");
local l_Cryo_0 = require(l_CorePackages_0.Packages.InGameMenuDependencies).Cryo;
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Components.Pages);
local v4 = require(l_Parent_0.Actions.NavigateBack);
local v5 = require(l_Parent_0.Actions.SetCurrentPage);
return function(v6, v7) --[[ Line: 12 ]]
    -- upvalues: v3 (copy), v4 (copy), l_Cryo_0 (copy), v5 (copy)
    local v8 = v3.pagesByKey[v6.menuPage];
    if v7.type == v4.name then
        if v6.respawn.dialogOpen then
            return l_Cryo_0.Dictionary.join(v6, {
                respawn = l_Cryo_0.Dictionary.join(v6.respawn, {
                    dialogOpen = false
                })
            });
        elseif v6.report.dialogOpen then
            return l_Cryo_0.Dictionary.join(v6, {
                report = l_Cryo_0.Dictionary.join(v6.report, {
                    dialogOpen = false
                })
            });
        elseif v6.menuPage then
            local l_parentPage_0 = v8.parentPage;
            if l_parentPage_0 ~= nil then
                return l_Cryo_0.Dictionary.join(v6, {
                    menuPage = l_parentPage_0
                });
            end;
        end;
    elseif v7.type == v5.name then
        return l_Cryo_0.Dictionary.join(v6, {
            currentlyOpenBubble = l_Cryo_0.None
        });
    end;
    return v6;
end;
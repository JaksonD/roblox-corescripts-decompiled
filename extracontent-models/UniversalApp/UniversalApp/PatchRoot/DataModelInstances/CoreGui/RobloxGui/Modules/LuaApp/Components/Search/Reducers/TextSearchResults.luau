local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local l_Modules_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules;
local l_AddTextSearchResults_0 = l_Modules_0.LuaApp.Actions.AddTextSearchResults;
local l_RemoveTextSearchResults_0 = l_Modules_0.LuaApp.Actions.RemoveTextSearchResults;
return function(v5, v6) --[[ Line: 9 ]]
    -- upvalues: l_AddTextSearchResults_0 (copy), v1 (copy), l_RemoveTextSearchResults_0 (copy)
    v5 = v5 or {};
    if v6.type == l_AddTextSearchResults_0.name then
        local l_searchUuid_0 = v6.searchUuid;
        local l_topicId_0 = v6.topicId;
        local v9 = v5[l_searchUuid_0] or {};
        local v10 = v1.Dictionary.join(v9, {
            [l_topicId_0] = v6.entry
        });
        return (v1.Dictionary.join(v5, {
            [l_searchUuid_0] = v10
        }));
    else
        if v6.type == l_RemoveTextSearchResults_0.name then
            local l_searchUuid_1 = v6.searchUuid;
            v5 = v1.Dictionary.join(v5, {
                [l_searchUuid_1] = v1.None
            });
        end;
        return v5;
    end;
end;
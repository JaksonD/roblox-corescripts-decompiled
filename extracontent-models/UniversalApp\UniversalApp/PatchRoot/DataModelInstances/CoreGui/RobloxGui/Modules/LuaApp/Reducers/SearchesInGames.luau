local l_CorePackages_0 = game:GetService("CorePackages");
local l_Immutable_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Immutable;
local l_Modules_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules;
local l_SetSearchInGames_0 = l_Modules_0.LuaApp.Actions.SetSearchInGames;
local l_AppendSearchInGames_0 = l_Modules_0.LuaApp.Actions.AppendSearchInGames;
local l_Modules_1 = game:GetService("CoreGui").RobloxGui.Modules;
local v6 = require(l_Modules_1.LuaApp.Actions.RemoveSearchInGames);
local v7 = require(l_Modules_1.LuaApp.Actions.ResetSearchesInGames);
return function(v8, v9) --[[ Line: 13 ]]
    -- upvalues: l_SetSearchInGames_0 (copy), l_Immutable_0 (copy), l_AppendSearchInGames_0 (copy), v6 (copy), v7 (copy)
    v8 = v8 or {};
    if v9.type == l_SetSearchInGames_0.name then
        return (l_Immutable_0.Set(v8, v9.searchUuid, v9.searchInGames));
    elseif v9.type == l_AppendSearchInGames_0.name then
        local l_searchUuid_0 = v9.searchUuid;
        local v11 = v8[l_searchUuid_0];
        local l_searchInGames_0 = v9.searchInGames;
        if v11 then
            l_searchInGames_0.emphasis = v11.emphasis;
            l_searchInGames_0.entries = l_Immutable_0.JoinLists(v11.entries, l_searchInGames_0.entries);
        end;
        return (l_Immutable_0.Set(v8, l_searchUuid_0, l_searchInGames_0));
    elseif v9.type == v6.name then
        return (l_Immutable_0.Set(v8, v9.searchUuid, nil));
    else
        if v9.type == v7.name then
            v8 = {};
        end;
        return v8;
    end;
end;
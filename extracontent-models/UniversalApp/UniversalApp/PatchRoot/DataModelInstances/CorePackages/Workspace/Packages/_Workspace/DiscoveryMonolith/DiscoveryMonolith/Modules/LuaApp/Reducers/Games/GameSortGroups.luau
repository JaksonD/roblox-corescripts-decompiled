local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v4 = require(l_Modules_0.LuaApp.Actions.Games.AppendGameSortsInGroup);
local v5 = require(l_Modules_0.LuaApp.Actions.Games.SetGameSortsInGroup);
local v6 = require(l_Modules_0.LuaApp.Models.GameSortGroup);
local l_FFlagSearchOmniAutocompletePage_0 = require(l_Parent_0.SharedFlags).FFlagSearchOmniAutocompletePage;
local v8 = {
    Games = v6.new(), 
    GamesSeeAll = v6.new(), 
    HomeGames = v6.new(), 
    GamesList = v6.new(), 
    SearchLandingPage = if l_FFlagSearchOmniAutocompletePage_0 then v6.new() else nil
};
return function(v9, v10) --[[ Line: 22 ]]
    -- upvalues: v8 (copy), v5 (copy), v2 (copy), v4 (copy)
    v9 = v9 or v8;
    assert(v9, "");
    if v10.type == v5.name then
        if v9[v10.groupId] then
            local v11 = v2.Dictionary.join(v9[v10.groupId], {
                sorts = v10.sorts, 
                pageId = v10.pageId
            });
            return (v2.Dictionary.join(v9, {
                [v10.groupId] = v11
            }));
        end;
    elseif v10.type == v4.name and v9[v10.groupId] then
        local v12 = v9[v10.groupId];
        local l_sorts_0 = v10.sorts;
        if v12.sorts then
            l_sorts_0 = v2.List.join(v12.sorts, l_sorts_0);
        end;
        local v14 = v2.Dictionary.join(v12, {
            sorts = l_sorts_0, 
            pageId = ""
        });
        v9 = v2.Dictionary.join(v9, {
            [v10.groupId] = v14
        });
    end;
    return v9;
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v4 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGamesData);
local v5 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchSortTokens);
return function(v6, v7, v8, v9) --[[ Line: 20 ]]
    -- upvalues: v5 (copy), v2 (copy), v4 (copy)
    assert(type(v7) == "table", "sortCategories should be a table");
    assert(#v7 >= 1, "Need more than 1 sortCategories");
    return function(v10) --[[ Line: 24 ]]
        -- upvalues: v7 (copy), v5 (ref), v6 (copy), v2 (ref), v4 (ref), v8 (copy), v9 (copy)
        local v11 = {};
        for _, v13 in ipairs(v7) do
            table.insert(v11, v10:dispatch(v5(v6, v13, nil)));
        end;
        return v2.all(v11):andThen(function() --[[ Line: 31 ]]
            -- upvalues: v7 (ref), v10 (copy), v4 (ref), v6 (ref), v8 (ref), v9 (ref), v2 (ref)
            local v14 = {};
            for _, v16 in ipairs(v7) do
                table.insert(v14, v10:dispatch(v4(v6, v16, v8, v9, nil)));
            end;
            return v2.all(v14);
        end);
    end;
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.tutils);
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v4 = require(l_Modules_0.LuaApp.Models.GamesApi.GameSearchEntry);
local v5 = require(l_Parent_0.ArgCheck);
local v6 = require(l_Modules_0.LuaApp.Enum.PaginationMethod);
local l_FFlagLuaAppSearchGridTiles_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSearchGridTiles;
local v8 = {
    new = function() --[[ Line: 37 ]] --[[ Name: new ]]
        return {};
    end
};
v8.mock = function() --[[ Line: 43 ]] --[[ Name: mock ]]
    -- upvalues: v8 (copy), v4 (copy), v6 (copy)
    local v9 = v8.new();
    v9.keyword = "Meepcity";
    v9.entries = {
        v4.mock()
    };
    v9.emphasis = true;
    v9.hasMoreRows = false;
    v9.nextPageToken = nil;
    v9.paginationMethod = v6.Scroll;
    return v9;
end;
v8.fromOmniSearch = function(v10, v11, v12, v13, v14) --[[ Line: 54 ]] --[[ Name: fromOmniSearch ]]
    -- upvalues: v8 (copy), l_FFlagLuaAppSearchGridTiles_0 (copy), v6 (copy), v5 (copy)
    local v15 = v8.new();
    v15.keyword = v10;
    v15.entries = v11;
    v15.emphasis = v12;
    if l_FFlagLuaAppSearchGridTiles_0 then
        v15.updatedTimestamp = tick();
    end;
    if v13 and v13 ~= "" then
        if v14 then
            v15.paginationMethod = v6[v14];
            v5.assert(v15.paginationMethod, (("Unknown pagination method: %*"):format(v14)));
        else
            v15.paginationMethod = v6.Scroll;
        end;
        v15.nextPageToken = v13;
        v15.hasMoreRows = true;
        return v15;
    else
        v15.nextPageToken = nil;
        v15.hasMoreRows = false;
        return v15;
    end;
end;
v8.IsEqual = function(v16, v17) --[[ Line: 79 ]] --[[ Name: IsEqual ]]
    -- upvalues: v2 (copy)
    if not v2.shallowEqual(v16.entries, v17.entries) then
        return false;
    else
        local v18 = {
            entries = true
        };
        return v2.shallowEqual(v16, v17, v18);
    end;
end;
return v8;
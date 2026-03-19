local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.tutils);
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v4 = require(l_Modules_0.LuaApp.Models.GamesApi.GameSearchEntry);
local v5 = require(l_Parent_0.ArgCheck);
local v6 = require(l_Modules_0.LuaApp.Enum.PaginationMethod);
local v7 = {
    new = function() --[[ Line: 36 ]] --[[ Name: new ]]
        return {};
    end
};
v7.mock = function() --[[ Line: 42 ]] --[[ Name: mock ]]
    -- upvalues: v7 (copy), v4 (copy), v6 (copy)
    local v8 = v7.new();
    v8.keyword = "Meepcity";
    v8.entries = {
        v4.mock()
    };
    v8.emphasis = true;
    v8.hasMoreRows = false;
    v8.nextPageToken = nil;
    v8.paginationMethod = v6.Scroll;
    return v8;
end;
v7.fromOmniSearch = function(v9, v10, v11, v12, v13) --[[ Line: 53 ]] --[[ Name: fromOmniSearch ]]
    -- upvalues: v7 (copy), v6 (copy), v5 (copy)
    local v14 = v7.new();
    v14.keyword = v9;
    v14.entries = v10;
    v14.emphasis = v11;
    v14.updatedTimestamp = tick();
    if v12 and v12 ~= "" then
        if v13 then
            v14.paginationMethod = v6[v13];
            v5.assert(v14.paginationMethod, (("Unknown pagination method: %*"):format(v13)));
        else
            v14.paginationMethod = v6.Scroll;
        end;
        v14.nextPageToken = v12;
        v14.hasMoreRows = true;
        return v14;
    else
        v14.nextPageToken = nil;
        v14.hasMoreRows = false;
        return v14;
    end;
end;
v7.IsEqual = function(v15, v16) --[[ Line: 76 ]] --[[ Name: IsEqual ]]
    -- upvalues: v2 (copy)
    if not v2.shallowEqual(v15.entries, v16.entries) then
        return false;
    else
        local v17 = {
            entries = true
        };
        return v2.shallowEqual(v15, v16, v17);
    end;
end;
return v7;
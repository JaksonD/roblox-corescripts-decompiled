local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(script.Parent.Parent.Actions.AddUsersSearchResults);
local v3 = require(script.Parent.Parent.Actions.RemoveUsersSearchResults);
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_PaginationMethod_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Enum.PaginationMethod;
return function(v6, v7) --[[ Line: 12 ]]
    -- upvalues: v2 (copy), v1 (copy), l_PaginationMethod_0 (copy), v4 (copy), v3 (copy)
    v6 = v6 or {};
    if v7.type == v2.name then
        local v8 = if v7.searchUuid then v7.searchUuid else v7.keyword;
        local v9 = v6[v8] or {};
        local l_nextPageCursor_0 = v9.nextPageCursor;
        local v11 = nil;
        v11 = if l_nextPageCursor_0 and l_nextPageCursor_0 ~= "" and l_nextPageCursor_0 == v7.curPageCursor then v1.List.join(v9.entries or {}, v7.entries) else v7.entries;
        local v12 = nil;
        if v7.paginationMethod then
            v12 = l_PaginationMethod_0[v7.paginationMethod];
            v4.assert(v12, (("Unknown pagination method: %*"):format(v12)));
        end;
        return (v1.Dictionary.join(v6, {
            [v8] = v1.Dictionary.join(v9, {
                nextPageCursor = v7.nextPageCursor or v1.None, 
                keyword = v7.keyword, 
                entries = v11, 
                paginationMethod = v7.paginationMethod
            })
        }));
    else
        if v7.type == v3.name then
            local v13 = if v7.searchUuid then v7.searchUuid else v7.keyword;
            v6 = v1.Dictionary.join(v6, {
                [v13] = v1.None
            });
        end;
        return v6;
    end;
end;
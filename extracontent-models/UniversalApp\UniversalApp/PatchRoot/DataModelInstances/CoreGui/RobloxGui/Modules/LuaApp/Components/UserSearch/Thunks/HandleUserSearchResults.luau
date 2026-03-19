local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Promise);
local l_OmniFeedConstants_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).OmniFeedConstants;
local l_Modules_1 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules;
local l_AddTextSearchResults_0 = l_Modules_1.LuaApp.Actions.AddTextSearchResults;
local l_getFormattedTextSearchEntry_0 = l_Modules_1.LuaApp.Models.DiscoveryApi.getFormattedTextSearchEntry;
local v7 = require(script.Parent.Parent.Actions.AddUsersSearchResults);
local v8 = require(script.Parent.Parent.Models.UserSearchEntry);
return function(_, v10, v11) --[[ Line: 23 ]]
    -- upvalues: v2 (copy), l_OmniFeedConstants_0 (copy), l_getFormattedTextSearchEntry_0 (copy), l_AddTextSearchResults_0 (copy), v8 (copy), v7 (copy)
    return function(v12) --[[ Line: 24 ]]
        -- upvalues: v11 (copy), v2 (ref), l_OmniFeedConstants_0 (ref), l_getFormattedTextSearchEntry_0 (ref), l_AddTextSearchResults_0 (ref), v10 (copy), v8 (ref), v7 (ref)
        if not v11 or not v11.responseBody then
            return v2.reject();
        else
            local l_nextPageToken_0 = v11.responseBody.nextPageToken;
            if not l_nextPageToken_0 or l_nextPageToken_0 == "" then
                l_nextPageToken_0 = "EndOfPlayerSearch";
            end;
            local v14 = v11.responseBody.searchResults and v11.responseBody.searchResults[1];
            if v14 and v14.contentGroupType == l_OmniFeedConstants_0.ContentGroupType.Text then
                local l_topicId_0 = v14.topicId;
                local v16 = l_getFormattedTextSearchEntry_0(v14.contents);
                if v16 then
                    v12:dispatch(l_AddTextSearchResults_0({
                        searchUuid = v10.searchUuid, 
                        topicId = l_topicId_0, 
                        entry = v16
                    }));
                end;
                return v2.resolve(v11);
            else
                local v17 = {};
                local v18 = v11.responseBody.searchResults and v11.responseBody.searchResults[1] and v11.responseBody.searchResults[1].contents;
                if v18 then
                    for v19 = 1, #v18 do
                        local v20 = v18[v19];
                        v8.fromOmniJsonData(v20):match(function(v21) --[[ Line: 67 ]]
                            -- upvalues: v17 (copy)
                            table.insert(v17, v21);
                        end):matchError(function(_) --[[ Line: 70 ]]
                            warn("Failure in parsing UserSearchEntry");
                        end);
                    end;
                end;
                v12:dispatch(v7({
                    keyword = v10.searchKeyword, 
                    entries = v17, 
                    nextPageCursor = l_nextPageToken_0, 
                    curPageCursor = v10.curPageCursor, 
                    paginationMethod = v11.responseBody.paginationMethod
                }));
                return v2.resolve(v11);
            end;
        end;
    end;
end;
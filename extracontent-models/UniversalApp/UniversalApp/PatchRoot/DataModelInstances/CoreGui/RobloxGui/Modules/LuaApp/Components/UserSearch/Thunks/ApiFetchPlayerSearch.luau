local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_SearchGetOmniSearch_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Http.Requests.SearchGetOmniSearch;
local v4 = require(l_CorePackages_0.Packages.enumerate);
local v5 = require(l_Modules_0.LuaApp.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v7 = require(script.Parent.Parent.Thunks.HandleUserSearchResults);
local v8 = v4("UsersError", {
    Unknown = 0, 
    TooManyIds = 1, 
    TooManyUsernames = 2, 
    InvalidUserId = 3, 
    TooManyRequests = 4, 
    KeywordFiltered = 5, 
    KeywordTooShort = 6
});
local function _(v9) --[[ Line: 28 ]] --[[ Name: getFetchName ]]
    return "luaapp.users.playersearch." .. v9;
end;
return {
    Fetch = function(v11, v12) --[[ Line: 40 ]] --[[ Name: Fetch ]]
        -- upvalues: l_PerformFetch_0 (copy), v5 (copy), l_SearchGetOmniSearch_0 (copy), v7 (copy), l_HttpService_0 (copy), v8 (copy)
        local l_keyword_0 = v12.keyword;
        return l_PerformFetch_0.Single("luaapp.users.playersearch." .. l_keyword_0, function(v14) --[[ Line: 43 ]]
            -- upvalues: l_keyword_0 (copy), v5 (ref), l_SearchGetOmniSearch_0 (ref), v11 (copy), v12 (copy), v7 (ref), l_HttpService_0 (ref), v8 (ref)
            local v15 = v14:getState().UsersSearchResults[l_keyword_0];
            local v16 = v15 and v15.nextPageCursor or nil;
            if v16 == "EndOfPlayerSearch" then
                return v5.resolve("Data has been already fetched");
            else
                return l_SearchGetOmniSearch_0(v11, {
                    searchQuery = l_keyword_0, 
                    pageToken = v16, 
                    sessionId = v12.searchUuid, 
                    globalSessionId = v12.omniSearchUuid, 
                    verticalType = "user"
                }):andThen(function(v17) --[[ Line: 59 ]]
                    -- upvalues: l_keyword_0 (ref), v12 (ref), v16 (copy), v14 (copy), v7 (ref), v11 (ref)
                    local v18 = {
                        searchKeyword = l_keyword_0, 
                        searchUuid = v12.searchUuid, 
                        curPageCursor = v16
                    };
                    return v14:dispatch(v7(v11, v18, v17));
                end, function(v19) --[[ Line: 66 ]]
                    -- upvalues: l_HttpService_0 (ref), v8 (ref), v5 (ref)
                    if v19.Body then
                        local v20 = l_HttpService_0:JSONDecode(v19.Body).errors[1];
                        if v8.fromRawValue(v20.code) == v8.KeywordFiltered then
                            return v5.resolve();
                        end;
                    end;
                    return v5.reject(v19);
                end);
            end;
        end);
    end, 
    GetFetchingStatus = function(v21, v22) --[[ Line: 80 ]] --[[ Name: GetFetchingStatus ]]
        -- upvalues: l_PerformFetch_0 (copy)
        return l_PerformFetch_0.GetStatus(v21, "luaapp.users.playersearch." .. v22);
    end
};
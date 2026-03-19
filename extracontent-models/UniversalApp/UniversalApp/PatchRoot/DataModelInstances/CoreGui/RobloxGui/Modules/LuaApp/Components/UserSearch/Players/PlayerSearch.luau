local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local v4 = require(l_Modules_0.LuaApp.Constants);
local v5 = require(l_Modules_0.LuaApp.Thunks.Search.getAutoFetchingStatus);
local v6 = require(l_Modules_0.LuaApp.Thunks.FetchDataWithErrorToasts);
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local v9 = require(l_CorePackages_0.Packages.Dash);
local l_RemoveTextSearchResults_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Actions.RemoveTextSearchResults;
local v11 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes);
local v12 = require(script.Parent.UserSearchResultsPageLayerExposure);
local v13 = require(script.Parent.PlayerSearchPage);
local v14 = require(script.Parent.Parent.Thunks.ApiFetchPlayerSearch);
local v15 = require(script.Parent.Parent.Actions.RemoveUsersSearchResults);
local function _(v16) --[[ Line: 25 ]]
    -- upvalues: v4 (copy)
    return utf8.len(v16) >= v4.PLAYER_SEARCH_MIN_KEYWORD_UTF8_LEN;
end;
return v3.connect(function(v18, v19) --[[ Line: 37 ]]
    -- upvalues: v4 (copy), v11 (copy), l_RetrievalStatus_0 (copy), v14 (copy), v5 (copy), l_FormFactor_0 (copy)
    local v20 = v19.searchParameters.searchKeyword or "";
    local v21 = not (utf8.len(v20) >= v4.PLAYER_SEARCH_MIN_KEYWORD_UTF8_LEN);
    local v22 = nil;
    local v23 = v18.TextSearchResults[v19.searchUuid] and v18.TextSearchResults[v19.searchUuid][v11.SearchTextTopicIds.HotlineSearchText];
    if v23 then
        v22 = v23.text;
    end;
    return {
        screenSize = v18.ScreenSize, 
        usersSearchResult = v18.UsersSearchResults[v20], 
        searchWordLengthNotSupported = v21, 
        playerSearchStatus = v21 and l_RetrievalStatus_0.Done or v14.GetFetchingStatus(v18, v20), 
        autoTabSearchStatus = v21 and l_RetrievalStatus_0.Done or v5(v18, v20), 
        wideMode = v18.FormFactor == l_FormFactor_0.WIDE, 
        hotlineSearchText = v22
    };
end, function(v24) --[[ Line: 59 ]]
    -- upvalues: v6 (copy), v14 (copy), v15 (copy), l_RemoveTextSearchResults_0 (copy)
    return {
        fetchPlayerSearch = function(v25, ...) --[[ Line: 61 ]] --[[ Name: fetchPlayerSearch ]]
            -- upvalues: v24 (copy), v6 (ref), v14 (ref)
            return v24(v6(v14.Fetch(v25, ...)));
        end, 
        removeUserSearchResults = function(v26) --[[ Line: 64 ]] --[[ Name: removeUserSearchResults ]]
            -- upvalues: v24 (copy), v15 (ref)
            return v24(v15(v26));
        end, 
        removeTextSearchResults = function(v27) --[[ Line: 67 ]] --[[ Name: removeTextSearchResults ]]
            -- upvalues: v24 (copy), l_RemoveTextSearchResults_0 (ref)
            return v24(l_RemoveTextSearchResults_0(v27));
        end
    };
end)(function(v28) --[[ Line: 29 ]]
    -- upvalues: v2 (copy), v12 (copy), v13 (copy), v9 (copy)
    return v2.createElement(v12, {
        renderChild = function(v29) --[[ Line: 31 ]] --[[ Name: renderChild ]]
            -- upvalues: v2 (ref), v13 (ref), v9 (ref), v28 (copy)
            return v2.createElement(v13, v9.join(v29 or {}, v28 or {}));
        end
    });
end);
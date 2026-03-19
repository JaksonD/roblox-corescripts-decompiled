local l_Parent_0 = script:FindFirstAncestor("TopicInfosRodux").Parent;
local v1 = require(l_Parent_0.DiscoveryTypes);
local l_FFlagSearchOmniAutocompletePage_0 = require(l_Parent_0.SharedFlags).FFlagSearchOmniAutocompletePage;
local l_FFlagEnableTopSongsSort_0 = require(l_Parent_0.SharedFlags).FFlagEnableTopSongsSort;
local l_FFlagLuaAppSearchGridTiles_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSearchGridTiles;
local l_FFlagLuaAppAddSubIdToHomeEvents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddSubIdToHomeEvents;
local v6 = {
    default = "LuaApp/category/filter_default", 
    Featured = "LuaApp/category/filter_featured", 
    FriendActivity = "LuaApp/category/filter_friendsplaying", 
    MyFavorite = "LuaApp/category/filter_myfavorites", 
    MyRecent = "LuaApp/category/filter_continueplaying", 
    Popular = "LuaApp/category/filter_popular", 
    PopularInCountry = "LuaApp/category/filter_popularnearyou", 
    TopGrossing = "LuaApp/category/filter_topearning", 
    TopRated = "LuaApp/category/filter_toprated", 
    TopRetaining = "LuaApp/category/filter_recommended"
};
local v7 = {};
v7.__index = v7;
v7.new = function() --[[ Line: 39 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v7 (copy)
    local v8 = {
        dataSource = v1.DataSourceType.Unknown
    };
    setmetatable(v8, v7);
    return v8;
end;
v7.mockFromExploreJsonData = function(v9, v10, v11) --[[ Line: 49 ]] --[[ Name: mockFromExploreJsonData ]]
    -- upvalues: v7 (copy)
    return (v7.fromExploreJsonData({
        sortDisplayName = "", 
        sortId = v9, 
        gameSetTargetId = 0, 
        gameSetTypeId = v11 or 0, 
        topicLayoutData = {}, 
        treatmentType = v10
    }));
end;
v7.mockFromOmniApi = function(v12) --[[ Line: 62 ]] --[[ Name: mockFromOmniApi ]]
    -- upvalues: v7 (copy)
    return (v7.fromOmniApi({
        topicId = v12, 
        topic = "", 
        treatmentType = ""
    }));
end;
v7.fromExploreJsonData = function(v13) --[[ Line: 71 ]] --[[ Name: fromExploreJsonData ]]
    -- upvalues: v7 (copy), v1 (copy), l_FFlagEnableTopSongsSort_0 (copy), v6 (copy)
    local v14 = v7.new();
    v14.dataSource = v1.DataSourceType.ExploreApi;
    v14.displayName = v13.sortDisplayName;
    v14.name = v13.sortId;
    v14.subtitle = v13.subtitle;
    v14.token = "";
    v14.gameSetTargetId = v13.gameSetTargetId;
    v14.gameSetTypeId = tostring(v13.gameSetTypeId);
    v14.topicLayoutData = v13.topicLayoutData;
    v14.treatmentType = v13.treatmentType;
    v14.appliedFilters = v13.appliedFilters;
    v14.subtitle = v13.subtitle;
    if l_FFlagEnableTopSongsSort_0 then
        v14.contentType = v13.contentType;
    end;
    if v14.name ~= nil then
        v14.displayIcon = v6[v14.name];
    end;
    if v14.displayIcon == nil then
        v14.displayIcon = v6.default;
    end;
    v14.uniqueKey = v14.name;
    v14.analyticsTypeId = v14.gameSetTypeId;
    return v14;
end;
v7.fromOmniApi = function(v15) --[[ Line: 103 ]] --[[ Name: fromOmniApi ]]
    -- upvalues: v7 (copy), v1 (copy), l_FFlagLuaAppAddSubIdToHomeEvents_0 (copy)
    local v16 = v7.new();
    v16.dataSource = v1.DataSourceType.DiscoveryApi;
    v16.displayName = v15.topic;
    v16.topicId = tostring(v15.topicId);
    v16.subtitle = v15.subtitle;
    v16.sortSubId = if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v15.sortSubId else nil;
    v16.treatmentType = v15.treatmentType;
    v16.uniqueKey = v16.topicId;
    v16.analyticsTypeId = v16.topicId;
    return v16;
end;
if l_FFlagSearchOmniAutocompletePage_0 then
    v7.fromOmniAutocompleteApi = function(v17) --[[ Line: 119 ]] --[[ Name: fromOmniAutocompleteApi ]]
        -- upvalues: v7 (copy), v1 (copy)
        local v18 = v7.new();
        v18.dataSource = v1.DataSourceType.OmniAutocompleteApi;
        v18.displayName = v17.sortDisplayName;
        v18.name = v17.sortId;
        v18.topicLayoutData = v17.topicLayoutData or {};
        v18.uniqueKey = v18.name;
        v18.analyticsTypeId = v18.name;
        v18.gameSetTypeId = v18.name;
        return v18;
    end;
end;
v7.makeTopSearchTopicKey = function(v19, v20) --[[ Line: 134 ]] --[[ Name: makeTopSearchTopicKey ]]
    return (("%*_%*"):format(v19, v20));
end;
v7.fromTopSearchApi = function(v21, v22) --[[ Line: 138 ]] --[[ Name: fromTopSearchApi ]]
    -- upvalues: v7 (copy), v1 (copy)
    local v23 = v7.new();
    v23.dataSource = v1.DataSourceType.SearchApi;
    v23.topicId = tostring(v21.topicId);
    v23.treatmentType = v21.treatmentType;
    v23.topicLayoutData = v21.topicLayoutData or {};
    v23.searchUuid = v22;
    v23.uniqueKey = v7.makeTopSearchTopicKey(v23.searchUuid, v23.topicId);
    v23.analyticsTypeId = v23.uniqueKey;
    return v23;
end;
v7.makeSearchTopicKey = l_FFlagLuaAppSearchGridTiles_0 and function(v24, v25) --[[ Line: 153 ]]
    -- upvalues: v7 (copy)
    return v7.makeTopSearchTopicKey(v24, v25);
end or nil;
v7.fromSearchApi = l_FFlagLuaAppSearchGridTiles_0 and function(v26, v27) --[[ Line: 159 ]]
    -- upvalues: v7 (copy)
    return v7.fromTopSearchApi(v26, v27);
end or nil;
v7.isOmni = function(v28) --[[ Line: 164 ]] --[[ Name: isOmni ]]
    -- upvalues: v1 (copy)
    if v28.dataSource == v1.DataSourceType.DiscoveryApi then
        return true;
    else
        return false;
    end;
end;
v7.isSponsored = function(v29) --[[ Line: 172 ]] --[[ Name: isSponsored ]]
    if v29.topicId == "400000000" then
        return true;
    elseif v29.gameSetTypeId == "27" then
        return true;
    else
        return false;
    end;
end;
return v7;
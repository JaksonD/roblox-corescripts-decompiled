local l_Parent_0 = script:FindFirstAncestor("GameModels").Parent;
local v1 = require(l_Parent_0.Result);
local l_trim_0 = require(l_Parent_0.LuauPolyfill).String.trim;
local _ = require(l_Parent_0.DiscoveryTypes);
local l_FFlagSearchOmniAutocompletePage_0 = require(l_Parent_0.SharedFlags).FFlagSearchOmniAutocompletePage;
local l_FFlagEnableTopSongsSort_0 = require(l_Parent_0.SharedFlags).FFlagEnableTopSongsSort;
local v11 = {
    new = function(v6, v7, v8) --[[ Line: 14 ]] --[[ Name: new ]]
        -- upvalues: l_trim_0 (copy)
        return {
            universeId = v6, 
            placeId = v7, 
            name = l_trim_0(v8)
        };
    end, 
    _fromSharedJson = function(v9, v10) --[[ Line: 24 ]] --[[ Name: _fromSharedJson ]]
        v9.ageRecommendationDisplayName = v10.ageRecommendationDisplayName;
        v9.minimumAge = v10.minimumAge;
        v9.contentMaturity = v10.contentMaturity;
        v9.playerCount = v10.playerCount;
        v9.primaryWideAssetId = if v10.primaryMediaAsset and v10.primaryMediaAsset.wideImageAssetId then tostring(v10.primaryMediaAsset.wideImageAssetId) else nil;
        v9.primaryWideListId = if v10.primaryMediaAsset and v10.primaryMediaAsset.wideImageListId then tostring(v10.primaryMediaAsset.wideImageListId) else nil;
        v9.totalDownVotes = v10.totalDownVotes;
        v9.totalUpVotes = v10.totalUpVotes;
        v9.defaultLayoutData = v10.defaultLayoutData;
        v9.layoutDataBySort = v10.layoutDataBySort;
    end
};
v11.mock = function() --[[ Line: 41 ]] --[[ Name: mock ]]
    -- upvalues: v11 (copy)
    local v12 = v11.new("149757", "10395446", "test");
    v11._fromSharedJson(v12, {
        ageRecommendationDisplayName = "Ages 13+", 
        minimumAge = 13, 
        contentMaturity = "moderate", 
        playerCount = 5, 
        primaryMediaAsset = {
            wideImageAssetId = "12046435434"
        }, 
        totalDownVotes = 2564, 
        totalUpVotes = 10970
    });
    v12.creatorId = "22915773";
    v12.creatorName = "Jaegerblox";
    v12.defaultLayoutData = {};
    v12.friendActivityTitle = "Friend Activity";
    v12.friendVisitedString = "1 Friend visited";
    v12.friendVisits = {
        {
            userId = "1894536079"
        }
    };
    v12.layoutDataBySort = {};
    return v12;
end;
v11.fromGamesApi = function(v13) --[[ Line: 73 ]] --[[ Name: fromGamesApi ]]
    -- upvalues: v1 (copy), v11 (copy)
    if type(v13.universeId) ~= "number" and type(v13.universeId) ~= "string" then
        return v1.error("GameInfoModel.fromGamesApi expects universeId to be a number or a string");
    elseif type(v13.placeId) ~= "number" and type(v13.placeId) ~= "string" then
        return v1.error("GameInfoModel.fromGamesApi expects placeId to be a number or a string");
    elseif type(v13.creatorId) ~= "number" and type(v13.creatorId) ~= "string" then
        return v1.error("GameInfoModel.fromGamesApi expects creatorId to be a number or a string");
    else
        local v14 = v11.new(tostring(v13.universeId), tostring(v13.placeId), v13.name);
        v11._fromSharedJson(v14, v13);
        v14.creatorId = tostring(v13.creatorId);
        v14.creatorName = v13.creatorName;
        return v1.success(v14);
    end;
end;
v11.fromExperienceApi = function(v15) --[[ Line: 92 ]] --[[ Name: fromExperienceApi ]]
    -- upvalues: v1 (copy), v11 (copy)
    if type(v15.universeId) ~= "number" and type(v15.universeId) ~= "string" then
        return v1.error("Game.fromJsonData expects universeId to be a number or a string");
    elseif type(v15.rootPlaceId) ~= "number" and type(v15.rootPlaceId) ~= "string" then
        return v1.error("Game.fromJsonData expects placeId to be a number or a string");
    else
        local v16 = v11.new(tostring(v15.universeId), tostring(v15.rootPlaceId), v15.name);
        v11._fromSharedJson(v16, v15);
        return v1.success(v16);
    end;
end;
v11.fromOmniApi = function(v17) --[[ Line: 106 ]] --[[ Name: fromOmniApi ]]
    -- upvalues: v1 (copy), v11 (copy)
    if type(v17.universeId) ~= "number" and type(v17.universeId) ~= "string" then
        return v1.error("DiscoveryGame.fromJsonData expects universeId to be a number or a string");
    elseif type(v17.rootPlaceId) ~= "number" and type(v17.rootPlaceId) ~= "string" then
        return v1.error("DiscoveryGame.fromJsonData expects rootPlaceId to be a number or a string");
    else
        local v18 = v11.new(tostring(v17.universeId), tostring(v17.rootPlaceId), v17.name);
        v11._fromSharedJson(v18, v17);
        v18.friendActivityTitle = v17.friendActivityTitle;
        v18.friendVisitedString = v17.friendVisitedString;
        v18.friendVisits = v17.friendVisits;
        v18.navigationUniverseId = if v17.navigationUid then tostring(v17.navigationUid) else nil;
        return v1.success(v18);
    end;
end;
if l_FFlagSearchOmniAutocompletePage_0 then
    v11.fromOmniAutocompleteApi = function(v19) --[[ Line: 125 ]] --[[ Name: fromOmniAutocompleteApi ]]
        -- upvalues: v1 (copy), v11 (copy)
        if type(v19.universeId) ~= "number" and type(v19.universeId) ~= "string" then
            return v1.error("GameInfoModel.fromOmniAutocompleteApi expects universeId to be a number or a string");
        elseif type(v19.rootPlaceId) ~= "number" and type(v19.rootPlaceId) ~= "string" then
            return v1.error("GameInfoModel.fromOmniAutocompleteApi expects placeId to be a number or a string");
        else
            local v20 = v11.new(tostring(v19.universeId), tostring(v19.rootPlaceId), v19.name);
            v11._fromSharedJson(v20, v19);
            return v1.success(v20);
        end;
    end;
end;
v11.fromSearchApi = function(v21) --[[ Line: 140 ]] --[[ Name: fromSearchApi ]]
    -- upvalues: v1 (copy), v11 (copy)
    if type(v21.universeId) ~= "number" and type(v21.universeId) ~= "string" then
        return v1.error("GameInfoModel.fromSearchApi expects universeId to be a number or a string");
    elseif type(v21.rootPlaceId) ~= "number" and type(v21.rootPlaceId) ~= "string" then
        return v1.error("GameInfoModel.fromSearchApi expects rootPlaceId to be a number or a string");
    elseif type(v21.creatorId) ~= "number" and type(v21.creatorId) ~= "string" then
        return v1.error("GameInfoModel.fromSearchApi expects creatorId to be a number or a string");
    else
        local v22 = v11.new(tostring(v21.universeId), tostring(v21.rootPlaceId), v21.name);
        v11._fromSharedJson(v22, v21);
        v22.creatorId = tostring(v21.creatorId);
        v22.creatorName = v21.creatorName;
        return v1.success(v22);
    end;
end;
if l_FFlagEnableTopSongsSort_0 then
    v11.fromMusicDiscoveryApi = function(v23) --[[ Line: 160 ]] --[[ Name: fromMusicDiscoveryApi ]]
        -- upvalues: v1 (copy), v11 (copy)
        if type(v23.universeId) ~= "number" and type(v23.universeId) ~= "string" then
            return v1.error("GameInfoModel.fromMusicDiscoveryApi expects universeId to be a number or a string");
        elseif type(v23.rootPlaceId) ~= "number" and type(v23.rootPlaceId) ~= "string" then
            return v1.error("GameInfoModel.fromMusicDiscoveryApi expects rootPlaceId to be a number or a string");
        else
            local v24 = v11.new(tostring(v23.universeId), tostring(v23.rootPlaceId), v23.name);
            v24.playerCount = v23.playerCount;
            v24.totalDownVotes = v23.downVotes;
            v24.totalUpVotes = v23.upVotes;
            return v1.success(v24);
        end;
    end;
end;
return v11;
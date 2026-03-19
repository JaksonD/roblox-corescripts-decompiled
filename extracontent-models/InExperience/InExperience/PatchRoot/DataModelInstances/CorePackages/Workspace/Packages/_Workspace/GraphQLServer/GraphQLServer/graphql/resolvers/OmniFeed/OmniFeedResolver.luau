local l_Parent_0 = script:FindFirstAncestor("GraphQLServer").Parent;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local v2 = {};
local v3 = require(script.Parent.Parent.Parent.connectors.OmniFeed.OmniFeedConnector);
local l_findOmniFeedBySessionId_0 = v3.findOmniFeedBySessionId;
local l_fetchMoreOmniRecommendationMetadata_0 = v3.fetchMoreOmniRecommendationMetadata;
local _ = require(script.Parent.Parent.Parent.generatedTypes);
v2.default = {
    OmniFeedItem = {
        experiences = function(v7) --[[ Line: 35 ]] --[[ Name: experiences ]]
            if not v7.metadata or not v7.metadata.Game or not v7.recommendations then
                return nil;
            else
                local l_Game_0 = v7.metadata.Game;
                local v9 = {};
                for _, v11 in v7.recommendations do
                    if v11.contentId then
                        local v12 = l_Game_0[tostring(v11.contentId)];
                        local l_contentMetadata_0 = v11.contentMetadata;
                        local v14 = if l_contentMetadata_0 and l_contentMetadata_0.EncryptedAdTrackingData then l_contentMetadata_0.EncryptedAdTrackingData else nil;
                        if v12 and v12.universeId then
                            local v15 = {
                                placeId = if v12.rootPlaceId then tostring(v12.rootPlaceId) else nil, 
                                name = v12.name, 
                                universeId = tostring(v12.universeId), 
                                totalUpVotes = v12.totalUpVotes, 
                                totalDownVotes = v12.totalDownVotes, 
                                playerCount = v12.playerCount, 
                                under9 = if v12.under9 then v12.under9 else false, 
                                under13 = if v12.under13 then v12.under13 else false, 
                                adId = v14 or ""
                            };
                            local v16 = false;
                            if v14 ~= nil then
                                v16 = v14 ~= "";
                            end;
                            v15.isSponsored = v16;
                            table.insert(v9, v15);
                        end;
                    end;
                end;
                return v9;
            end;
        end
    }, 
    OmniFeedMetadata = {
        GameJSON = function(v17) --[[ Line: 73 ]] --[[ Name: GameJSON ]]
            return v17.Game;
        end, 
        CatalogAssetJSON = function(v18) --[[ Line: 76 ]] --[[ Name: CatalogAssetJSON ]]
            return v18.CatalogAsset;
        end, 
        CatalogBundleJSON = function(v19) --[[ Line: 79 ]] --[[ Name: CatalogBundleJSON ]]
            return v19.CatalogBundle;
        end, 
        RecommendedFriendJSON = function(v20) --[[ Line: 82 ]] --[[ Name: RecommendedFriendJSON ]]
            return v20.RecommendedFriend;
        end
    }, 
    OmniFeed = {
        metadata = function(v21) --[[ Line: 87 ]] --[[ Name: metadata ]]
            return v21.contentMetadata;
        end, 
        sortsExpirationTime = function(v22) --[[ Line: 90 ]] --[[ Name: sortsExpirationTime ]]
            if not v22.sortsRefreshInterval then
                return nil;
            else
                return math.floor((tick())) + v22.sortsRefreshInterval;
            end;
        end, 
        recommendationsId = function(v23) --[[ Line: 96 ]] --[[ Name: recommendationsId ]]
            return v23.requestId;
        end, 
        globalLayoutData = function(v24) --[[ Line: 99 ]] --[[ Name: globalLayoutData ]]
            return v24.globalLayoutData;
        end, 
        sorts = function(v25) --[[ Line: 102 ]] --[[ Name: sorts ]]
            -- upvalues: l_Array_0 (copy)
            if not v25.sorts then
                return nil;
            else
                return (l_Array_0.map(v25.sorts, function(v26) --[[ Line: 107 ]]
                    -- upvalues: v25 (copy)
                    return {
                        topic = v26.topic, 
                        topicId = v26.topicId, 
                        treatmentType = v26.treatmentType, 
                        recommendations = v26.recommendationList, 
                        metadata = v25.contentMetadata
                    };
                end));
            end;
        end
    }, 
    OmniFeedItemWithMetadata = {
        metadata = function(v27) --[[ Line: 121 ]] --[[ Name: metadata ]]
            return v27.contentMetadata;
        end, 
        sort = function(v28) --[[ Line: 124 ]] --[[ Name: sort ]]
            return {
                topicId = v28.topicId, 
                metadata = v28.contentMetadata, 
                recommendations = v28.recommendations
            };
        end
    }, 
    Query = {
        omniFeed = function(_, v30, v31) --[[ Line: 135 ]] --[[ Name: omniFeed ]]
            -- upvalues: l_findOmniFeedBySessionId_0 (copy)
            return l_findOmniFeedBySessionId_0(v30, v31.fetchImpl);
        end, 
        refreshOmniFeedItem = function(_, v33, v34) --[[ Line: 138 ]] --[[ Name: refreshOmniFeedItem ]]
            -- upvalues: l_fetchMoreOmniRecommendationMetadata_0 (copy)
            return l_fetchMoreOmniRecommendationMetadata_0(v33, v34.fetchImpl);
        end
    }
};
return v2;
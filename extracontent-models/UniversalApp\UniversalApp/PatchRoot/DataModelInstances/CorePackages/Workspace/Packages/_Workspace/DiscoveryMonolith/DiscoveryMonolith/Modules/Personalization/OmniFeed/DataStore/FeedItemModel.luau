local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local v1 = require(l_Parent_0.DiscoveryTypes);
local l_OmniFeedTypes_0 = v1.OmniFeedTypes;
local l_FFlagLuaAppPropagateFriendsCarouselHeader_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppPropagateFriendsCarouselHeader;
local l_FFlagSearchOmniAutocompletePage_0 = require(l_Parent_0.SharedFlags).FFlagSearchOmniAutocompletePage;
local l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddRequestIdToRfySignalApportioning;
local v26 = {
    fromLocalData = function(v6, v7, v8, v9) --[[ Line: 18 ]] --[[ Name: fromLocalData ]]
        -- upvalues: v1 (copy)
        return {
            orderHint = v6, 
            treatmentType = v7, 
            treatmentProps = v8, 
            numberOfRows = v9 or 1, 
            dataSource = v1.DataSourceType.Local
        };
    end, 
    fromGamesApi = function(v10, v11, v12) --[[ Line: 35 ]] --[[ Name: fromGamesApi ]]
        -- upvalues: l_OmniFeedTypes_0 (copy), v1 (copy)
        return {
            treatmentType = l_OmniFeedTypes_0.Carousel, 
            numberOfRows = 1, 
            itemId = {
                sortName = v11, 
                sortIndex = v10
            }, 
            treatmentProps = {
                sortIndex = v10, 
                isOmni = false, 
                topicLayoutData = v12
            }, 
            dataSource = v1.DataSourceType.GamesApi
        };
    end, 
    fromExploreTopicInfo = function(v13, v14, v15) --[[ Line: 54 ]] --[[ Name: fromExploreTopicInfo ]]
        -- upvalues: v1 (copy), l_OmniFeedTypes_0 (copy)
        local v16 = {
            treatmentType = v14.treatmentType, 
            numberOfRows = 1, 
            itemId = {
                sortName = v14.name, 
                sortIndex = v13
            }, 
            dataSource = v1.DataSourceType.ExploreApi, 
            pageSection = v15
        };
        if v14.treatmentType == l_OmniFeedTypes_0.Pills then
            v16.treatmentProps = {
                sortIndex = v13, 
                gameSortId = v14.name, 
                topicName = v14.displayName, 
                isOmni = false, 
                topicLayoutData = v14.topicLayoutData
            };
            return v16;
        else
            v16.treatmentProps = {
                sortIndex = v13, 
                isOmni = false, 
                topicLayoutData = v14.topicLayoutData
            };
            return v16;
        end;
    end, 
    fromDiscoveryApi = function(v17, v18, v19) --[[ Line: 89 ]] --[[ Name: fromDiscoveryApi ]]
        -- upvalues: v1 (copy), l_OmniFeedTypes_0 (copy), l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 (copy), l_FFlagLuaAppPropagateFriendsCarouselHeader_0 (copy)
        local l_treatmentType_0 = v18.treatmentType;
        local v21 = {
            treatmentType = l_treatmentType_0, 
            numberOfRows = v18.numberOfRows or 1, 
            dataSource = v1.DataSourceType.DiscoveryApi
        };
        if l_treatmentType_0 == l_OmniFeedTypes_0.Carousel or l_treatmentType_0 == l_OmniFeedTypes_0.AvatarCarousel then
            v21.itemId = {
                topicId = v18.topicId, 
                sortIndex = v17
            };
            v21.treatmentProps = {
                sortIndex = v17, 
                topicLayoutData = v18.topicLayoutData, 
                isOmni = true
            };
            return v21;
        elseif l_treatmentType_0 == l_OmniFeedTypes_0.HomeGameGrid then
            v21.actualRenderedRows = -1;
            v21.itemId = {
                topicId = v18.topicId, 
                sortIndex = v17
            };
            v21.treatmentProps = {
                sortIndex = v17, 
                topicId = v18.topicId, 
                topicName = v18.topic, 
                topicLayoutData = v18.topicLayoutData, 
                numberOfRows = v18.numberOfRows, 
                recommendationsRequestId = if l_FFlagLuaAppAddRequestIdToRfySignalApportioning_0 then v19 else nil
            };
            return v21;
        elseif l_treatmentType_0 == l_OmniFeedTypes_0.JoinYourFriendsCarousel then
            v21.treatmentProps = {
                topicId = v18.topicId, 
                topicLayoutData = v18.topicLayoutData
            };
            return v21;
        elseif l_treatmentType_0 == l_OmniFeedTypes_0.FriendCarousel then
            v21.treatmentProps = {
                topic = if l_FFlagLuaAppPropagateFriendsCarouselHeader_0 then v18.topic else nil, 
                topicId = v18.topicId
            };
            return v21;
        elseif l_treatmentType_0 == l_OmniFeedTypes_0.FriendRecommendationCarousel then
            v21.treatmentProps = {
                sortIndex = v17, 
                carouselTitle = v18.topic, 
                topicId = v18.topicId, 
                topicLayoutData = v18.topicLayoutData
            };
            return v21;
        else
            if l_treatmentType_0 == l_OmniFeedTypes_0.ServerDrivenUi then
                v21.treatmentProps = {
                    sortIndex = v17, 
                    topicId = v18.topicId, 
                    numberOfRows = v18.numberOfRows, 
                    feedItemKey = v18.feedItemKey
                };
                v21.itemId = {
                    topicId = v18.topicId, 
                    sortIndex = v17
                };
            end;
            return v21;
        end;
    end, 
    getUniqueNameForAnalytics = function(v22) --[[ Line: 160 ]] --[[ Name: getUniqueNameForAnalytics ]]
        -- upvalues: l_OmniFeedTypes_0 (copy)
        if not v22 then
            return nil;
        elseif not v22.treatmentType then
            return nil;
        else
            if v22.treatmentType == l_OmniFeedTypes_0.Carousel then
                local l_itemId_0 = v22.itemId;
                if l_itemId_0.topicId then
                    return "topicId:" .. l_itemId_0.topicId .. "_" .. l_itemId_0.sortIndex;
                elseif l_itemId_0.sortName then
                    return "sortId:" .. l_itemId_0.sortName .. "_" .. l_itemId_0.sortIndex;
                end;
            end;
            if v22.treatmentType == l_OmniFeedTypes_0.HomeGameGrid then
                local l_itemId_1 = v22.itemId;
                if l_itemId_1.topicId then
                    return "GameGrid_topicId:" .. l_itemId_1.topicId .. "_" .. l_itemId_1.sortIndex;
                end;
            end;
            if v22.treatmentType == l_OmniFeedTypes_0.ServerDrivenUi then
                local l_itemId_2 = v22.itemId;
                if l_itemId_2.topicId then
                    return "ServerDrivenUi_topicId:" .. l_itemId_2.topicId .. "_" .. l_itemId_2.sortIndex;
                end;
            end;
            return "type:" .. v22.treatmentType;
        end;
    end
};
v26.getUniqueNameForFeed = function(v27) --[[ Line: 198 ]] --[[ Name: getUniqueNameForFeed ]]
    -- upvalues: v26 (copy)
    return v26.getUniqueNameForAnalytics(v27);
end;
v26.fromSearchApi = function(v28, v29, v30, v31, v32) --[[ Line: 202 ]] --[[ Name: fromSearchApi ]]
    -- upvalues: v1 (copy), l_OmniFeedTypes_0 (copy)
    local v33 = {
        treatmentType = v30, 
        itemId = {
            topicId = v29, 
            sortIndex = v31
        }, 
        treatmentProps = {
            searchUuid = v28, 
            topicId = v29, 
            topicLayoutData = v32, 
            sortIndex = v31
        }, 
        dataSource = v1.DataSourceType.SearchApi, 
        numberOfRows = v32 and v32.numOfRows or 1
    };
    if v30 == l_OmniFeedTypes_0.SearchGameGrid or v30 == l_OmniFeedTypes_0.UserSearchGrid then
        v33.actualRenderedRows = -1;
    end;
    return v33;
end;
if l_FFlagSearchOmniAutocompletePage_0 then
    v26.fromOmniAutocompleteApi = function(v34, v35) --[[ Line: 234 ]] --[[ Name: fromOmniAutocompleteApi ]]
        -- upvalues: v1 (copy), l_OmniFeedTypes_0 (copy)
        local l_treatmentType_1 = v35.treatmentType;
        local v37 = {
            treatmentType = l_treatmentType_1, 
            dataSource = v1.DataSourceType.OmniAutocompleteApi, 
            itemId = {
                topicId = v35.sortId, 
                sortIndex = v34
            }, 
            numberOfRows = v35.numberOfRows or 1
        };
        if l_treatmentType_1 == l_OmniFeedTypes_0.Carousel then
            v37.treatmentProps = {
                sortIndex = v34, 
                sortName = v35.sortId, 
                topicLayoutData = v35.topicLayoutData, 
                isOmni = false
            };
            return v37;
        else
            if l_treatmentType_1 == l_OmniFeedTypes_0.SearchPillCarousel then
                v37.treatmentProps = {
                    sortIndex = v34, 
                    sortName = v35.sortId, 
                    topicLayoutData = v35.topicLayoutData, 
                    isOmni = false
                };
            end;
            return v37;
        end;
    end;
end;
v26.getNumberOfRows = function(v38) --[[ Line: 269 ]] --[[ Name: getNumberOfRows ]]
    if not v38 then
        return nil;
    elseif not v38.actualRenderedRows then
        return v38.numberOfRows;
    elseif v38.actualRenderedRows >= 0 then
        return v38.actualRenderedRows;
    else
        return nil;
    end;
end;
return v26;
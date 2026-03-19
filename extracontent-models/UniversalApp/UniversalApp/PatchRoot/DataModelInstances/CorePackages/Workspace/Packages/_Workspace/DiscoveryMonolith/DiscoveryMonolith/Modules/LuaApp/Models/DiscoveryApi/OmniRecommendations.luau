local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local v1 = require(l_Parent_0.Result);
local v2 = require(l_Parent_0.Cryo);
local l_GameInfoModel_0 = require(l_Parent_0.GameModels).GameInfoModel;
local v4 = require(l_Parent_0.DiscoveryTypes);
local l_OmniRecommendationsContentType_0 = v4.OmniRecommendationsContentType;
local l_OmniFeedTypes_0 = v4.OmniFeedTypes;
local l_OmniRecommendationsPageType_0 = require(l_Parent_0.DiscoveryUtils).OmniRecommendationsPageType;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_FFlagLuaAppAddSubIdToHomeEvents_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppAddSubIdToHomeEvents;
local l_FFlagLuaAppLogOmniAnalyticsData_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppLogOmniAnalyticsData;
local v11 = {
    new = function() --[[ Line: 49 ]] --[[ Name: new ]]
        return {};
    end
};
v11.mock = function() --[[ Line: 55 ]] --[[ Name: mock ]]
    -- upvalues: v11 (copy), l_AppPage_0 (copy), l_GameInfoModel_0 (copy), l_OmniRecommendationsContentType_0 (copy), l_OmniFeedTypes_0 (copy)
    local v12 = v11.new();
    v12.pageType = l_AppPage_0.Home;
    v12.nextPageToken = "eyJzdGFydCI6MTAsImNvdW50IjoxMCwiZW5kT2ZQYWdlIjpmYWxzZX0=";
    v12.isSessionExpired = false;
    local v13 = l_GameInfoModel_0.mock();
    v12.sorts = {
        {
            topic = "topic1", 
            topicId = "100000003", 
            recommendations = {
                {
                    contentType = l_OmniRecommendationsContentType_0.Game, 
                    contentId = v13.universeId
                }
            }, 
            treatmentType = l_OmniFeedTypes_0.Carousel, 
            numberOfRows = -1
        }
    };
    v12.recommendationsId = "3d14d9e6-cea3-4eec-bcdc-cfdc906f61cb";
    v12.omniSessionId = "d3240862-f901-419c-8780-5160e05d8473";
    return v12;
end;
v11.mockEndpointResponse = function(v14) --[[ Line: 84 ]] --[[ Name: mockEndpointResponse ]]
    -- upvalues: l_OmniRecommendationsContentType_0 (copy), l_OmniFeedTypes_0 (copy), l_OmniRecommendationsPageType_0 (copy)
    local v15 = {
        rootPlaceId = "10395446", 
        universeId = "149757", 
        name = "test", 
        totalUpVotes = 10970, 
        totalDownVotes = 2564, 
        playerCount = 5, 
        under9 = true, 
        under13 = false, 
        friendActivityTitle = "Friend Activity", 
        minimumAge = 0, 
        ageRecommendationDisplayName = "All Ages", 
        friendVisits = {
            {
                userId = "1894536079"
            }
        }, 
        friendVisitedString = "1 Friend visited", 
        defaultLayoutData = {
            footer = {
                type = "TextLabel", 
                textLiteral = "This is footer text"
            }
        }, 
        layoutDataBySort = {
            ["500000000"] = {
                footer = {
                    type = "TextLabel", 
                    textLiteral = "This is a sort-level footer text"
                }
            }
        }, 
        primaryWideAssetId = "12046435434"
    };
    return {
        contentMetadata = {
            [l_OmniRecommendationsContentType_0.Game] = {
                [v15.universeId] = v15
            }
        }, 
        sorts = {
            {
                topic = "Friends", 
                topicId = 600000000, 
                recommendationList = {}, 
                treatmentType = l_OmniFeedTypes_0.FriendCarousel
            }, 
            {
                topic = v14 or "topic123", 
                topicId = 100000003, 
                recommendationList = {
                    {
                        contentType = l_OmniRecommendationsContentType_0.Game, 
                        contentId = v15.universeId
                    }
                }, 
                treatmentType = l_OmniFeedTypes_0.Carousel
            }
        }, 
        pageType = l_OmniRecommendationsPageType_0.OmniRecommendationsPageType.PAGE_TYPE_HOME, 
        requestId = "123avcd3-1431-35bd-24db-452abcde65abf35", 
        nextPageToken = "eyJzdGFydCI6MTAsImNvdW50IjoxMCwiZW5kT2ZQYWdlIjpmYWxzZX0=", 
        isSessionExpired = false
    };
end;
v11.fromJsonData = function(v16, v17) --[[ Line: 147 ]] --[[ Name: fromJsonData ]]
    -- upvalues: l_OmniRecommendationsPageType_0 (copy), v1 (copy), v2 (copy), l_FFlagLuaAppAddSubIdToHomeEvents_0 (copy), l_FFlagLuaAppLogOmniAnalyticsData_0 (copy)
    local _ = nil;
    local v19 = {};
    local v20 = l_OmniRecommendationsPageType_0.toAppPage(v16.pageType);
    if not v20 then
        return v1.error((("pageType %* for OmniRecommedations is not supported."):format(v20)));
    else
        assert(v20, "always exists for linter");
        v19.pageType = v20;
        if v16.sortsRefreshInterval and v16.sortsRefreshInterval > 0 then
            v19.sortsExpirationTime = tick() + v16.sortsRefreshInterval;
        end;
        v19.nextPageToken = v16.nextPageToken;
        v19.isSessionExpired = v16.isSessionExpired;
        v19.recommendationsId = v16.requestId;
        v19.omniSessionId = v17 or "Invalid_OmniSessionId";
        v19.sorts = v2.List.map(v16.sorts, function(v21) --[[ Line: 165 ]]
            -- upvalues: l_FFlagLuaAppAddSubIdToHomeEvents_0 (ref), l_FFlagLuaAppLogOmniAnalyticsData_0 (ref), v2 (ref)
            local v22 = if v21.topicId then tostring(v21.topicId) else nil;
            return {
                topic = v21.topic, 
                topicId = v22, 
                subtitle = v21.subtitle, 
                sortSubId = if l_FFlagLuaAppAddSubIdToHomeEvents_0 then v21.subId else nil, 
                analyticsData = if l_FFlagLuaAppLogOmniAnalyticsData_0 then v21.analyticsData else nil, 
                recommendations = if v21.recommendationList then v2.List.map(v21.recommendationList, function(v23) --[[ Line: 175 ]]
                    -- upvalues: l_FFlagLuaAppLogOmniAnalyticsData_0 (ref)
                    return {
                        contentType = v23.contentType, 
                        contentId = v23.contentId, 
                        contentStringId = v23.contentStringId, 
                        contentMetadata = v23.contentMetadata, 
                        analyticsData = if l_FFlagLuaAppLogOmniAnalyticsData_0 then v23.analyticsData else nil
                    };
                end) else nil, 
                treatmentType = v21.treatmentType, 
                numberOfRows = v21.numberOfRows and v21.numberOfRows or -1, 
                topicLayoutData = v21.topicLayoutData, 
                feedItemKey = v21.feedItemKey
            };
        end);
        v19.globalLayoutData = v16.globalLayoutData or {};
        v19.sdui = v16.sdui;
        return v1.success(v19);
    end;
end;
return v11;
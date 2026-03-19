local l_Parent_0 = script:FindFirstAncestor("GraphQlShared").Parent;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_HttpService_0 = game:GetService("HttpService");
local v4 = require(l_Parent_0.DiscoveryUtils);
local l_FFlagEnableContextFeaturesForOmniRecommendations_0 = require(l_Parent_0.SharedFlags).FFlagEnableContextFeaturesForOmniRecommendations;
local l_AddSystemInfoToArgs_0 = v4.AddSystemInfoToArgs;
local l_OmniRecommendationsPageType_0 = v4.OmniRecommendationsPageType;
local v8 = l_UrlBuilder_0.new({
    base = l_Url_0.APIS_URL, 
    path = "/discovery-api/omni-recommendation"
});
return function(v9, v10, v11, v12, v13, v14, v15, v16, v17) --[[ Line: 54 ]]
    -- upvalues: l_OmniRecommendationsPageType_0 (copy), l_FFlagEnableContextFeaturesForOmniRecommendations_0 (copy), l_AddSystemInfoToArgs_0 (copy), v8 (copy), l_HttpService_0 (copy)
    local v18 = {
        pageType = l_OmniRecommendationsPageType_0.fromAppPage(v10), 
        sessionId = v11, 
        pageToken = v12, 
        supportedTreatmentTypes = v13, 
        requestIntent = v14, 
        topicIds = v15, 
        sduiTreatmentTypes = v16
    };
    if l_FFlagEnableContextFeaturesForOmniRecommendations_0 and v17 then
        v18.contextFeatures = v17;
    end;
    l_AddSystemInfoToArgs_0(v18);
    return v9(v8(), "POST", {
        postBody = l_HttpService_0:JSONEncode(v18)
    });
end;
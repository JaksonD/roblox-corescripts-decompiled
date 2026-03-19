local l_Parent_0 = script:FindFirstAncestor("DataHydration").Parent;
local l_Url_0 = require(l_Parent_0.Http).Url;
local l_UrlBuilder_0 = require(l_Parent_0.UrlBuilder).UrlBuilder;
local l_GetFStringEdpPlayerFeedbackServiceRoute_0 = require(l_Parent_0.SharedFlags).GetFStringEdpPlayerFeedbackServiceRoute;
local v4 = {
    ExperienceDiscoveryPage = "experience-discovery-page"
};
return {
    USER_VOTE_FEEDBACK_METADATA_URL = l_UrlBuilder_0.new({
        base = l_Url_0.APIS_URL, 
        path = "{serviceRoute}/v1/channels/{channel}/assets"
    })({
        serviceRoute = l_GetFStringEdpPlayerFeedbackServiceRoute_0(), 
        channel = v4.ExperienceDiscoveryPage
    }), 
    buildUserVoteFeedbackMetadataUrl = function(v5) --[[ Line: 22 ]] --[[ Name: buildUserVoteFeedbackMetadataUrl ]]
        -- upvalues: l_UrlBuilder_0 (copy), l_Url_0 (copy), l_GetFStringEdpPlayerFeedbackServiceRoute_0 (copy), v4 (copy)
        return l_UrlBuilder_0.new({
            base = l_Url_0.APIS_URL, 
            path = "{serviceRoute}/v1/channels/{channel}/assets/{rootPlaceId}"
        })({
            serviceRoute = l_GetFStringEdpPlayerFeedbackServiceRoute_0(), 
            channel = v4.ExperienceDiscoveryPage, 
            rootPlaceId = v5
        });
    end
};
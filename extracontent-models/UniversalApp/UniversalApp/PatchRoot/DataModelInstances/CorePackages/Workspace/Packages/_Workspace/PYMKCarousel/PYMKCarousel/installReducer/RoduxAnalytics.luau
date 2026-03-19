local l_script_FirstAncestor_0 = script:FindFirstAncestor("PYMKCarousel");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local _ = require(l_script_FirstAncestor_0.Common.OmniTypes);
local v3 = require(script.Parent.transformOmniRecommendationsToActions);
local l_RECOMMENDATION_SESSION_ID_KEY_0 = require(l_script_FirstAncestor_0.Common.Constants).RECOMMENDATION_SESSION_ID_KEY;
local l_convertActions_0 = v1.convertActions;
local l_RoduxAnalytics_0 = v1.RoduxAnalytics;
local v7 = l_RoduxAnalytics_0.installReducer();
local function v12(v8, _) --[[ Line: 12 ]]
    -- upvalues: l_RoduxAnalytics_0 (copy), l_RECOMMENDATION_SESSION_ID_KEY_0 (copy)
    local v10 = nil;
    if v8 and v8.recommendations and #v8.recommendations > 0 and v8.recommendations[1] and v8.recommendations[1].contentMetadata then
        local l_contentMetadata_0 = v8.recommendations[1].contentMetadata;
        v10 = if l_contentMetadata_0 then l_contentMetadata_0.recommendationRequestId else nil;
    end;
    return l_RoduxAnalytics_0.Actions.SessionIdUpdated({
        sessionKey = l_RECOMMENDATION_SESSION_ID_KEY_0, 
        sessionId = v10
    });
end;
local function _(v13) --[[ Line: 34 ]]
    -- upvalues: v3 (copy), v12 (copy)
    return {
        AddOmniRecommendations = function(v14) --[[ Line: 36 ]] --[[ Name: AddOmniRecommendations ]]
            -- upvalues: v3 (ref), v13 (copy), v12 (ref)
            return v3(v14.recommendations or {}, v13, nil, v12);
        end
    };
end;
return function(v16) --[[ Line: 42 ]]
    -- upvalues: l_convertActions_0 (copy), v7 (copy), v3 (copy), v12 (copy)
    return l_convertActions_0(v7, {
        AddOmniRecommendations = function(v17) --[[ Line: 36 ]] --[[ Name: AddOmniRecommendations ]]
            -- upvalues: v3 (ref), v16 (copy), v12 (ref)
            return v3(v17.recommendations or {}, v16, nil, v12);
        end
    }, {});
end;
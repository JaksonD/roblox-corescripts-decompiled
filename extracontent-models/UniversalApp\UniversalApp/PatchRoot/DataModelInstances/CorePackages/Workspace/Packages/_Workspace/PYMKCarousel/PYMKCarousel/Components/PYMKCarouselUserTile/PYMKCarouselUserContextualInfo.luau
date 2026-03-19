local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_0.dependencies);
local v3 = require(l_Parent_1.SocialCommon);
local l_Roact_0 = v2.Roact;
local l_React_0 = v2.React;
local l_useSelector_0 = v2.Hooks.useSelector;
local l_useLocalization_0 = v2.Hooks.useLocalization;
local l_RoduxFriends_0 = v2.RoduxFriends;
local l_getDeepValue_0 = v2.SocialLibraries.Dictionary.getDeepValue;
local v10 = require(l_Parent_0.Common.TextKeys);
local l_CarouselUserContextualInfo_0 = v3.Components.CarouselUserTile.CarouselUserContextualInfo;
local l_useRecommendationContextualInfoDisplay_0 = v3.Hooks.useRecommendationContextualInfoDisplay;
local l_RecommendationContextType_0 = l_RoduxFriends_0.Enums.RecommendationContextType;
local function v17(v14) --[[ Line: 32 ]]
    -- upvalues: l_useLocalization_0 (copy)
    local v15 = l_useLocalization_0({
        contextualText = v14.textKey
    });
    local v16 = if v14.textKey then v15.contextualText else v14.text;
    if v14.formatter then
        return (v14.formatter(v16));
    else
        return v16;
    end;
end;
return function(v18) --[[ Line: 41 ]]
    -- upvalues: l_useSelector_0 (copy), l_RoduxFriends_0 (copy), l_getDeepValue_0 (copy), l_useRecommendationContextualInfoDisplay_0 (copy), v10 (copy), l_RecommendationContextType_0 (copy), l_React_0 (copy), v17 (copy), l_Roact_0 (copy), l_CarouselUserContextualInfo_0 (copy)
    local v19 = tostring(v18.userId);
    local v21 = l_useSelector_0(function(v20) --[[ Line: 43 ]]
        return (tostring(v20.LocalUserId));
    end);
    local v23 = l_useSelector_0(function(v22) --[[ Line: 47 ]]
        -- upvalues: l_RoduxFriends_0 (ref), v21 (copy), v19 (copy)
        return l_RoduxFriends_0.Selectors.selectRecommendationsForUserId(v22)(v21)[v19] or {};
    end);
    local v25 = l_useSelector_0(function(v24) --[[ Line: 51 ]]
        -- upvalues: l_getDeepValue_0 (ref), v19 (copy)
        return l_getDeepValue_0(v24, string.format("PYMKCarousel.Friends.recommendations.hasIncomingFriendRequest.%s", v19)) or false;
    end);
    local v26 = {
        text = l_useRecommendationContextualInfoDisplay_0(v23).text
    };
    if v25 then
        v26 = {
            textKey = v10.ConnectionRequestContext
        };
    end;
    if v18.contextType == l_RecommendationContextType_0.Contacts then
        v26 = {
            textKey = v10.FromContacts
        };
    end;
    local v27 = l_React_0.useCallback(v17(v26), {
        v26
    });
    return l_Roact_0.createElement(l_CarouselUserContextualInfo_0, {
        label = {
            text = v27, 
            font = v26.font, 
            colorStyle = v26.colorStyle
        }, 
        lineWidth = v18.lineWidth
    });
end;
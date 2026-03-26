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
local l_FFlagConnectionsToFriendsRename_0 = require(l_Parent_1.SharedFlags).FFlagConnectionsToFriendsRename;
local function v18(v15) --[[ Line: 34 ]]
    -- upvalues: l_useLocalization_0 (copy)
    local v16 = l_useLocalization_0({
        contextualText = v15.textKey
    });
    local v17 = if v15.textKey then v16.contextualText else v15.text;
    if v15.formatter then
        return (v15.formatter(v17));
    else
        return v17;
    end;
end;
return function(v19) --[[ Line: 43 ]]
    -- upvalues: l_useSelector_0 (copy), l_RoduxFriends_0 (copy), l_getDeepValue_0 (copy), l_useRecommendationContextualInfoDisplay_0 (copy), l_FFlagConnectionsToFriendsRename_0 (copy), v10 (copy), l_RecommendationContextType_0 (copy), l_React_0 (copy), v18 (copy), l_Roact_0 (copy), l_CarouselUserContextualInfo_0 (copy)
    local v20 = tostring(v19.userId);
    local v22 = l_useSelector_0(function(v21) --[[ Line: 45 ]]
        return (tostring(v21.LocalUserId));
    end);
    local v24 = l_useSelector_0(function(v23) --[[ Line: 49 ]]
        -- upvalues: l_RoduxFriends_0 (ref), v22 (copy), v20 (copy)
        return l_RoduxFriends_0.Selectors.selectRecommendationsForUserId(v23)(v22)[v20] or {};
    end);
    local v26 = l_useSelector_0(function(v25) --[[ Line: 53 ]]
        -- upvalues: l_getDeepValue_0 (ref), v20 (copy)
        return l_getDeepValue_0(v25, string.format("PYMKCarousel.Friends.recommendations.hasIncomingFriendRequest.%s", v20)) or false;
    end);
    local v27 = {
        text = l_useRecommendationContextualInfoDisplay_0(v24).text
    };
    if v26 then
        v27 = {
            textKey = if l_FFlagConnectionsToFriendsRename_0 then v10.FriendRequestContext else v10.ConnectionRequestContext
        };
    end;
    if v19.contextType == l_RecommendationContextType_0.Contacts then
        v27 = {
            textKey = v10.FromContacts
        };
    end;
    local v28 = l_React_0.useCallback(v18(v27), {
        v27
    });
    return l_Roact_0.createElement(l_CarouselUserContextualInfo_0, {
        label = {
            text = v28, 
            font = v27.font, 
            colorStyle = v27.colorStyle
        }, 
        lineWidth = v19.lineWidth
    });
end;
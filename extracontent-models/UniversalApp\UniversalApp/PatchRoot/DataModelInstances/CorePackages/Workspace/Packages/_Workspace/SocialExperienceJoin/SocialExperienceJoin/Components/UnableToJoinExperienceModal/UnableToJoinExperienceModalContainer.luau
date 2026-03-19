local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialExperienceJoin");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Navigation);
local v4 = require(l_Parent_0.RobloxAppHooks);
local v5 = require(l_Parent_0.UserProfiles);
local v6 = require(l_Parent_0.RobloxAppNavigation);
local v7 = require(l_script_FirstAncestor_0.Analytics.initializeSocialExperienceJoinAnalytics);
local v8 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_useNavigation_0 = v3.useNavigation;
local l_useNavigationProps_0 = v6.useNavigationProps;
local l_useScreenSize_0 = v4.useScreenSize;
local v12 = require(script.Parent.UnableToJoinExperienceModal);
return function(v13) --[[ Line: 25 ]]
    -- upvalues: l_useNavigation_0 (copy), l_useNavigationProps_0 (copy), v2 (copy), v7 (copy), l_useScreenSize_0 (copy), v5 (copy), v8 (copy), v12 (copy)
    local v14 = l_useNavigation_0();
    local v17 = l_useNavigationProps_0(function(v15, v16) --[[ Line: 27 ]]
        return {
            universeId = v15, 
            userId = v16.userId, 
            openGameDetailsPeekViewClosed = v16.openGameDetailsPeekViewClosed, 
            analyticProps = v16.analyticProps
        };
    end);
    local v18 = v2.useMemo(function() --[[ Line: 36 ]]
        -- upvalues: v7 (ref), v17 (copy)
        return v7(v17.analyticProps);
    end, {
        v17.analyticProps
    });
    local v19 = l_useScreenSize_0();
    local v20 = v5.Hooks.useUserProfilesFetch({
        userIds = {
            v17.userId
        }, 
        query = v5.Queries.userProfilesCombinedNameByUserIds
    });
    local v21 = if v20.data then v5.Selectors.getCombinedNameFromId(v20.data, v17.userId) else "";
    local v22 = v2.useCallback(function() --[[ Line: 49 ]]
        -- upvalues: v14 (copy)
        v14.pop();
    end, {
        v14
    });
    local v23 = v2.useCallback(function() --[[ Line: 53 ]]
        -- upvalues: v18 (copy), v8 (ref), v17 (copy), v22 (copy)
        v18.fireAnalyticsEvent(v8.UnableToJoinCancel, {
            universeId = v17.universeId, 
            profileUserId = v17.userId
        });
        v22();
    end, {
        v22
    });
    local v24 = v2.useCallback(function() --[[ Line: 63 ]]
        -- upvalues: v18 (copy), v8 (ref), v17 (copy), v22 (copy), v13 (copy)
        v18.fireAnalyticsEvent(v8.UnableToJoinViewDetails, {
            universeId = v17.universeId, 
            profileUserId = v17.userId
        });
        v22();
        v13.openGameDetailsPeekView(v17.universeId, {
            mountAsFullView = true, 
            showBackButton = true, 
            onPeekViewClosed = v17.openGameDetailsPeekViewClosed
        });
    end, {
        v14, 
        v17.universeId, 
        v17.userId, 
        v17.openGameDetailsPeekViewClosed, 
        v13.openGameDetailsPeekView, 
        v22
    });
    return v2.createElement(v12, {
        cancel = v23, 
        openGameDetailsPeekView = v24, 
        screenSize = v19, 
        userPrimaryName = v21
    });
end;
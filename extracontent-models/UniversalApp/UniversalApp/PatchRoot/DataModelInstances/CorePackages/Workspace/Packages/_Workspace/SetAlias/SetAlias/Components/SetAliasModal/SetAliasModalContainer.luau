local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.SocialStopwatch);
local v3 = require(l_Parent_1.SocialLuaAnalytics);
local v4 = require(l_Parent_1.RoactUtils);
local v5 = require(l_Parent_0.dependencies);
local v6 = require(script.Parent.SetAliasModal);
local v7 = require(l_Parent_0.Common.Constants);
local v8 = require(l_Parent_0.Analytics);
local l_EventNames_0 = v8.EventNames;
local l_useAnalytics_0 = v8.useAnalytics;
local l_LoadingStages_0 = v3.Analytics.Enums.LoadingStages;
local l_React_0 = v5.React;
local l_NetworkingAliases_0 = v5.NetworkingAliases;
local l_getDeepValue_0 = v5.SocialLibraries.Dictionary.getDeepValue;
local l_useSelector_0 = v5.Hooks.useSelector;
local l_useDispatch_0 = v5.Hooks.useDispatch;
local l_useEffectOnMount_0 = v5.Hooks.useEffectOnMount;
local l_useUserProfilesFetch_0 = v5.UserProfiles.Hooks.useUserProfilesFetch;
local l_userProfilesAllNamesByUserIds_0 = v5.UserProfiles.Queries.userProfilesAllNamesByUserIds;
local l_writeNamesQuery_0 = v5.UserProfiles.Mutations.writeNamesQuery;
local l_useEffectOnce_0 = v4.Hooks.useEffectOnce;
local v22 = {
    Moderated = "Moderated", 
    Success = "Success"
};
return function(v23) --[[ Line: 47 ]]
    -- upvalues: l_useDispatch_0 (copy), v7 (copy), l_React_0 (copy), l_useUserProfilesFetch_0 (copy), l_userProfilesAllNamesByUserIds_0 (copy), l_useAnalytics_0 (copy), l_useSelector_0 (copy), l_getDeepValue_0 (copy), l_useEffectOnMount_0 (copy), l_EventNames_0 (copy), v2 (copy), l_LoadingStages_0 (copy), l_useEffectOnce_0 (copy), l_NetworkingAliases_0 (copy), v22 (copy), l_writeNamesQuery_0 (copy), v6 (copy)
    local v24 = l_useDispatch_0();
    local v25 = v23.navigation.getParam(v7.PROFILE_USER_ID);
    local v26, v27 = l_React_0.useState(false);
    local v28 = l_useUserProfilesFetch_0({
        userIds = {
            v25
        }, 
        query = l_userProfilesAllNamesByUserIds_0
    });
    local v29 = l_useAnalytics_0();
    local v31 = l_useSelector_0(function(v30) --[[ Line: 57 ]]
        return v30.ScreenSize;
    end);
    local v32 = (l_getDeepValue_0(v28, "data.userProfiles") or {})[1] or {};
    local v33 = l_getDeepValue_0(v32, "names.alias");
    local v34 = l_getDeepValue_0(v32, "names.displayName");
    l_useEffectOnMount_0(function() --[[ Line: 67 ]]
        -- upvalues: v29 (copy), l_EventNames_0 (ref)
        if v29 then
            v29.fireAnalyticsEvent(l_EventNames_0.CustomizeNameModalOpened);
        end;
    end);
    l_React_0.useEffect(function() --[[ Line: 73 ]]
        -- upvalues: v2 (ref), v29 (copy), l_EventNames_0 (ref), l_LoadingStages_0 (ref)
        local v35 = v2.Stopwatch.get(v2.Events.CustomizeNameOpened);
        v29.fireAnalyticsEvent(l_EventNames_0.CustomizeNameLoadingStage, {
            status = l_LoadingStages_0.Fetching, 
            statValue = v35 and v35.timeElapsed
        });
        return function() --[[ Line: 80 ]]
            -- upvalues: v2 (ref)
            v2.Stopwatch.stop(v2.Events.CustomizeNameOpened);
        end;
    end, {});
    l_useEffectOnce_0(function() --[[ Line: 85 ]]
        -- upvalues: v2 (ref), v29 (copy), l_EventNames_0 (ref), v28 (copy), l_LoadingStages_0 (ref)
        local v36 = v2.Stopwatch.get(v2.Events.CustomizeNameOpened);
        v29.fireAnalyticsEvent(l_EventNames_0.CustomizeNameLoadingStage, {
            status = if v28.data then l_LoadingStages_0.Done else l_LoadingStages_0.Failed, 
            statValue = v36 and v36.timeElapsed
        });
    end, v28.data or v28.error);
    local function v37() --[[ Line: 93 ]]
        -- upvalues: v23 (copy)
        v23.navigation.pop();
    end;
    local function v40(v38) --[[ Line: 97 ]]
        -- upvalues: v24 (copy), l_NetworkingAliases_0 (ref), v25 (copy), l_getDeepValue_0 (ref), v22 (ref), v27 (copy), v29 (copy), l_EventNames_0 (ref), l_writeNamesQuery_0 (ref), v28 (copy), l_userProfilesAllNamesByUserIds_0 (ref), v32 (copy), v23 (copy)
        return v24(l_NetworkingAliases_0.SetUserTag.API(v25, v38)):andThen(function(v39) --[[ Line: 98 ]]
            -- upvalues: l_getDeepValue_0 (ref), v22 (ref), v27 (ref), v29 (ref), l_EventNames_0 (ref), v38 (copy), l_writeNamesQuery_0 (ref), v28 (ref), l_userProfilesAllNamesByUserIds_0 (ref), v25 (ref), v32 (ref), v23 (ref)
            if l_getDeepValue_0(v39, "responseBody.status") == v22.Moderated then
                v27(true);
                if v29 then
                    v29.fireAnalyticsEvent(l_EventNames_0.CustomizeNameSaveAttemptInvalidInput, {
                        alias = v38
                    });
                end;
                return;
            else
                if v29 then
                    v29.fireAnalyticsEvent(l_EventNames_0.CustomizeNameSaved, {
                        alias = v38
                    });
                end;
                l_writeNamesQuery_0({
                    client = v28.client, 
                    query = l_userProfilesAllNamesByUserIds_0, 
                    userId = v25, 
                    names = {
                        alias = v38, 
                        contactName = l_getDeepValue_0(v32, "names.contactName"), 
                        displayName = l_getDeepValue_0(v32, "names.displayName"), 
                        username = l_getDeepValue_0(v32, "names.username")
                    }
                });
                v23.navigation.pop();
                return;
            end;
        end);
    end;
    return l_React_0.createElement(v6, {
        screenSize = v31, 
        alias = v33, 
        displayName = v34, 
        cancelOnActivated = v37, 
        saveOnActivated = v40, 
        hasSaveAliasError = v26, 
        onTextChanged = function() --[[ Line: 130 ]]
            -- upvalues: v26 (copy), v27 (copy)
            if v26 then
                v27(false);
            end;
        end, 
        isLoading = v28.loading
    });
end;
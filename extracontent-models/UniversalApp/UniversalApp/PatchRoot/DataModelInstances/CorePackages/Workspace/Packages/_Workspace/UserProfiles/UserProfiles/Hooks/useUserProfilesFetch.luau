local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserProfiles");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.RoactUtils);
local v5 = require(l_script_FirstAncestor_0.Analytics.setupFireDiag);
local v6 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local v7 = require(l_script_FirstAncestor_0.Analytics.UserProfilesAnalytics);
local v8 = require(l_Parent_0.SocialCommon);
local l_getDeepValue_0 = require(l_Parent_0.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue;
local l_useApolloAutoRetry_0 = v8.Hooks.useApolloAutoRetry;
local l_useEffectOnce_0 = v4.Hooks.useEffectOnce;
local l_useEffectOnMount_0 = v4.Hooks.useEffectOnMount;
local l_useQuery_0 = require(l_Parent_0.ApolloClient).useQuery;
local v14 = game:DefineFastFlag("UserProfilesEnableRetries", false);
local v15 = require(l_script_FirstAncestor_0.Flags.FFlagUserProfilesLogCancelledRequests);
local v16 = require(l_script_FirstAncestor_0.Flags.FFlagUserProfilesLogErrorCodes);
local v17 = game:DefineFastInt("UserProfileDefaultRetryCount", 2);
local v18 = game:DefineFastFlag("UserProfilesFilterInvalidUserIds", false);
return function(v19) --[[ Line: 29 ]]
    -- upvalues: v18 (copy), v3 (copy), v2 (copy), l_useQuery_0 (copy), v14 (copy), l_useApolloAutoRetry_0 (copy), v17 (copy), v15 (copy), v5 (copy), v7 (copy), l_useEffectOnMount_0 (copy), v6 (copy), l_useEffectOnce_0 (copy), v16 (copy), l_getDeepValue_0 (copy)
    local v20 = nil;
    if v18 then
        v20 = v3.useMemo(function() --[[ Line: 37 ]]
            -- upvalues: v2 (ref), v19 (copy)
            return v2.List.filter(v19.userIds, function(v21) --[[ Line: 38 ]]
                return tonumber(v21) ~= nil;
            end);
        end, {
            v19.userIds
        });
    end;
    local v22 = if v18 then #v20 == 0 else #v19.userIds == 0;
    local v23 = l_useQuery_0(v19.query, {
        errorPolicy = "all", 
        skip = v22 or v19.skip, 
        variables = {
            userIds = if v18 then v20 else v19.userIds
        }
    });
    local l_v23_0 = v23;
    if v14 then
        l_v23_0 = l_useApolloAutoRetry_0(v23, {
            retryCount = if v19.overrideRetryCount then v19.overrideRetryCount else v17
        });
    end;
    local v25 = v3.useRef(l_v23_0.loading or l_v23_0.isRetrying);
    if v15 then
        v25.current = l_v23_0.loading or l_v23_0.isRetrying;
    end;
    local v26 = v3.useMemo(function() --[[ Line: 68 ]]
        -- upvalues: v5 (ref), v7 (ref)
        return v5({
            analytics = {
                Diag = v7.Diag
            }
        });
    end, {});
    local v27 = v3.useRef(DateTime.now());
    l_useEffectOnMount_0(function() --[[ Line: 78 ]]
        -- upvalues: v27 (copy), v26 (copy), v6 (ref)
        v27.current = DateTime.now();
        v26(v6.UserProfilesRequestBegin);
    end);
    if v14 then
        l_useEffectOnce_0(function() --[[ Line: 84 ]]
            -- upvalues: v27 (copy), v26 (copy), v6 (ref), v7 (ref), v16 (ref), l_getDeepValue_0 (ref), l_v23_0 (ref)
            local v28 = nil;
            if v27.current then
                v28 = DateTime.now().UnixTimestampMillis - v27.current.UnixTimestampMillis;
                v26(v6.UserProfilesRequestFail);
                v7.Diag:reportStats(v6.UserProfilesRequestFailDuration, v28);
                if v16 then
                    local v29 = l_getDeepValue_0(l_v23_0, "error.graphQLErrors");
                    if v29 then
                        local v30 = v29[1] or {};
                        local v31 = l_getDeepValue_0(v30, "extensions.status");
                        v26(v6.UserProfilesErrorCode, {
                            status = v31
                        });
                    end;
                end;
            end;
        end, l_v23_0.error);
        l_useEffectOnce_0(function() --[[ Line: 105 ]]
            -- upvalues: v27 (copy), l_v23_0 (ref), v26 (copy), v6 (ref), v7 (ref), v16 (ref), l_getDeepValue_0 (ref)
            local v32 = nil;
            if v27.current then
                v32 = DateTime.now().UnixTimestampMillis - v27.current.UnixTimestampMillis;
                if l_v23_0.data and l_v23_0.retryCount == 0 then
                    v26(v6.UserProfilesRequestSuccess);
                    v7.Diag:reportStats(v6.UserProfilesRequestSuccessDuration, v32);
                    return;
                elseif l_v23_0.data then
                    v26(v6.UserProfilesRequestSuccessAfterRetry);
                    v7.Diag:reportStats(v6.UserProfilesRequestSuccessAfterRetry, v32);
                    return;
                else
                    v26(v6.UserProfilesRequestFailAfterRetry);
                    v7.Diag:reportStats(v6.UserProfilesRequestFailAfterRetryDuration, v32);
                    if v16 then
                        local v33 = l_getDeepValue_0(l_v23_0, "error.graphQLErrors");
                        if v33 then
                            local v34 = v33[1] or {};
                            local v35 = l_getDeepValue_0(v34, "extensions.status");
                            v26(v6.UserProfilesErrorCode, {
                                status = v35
                            });
                        end;
                    end;
                end;
            end;
        end, if v15 then not v25.current else l_v23_0.loading == false and l_v23_0.isRetrying == false);
    end;
    if v15 then
        v3.useEffect(function() --[[ Line: 148 ]]
            -- upvalues: v25 (copy), v26 (copy), v6 (ref)
            return function() --[[ Line: 149 ]]
                -- upvalues: v25 (ref), v26 (ref), v6 (ref)
                if v25.current then
                    v26(v6.UserProfilesUnmountEarly);
                end;
            end;
        end, {});
    end;
    return l_v23_0;
end;
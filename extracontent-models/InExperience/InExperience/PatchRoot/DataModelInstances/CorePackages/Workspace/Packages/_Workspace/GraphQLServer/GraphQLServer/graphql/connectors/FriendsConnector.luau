local l_script_FirstAncestor_0 = script:FindFirstAncestor("GraphQLServer");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_UrlBuilder_0 = require(l_script_FirstAncestor_0.Parent.UrlBuilder).UrlBuilder;
local l_UrlBase_0 = require(l_script_FirstAncestor_0.Parent.UrlBuilder).UrlBase;
local _ = require(l_script_FirstAncestor_0.Parent.LuauPolyfill);
local v5 = require(l_script_FirstAncestor_0.Parent.Promise);
local l_GraphQLError_0 = require(l_script_FirstAncestor_0.Parent.GraphQL).GraphQLError;
local _ = require(l_script_FirstAncestor_0.graphql.generatedTypes);
local v8 = require(l_script_FirstAncestor_0.Parent.Fetch);
local l_fetch_0 = v8.fetch;
local l_Response_0 = v8.Response;
local v11 = require(l_Parent_0.SocialLuaAnalytics);
local l_reportPromiseLoadingTimeWrapper_0 = v11.Analytics.Timing.reportPromiseLoadingTimeWrapper;
local l_createDiagMetricString_0 = v11.Analytics.Formatters.createDiagMetricString;
local l_Diag_0 = v11.Analytics.DefaultAnalyticsService.Diag;
local l_getPlatformSuffix_0 = v11.Analytics.FireEvent.getPlatformSuffix;
local l_PlatformSpecificity_0 = v11.Analytics.Enums.PlatformSpecificity;
local v17 = game:DefineFastFlag("PassRequestIdToFriendsApiCalls", false);
local l_HttpService_0 = game:GetService("HttpService");
local v19 = game:DefineFastFlag("FriendsSortFriendsApiFeatureLoggingEnabled", false);
local v20 = require(l_Parent_0.LoggingProtocol);
local l_SupportedTelemetryBackends_0 = v11.Analytics.Enums.SupportedTelemetryBackends;
local v22 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.FRIENDS, 
    path = "users/{userId}/friends/find", 
    query = {
        {
            name = "limit", 
            value = "{limit}", 
            optional = false
        }, 
        {
            name = "userSort", 
            value = "{userSort}", 
            optional = true
        }, 
        {
            name = "cursor", 
            value = "{cursor}", 
            optional = true
        }
    }
});
local v23 = l_UrlBuilder_0.new({
    base = l_UrlBase_0.FRIENDS, 
    path = "users/{userId}/friends/online", 
    query = {
        {
            name = "userSort", 
            value = "{userSort}", 
            optional = true
        }
    }
});
local function _() --[[ Line: 102 ]]
    -- upvalues: l_HttpService_0 (copy)
    return string.format("friends-sort-%s", l_HttpService_0:GenerateGUID(false));
end;
local v25 = if v17 then v11.Telemetry.createEmitter({
    telemetryImpl = v20.default, 
    defaultTelemetryConfig = {
        throttlingThousandths = game:DefineFastInt("FriendsCommonAnalyticsThrottlingThousandths", 10000), 
        links = "https://docs.google.com/document/d/1uRCdl8pEuiW9wDiOTL39JPMGLhgxtpvVgiXovE8Xof4"
    }, 
    getSharedInfo = function() --[[ Line: 113 ]] --[[ Name: getSharedInfo ]]
        return {};
    end
}) else nil;
local v28 = if v17 then v11.Telemetry.new({
    name = "FriendsSortFeFindFriendsResponse", 
    description = "User making a request to /FindFriends", 
    lastUpdated = {
        2026, 
        3, 
        18
    }, 
    backendsList = {
        {
            type = l_SupportedTelemetryBackends_0.EventIngest, 
            format = function(v26, _) --[[ Line: 127 ]] --[[ Name: format ]]
                return v26;
            end
        }
    }
}) else nil;
local v31 = if v17 then v11.Telemetry.new({
    name = "FriendsSortFeGetAllOnlineFriendsResponse", 
    description = "User making a request to /GetAllOnlineFriends", 
    lastUpdated = {
        2026, 
        3, 
        18
    }, 
    backendsList = {
        {
            type = l_SupportedTelemetryBackends_0.EventIngest, 
            format = function(v29, _) --[[ Line: 143 ]] --[[ Name: format ]]
                return v29;
            end
        }
    }
}) else nil;
local function _(v32, v33, v34, v35) --[[ Line: 151 ]]
    -- upvalues: v25 (copy)
    local v36 = {
        requestId = v32, 
        friendIds = table.concat(v33, ","), 
        sortType = v35
    };
    v25.emit(v34, v36);
end;
local function v54(v38, v39) --[[ Line: 160 ]] --[[ Name: getAllFriendsByUserId ]]
    -- upvalues: l_fetch_0 (copy), v5 (copy), v22 (copy), v17 (copy), l_HttpService_0 (copy), l_Response_0 (copy), l_GraphQLError_0 (copy), v19 (copy), v28 (copy), v25 (copy)
    local v40 = v39 or l_fetch_0;
    return v5.new(function(v41, v42) --[[ Line: 163 ]]
        -- upvalues: v22 (ref), v38 (copy), v17 (ref), l_HttpService_0 (ref), v40 (copy), l_Response_0 (ref), l_GraphQLError_0 (ref), v19 (ref), v28 (ref), v25 (ref)
        local v43 = v22({
            userId = v38.userId, 
            limit = v38.pageLimit or 50, 
            cursor = v38.pageCursor, 
            userSort = v38.sort
        });
        local v44 = if v17 then string.format("friends-sort-%s", l_HttpService_0:GenerateGUID(false)) else nil;
        local v47 = v40(v43, if v17 then {
            method = "GET", 
            headers = {
                ["friends-sort"] = v44
            }
        } else {
            method = "GET"
        }):catch(function(v45) --[[ Line: 178 ]]
            -- upvalues: l_Response_0 (ref)
            local v46 = l_Response_0.error();
            v46.statusText = v45.message;
            return v46;
        end):expect();
        if not v47.ok then
            v42(l_GraphQLError_0.new(v47.statusText, nil, nil, nil, nil, {
                extensions = {
                    status = v47.status, 
                    statusText = v47.statusText
                }
            }));
            return;
        else
            local v48 = v47:json():catch(function() --[[ Line: 197 ]]
                return nil;
            end):expect();
            if not v48 then
                v42(l_GraphQLError_0.new("Failed to decode HTTP response as JSON for friends API"));
                return;
            else
                v41(v48);
                if v17 and v19 then
                    if v44 == nil then
                        return;
                    else
                        local v49 = {};
                        for _, v51 in pairs(v48.PageItems) do
                            table.insert(v49, v51.id);
                        end;
                        local l_v28_0 = v28;
                        local v53 = {
                            requestId = v44, 
                            friendIds = table.concat(v49, ","), 
                            sortType = "FriendScore"
                        };
                        v25.emit(l_v28_0, v53);
                    end;
                end;
                return;
            end;
        end;
    end);
end;
local function v72(v55, v56) --[[ Line: 223 ]] --[[ Name: getOnlineFriendsByUserId ]]
    -- upvalues: l_fetch_0 (copy), v5 (copy), v23 (copy), v17 (copy), l_HttpService_0 (copy), l_Response_0 (copy), l_GraphQLError_0 (copy), v19 (copy), v31 (copy), v25 (copy)
    local v57 = v56 or l_fetch_0;
    return v5.new(function(v58, v59) --[[ Line: 226 ]]
        -- upvalues: v23 (ref), v55 (copy), v17 (ref), l_HttpService_0 (ref), v57 (copy), l_Response_0 (ref), l_GraphQLError_0 (ref), v19 (ref), v31 (ref), v25 (ref)
        local v60 = v23({
            userId = v55.userId, 
            userSort = v55.sort
        });
        local v61 = if v17 then string.format("friends-sort-%s", l_HttpService_0:GenerateGUID(false)) else nil;
        local v64 = v57(v60, if v17 then {
            method = "GET", 
            headers = {
                ["friends-sort"] = v61
            }
        } else {
            method = "GET"
        }):catch(function(v62) --[[ Line: 239 ]]
            -- upvalues: l_Response_0 (ref)
            local v63 = l_Response_0.error();
            v63.statusText = v62.message;
            return v63;
        end):expect();
        if not v64.ok then
            v59(l_GraphQLError_0.new(v64.statusText, nil, nil, nil, nil, {
                extensions = {
                    status = v64.status, 
                    statusText = v64.statusText
                }
            }));
            return;
        else
            local v65 = v64:json():catch(function() --[[ Line: 258 ]]
                return nil;
            end):expect();
            if not v65 then
                v59(l_GraphQLError_0.new("Failed to decode HTTP response as JSON for friends API"));
                return;
            else
                local v66 = v65.data or {};
                v58(v66);
                if v17 and v19 then
                    if v61 == nil then
                        return;
                    else
                        local v67 = {};
                        for _, v69 in v66 do
                            table.insert(v67, v69.id);
                        end;
                        local l_v31_0 = v31;
                        local v71 = {
                            requestId = v61, 
                            friendIds = table.concat(v67, ","), 
                            sortType = "Carousel"
                        };
                        v25.emit(l_v31_0, v71);
                    end;
                end;
                return;
            end;
        end;
    end);
end;
local function v77(v73, v74, v75) --[[ Line: 285 ]] --[[ Name: fireLoadingEvent ]]
    -- upvalues: l_createDiagMetricString_0 (copy), l_getPlatformSuffix_0 (copy), l_PlatformSpecificity_0 (copy), l_Diag_0 (copy)
    local v76 = l_createDiagMetricString_0(v73, v74) .. l_getPlatformSuffix_0(l_PlatformSpecificity_0.BucketsOnly);
    l_Diag_0:reportStats(v76, v75);
end;
return {
    getAllFriendsByUserId = l_reportPromiseLoadingTimeWrapper_0(v54, function(v78) --[[ Line: 293 ]]
        return {
            fetch = "friends_find", 
            nextPage = v78.pageCursor and v78.pageCursor ~= ""
        };
    end, {
        fireEvent = v77
    }), 
    getOnlineFriendsByUserId = l_reportPromiseLoadingTimeWrapper_0(v72, function(_) --[[ Line: 301 ]]
        return {
            fetch = "friends_online"
        };
    end, {
        fireEvent = v77
    })
};
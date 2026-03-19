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
local v17 = l_UrlBuilder_0.new({
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
local v18 = l_UrlBuilder_0.new({
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
local function v29(v19, v20) --[[ Line: 87 ]] --[[ Name: getAllFriendsByUserId ]]
    -- upvalues: l_fetch_0 (copy), v5 (copy), v17 (copy), l_Response_0 (copy), l_GraphQLError_0 (copy)
    local v21 = v20 or l_fetch_0;
    return v5.new(function(v22, v23) --[[ Line: 90 ]]
        -- upvalues: v17 (ref), v19 (copy), v21 (copy), l_Response_0 (ref), l_GraphQLError_0 (ref)
        local v24 = v17({
            userId = v19.userId, 
            limit = v19.pageLimit or 50, 
            cursor = v19.pageCursor, 
            userSort = v19.sort
        });
        local v27 = v21(v24, {
            method = "GET"
        }):catch(function(v25) --[[ Line: 99 ]]
            -- upvalues: l_Response_0 (ref)
            local v26 = l_Response_0.error();
            v26.statusText = v25.message;
            return v26;
        end):expect();
        if not v27.ok then
            v23(l_GraphQLError_0.new(v27.statusText, nil, nil, nil, nil, {
                extensions = {
                    status = v27.status, 
                    statusText = v27.statusText
                }
            }));
            return;
        else
            local v28 = v27:json():catch(function() --[[ Line: 118 ]]
                return nil;
            end):expect();
            if not v28 then
                v23(l_GraphQLError_0.new("Failed to decode HTTP response as JSON for friends API"));
                return;
            else
                v22(v28);
                return;
            end;
        end;
    end);
end;
local function v40(v30, v31) --[[ Line: 133 ]] --[[ Name: getOnlineFriendsByUserId ]]
    -- upvalues: l_fetch_0 (copy), v5 (copy), v18 (copy), l_Response_0 (copy), l_GraphQLError_0 (copy)
    local v32 = v31 or l_fetch_0;
    return v5.new(function(v33, v34) --[[ Line: 136 ]]
        -- upvalues: v18 (ref), v30 (copy), v32 (copy), l_Response_0 (ref), l_GraphQLError_0 (ref)
        local v35 = v18({
            userId = v30.userId, 
            userSort = v30.sort
        });
        local v38 = v32(v35, {
            method = "GET"
        }):catch(function(v36) --[[ Line: 143 ]]
            -- upvalues: l_Response_0 (ref)
            local v37 = l_Response_0.error();
            v37.statusText = v36.message;
            return v37;
        end):expect();
        if not v38.ok then
            v34(l_GraphQLError_0.new(v38.statusText, nil, nil, nil, nil, {
                extensions = {
                    status = v38.status, 
                    statusText = v38.statusText
                }
            }));
            return;
        else
            local v39 = v38:json():catch(function() --[[ Line: 162 ]]
                return nil;
            end):expect();
            if not v39 then
                v34(l_GraphQLError_0.new("Failed to decode HTTP response as JSON for friends API"));
                return;
            else
                v33(v39.data or {});
                return;
            end;
        end;
    end);
end;
local function v45(v41, v42, v43) --[[ Line: 178 ]] --[[ Name: fireLoadingEvent ]]
    -- upvalues: l_createDiagMetricString_0 (copy), l_getPlatformSuffix_0 (copy), l_PlatformSpecificity_0 (copy), l_Diag_0 (copy)
    local v44 = l_createDiagMetricString_0(v41, v42) .. l_getPlatformSuffix_0(l_PlatformSpecificity_0.BucketsOnly);
    l_Diag_0:reportStats(v44, v43);
end;
return {
    getAllFriendsByUserId = l_reportPromiseLoadingTimeWrapper_0(v29, function(v46) --[[ Line: 186 ]]
        return {
            fetch = "friends_find", 
            nextPage = v46.pageCursor and v46.pageCursor ~= ""
        };
    end, {
        fireEvent = v45
    }), 
    getOnlineFriendsByUserId = l_reportPromiseLoadingTimeWrapper_0(v40, function(_) --[[ Line: 194 ]]
        return {
            fetch = "friends_online"
        };
    end, {
        fireEvent = v45
    })
};
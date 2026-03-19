local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Signals);
local v3 = require(l_script_FirstAncestor_0.createDataCache);
local v4 = require(l_script_FirstAncestor_0.createDataResolver);
local _ = require(l_script_FirstAncestor_0.DataHydrationTypes);
local v6 = require(l_Parent_0.DiscoveryUtils);
local _ = require(l_Parent_0.LuauPolyfill);
local l_logResponseError_0 = v6.logResponseError;
local l_DiscoveryEventErrorLogger_0 = v6.DiscoveryEventErrorLogger;
local v10 = require(script.Parent.fetchFollowing);
local v11 = require(script.Parent.requestUpdateFollowing);
local v12 = require(script.Parent.FollowingsStoreTypes);
local v13 = require(script.Parent.FollowingsUrlBuilder);
local l_FFlagLuaAppDataHydrationUpdateItem_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppDataHydrationUpdateItem;
return function() --[[ Line: 22 ]] --[[ Name: createFollowingsStore ]]
    -- upvalues: v3 (copy), v4 (copy), l_logResponseError_0 (copy), v13 (copy), v10 (copy), v12 (copy), l_DiscoveryEventErrorLogger_0 (copy), v2 (copy), v11 (copy), l_FFlagLuaAppDataHydrationUpdateItem_0 (copy)
    local v15 = v3();
    local v16 = nil;
    local v25 = v4({
        cache = v15, 
        supportsMultiGet = false, 
        logError = function(v17) --[[ Line: 30 ]] --[[ Name: logError ]]
            -- upvalues: l_logResponseError_0 (ref), v13 (ref)
            l_logResponseError_0(v13.FOLLOWING_STATUS_URL, v17);
        end, 
        onClear = function() --[[ Line: 34 ]] --[[ Name: onClear ]]
            -- upvalues: v16 (ref)
            v16 = nil;
        end, 
        fetchFn = function(v18, _) --[[ Line: 38 ]] --[[ Name: fetchFn ]]
            -- upvalues: v10 (ref), v12 (ref), l_DiscoveryEventErrorLogger_0 (ref), v16 (ref)
            return v10(v18):andThen(function(v20) --[[ Line: 43 ]]
                -- upvalues: v12 (ref), l_DiscoveryEventErrorLogger_0 (ref), v16 (ref)
                local l_responseBody_0 = v20.responseBody;
                if not v12.followingResponseValidator(l_responseBody_0) then
                    l_DiscoveryEventErrorLogger_0.reportError("createFollowingsStore", "Invalid following response", {
                        universeId = l_responseBody_0.UniverseId, 
                        isFollowing = l_responseBody_0.IsFollowing, 
                        userId = l_responseBody_0.UserId, 
                        canFollow = l_responseBody_0.CanFollow
                    });
                    error({
                        StatusCode = v20.responseCode
                    });
                end;
                if l_responseBody_0.FollowingCountByType and l_responseBody_0.FollowingLimitByType then
                    v16 = {
                        followingCountByType = l_responseBody_0.FollowingCountByType, 
                        followingLimitByType = l_responseBody_0.FollowingLimitByType
                    };
                end;
                return {
                    universeId = tostring(l_responseBody_0.UniverseId), 
                    userId = tostring(l_responseBody_0.UserId), 
                    canFollow = l_responseBody_0.CanFollow, 
                    isFollowing = l_responseBody_0.IsFollowing
                };
            end):catch(function(v22) --[[ Line: 74 ]]
                -- upvalues: l_DiscoveryEventErrorLogger_0 (ref), v18 (copy)
                local v23 = false;
                if type(v22) == "table" then
                    v23 = v22.ClientError ~= nil;
                end;
                if v23 then
                    local v24 = v22.message or v22.ClientError;
                    l_DiscoveryEventErrorLogger_0.reportError("createFollowingsStore", "Client validation error fetching following", {
                        universeId = v18, 
                        clientError = v24
                    });
                    return;
                else
                    error(v22);
                    return;
                end;
            end);
        end
    });
    local function v41(v26, v27) --[[ Line: 95 ]] --[[ Name: updateFollowing ]]
        -- upvalues: v2 (ref), v15 (copy), v16 (ref), v11 (ref), l_DiscoveryEventErrorLogger_0 (ref), l_logResponseError_0 (ref), v13 (ref)
        local v28, v29 = v2.createSignal(nil);
        local v30 = v15.getItem(v26);
        local v31 = v30 and v30.data(false);
        local v32 = if v31 then v31.isFollowing else nil;
        local l_v16_0 = v16;
        if v27 and l_v16_0 and l_v16_0.followingCountByType >= l_v16_0.followingLimitByType then
            v29({
                type = "error", 
                errorType = "LimitReached", 
                statusCode = nil, 
                statusMessage = nil
            });
            return v28;
        else
            v15.updateItem(v26, {
                isFollowing = v27
            });
            if l_v16_0 then
                local v34 = v27 and 1 or -1;
                v16 = {
                    followingCountByType = (l_v16_0 and l_v16_0.followingCountByType or 0) + v34, 
                    followingLimitByType = l_v16_0.followingLimitByType
                };
            end;
            v11(v26, v27):andThen(function() --[[ Line: 143 ]]
                -- upvalues: v29 (copy), v27 (copy)
                v29({
                    type = "success", 
                    isFollowing = v27
                });
            end):catch(function(v35) --[[ Line: 149 ]]
                -- upvalues: v15 (ref), v26 (copy), v32 (copy), l_v16_0 (copy), v16 (ref), v29 (copy), l_DiscoveryEventErrorLogger_0 (ref), v27 (copy), l_logResponseError_0 (ref), v13 (ref)
                v15.updateItem(v26, {
                    isFollowing = v32
                });
                if l_v16_0 then
                    v16 = l_v16_0;
                end;
                local v36 = false;
                if type(v35) == "table" then
                    v36 = v35.ClientError ~= nil;
                end;
                local v37 = if v36 then v35.message or v35.ClientError else nil;
                local v38 = if type(v35) == "table" and v35.StatusCode then v35.StatusCode else nil;
                local v39 = if type(v35) == "table" and v35.StatusMessage then v35.StatusMessage else nil;
                local v40 = nil;
                v40 = v36 and "ClientError" or v38 == 400 and "LimitReached" or "NetworkError";
                v29({
                    type = "error", 
                    errorType = v40, 
                    statusCode = v38, 
                    statusMessage = v37 or v39
                });
                if v36 then
                    l_DiscoveryEventErrorLogger_0.reportError("updateFollowing", "Client validation error updating following", {
                        universeId = v26, 
                        method = v27 and "POST" or "DELETE", 
                        clientError = v37
                    });
                    return;
                else
                    l_logResponseError_0(v13.FOLLOWING_UPDATE_URL, {
                        StatusCode = v38
                    });
                    l_DiscoveryEventErrorLogger_0.reportError("updateFollowing", "Error updating following", {
                        universeId = v26, 
                        statusCode = v38, 
                        method = v27 and "POST" or "DELETE", 
                        statusMessage = v39
                    });
                    return;
                end;
            end);
            return v28;
        end;
    end;
    local function v42() --[[ Line: 212 ]] --[[ Name: clear ]]
        -- upvalues: v16 (ref), v25 (copy)
        v16 = nil;
        v25.clear();
    end;
    return {
        fetchFollowing = v25.fetchItem, 
        fetchFollowings = v25.fetchItems, 
        getFollowing = v25.getCachedItem, 
        getFollowings = v25.getCachedItems, 
        getAndFetchFollowing = v25.getAndFetchItem, 
        getAndFetchFollowings = v25.getAndFetchItems, 
        updateFollowing = v41, 
        updateItem = if l_FFlagLuaAppDataHydrationUpdateItem_0 then v15.updateItem else nil, 
        updateUserFollowingLimits = l_FFlagLuaAppDataHydrationUpdateItem_0 and function(v43) --[[ Line: 234 ]]
            -- upvalues: v16 (ref)
            v16 = v43;
        end or nil, 
        clear = v42, 
        dispose = function() --[[ Line: 217 ]] --[[ Name: dispose ]]
            -- upvalues: v25 (copy)
            v25.dispose();
        end
    };
end;
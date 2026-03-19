local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_script_FirstAncestor_0.createDataCache);
local v4 = require(l_script_FirstAncestor_0.createDataResolver);
local _ = require(l_script_FirstAncestor_0.DataHydrationTypes);
local v6 = require(script.Parent.fetchPlayability);
local v7 = require(script.Parent.PlayabilityStoreTypes);
local v8 = require(l_Parent_0.DiscoveryUtils);
local l_logResponseError_0 = v8.logResponseError;
local l_DiscoveryEventErrorLogger_0 = v8.DiscoveryEventErrorLogger;
local v11 = require(l_Parent_0.SharedFlags).GetFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds();
return function() --[[ Line: 23 ]] --[[ Name: createPlayabilityStore ]]
    -- upvalues: v3 (copy), v11 (copy), v4 (copy), l_logResponseError_0 (copy), l_DiscoveryEventErrorLogger_0 (copy), v2 (copy), v6 (copy), v7 (copy)
    local v12 = v3(v11);
    local v23 = v4({
        cache = v12, 
        logError = function(v13) --[[ Line: 28 ]] --[[ Name: logError ]]
            -- upvalues: l_logResponseError_0 (ref), l_DiscoveryEventErrorLogger_0 (ref)
            if type(v13) == "table" then
                if v13.responseCode then
                    l_logResponseError_0("v1/games/multiget-playability-status", {
                        StatusCode = tonumber(v13.responseCode)
                    });
                end;
                if v13.errorType and v13.errorMessage then
                    l_DiscoveryEventErrorLogger_0.reportError(v13.errorType, v13.errorMessage, v13.customFields);
                    return;
                end;
            else
                l_DiscoveryEventErrorLogger_0.reportError("FetchPlayabilityError", (tostring(v13)));
            end;
        end, 
        fetchFn = function(v14) --[[ Line: 48 ]] --[[ Name: fetchFn ]]
            -- upvalues: v2 (ref), v6 (ref), v7 (ref)
            local v15 = v2.keys(v14);
            return v6(v15):andThen(function(v16) --[[ Line: 53 ]]
                -- upvalues: v15 (copy), v7 (ref)
                if not v16 or not v16.responseBody then
                    error({
                        responseCode = v16 and v16.responseCode, 
                        errorType = "FetchPlayabilityResponseError", 
                        errorMessage = v16 and "Missing response body" or "No response", 
                        customFields = {
                            universeIds = v15
                        }
                    });
                end;
                local v17, v18 = v7.playabilityResponseValidator(v16.responseBody);
                if not v17 then
                    error({
                        responseCode = v16.responseCode, 
                        errorType = "FetchPlayabilityResponseInvalidInterface", 
                        errorMessage = v18, 
                        customFields = {
                            universeIds = v15
                        }
                    });
                end;
                local v19 = {};
                for _, v21 in v16.responseBody do
                    v19[tostring(v21.universeId)] = {
                        isPlayable = v21.isPlayable, 
                        playabilityStatus = v21.playabilityStatus
                    };
                end;
                return v19;
            end):catch(function(v22) --[[ Line: 85 ]]
                error(v22);
            end);
        end
    });
    return {
        fetchPlayability = v23.fetchItem, 
        getPlayability = v23.getCachedItem, 
        getAndFetchPlayability = v23.getAndFetchItem, 
        clear = v23.clear, 
        dispose = v23.dispose
    };
end;
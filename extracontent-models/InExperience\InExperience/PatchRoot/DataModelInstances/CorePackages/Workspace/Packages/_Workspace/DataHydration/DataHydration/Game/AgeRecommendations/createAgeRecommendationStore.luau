local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.DiscoveryUtils);
local l_logResponseError_0 = v2.logResponseError;
local l_DiscoveryEventErrorLogger_0 = v2.DiscoveryEventErrorLogger;
local v5 = require(l_script_FirstAncestor_0.createDataCache);
local v6 = require(l_script_FirstAncestor_0.createDataResolver);
local _ = require(l_script_FirstAncestor_0.DataHydrationTypes);
local v8 = require(script.Parent.fetchAgeRecommendation);
local v9 = require(script.Parent.AgeRecommendationStoreTypes);
return function() --[[ Line: 16 ]] --[[ Name: createAgeRecommendationStore ]]
    -- upvalues: v5 (copy), v6 (copy), l_logResponseError_0 (copy), l_DiscoveryEventErrorLogger_0 (copy), v8 (copy), v9 (copy)
    local v10 = v5();
    local v20 = v6({
        cache = v10, 
        requestBatchSize = 1, 
        logError = function(v11) --[[ Line: 23 ]] --[[ Name: logError ]]
            -- upvalues: l_logResponseError_0 (ref), l_DiscoveryEventErrorLogger_0 (ref)
            if type(v11) == "table" then
                if v11.responseCode then
                    l_logResponseError_0("experience-guidelines-api/get-age-recommendation", {
                        StatusCode = tonumber(v11.responseCode)
                    });
                end;
                if v11.errorType and v11.errorMessage then
                    l_DiscoveryEventErrorLogger_0.reportError(v11.errorType, v11.errorMessage, v11.customFields);
                    return;
                end;
            else
                l_DiscoveryEventErrorLogger_0.reportError("FetchAgeRecommendationError", (tostring(v11)));
            end;
        end, 
        fetchFn = function(v12) --[[ Line: 43 ]] --[[ Name: fetchFn ]]
            -- upvalues: v8 (ref), v9 (ref)
            local v13 = next(v12);
            if not v13 then
                error({
                    errorType = "CreateAgeRecommendationStoreMissingUniverseId", 
                    errorMessage = "CreateAgeRecommendationStore requires universeId", 
                    customFields = {
                        universeId = v13
                    }
                });
            end;
            return v8(v13):andThen(function(v14) --[[ Line: 55 ]]
                -- upvalues: v13 (copy), v9 (ref)
                if not v14 or not v14.responseBody then
                    error({
                        responseCode = v14 and v14.responseCode, 
                        errorType = "FetchAgeRecommendationResponseError", 
                        errorMessage = v14 and "Missing response body" or "No response", 
                        customFields = {
                            universeId = v13
                        }
                    });
                end;
                local v15, v16 = v9.ageRecommendationResponseValidator(v14.responseBody);
                if not v15 then
                    error({
                        responseCode = v14.responseCode, 
                        errorType = "FetchAgeRecommendationResponseInvalidInterface", 
                        errorMessage = v16, 
                        customFields = {
                            universeId = v13
                        }
                    });
                end;
                local v17 = {};
                local l_ageRecommendation_0 = v14.responseBody.ageRecommendationDetails.summary.ageRecommendation;
                v17[v13] = {
                    displayName = l_ageRecommendation_0.displayName, 
                    displayNameWithHeaderShort = l_ageRecommendation_0.displayNameWithHeaderShort
                };
                return v17;
            end):catch(function(v19) --[[ Line: 86 ]]
                error(v19);
            end);
        end
    });
    return {
        fetchAgeRecommendation = v20.fetchItem, 
        getAgeRecommendation = v20.getCachedItem, 
        getAndFetchAgeRecommendation = v20.getAndFetchItem, 
        clear = v20.clear, 
        dispose = v20.dispose
    };
end;
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
local l_FFlagSduiExperienceDetailsSupport_0 = require(l_Parent_0.SharedFlags).FFlagSduiExperienceDetailsSupport;
return function() --[[ Line: 18 ]] --[[ Name: createAgeRecommendationStore ]]
    -- upvalues: v5 (copy), v6 (copy), l_logResponseError_0 (copy), l_DiscoveryEventErrorLogger_0 (copy), v8 (copy), v9 (copy), l_FFlagSduiExperienceDetailsSupport_0 (copy)
    local v11 = v5();
    local v21 = v6({
        cache = v11, 
        requestBatchSize = 1, 
        logError = function(v12) --[[ Line: 25 ]] --[[ Name: logError ]]
            -- upvalues: l_logResponseError_0 (ref), l_DiscoveryEventErrorLogger_0 (ref)
            if type(v12) == "table" then
                if v12.responseCode then
                    l_logResponseError_0("experience-guidelines-api/get-age-recommendation", {
                        StatusCode = tonumber(v12.responseCode)
                    });
                end;
                if v12.errorType and v12.errorMessage then
                    l_DiscoveryEventErrorLogger_0.reportError(v12.errorType, v12.errorMessage, v12.customFields);
                    return;
                end;
            else
                l_DiscoveryEventErrorLogger_0.reportError("FetchAgeRecommendationError", (tostring(v12)));
            end;
        end, 
        fetchFn = function(v13) --[[ Line: 45 ]] --[[ Name: fetchFn ]]
            -- upvalues: v8 (ref), v9 (ref), l_FFlagSduiExperienceDetailsSupport_0 (ref)
            local v14 = next(v13);
            if not v14 then
                error({
                    errorType = "CreateAgeRecommendationStoreMissingUniverseId", 
                    errorMessage = "CreateAgeRecommendationStore requires universeId", 
                    customFields = {
                        universeId = v14
                    }
                });
            end;
            return v8(v14):andThen(function(v15) --[[ Line: 57 ]]
                -- upvalues: v14 (copy), v9 (ref), l_FFlagSduiExperienceDetailsSupport_0 (ref)
                if not v15 or not v15.responseBody then
                    error({
                        responseCode = v15 and v15.responseCode, 
                        errorType = "FetchAgeRecommendationResponseError", 
                        errorMessage = v15 and "Missing response body" or "No response", 
                        customFields = {
                            universeId = v14
                        }
                    });
                end;
                local v16, v17 = v9.ageRecommendationResponseValidator(v15.responseBody);
                if not v16 then
                    error({
                        responseCode = v15.responseCode, 
                        errorType = "FetchAgeRecommendationResponseInvalidInterface", 
                        errorMessage = v17, 
                        customFields = {
                            universeId = v14
                        }
                    });
                end;
                local v18 = {};
                local l_ageRecommendation_0 = v15.responseBody.ageRecommendationDetails.summary.ageRecommendation;
                v18[v14] = {
                    displayName = l_ageRecommendation_0.displayName, 
                    displayNameWithHeaderShort = l_ageRecommendation_0.displayNameWithHeaderShort, 
                    igrsRating = if l_FFlagSduiExperienceDetailsSupport_0 then l_ageRecommendation_0.igrsRating else nil, 
                    igrsRatingDisplayMessage = if l_FFlagSduiExperienceDetailsSupport_0 then l_ageRecommendation_0.igrsRatingDisplayMessage else nil
                };
                return v18;
            end):catch(function(v20) --[[ Line: 94 ]]
                error(v20);
            end);
        end
    });
    return {
        fetchAgeRecommendation = v21.fetchItem, 
        getAgeRecommendation = v21.getCachedItem, 
        getAndFetchAgeRecommendation = v21.getAndFetchItem, 
        updateAgeRecommendations = if l_FFlagSduiExperienceDetailsSupport_0 then v11.updateItems else nil, 
        clear = v21.clear, 
        dispose = v21.dispose
    };
end;
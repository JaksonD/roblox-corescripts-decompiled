local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExperienceLoadingScript");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.DataHydration);
local l_createDataCache_0 = v2.createDataCache;
local l_createDataResolver_0 = v2.createDataResolver;
local v5 = require(script.Parent.fetchPlayerLocalizationChoice);
local v6 = require(l_script_FirstAncestor_0.LoadingScreenTelemetry);
return function() --[[ Line: 18 ]] --[[ Name: createLoadingScreenStore ]]
    -- upvalues: l_createDataCache_0 (copy), l_createDataResolver_0 (copy), v6 (copy), v5 (copy)
    local v7 = l_createDataCache_0();
    local v14 = l_createDataResolver_0({
        cache = v7, 
        supportsMultiGet = false, 
        logError = function(v8) --[[ Line: 23 ]] --[[ Name: logError ]]
            -- upvalues: v6 (ref)
            if type(v8) == "table" then
                v6.countPlayerLocalizationChoiceFailed({
                    responseCode = v8.responseCode, 
                    errorType = v8.errorType
                });
                return;
            else
                v6.countPlayerLocalizationChoiceFailed({
                    errorType = "PlayerLocalizationChoiceFetchError"
                });
                return;
            end;
        end, 
        fetchFn = function(v9, _) --[[ Line: 40 ]] --[[ Name: fetchFn ]]
            -- upvalues: v5 (ref)
            return v5(v9):andThen(function(v11) --[[ Line: 42 ]]
                -- upvalues: v9 (copy)
                if not v11 or not v11.responseBody then
                    error({
                        responseCode = v11 and v11.responseCode, 
                        errorType = "PlayerLocalizationChoiceResponseError", 
                        errorMessage = v11 and "Missing response body" or "No response", 
                        customFields = {
                            universeId = v9
                        }
                    });
                end;
                local l_responseBody_0 = v11.responseBody;
                if l_responseBody_0.IsPlayerChoiceEnabled == nil then
                    error({
                        responseCode = v11.responseCode, 
                        errorType = "PlayerLocalizationChoiceMissingKey", 
                        errorMessage = "Missing IsPlayerChoiceEnabled in response body", 
                        customFields = {
                            universeId = v9, 
                            responseBody = l_responseBody_0
                        }
                    });
                end;
                return l_responseBody_0;
            end):catch(function(v13) --[[ Line: 65 ]]
                error(v13);
            end);
        end
    });
    return {
        getAndFetchPlayerLocalizationChoice = v14.getAndFetchItem, 
        getCachedPlayerLocalizationChoice = v14.getCachedItem, 
        clear = function() --[[ Line: 71 ]] --[[ Name: clear ]]
            -- upvalues: v7 (copy), v14 (copy)
            v7.clear();
            v14.clear();
        end, 
        dispose = function() --[[ Line: 76 ]] --[[ Name: dispose ]]
            -- upvalues: v14 (copy)
            v14.dispose();
        end
    };
end;
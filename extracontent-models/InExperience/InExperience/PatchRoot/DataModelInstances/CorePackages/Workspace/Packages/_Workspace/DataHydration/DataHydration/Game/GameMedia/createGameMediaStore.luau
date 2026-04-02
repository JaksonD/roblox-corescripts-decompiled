local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_DiscoveryEventErrorLogger_0 = require(l_Parent_0.DiscoveryUtils).DiscoveryEventErrorLogger;
local v3 = require(l_script_FirstAncestor_0.createDataCache);
local v4 = require(l_script_FirstAncestor_0.createDataResolver);
local _ = require(l_script_FirstAncestor_0.DataHydrationTypes);
local v6 = require(script.Parent.fetchGameMedia);
local v7 = require(script.Parent.GameMediaStoreTypes);
return function() --[[ Line: 16 ]] --[[ Name: createGameMediaStore ]]
    -- upvalues: v3 (copy), v4 (copy), l_DiscoveryEventErrorLogger_0 (copy), v6 (copy), v7 (copy)
    local v8 = v3();
    local v19 = v4({
        cache = v8, 
        supportsMultiGet = false, 
        logError = function(v9) --[[ Line: 21 ]] --[[ Name: logError ]]
            -- upvalues: l_DiscoveryEventErrorLogger_0 (ref)
            if type(v9) == "table" and v9.errorType then
                l_DiscoveryEventErrorLogger_0.reportError(v9.errorType, v9.errorMessage);
                return;
            else
                l_DiscoveryEventErrorLogger_0.reportError("FetchGameMediaError", (tostring(v9)));
                return;
            end;
        end, 
        fetchFn = function(v10, _) --[[ Line: 28 ]] --[[ Name: fetchFn ]]
            -- upvalues: v6 (ref), v7 (ref)
            return v6(v10):andThen(function(v12) --[[ Line: 29 ]]
                -- upvalues: v7 (ref)
                if not v12 or not v12.responseBody then
                    error({
                        errorType = "FetchGameMediaResponseError", 
                        errorMessage = v12 and "Missing response body" or "No response"
                    });
                end;
                local v13, v14 = v7.gameMediaResponseValidator(v12.responseBody);
                if not v13 then
                    error({
                        errorType = "FetchGameMediaResponseInvalidInterface", 
                        errorMessage = v14
                    });
                end;
                local v15 = {};
                local l_data_0 = v12.responseBody.data;
                if l_data_0 then
                    for _, v18 in l_data_0 do
                        if v18.imageId then
                            table.insert(v15, {
                                imageId = v18.imageId, 
                                assetTypeId = v18.assetTypeId, 
                                videoId = v18.videoId, 
                                videoHash = v18.videoHash, 
                                videoTitle = v18.videoTitle
                            });
                        end;
                    end;
                end;
                return v15;
            end);
        end
    });
    return {
        getAndFetchGameMedia = v19.getAndFetchItem, 
        getGameMedia = v19.getCachedItem, 
        clear = v19.clear, 
        dispose = v19.dispose
    };
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.createDataCache);
local v3 = require(l_script_FirstAncestor_0.createDataResolver);
local _ = require(l_script_FirstAncestor_0.DataHydrationTypes);
local v5 = require(script.Parent.UserVoteFeedbackMetadataStoreTypes);
local v6 = require(l_Parent_0.DiscoveryUtils);
local l_logResponseError_0 = v6.logResponseError;
local l_DiscoveryEventErrorLogger_0 = v6.DiscoveryEventErrorLogger;
local v9 = require(script.Parent.fetchUserVoteFeedbackMetadata);
local v10 = require(script.Parent.UserVoteFeedbackMetdataUrlBuilder);
return function() --[[ Line: 16 ]] --[[ Name: createUserVoteFeedbackMetadataStore ]]
    -- upvalues: v2 (copy), v3 (copy), l_logResponseError_0 (copy), v10 (copy), v9 (copy), v5 (copy), l_DiscoveryEventErrorLogger_0 (copy)
    local v11 = v2();
    local v17 = v3({
        cache = v11, 
        supportsMultiGet = false, 
        logError = function(v12) --[[ Line: 23 ]] --[[ Name: logError ]]
            -- upvalues: l_logResponseError_0 (ref), v10 (ref)
            l_logResponseError_0(v10.USER_VOTE_FEEDBACK_METADATA_URL, v12);
        end, 
        fetchFn = function(v13, _) --[[ Line: 26 ]] --[[ Name: fetchFn ]]
            -- upvalues: v9 (ref), v5 (ref), l_DiscoveryEventErrorLogger_0 (ref)
            return v9(v13):andThen(function(v15) --[[ Line: 32 ]]
                -- upvalues: v5 (ref), l_DiscoveryEventErrorLogger_0 (ref), v13 (copy)
                local l_responseBody_0 = v15.responseBody;
                if not v5.userVoteFeedbackMetadataResponseValidator(l_responseBody_0) then
                    l_DiscoveryEventErrorLogger_0.reportError("createUserVoteFeedbackMetadataStore", "Invalid user vote feedback metadata response", {
                        rootPlaceId = v13, 
                        responseBody = l_responseBody_0
                    });
                    error({
                        StatusCode = v15.responseCode
                    });
                end;
                return {
                    rootPlaceId = v13, 
                    canSubmitReview = l_responseBody_0.capabilities and l_responseBody_0.capabilities.can_submit_review, 
                    canSubmitComment = l_responseBody_0.capabilities and l_responseBody_0.capabilities.can_submit_comment, 
                    categories = l_responseBody_0.categories or {}, 
                    comment = l_responseBody_0.comment or {}, 
                    metadata = l_responseBody_0.metadata or {}
                };
            end);
        end
    });
    return {
        fetchUserVoteFeedbackMetadata = v17.fetchItem, 
        fetchUserVoteFeedbackMetadatas = v17.fetchItems, 
        getUserVoteFeedbackMetadata = v17.getCachedItem, 
        getUserVoteFeedbackMetadatas = v17.getCachedItems, 
        getAndFetchUserVoteFeedbackMetadata = v17.getAndFetchItem, 
        getAndFetchUserVoteFeedbackMetadatas = v17.getAndFetchItems, 
        clearItem = function(v18) --[[ Line: 79 ]] --[[ Name: clearItem ]]
            -- upvalues: v11 (copy)
            v11.replaceItem(v18, nil);
        end, 
        clear = function() --[[ Line: 62 ]] --[[ Name: clear ]]
            -- upvalues: v11 (copy), v17 (copy)
            v11.clear();
            v17.clear();
        end, 
        dispose = function() --[[ Line: 67 ]] --[[ Name: dispose ]]
            -- upvalues: v17 (copy)
            v17.dispose();
        end
    };
end;
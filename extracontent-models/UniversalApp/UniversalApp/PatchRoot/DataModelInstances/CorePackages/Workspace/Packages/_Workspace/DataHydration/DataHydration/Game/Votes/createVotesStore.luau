local l_script_FirstAncestor_0 = script:FindFirstAncestor("DataHydration");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Dash);
local v3 = require(l_Parent_0.Signals);
local l_HttpService_0 = game:GetService("HttpService");
local v5 = require(l_script_FirstAncestor_0.createDataCache);
local v6 = require(l_script_FirstAncestor_0.createDataResolver);
local _ = require(l_script_FirstAncestor_0.DataHydrationTypes);
local v8 = require(script.Parent.VotesStoreTypes);
local v9 = require(script.Parent.VotesUtils);
local v10 = require(l_Parent_0.DiscoveryUtils);
local l_StatusCodes_0 = require(l_Parent_0.Http).StatusCodes;
local l_logResponseError_0 = v10.logResponseError;
local l_DiscoveryEventErrorLogger_0 = v10.DiscoveryEventErrorLogger;
local v14 = require(script.Parent.fetchVotes);
local v15 = require(script.Parent.fetchUserVote);
local v16 = require(script.Parent.requestUserVoteUpdate);
local v17 = require(l_Parent_0.SharedFlags);
local l_FFlagLuaAppDataHydrationUserVotesStore_0 = v17.FFlagLuaAppDataHydrationUserVotesStore;
local l_FFlagLuaAppDataHydrationVotesStoreTrackOptimisticVotes_0 = v17.FFlagLuaAppDataHydrationVotesStoreTrackOptimisticVotes;
local l_ReasonNotVoteable_0 = v8.ReasonNotVoteable;
local l_FFlagLuaAppInExperienceDetailsPrompt_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppInExperienceDetailsPrompt;
local l_FFlagLuaAppDataHydrationUpdateItem_0 = v17.FFlagLuaAppDataHydrationUpdateItem;
local v23 = game:DefineFastInt("USER_VOTE_CACHE_TTL_SECONDS", 600);
return function() --[[ Line: 37 ]] --[[ Name: createVotesStore ]]
    -- upvalues: v5 (copy), v6 (copy), v2 (copy), v14 (copy), l_FFlagLuaAppInExperienceDetailsPrompt_0 (copy), l_FFlagLuaAppDataHydrationUserVotesStore_0 (copy), v9 (copy), v23 (copy), l_logResponseError_0 (copy), v15 (copy), v8 (copy), l_DiscoveryEventErrorLogger_0 (copy), v3 (copy), l_FFlagLuaAppDataHydrationVotesStoreTrackOptimisticVotes_0 (copy), v16 (copy), l_HttpService_0 (copy), l_ReasonNotVoteable_0 (copy), l_StatusCodes_0 (copy), l_FFlagLuaAppDataHydrationUpdateItem_0 (copy)
    local v24 = v5();
    local v35 = v6({
        cache = v24, 
        fetchFn = function(v25) --[[ Line: 41 ]] --[[ Name: fetchFn ]]
            -- upvalues: v2 (ref), v14 (ref), l_FFlagLuaAppInExperienceDetailsPrompt_0 (ref), l_FFlagLuaAppDataHydrationUserVotesStore_0 (ref), v9 (ref)
            local v26 = v2.keys(v25);
            return v14(v26):andThen(function(v27) --[[ Line: 46 ]]
                -- upvalues: l_FFlagLuaAppInExperienceDetailsPrompt_0 (ref), v2 (ref), l_FFlagLuaAppDataHydrationUserVotesStore_0 (ref), v9 (ref)
                if not v27 then
                    error("No response");
                end;
                if not v27.responseBody or not v27.responseBody.data then
                    if l_FFlagLuaAppInExperienceDetailsPrompt_0 then
                        error((("Response Code: %*"):format(v27.responseCode)));
                    else
                        error((("Response Code: %*"):format(v27.reponseCode)));
                    end;
                end;
                local v28 = {};
                local l_data_0 = v27.responseBody.data;
                v2.forEach(l_data_0, function(v30) --[[ Line: 60 ]]
                    -- upvalues: l_FFlagLuaAppDataHydrationUserVotesStore_0 (ref), v9 (ref), v28 (copy)
                    local v31 = nil;
                    local l_upVotes_0 = v30.upVotes;
                    local l_downVotes_0 = v30.downVotes;
                    if l_FFlagLuaAppDataHydrationUserVotesStore_0 and typeof(l_upVotes_0) == "number" and typeof(l_downVotes_0) == "number" then
                        v31 = v9.calculateRating(l_upVotes_0, l_downVotes_0);
                    elseif typeof(l_upVotes_0) == "number" and typeof(l_downVotes_0) == "number" then
                        v31 = math.round((l_upVotes_0 + l_downVotes_0 == 0 and 0 or l_upVotes_0 / (l_upVotes_0 + l_downVotes_0)) * 100);
                    end;
                    v28[tostring(v30.id)] = {
                        upVotes = l_upVotes_0, 
                        downVotes = l_downVotes_0, 
                        rating = v31
                    };
                end);
                return v28;
            end):catch(function(v34) --[[ Line: 89 ]]
                error((("Error requesting votes: %*"):format(v34)));
            end);
        end
    });
    local v36 = nil;
    local v37 = nil;
    local v38 = nil;
    if l_FFlagLuaAppDataHydrationUserVotesStore_0 then
        v36 = v5(v23);
        v37 = v6({
            cache = v36, 
            logError = function(v39) --[[ Line: 102 ]] --[[ Name: logError ]]
                -- upvalues: l_logResponseError_0 (ref)
                l_logResponseError_0("v1/games/votes/user", v39);
            end, 
            fetchFn = function(v40, _) --[[ Line: 105 ]] --[[ Name: fetchFn ]]
                -- upvalues: v15 (ref), v8 (ref), l_DiscoveryEventErrorLogger_0 (ref)
                return v15(v40):andThen(function(v42) --[[ Line: 109 ]]
                    -- upvalues: v8 (ref), l_DiscoveryEventErrorLogger_0 (ref), v40 (copy)
                    local l_responseBody_0 = v42.responseBody;
                    if not v8.userVoteResponseValidator(l_responseBody_0) then
                        l_DiscoveryEventErrorLogger_0.reportError("createVotesStore", "Invalid user vote response", {
                            universeId = v40, 
                            responseBody = l_responseBody_0
                        });
                        error({
                            StatusCode = v42.responseCode
                        });
                    end;
                    return l_responseBody_0;
                end);
            end, 
            supportsMultiGet = false
        });
        v38 = function(v44, v45) --[[ Line: 125 ]]
            -- upvalues: v3 (ref), v36 (ref), v24 (copy), v37 (ref), l_FFlagLuaAppDataHydrationVotesStoreTrackOptimisticVotes_0 (ref), v9 (ref), v16 (ref), l_HttpService_0 (ref), v8 (ref), l_ReasonNotVoteable_0 (ref), l_StatusCodes_0 (ref), l_DiscoveryEventErrorLogger_0 (ref), l_logResponseError_0 (ref)
            local v46, v47 = v3.createSignal(nil);
            local v48, v49 = v36.getItem(v44);
            local v50 = v48 and v48.data(false);
            local v51 = if v50 then v50.userVote else nil;
            local v52 = v24.getItem(v44);
            local v53 = v52 and v52.data(false);
            if v49 then
                v37.fetchItem(v44);
            elseif v50 and not v50.canVote then
                v47({
                    type = "error", 
                    reasonForNotVoteable = v50.reasonForNotVoteable
                });
                return v46;
            end;
            local v54 = v50 and v50.canVote or nil;
            local v55 = v50 and v50.reasonForNotVoteable or nil;
            v36.replaceItem(v44, {
                canVote = v54, 
                reasonForNotVoteable = v55, 
                userVote = v45
            });
            if v53 then
                local v56 = nil;
                local v57 = nil;
                if l_FFlagLuaAppDataHydrationVotesStoreTrackOptimisticVotes_0 then
                    local v58 = v51 == true and 1 or 0;
                    local v59 = v51 == false and 1 or 0;
                    local v60 = v45 == true and 1 or 0;
                    local v61 = v45 == false and 1 or 0;
                    v56 = v60 - v58;
                    v57 = v61 - v59;
                else
                    v56 = v45 == true and 1 or 0;
                    v57 = v45 == false and 1 or 0;
                end;
                local v62 = v53.upVotes + v56;
                local v63 = v53.downVotes + v57;
                if l_FFlagLuaAppDataHydrationVotesStoreTrackOptimisticVotes_0 then
                    v62 = math.max(0, v62);
                    v63 = math.max(0, v63);
                end;
                local v64 = v9.calculateRating(v62, v63);
                local v65 = {
                    upVotes = v62, 
                    downVotes = v63, 
                    rating = v64
                };
                v24.updateItem(v44, v65);
            end;
            v16(v44, v45):andThen(function(_) --[[ Line: 201 ]]
                -- upvalues: v47 (copy), v45 (copy)
                v47({
                    type = "success", 
                    userVote = v45
                });
            end):catch(function(v67) --[[ Line: 207 ]]
                -- upvalues: v36 (ref), v44 (copy), v54 (copy), v55 (copy), v51 (copy), v53 (copy), v24 (ref), l_HttpService_0 (ref), v8 (ref), l_ReasonNotVoteable_0 (ref), l_StatusCodes_0 (ref), v47 (copy), l_DiscoveryEventErrorLogger_0 (ref), l_logResponseError_0 (ref)
                v36.replaceItem(v44, {
                    canVote = v54, 
                    reasonForNotVoteable = v55, 
                    userVote = v51
                });
                if v53 then
                    v24.updateItem(v44, v53);
                end;
                local v68 = if type(v67) == "table" and v67.StatusCode then v67.StatusCode else nil;
                local v69 = nil;
                if v68 then
                    local l_status_0, l_result_0 = pcall(function() --[[ Line: 227 ]]
                        -- upvalues: l_HttpService_0 (ref), v67 (copy)
                        return l_HttpService_0:JSONDecode(v67.Body);
                    end);
                    if l_status_0 and l_result_0 and l_result_0.errors then
                        for _, v73 in ipairs(l_result_0.errors) do
                            if v73.code == v8.PLAY_GAME_ERROR_CODE then
                                v69 = l_ReasonNotVoteable_0.PlayGame;
                            end;
                        end;
                    end;
                    if v68 == l_StatusCodes_0.TOO_MANY_REQUESTS then
                        v69 = l_ReasonNotVoteable_0.FloodCheckThresholdMet;
                    end;
                end;
                v47({
                    type = "error", 
                    reasonForNotVoteable = v69
                });
                local v74 = if type(v67) == "table" and v67.StatusMessage then v67.StatusMessage else nil;
                l_DiscoveryEventErrorLogger_0.reportError("updateUserVote", "Error updating user vote", {
                    universeId = v44, 
                    statusCode = v68, 
                    statusMessage = v74
                });
                l_logResponseError_0("v1/games/votes/user-votes", {
                    StatusCode = v68
                });
            end);
            return v46;
        end;
    end;
    local function v75() --[[ Line: 262 ]] --[[ Name: clear ]]
        -- upvalues: v24 (copy), v35 (copy), l_FFlagLuaAppDataHydrationUserVotesStore_0 (ref), v36 (ref), v37 (ref)
        v24.clear();
        v35.clear();
        if l_FFlagLuaAppDataHydrationUserVotesStore_0 then
            v36.clear();
            v37.clear();
        end;
    end;
    local function v76() --[[ Line: 271 ]] --[[ Name: dispose ]]
        -- upvalues: v24 (copy), v35 (copy), l_FFlagLuaAppDataHydrationUserVotesStore_0 (ref), v37 (ref)
        v24.dispose();
        v35.dispose();
        if l_FFlagLuaAppDataHydrationUserVotesStore_0 then
            v37.dispose();
        end;
    end;
    return {
        fetchVote = v35.fetchItem, 
        fetchVotes = v35.fetchItems, 
        getVote = v35.getCachedItem, 
        getVotes = v35.getCachedItems, 
        getAndFetchVote = v35.getAndFetchItem, 
        getAndFetchVotes = v35.getAndFetchItems, 
        fetchUserVote = if l_FFlagLuaAppDataHydrationUserVotesStore_0 then v37.fetchItem else nil, 
        fetchUserVotes = if l_FFlagLuaAppDataHydrationUserVotesStore_0 then v37.fetchItems else nil, 
        getUserVote = if l_FFlagLuaAppDataHydrationUserVotesStore_0 then v37.getCachedItem else nil, 
        getUserVotes = if l_FFlagLuaAppDataHydrationUserVotesStore_0 then v37.getCachedItems else nil, 
        getAndFetchUserVote = if l_FFlagLuaAppDataHydrationUserVotesStore_0 then v37.getAndFetchItem else nil, 
        getAndFetchUserVotes = if l_FFlagLuaAppDataHydrationUserVotesStore_0 then v37.getAndFetchItems else nil, 
        updateUserVote = if l_FFlagLuaAppDataHydrationUserVotesStore_0 then v38 else nil, 
        updateVoteItem = l_FFlagLuaAppDataHydrationUpdateItem_0 and function(v77, v78, v79) --[[ Line: 298 ]]
            -- upvalues: v24 (copy), v9 (ref)
            v24.updateItem(v77, {
                downVotes = v78, 
                upVotes = v79, 
                rating = v9.calculateRating(v79, v78)
            });
        end or nil, 
        updateUserVoteItem = if l_FFlagLuaAppDataHydrationUpdateItem_0 and l_FFlagLuaAppDataHydrationUserVotesStore_0 then v36.updateItem else nil, 
        clear = v75, 
        dispose = v76
    };
end;
local l_Parent_0 = script:FindFirstAncestor("GamePlayButton").Parent;
local l_PromiseUtilities_0 = require(l_Parent_0.AppCommonLib).Utils.PromiseUtilities;
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local v3 = require(l_Parent_0.GameDetailRodux);
local l_ApiFetchGameDetails_0 = v3.GameDetails.ApiFetchGameDetails;
local l_FetchGamePlayabilityAndProductInfo_0 = v3.FetchGamePlayabilityAndProductInfo;
local l_FetchUserGameVotes_0 = require(l_Parent_0.GameVotesRodux).UserGameVotes.FetchUserGameVotes;
local v7 = require(l_Parent_0.NextDataExpirationTimeRodux);
local l_SetNextDataExpirationTime_0 = v7.SetNextDataExpirationTime;
local l_NextDataExpirationTimeReducer_0 = v7.NextDataExpirationTimeReducer;
local l_ExpirationTimeNamespace_0 = v7.ExpirationTimeNamespace;
local l_ApiFetchShowAgeVerificationOverlay_0 = require(l_Parent_0.VoiceChat).AgeVerificationOverlay.ApiFetchShowAgeVerificationOverlay;
local l_GetFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds_0 = require(l_Parent_0.SharedFlags).GetFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds;
local l_RunService_0 = game:GetService("RunService");
local v14 = {};
local function v22(v15, v16, v17, v18, v19) --[[ Line: 25 ]] --[[ Name: playButtonDataFetchPromises ]]
    -- upvalues: l_ApiFetchGameDetails_0 (copy), l_RetrievalStatus_0 (copy), l_FetchGamePlayabilityAndProductInfo_0 (copy), l_ApiFetchShowAgeVerificationOverlay_0 (copy), l_FetchUserGameVotes_0 (copy)
    local v20 = {};
    if l_ApiFetchGameDetails_0.GetFetchingStatus(v16:getState(), v17) ~= l_RetrievalStatus_0.Fetching and (v18 or v16:getState().GameDetails[v17] == nil) then
        table.insert(v20, v16:dispatch(l_ApiFetchGameDetails_0.Fetch(v15, {
            v17
        })));
    end;
    local v21 = l_FetchGamePlayabilityAndProductInfo_0.GetFetchingStatus(v16:getState(), v17);
    if v18 or v19 or v21 == l_RetrievalStatus_0.NotStarted or v21 == l_RetrievalStatus_0.Failed then
        table.insert(v20, v16:dispatch(l_FetchGamePlayabilityAndProductInfo_0.Fetch(v15, v17)));
    end;
    if game:GetEngineFeature("VoiceChatSupported") and l_ApiFetchShowAgeVerificationOverlay_0.GetFetchingStatus(v16:getState(), v17) ~= l_RetrievalStatus_0.Fetching and (v18 or v16:getState().ShowAgeVerificationOverlay[v17] == nil) then
        table.insert(v20, v16:dispatch(l_ApiFetchShowAgeVerificationOverlay_0.Fetch(v15, v17)));
    end;
    if l_FetchUserGameVotes_0.GetFetchingStatus(v16:getState(), v17) ~= l_RetrievalStatus_0.Fetching and (v18 or v16:getState().UserGameVotes[v17] == nil) then
        v16:dispatch(l_FetchUserGameVotes_0.Fetch(v15, v17));
    end;
    return v20;
end;
v14.IsLoading = function(v23, v24) --[[ Line: 80 ]] --[[ Name: IsLoading ]]
    -- upvalues: l_ApiFetchGameDetails_0 (copy), l_RetrievalStatus_0 (copy), l_FetchGamePlayabilityAndProductInfo_0 (copy), l_ApiFetchShowAgeVerificationOverlay_0 (copy)
    local v25 = l_ApiFetchGameDetails_0.GetFetchingStatus(v23, v24);
    if v25 == l_RetrievalStatus_0.NotStarted or v25 == l_RetrievalStatus_0.Fetching then
        return true;
    else
        local v26 = l_FetchGamePlayabilityAndProductInfo_0.GetFetchingStatus(v23, v24);
        if v26 == l_RetrievalStatus_0.NotStarted or v26 == l_RetrievalStatus_0.Fetching then
            return true;
        else
            if game:GetEngineFeature("VoiceChatSupported") then
                local v27 = l_ApiFetchShowAgeVerificationOverlay_0.GetFetchingStatus(v23, v24);
                if v27 == l_RetrievalStatus_0.NotStarted or v27 == l_RetrievalStatus_0.Fetching then
                    return true;
                end;
            end;
            return false;
        end;
    end;
end;
v14.Fetch = function(v28, v29, v30) --[[ Line: 115 ]] --[[ Name: Fetch ]]
    -- upvalues: l_NextDataExpirationTimeReducer_0 (copy), l_ExpirationTimeNamespace_0 (copy), v22 (copy), l_RunService_0 (copy), l_PromiseUtilities_0 (copy), l_GetFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds_0 (copy), l_SetNextDataExpirationTime_0 (copy)
    return function(v31) --[[ Line: 116 ]]
        -- upvalues: l_NextDataExpirationTimeReducer_0 (ref), l_ExpirationTimeNamespace_0 (ref), v29 (copy), v22 (ref), v28 (copy), v30 (copy), l_RunService_0 (ref), l_PromiseUtilities_0 (ref), l_GetFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds_0 (ref), l_SetNextDataExpirationTime_0 (ref)
        local v32 = tick();
        local v33 = nil;
        local v34 = v31:getState().Personalization[l_NextDataExpirationTimeReducer_0.key][l_ExpirationTimeNamespace_0.GameDetailPlayability];
        if v34 then
            v33 = v34[v29];
        end;
        local v35 = false;
        if v33 == nil or v33 < v32 then
            v35 = true;
        end;
        local v36 = v22(v28, v31, v29, v35, v30);
        if #v36 > 0 then
            local v37 = nil;
            if _G.__TESTEZ_RUNNING_TEST__ or l_RunService_0:IsStudio() then
                v37 = warn;
            end;
            return l_PromiseUtilities_0.Batch(v36, v37):andThen(function(v38) --[[ Line: 139 ]]
                -- upvalues: l_PromiseUtilities_0 (ref), v32 (ref), v33 (ref), l_GetFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds_0 (ref), v31 (copy), l_SetNextDataExpirationTime_0 (ref), v29 (ref), l_ExpirationTimeNamespace_0 (ref)
                if l_PromiseUtilities_0.CountResults(v38).failureCount == 0 then
                    v32 = tick();
                    v33 = math.floor(v32 + l_GetFIntLuaAppThrottleRefreshPlayabilityIntervalSeconds_0());
                    v31:dispatch(l_SetNextDataExpirationTime_0(v29, v33, l_ExpirationTimeNamespace_0.GameDetailPlayability));
                end;
            end);
        else
            return;
        end;
    end;
end;
return v14;
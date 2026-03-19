local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameVotesRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.Promise);
local l_StatusCodes_0 = require(l_Parent_0.Http).StatusCodes;
local v5 = require(l_script_FirstAncestor_0.Enums.ReasonForNotVoteable);
local v6 = require(l_script_FirstAncestor_0.Enums.VoteStatus);
local v7 = require(l_script_FirstAncestor_0.UserGameVotes.SetUserGameVotes);
local v8 = require(l_script_FirstAncestor_0.UserGameVotes.GamesPatchUserVotes);
local l_ToastType_0 = require(l_Parent_0.ToastRodux).Enums.ToastType;
local l_SetCurrentToastMessage_0 = require(l_Parent_0.ToastRodux).Actions.SetCurrentToastMessage;
local v11 = require(l_script_FirstAncestor_0.GameVotes.SetGameVotes);
local l_SetNetworkingErrorToast_0 = require(l_Parent_0.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast;
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
local function v19(v14, v15, v16) --[[ Line: 19 ]] --[[ Name: getNewGameVotes ]]
    -- upvalues: v6 (copy)
    if v15 == v16 then
        return v14;
    else
        local v17 = v14 and v14.upVotes;
        local v18 = v14 and v14.downVotes;
        if v16 == v6.VotedUp then
            v17 = v17 + 1;
            if v15 == v6.VotedDown then
                v18 = v18 - 1;
            end;
        elseif v16 == v6.VotedDown then
            v18 = v18 + 1;
            if v15 == v6.VotedUp then
                v17 = v17 - 1;
            end;
        elseif v16 == v6.NotVoted then
            if v15 == v6.VotedUp then
                v17 = v17 - 1;
            elseif v15 == v6.VotedDown then
                v18 = v18 - 1;
            end;
        end;
        return {
            upVotes = v17, 
            downVotes = v18
        };
    end;
end;
local function _(v20) --[[ Line: 50 ]] --[[ Name: isTooManyRequestsError ]]
    -- upvalues: l_StatusCodes_0 (copy)
    return v20 and v20.HttpError == Enum.HttpError.OK and v20.StatusCode == l_StatusCodes_0.TOO_MANY_REQUESTS;
end;
local function v27(v22) --[[ Line: 54 ]] --[[ Name: isPlayGameError ]]
    -- upvalues: l_StatusCodes_0 (copy), l_HttpService_0 (copy)
    if v22 and v22.HttpError == Enum.HttpError.OK and v22.StatusCode == l_StatusCodes_0.FORBIDDEN then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 56 ]]
            -- upvalues: l_HttpService_0 (ref), v22 (copy)
            return l_HttpService_0:JSONDecode(v22.Body);
        end);
        if l_status_0 and l_result_0 and l_result_0.errors then
            for _, v26 in ipairs(l_result_0.errors) do
                if v26.code == 6 then
                    return true;
                end;
            end;
        end;
    end;
    return false;
end;
local function _(v28) --[[ Line: 70 ]] --[[ Name: fetchKeymapper ]]
    return "luaapp.gamesapi.patch-user-votes" .. v28;
end;
return {
    getNewGameVotes = v19, 
    Patch = function(v30, v31, v32, v33) --[[ Line: 78 ]] --[[ Name: Patch ]]
        -- upvalues: v3 (copy), l_PerformFetch_0 (copy), v8 (copy), v19 (copy), v11 (copy), v7 (copy), l_StatusCodes_0 (copy), v5 (copy), l_SetCurrentToastMessage_0 (copy), l_ToastType_0 (copy), v27 (copy), l_SetNetworkingErrorToast_0 (copy)
        assert(type(v31) == "string", string.format("PatchUserVotes thunk expects universeId to be a string, was %s", (type(v31))));
        assert(type(v32) == "string", string.format("PatchUserVotes thunk expects vote to be a string, was %s", (type(v32))));
        assert(type(v33) == "string", string.format("PatchUserVotes thunk expects curVote to be a string, was %s", (type(v33))));
        if v32 == v33 then
            return v3.resolve();
        else
            return l_PerformFetch_0.Single("luaapp.gamesapi.patch-user-votes" .. v31, function(v34) --[[ Line: 97 ]]
                -- upvalues: v8 (ref), v30 (copy), v31 (copy), v32 (copy), v19 (ref), v33 (copy), v11 (ref), v7 (ref), v3 (ref), l_StatusCodes_0 (ref), v5 (ref), l_SetCurrentToastMessage_0 (ref), l_ToastType_0 (ref), v27 (ref), l_SetNetworkingErrorToast_0 (ref)
                return v8(v30, v31, v32):andThen(function(v35) --[[ Line: 98 ]]
                    -- upvalues: v34 (copy), v31 (ref), v19 (ref), v33 (ref), v32 (ref), v11 (ref), v7 (ref), v3 (ref)
                    local v36 = v34:getState().GameVotes[v31];
                    local v37 = v19(v36, v33, v32);
                    v34:dispatch(v11(v31, v37.upVotes, v37.downVotes));
                    v34:dispatch(v7(v31, true, v32, ""));
                    return v3.resolve(v35);
                end, function(v38) --[[ Line: 105 ]]
                    -- upvalues: l_StatusCodes_0 (ref), v34 (copy), v7 (ref), v31 (ref), v33 (ref), v5 (ref), l_SetCurrentToastMessage_0 (ref), l_ToastType_0 (ref), v3 (ref), v27 (ref), l_SetNetworkingErrorToast_0 (ref)
                    if v38 and v38.HttpError == Enum.HttpError.OK and v38.StatusCode == l_StatusCodes_0.TOO_MANY_REQUESTS then
                        v34:dispatch(v7(v31, false, v33, v5.FloodCheckThresholdMet));
                        v34:dispatch(l_SetCurrentToastMessage_0({
                            toastType = l_ToastType_0.NetworkingError, 
                            toastMessage = "Feature.Toast.VoteError.FloodCheckThresholdMet"
                        }));
                        return v3.reject(v38);
                    elseif v27(v38) then
                        v34:dispatch(v7(v31, false, v33, v5.PlayGame));
                        v34:dispatch(l_SetCurrentToastMessage_0({
                            toastType = l_ToastType_0.NetworkingError, 
                            toastMessage = "Feature.Toast.VoteError.PlayGame"
                        }));
                        return v3.reject(v38);
                    else
                        v34:dispatch(l_SetNetworkingErrorToast_0(v38));
                        return v3.reject(v38);
                    end;
                end);
            end);
        end;
    end, 
    GetPatchingStatus = function(v39, v40) --[[ Line: 129 ]] --[[ Name: GetPatchingStatus ]]
        -- upvalues: l_PerformFetch_0 (copy)
        return l_PerformFetch_0.GetStatus(v39, "luaapp.gamesapi.patch-user-votes" .. v40);
    end
};
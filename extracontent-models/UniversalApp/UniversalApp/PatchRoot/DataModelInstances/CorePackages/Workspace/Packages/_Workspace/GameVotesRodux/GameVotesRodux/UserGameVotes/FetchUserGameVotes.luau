local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameVotesRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
local l_Logging_0 = require(l_Parent_0.AppCommonLib).Logging;
local l_SetNetworkingErrorToast_0 = require(l_Parent_0.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast;
local v6 = require(l_script_FirstAncestor_0.UserGameVotes.GetUserGameVotes);
local v7 = require(l_script_FirstAncestor_0.UserGameVotes.SetUserGameVotes);
local v8 = require(l_script_FirstAncestor_0.Enums.VoteStatus);
local function _(v9) --[[ Line: 11 ]] --[[ Name: getUserVoteStatus ]]
    -- upvalues: v8 (copy)
    if v9 == true then
        return v8.VotedUp;
    elseif v9 == false then
        return v8.VotedDown;
    elseif v9 == nil then
        return v8.NotVoted;
    else
        return nil;
    end;
end;
local v11 = {};
local function _(v12) --[[ Line: 24 ]] --[[ Name: fetchKeymapper ]]
    return "luaapp.gamesapi.user-game-votes" .. v12;
end;
v11.Fetch = function(v14, v15) --[[ Line: 28 ]] --[[ Name: Fetch ]]
    -- upvalues: l_PerformFetch_0 (copy), v6 (copy), v8 (copy), v7 (copy), l_Logging_0 (copy), v2 (copy), l_SetNetworkingErrorToast_0 (copy)
    assert(type(v15) == "string", string.format("FetchUserGameVotes thunk expects universeId to be a string, was %s", (type(v15))));
    return l_PerformFetch_0.Single("luaapp.gamesapi.user-game-votes" .. v15, function(v16) --[[ Line: 34 ]]
        -- upvalues: v6 (ref), v14 (copy), v15 (copy), v8 (ref), v7 (ref), l_Logging_0 (ref), v2 (ref), l_SetNetworkingErrorToast_0 (ref)
        return v6(v14, v15):andThen(function(v17) --[[ Line: 35 ]]
            -- upvalues: v8 (ref), v16 (copy), v7 (ref), v15 (ref), l_Logging_0 (ref), v2 (ref)
            local l_responseBody_0 = v17.responseBody;
            if l_responseBody_0 ~= nil and l_responseBody_0.canVote ~= nil and l_responseBody_0.reasonForNotVoteable ~= nil then
                local l_userVote_0 = l_responseBody_0.userVote;
                local v20 = if l_userVote_0 == true then v8.VotedUp else if l_userVote_0 == false then v8.VotedDown else if l_userVote_0 == nil then v8.NotVoted else nil;
                if v20 then
                    v16:dispatch(v7(v15, l_responseBody_0.canVote, v20, l_responseBody_0.reasonForNotVoteable));
                    return v2.resolve(v17);
                else
                    l_Logging_0.warn("Response from GetUserGameVotes is malformed!");
                    return v2.reject({
                        HttpError = Enum.HttpError.OK
                    });
                end;
            else
                l_Logging_0.warn("Response from GetUserGameVotes is malformed!");
                return v2.reject({
                    HttpError = Enum.HttpError.OK
                });
            end;
        end, function(v21) --[[ Line: 53 ]]
            -- upvalues: v16 (copy), l_SetNetworkingErrorToast_0 (ref), v2 (ref)
            v16:dispatch(l_SetNetworkingErrorToast_0(v21));
            return v2.reject(v21);
        end);
    end);
end;
v11.GetFetchingStatus = function(v22, v23) --[[ Line: 60 ]] --[[ Name: GetFetchingStatus ]]
    -- upvalues: l_PerformFetch_0 (copy)
    return l_PerformFetch_0.GetStatus(v22, "luaapp.gamesapi.user-game-votes" .. v23);
end;
return v11;
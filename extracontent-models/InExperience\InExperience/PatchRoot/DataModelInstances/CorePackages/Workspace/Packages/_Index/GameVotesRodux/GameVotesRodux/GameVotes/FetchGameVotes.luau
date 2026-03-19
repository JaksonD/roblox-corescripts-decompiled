local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameVotesRodux");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local l_PerformFetch_0 = require(l_Parent_0.Http).PerformFetch;
local l_Logging_0 = require(l_Parent_0.AppCommonLib).Logging;
local l_SetNetworkingErrorToast_0 = require(l_Parent_0.RobloxAppToastsRodux).Thunks.SetNetworkingErrorToast;
local v6 = require(l_script_FirstAncestor_0.GameVotes.SetGameVotes);
local v7 = require(l_script_FirstAncestor_0.GameVotes.GetGameVotes);
local v8 = {};
local function _(v9) --[[ Line: 12 ]] --[[ Name: fetchKeymapper ]]
    return "luaapp.gamesapi.game-votes" .. v9;
end;
v8.Fetch = function(v11, v12) --[[ Line: 16 ]] --[[ Name: Fetch ]]
    -- upvalues: l_PerformFetch_0 (copy), v7 (copy), v6 (copy), v2 (copy), l_Logging_0 (copy), l_SetNetworkingErrorToast_0 (copy)
    assert(type(v12) == "string", string.format("FetchGameVotes thunk expects universeId to be a string, was %s", (type(v12))));
    return l_PerformFetch_0.Single("luaapp.gamesapi.game-votes" .. v12, function(v13) --[[ Line: 22 ]]
        -- upvalues: v7 (ref), v11 (copy), v12 (copy), v6 (ref), v2 (ref), l_Logging_0 (ref), l_SetNetworkingErrorToast_0 (ref)
        return v7(v11, v12):andThen(function(v14) --[[ Line: 23 ]]
            -- upvalues: v13 (copy), v6 (ref), v12 (ref), v2 (ref), l_Logging_0 (ref)
            local l_responseBody_0 = v14.responseBody;
            if l_responseBody_0 ~= nil and l_responseBody_0.upVotes ~= nil and l_responseBody_0.downVotes ~= nil then
                v13:dispatch(v6(v12, l_responseBody_0.upVotes < 0 and 0 or l_responseBody_0.upVotes, l_responseBody_0.downVotes < 0 and 0 or l_responseBody_0.downVotes));
                return v2.resolve(v14);
            else
                l_Logging_0.warn("Response from GetGameVotes is malformed!");
                return v2.reject({
                    HttpError = Enum.HttpError.OK
                });
            end;
        end, function(v16) --[[ Line: 39 ]]
            -- upvalues: v13 (copy), l_SetNetworkingErrorToast_0 (ref), v2 (ref)
            v13:dispatch(l_SetNetworkingErrorToast_0(v16));
            return v2.reject(v16);
        end);
    end);
end;
v8.GetFetchingStatus = function(v17, v18) --[[ Line: 46 ]] --[[ Name: GetFetchingStatus ]]
    -- upvalues: l_PerformFetch_0 (copy)
    return l_PerformFetch_0.GetStatus(v17, "luaapp.gamesapi.game-votes" .. v18);
end;
return v8;
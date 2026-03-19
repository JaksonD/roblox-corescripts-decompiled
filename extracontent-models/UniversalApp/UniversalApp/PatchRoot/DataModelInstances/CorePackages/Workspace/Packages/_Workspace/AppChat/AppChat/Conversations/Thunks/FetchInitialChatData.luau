local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Actions.SetAppLoaded);
local v2 = require(l_script_FirstAncestor_0.Conversations.Thunks.FetchChatSettings);
local v3 = require(l_script_FirstAncestor_0.Http.NetworkingUsers);
return function(v4) --[[ Line: 11 ]]
    -- upvalues: v3 (copy), v2 (copy), v1 (copy)
    v4:dispatch(function(v5) --[[ Line: 12 ]]
        -- upvalues: v3 (ref)
        return v5:dispatch(v3.GetUserV2FromUserId.API(v5:getState().LocalUserId));
    end);
    return v4:dispatch(v2.API()):andThen(function() --[[ Line: 18 ]]
        -- upvalues: v4 (copy), v1 (ref)
        v4:dispatch(v1(true));
    end):catch(function(v6) --[[ Line: 21 ]]
        warn("AppChat.Conversations.Thunks.FetchInitialChatData with error: ", (tostring(v6)));
    end);
end;
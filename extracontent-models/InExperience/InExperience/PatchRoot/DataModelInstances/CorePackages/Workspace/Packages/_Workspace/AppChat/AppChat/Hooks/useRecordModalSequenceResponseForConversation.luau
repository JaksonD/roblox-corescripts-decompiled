local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local v3 = require(l_script_FirstAncestor_0.Hooks.useGetOneToOneFriendIdFromConversationId);
local v4 = require(l_script_FirstAncestor_0.Hooks.useGetConversationFromId);
local v5 = require(l_Parent_0.AppChatNetworking);
return function(v6) --[[ Line: 11 ]]
    -- upvalues: l_useDispatch_0 (copy), v4 (copy), v3 (copy), v5 (copy)
    local v7 = l_useDispatch_0();
    local v8 = v4(v6);
    local v9 = v3(v6);
    return function(v10, v11, v12, v13) --[[ Line: 18 ]]
        -- upvalues: v8 (copy), v9 (copy), v7 (copy), v5 (ref), v6 (copy)
        if v8 and v8.source == "friends" and v9 then
            return v7(v5.rodux.RecordModalSequenceResponse.API(v10, v11, v12, v13, nil, v9));
        else
            return v7(v5.rodux.RecordModalSequenceResponse.API(v10, v11, v12, v13, v6));
        end;
    end;
end;
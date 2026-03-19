local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.AppChatNetworking);
local v2 = require(l_Parent_0.AppCommonLib);
local v3 = require(l_Parent_0.UserLib);
local l_Immutable_0 = v2.Immutable;
local l_UpdateUsers_0 = v3.Thunks.UpdateUsers;
local l_GetConversationMetadata_0 = v1.rodux.GetConversationMetadata;
return function(v7) --[[ Line: 14 ]]
    -- upvalues: l_Immutable_0 (copy), l_UpdateUsers_0 (copy), l_GetConversationMetadata_0 (copy)
    return function(v8) --[[ Line: 15 ]]
        -- upvalues: v7 (copy), l_Immutable_0 (ref), l_UpdateUsers_0 (ref), l_GetConversationMetadata_0 (ref)
        local v9 = v8:getState().Users[v7];
        if v9 then
            local v10 = l_Immutable_0.Set(v9, "isFriend", false);
            v8:dispatch(l_UpdateUsers_0({
                v10
            }));
            v8:dispatch(l_GetConversationMetadata_0.API());
        end;
    end;
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_useLocalUserId_0 = require(l_Parent_0.RobloxAppHooks).useLocalUserId;
local v3 = require(l_script_FirstAncestor_0.Hooks.useGetConversationFromId);
local v4 = require(l_script_FirstAncestor_0.Conversations.getOtherParticipants);
return function(v5) --[[ Line: 8 ]]
    -- upvalues: l_useLocalUserId_0 (copy), v3 (copy), v4 (copy)
    local v6 = l_useLocalUserId_0();
    local v7 = v3(v5);
    if not v5 or not v6 then
        return nil;
    elseif not v7 then
        return nil;
    elseif v7.type ~= "one_to_one" then
        return nil;
    else
        local v8 = v4(v7, v6);
        if #v8 ~= 1 then
            return nil;
        else
            return v8[1];
        end;
    end;
end;
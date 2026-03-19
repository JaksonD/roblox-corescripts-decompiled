local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_script_FirstAncestor_0.Components.ChatConversation.EnumMessageTypes);
local v4 = require(l_Parent_0.ArgCheck);
return function(v5, v6) --[[ Line: 8 ]]
    -- upvalues: v4 (copy), v2 (copy), v3 (copy)
    v4.isType(v5, "table", "formatMessages.messages");
    v4.isType(v6, "table", "formatMessages.messageData");
    return v2.List.map(v5, function(v7) --[[ Line: 12 ]]
        -- upvalues: v2 (ref), v6 (copy), v3 (ref)
        if v7.placeId or v7.shareLink then
            return v2.Dictionary.join(v6, v7, {
                messageType = v3.Link, 
                content = v2.None
            });
        else
            return v2.Dictionary.join(v6, v7);
        end;
    end);
end;
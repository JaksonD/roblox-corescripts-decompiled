local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.ChatConversation.EnumCustomEntryTypes);
local v4 = require(l_script_FirstAncestor_0.Components.ChatConversation.ConversationCards.OsaContextCardOneToOneContainer);
return v2.memo(function(v5) --[[ Line: 15 ]] --[[ Name: CustomMessageEntryContainer ]]
    -- upvalues: v3 (copy), v2 (copy), v4 (copy)
    if v5.customEntryType == v3.OsaContextCardOneToOne then
        return (v2.createElement(v4, {
            conversationId = v5.conversationId, 
            openViewProfile = v5.openViewProfile
        }));
    else
        return nil;
    end;
end);
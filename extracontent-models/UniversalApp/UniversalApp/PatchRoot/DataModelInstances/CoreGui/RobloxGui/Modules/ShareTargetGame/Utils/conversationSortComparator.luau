local l_script_FirstAncestor_0 = script:FindFirstAncestor("ShareTargetGame");
local l_getConversationDisplayTitle_0 = require(l_script_FirstAncestor_0.dependencies).SocialLibraries.Conversation.getConversationDisplayTitle;
return function(v2, v3) --[[ Line: 7 ]]
    -- upvalues: l_getConversationDisplayTitle_0 (copy)
    assert(type(v2 == "table"), "ConversationA should be a table value. Value given: ", (type(v2)));
    assert(v2.title or v2.titleForViewer, "ConversationA should have a title string");
    assert(type(v3 == "table"), "ConversationB should be a table value. Value given: ", (type(v3)));
    assert(v3.title or v3.titleForViewer, "ConversationB should have a title string");
    if v2.lastUpdated ~= nil and v3.lastUpdated ~= nil then
        return v2.lastUpdated > v3.lastUpdated;
    elseif v2.lastUpdated ~= nil then
        return true;
    elseif v3.lastUpdated ~= nil then
        return false;
    else
        return l_getConversationDisplayTitle_0(v2) < l_getConversationDisplayTitle_0(v3);
    end;
end;
local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Rodux);
local _ = require(l_Parent_0.AppChatNetworking);
return v1.makeActionCreator(script.Name, function(v3, v4) --[[ Line: 14 ]]
    return {
        conversationId = v3, 
        moderationType = v4
    };
end);
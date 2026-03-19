local l_CorePackages_0 = game:GetService("CorePackages");
local l_Conversations_0 = require(l_CorePackages_0.Workspace.Packages.AppChat).Conversations;
local v2 = require(script.Parent.SendPolicies.SendGameLinkMessagePolicy);
local l_SendMessageUsingPolicy_0 = l_Conversations_0.Thunks.SendMessageUsingPolicy;
return function(v4, v5, v6, v7, v8) --[[ Line: 8 ]]
    -- upvalues: v2 (copy), l_SendMessageUsingPolicy_0 (copy)
    local v9 = v2:new(v4, v5, nil, v6 or false, v7 or 0, v8 or 0);
    return l_SendMessageUsingPolicy_0(v9);
end;
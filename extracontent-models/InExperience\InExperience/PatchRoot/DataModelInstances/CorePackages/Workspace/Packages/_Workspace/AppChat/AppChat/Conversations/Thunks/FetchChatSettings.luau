local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Http.RoduxNetworking);
local l_Url_0 = require(l_Parent_0.Http).Url;
return v2.GET(script.Name, function(v4) --[[ Line: 7 ]]
    -- upvalues: l_Url_0 (copy)
    return v4(l_Url_0.CHAT_URL):path("chat-settings");
end);
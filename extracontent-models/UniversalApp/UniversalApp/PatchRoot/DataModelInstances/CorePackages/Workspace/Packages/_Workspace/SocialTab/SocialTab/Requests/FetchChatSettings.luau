local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_RoduxNetworking_0 = v1.RoduxNetworking;
local l_Url_0 = v1.Url;
return l_RoduxNetworking_0.GET(script.Name, function(v4) --[[ Line: 7 ]]
    -- upvalues: l_Url_0 (copy)
    return v4(l_Url_0.CHAT_URL):path("chat-settings");
end);
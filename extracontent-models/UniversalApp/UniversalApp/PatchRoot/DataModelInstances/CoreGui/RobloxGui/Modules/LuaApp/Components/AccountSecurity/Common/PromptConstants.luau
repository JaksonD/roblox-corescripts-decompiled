local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Url);
local v2 = {
    webViewUrlAccountSettings = v1.WWW_URL .. "my/account#!/security?src=authpopup", 
    webViewUrlEmailHighlight = v1.WWW_URL .. "my/account#!/security?src=emailhighlight", 
    webViewUrlHelpPage = "https://en.help.roblox.com/hc/articles/212459863"
};
v2.getWebViewUrlAccountSettings = function() --[[ Line: 15 ]] --[[ Name: getWebViewUrlAccountSettings ]]
    -- upvalues: v2 (copy)
    return v2.webViewUrlAccountSettings;
end;
v2.getWebViewUrlEmailHighlight = function() --[[ Line: 19 ]] --[[ Name: getWebViewUrlEmailHighlight ]]
    -- upvalues: v2 (copy)
    return v2.webViewUrlEmailHighlight;
end;
v2.getWebViewUrlHelpPage = function() --[[ Line: 23 ]] --[[ Name: getWebViewUrlHelpPage ]]
    -- upvalues: v2 (copy)
    return v2.webViewUrlHelpPage;
end;
return v2;
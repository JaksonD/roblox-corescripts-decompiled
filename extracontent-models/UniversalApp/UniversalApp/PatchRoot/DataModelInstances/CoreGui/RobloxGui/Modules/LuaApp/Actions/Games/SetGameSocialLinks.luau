local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
return require(l_Modules_0.Common.Action)(script.Name, function(v1, v2) --[[ Line: 4 ]]
    assert(type(v1) == "string", string.format("SetGameSocialLinks action expects universeId to be a string, was %s", (type(v1))));
    assert(type(v2) == "table", string.format("SetGameSocialLinks action expects socialLinks to be a table, was %s", (type(v2))));
    return {
        universeId = v1, 
        socialLinks = v2
    };
end);
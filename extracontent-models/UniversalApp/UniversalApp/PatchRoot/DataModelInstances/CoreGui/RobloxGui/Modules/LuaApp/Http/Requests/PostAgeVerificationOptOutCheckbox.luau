local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Url);
local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v4 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
return function(v5, v6) --[[ Line: 12 ]]
    -- upvalues: v4 (copy), v1 (copy), l_HttpService_0 (copy)
    v4.isType(v6, "boolean", "PostAgeVerificationOptOutCheckbox request expects showOverlay to be a boolean");
    return v5(string.format("%s/v1/settings/verify/show-overlay", v1.VOICE_URL), "POST", {
        postBody = l_HttpService_0:JSONEncode({
            showOverlay = v6
        })
    });
end;
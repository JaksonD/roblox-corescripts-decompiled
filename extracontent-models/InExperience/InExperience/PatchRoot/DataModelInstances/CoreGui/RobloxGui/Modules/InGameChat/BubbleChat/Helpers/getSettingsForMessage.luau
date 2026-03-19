local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.t);
local v2 = require(script.Parent.Parent.Types);
local v3 = require(script.Parent.maybeAssert);
local _ = script.Parent.Parent.Parent.Parent.Flags;
return function(v5, v6) --[[ Line: 12 ]] --[[ Name: getSettingsForMessage ]]
    -- upvalues: v3 (copy), v2 (copy), v1 (copy)
    v3(v2.IChatSettings(v5));
    v3(v1.optional(v2.IMessage)(v6));
    local l_UserSpecificSettings_0 = v5.UserSpecificSettings;
    if not l_UserSpecificSettings_0 or not v6 then
        return v5;
    else
        return l_UserSpecificSettings_0[v6.userId] or v6.adornee and l_UserSpecificSettings_0[v6.adornee:GetFullName()] or v5;
    end;
end;
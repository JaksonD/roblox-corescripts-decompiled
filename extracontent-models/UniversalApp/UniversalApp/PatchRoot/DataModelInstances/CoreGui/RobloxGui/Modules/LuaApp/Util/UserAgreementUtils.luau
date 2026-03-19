local l_CorePackages_0 = game:GetService("CorePackages");
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v2 = {
    TermsOfService = true, 
    PrivacyPolicy = true, 
    RiderTerms = true, 
    ChildrenPrivacyPolicy = true, 
    LuobuThirdPartyDataUse = true, 
    StudioTermsForVNGSKU = true
};
setmetatable(v2, {
    __index = function(_, v4) --[[ Line: 14 ]] --[[ Name: __index ]]
        -- upvalues: l_Logging_0 (copy)
        l_Logging_0.warn(string.format("Unknown User Agreement Type: %s", (tostring(v4))));
        return false;
    end
});
return {
    CheckAgreementTypeExists = function(v5) --[[ Line: 22 ]]
        -- upvalues: v2 (copy)
        return v2[v5];
    end
};
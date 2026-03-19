local l_Parent_0 = script.Parent.Parent;
local l_Logging_0 = require(l_Parent_0.AppCommonLib).Logging;
local v2 = {
    TermsOfService = true, 
    PrivacyPolicy = true, 
    RiderTerms = true, 
    ChildrenPrivacyPolicy = true, 
    LuobuThirdPartyDataUse = true, 
    TransferPersonalInformationPolicy = true, 
    OptionalPersonalInformationPolicy = true, 
    ThirdPartyPersonalInformationPolicy = true, 
    PersonalInformationPolicy = true, 
    StudioTermsForVNGSKU = true
};
setmetatable(v2, {
    __index = function(_, v4) --[[ Line: 19 ]] --[[ Name: __index ]]
        -- upvalues: l_Logging_0 (copy)
        l_Logging_0.warn(string.format("Unknown User Agreement Type: %s", (tostring(v4))));
        return false;
    end
});
return {
    CheckAgreementTypeExists = function(v5) --[[ Line: 27 ]]
        -- upvalues: v2 (copy)
        return v2[v5];
    end
};
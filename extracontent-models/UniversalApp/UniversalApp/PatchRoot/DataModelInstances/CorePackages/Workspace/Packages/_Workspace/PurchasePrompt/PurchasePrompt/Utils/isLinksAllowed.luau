local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(l_Parent_0.Enums.UpsellFlow);
local v4 = require(l_Parent_0.NativeUpsell.getUpsellFlow);
local l_getAppFeaturePolicies_0 = require(l_Parent_1.UniversalAppPolicy).getAppFeaturePolicies;
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = require(l_Parent_1.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow;
return function() --[[ Line: 12 ]]
    -- upvalues: l_UserInputService_0 (copy), v4 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), l_getAppFeaturePolicies_0 (copy), v3 (copy)
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    local v8 = v4(l_l_UserInputService_0_Platform_0);
    if l_FFlagEnableUnifiedProductPurchaseFlow_0 and l_getAppFeaturePolicies_0().getShouldUseDMCCALegalDisclosureInApp() then
        return true;
    else
        return v8 == v3.Web;
    end;
end;
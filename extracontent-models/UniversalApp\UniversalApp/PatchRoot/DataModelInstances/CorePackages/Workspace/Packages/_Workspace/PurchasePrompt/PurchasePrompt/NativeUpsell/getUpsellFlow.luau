local l_script_FirstAncestor_0 = script:FindFirstAncestor("PurchasePrompt");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Enums.UpsellFlow);
local l_getAppFeaturePolicies_0 = require(l_Parent_0.UniversalAppPolicy).getAppFeaturePolicies;
local v4 = require(l_script_FirstAncestor_0.Flags.GetFFlagEnablePalisadesPaymentsPlatform);
local l_FFlagFixPalisadesPaymentPlatform_0 = require(l_Parent_0.SharedFlags).FFlagFixPalisadesPaymentPlatform;
return function(v6) --[[ Line: 11 ]] --[[ Name: getUpsellFlow ]]
    -- upvalues: l_getAppFeaturePolicies_0 (copy), v2 (copy), v4 (copy), l_FFlagFixPalisadesPaymentPlatform_0 (copy)
    if l_getAppFeaturePolicies_0().getRobuxUpsellFlowMobile() then
        return v2.Mobile;
    elseif v6 == Enum.Platform.Windows or v6 == Enum.Platform.OSX or v6 == Enum.Platform.Linux then
        return v2.Web;
    elseif v6 == Enum.Platform.IOS or v6 == Enum.Platform.Android or v6 == Enum.Platform.UWP then
        return v2.Mobile;
    elseif v6 == Enum.Platform.XBoxOne then
        return v2.Xbox;
    elseif v4() and (v6 == Enum.Platform.PS4 or l_FFlagFixPalisadesPaymentPlatform_0 and v6 == Enum.Platform.PS5) then
        return v2.Mobile;
    else
        return v2.None;
    end;
end;
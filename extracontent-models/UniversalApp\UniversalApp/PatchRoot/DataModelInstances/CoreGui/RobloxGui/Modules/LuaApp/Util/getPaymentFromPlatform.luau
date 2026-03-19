local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.LuaApp.Enum.PaymentPlatform);
local v3 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnablePalisadesPaymentsPlatform);
local l_FFlagEnableMicrosoftStorePaymentsPlatform_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableMicrosoftStorePaymentsPlatform;
local l_FFlagEnableMilkyWayPaymentsPlatformV2_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableMilkyWayPaymentsPlatformV2;
local l_FFlagFixPalisadesPaymentPlatform_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagFixPalisadesPaymentPlatform;
local l_getAppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
return function(v8, v9, v10) --[[ Line: 17 ]]
    -- upvalues: v2 (copy), l_FFlagEnableMicrosoftStorePaymentsPlatform_0 (copy), l_getAppFeaturePolicies_0 (copy), l_FFlagEnableMilkyWayPaymentsPlatformV2_0 (copy), v3 (copy), l_FFlagFixPalisadesPaymentPlatform_0 (copy)
    if v8 == Enum.Platform.XBoxOne then
        return v2.Xbox;
    elseif v8 == Enum.Platform.IOS then
        return v2.Apple;
    elseif v8 == Enum.Platform.Windows or v8 == Enum.Platform.OSX or v8 == Enum.Platform.Linux then
        if l_FFlagEnableMicrosoftStorePaymentsPlatform_0 and l_getAppFeaturePolicies_0().getUsePaymentPlatformMicrosoftStore() then
            return v2.Microsoft;
        else
            return v2.Web;
        end;
    elseif v8 == Enum.Platform.Android then
        if v9 then
            return v2.Amazon;
        elseif v10 then
            return v2.Maquettes;
        elseif l_FFlagEnableMilkyWayPaymentsPlatformV2_0 and l_getAppFeaturePolicies_0().getUsePaymentPlatformMilkyWayStore() then
            return v2.MilkyWay;
        else
            return v2.Google;
        end;
    elseif v8 == Enum.Platform.UWP then
        return v2.UWP;
    elseif v3() and (v8 == Enum.Platform.PS4 or l_FFlagFixPalisadesPaymentPlatform_0 and v8 == Enum.Platform.PS5) then
        return v2.Palisades;
    else
        return v2.None;
    end;
end;
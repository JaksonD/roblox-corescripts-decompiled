local l_UserInputService_0 = game:GetService("UserInputService");
local l_AvatarChatService_0 = game:GetService("AvatarChatService");
local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local v3 = require(l_Parent_0.SocialExperiments);
local l_FFlagTestDeviceForFAEUpsell_0 = v3.FFlagTestDeviceForFAEUpsell;
local l_deviceMeetsRequirementsForFAE_0 = v3.deviceMeetsRequirementsForFAE;
local l_FFlagAEGIS2UseGuacToShowFAEUpsell_0 = require(l_Parent_0.SharedFlags).FFlagAEGIS2UseGuacToShowFAEUpsell;
local v7 = nil;
if l_FFlagAEGIS2UseGuacToShowFAEUpsell_0 then
    v7 = require(l_Parent_0.UniversalAppPolicy);
end;
return function() --[[ Line: 21 ]]
    -- upvalues: l_FFlagAEGIS2UseGuacToShowFAEUpsell_0 (copy), l_UserInputService_0 (copy), l_AvatarChatService_0 (copy), l_FFlagTestDeviceForFAEUpsell_0 (copy), l_deviceMeetsRequirementsForFAE_0 (copy), v7 (ref)
    local v8 = false;
    if not l_FFlagAEGIS2UseGuacToShowFAEUpsell_0 then
        local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
        local v10;
        if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.IOS and l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Android and l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Windows then
            v10 = false;
            v8 = l_l_UserInputService_0_Platform_0 ~= Enum.Platform.OSX;
        end;
        if not v8 then
            v10 = l_AvatarChatService_0:deviceMeetsRequirementsForFeature(Enum.DeviceFeatureType.InExperienceFAE);
            if v10 then
                if l_FFlagTestDeviceForFAEUpsell_0 then
                    return (l_deviceMeetsRequirementsForFAE_0());
                else
                    v10 = true;
                end;
            end;
        end;
        v8 = false;
        return v10;
    else
        local v11 = v7.getAppFeaturePolicies().getShowInExpFAEUpsell();
        if v11 then
            v11 = l_AvatarChatService_0:deviceMeetsRequirementsForFeature(Enum.DeviceFeatureType.InExperienceFAE);
            if v11 then
                if l_FFlagTestDeviceForFAEUpsell_0 then
                    return (l_deviceMeetsRequirementsForFAE_0());
                else
                    v11 = true;
                end;
            end;
        end;
        return v11;
    end;
end;
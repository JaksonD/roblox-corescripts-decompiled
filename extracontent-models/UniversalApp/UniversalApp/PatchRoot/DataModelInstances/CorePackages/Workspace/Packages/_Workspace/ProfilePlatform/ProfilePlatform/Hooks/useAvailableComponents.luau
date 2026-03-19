local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_dependencyArray_0 = require(l_Parent_0.RoactUtils).Hooks.dependencyArray;
local _ = require(l_Parent_0.SocialCommon);
local _ = require(l_script_FirstAncestor_0.Types.Component);
local v6 = require(l_script_FirstAncestor_0.Common.Enums);
local v7 = require(l_script_FirstAncestor_0.Hooks.getAvailableUserComponents);
local v8 = require(l_script_FirstAncestor_0.Hooks.getAvailableCommunityComponents);
local v9 = require(l_script_FirstAncestor_0.Hooks.getAvailableContactComponents);
local v10 = require(l_script_FirstAncestor_0.Utils.getDeepValue);
local v11 = require(l_script_FirstAncestor_0.Contexts.useProfileWrapperContext);
local v12 = require(l_script_FirstAncestor_0.Hooks.useAreWebViewsSupported);
local v13 = require(l_script_FirstAncestor_0.Hooks.useIsProfileQrCodeEnabled);
local v14 = require(l_script_FirstAncestor_0.Hooks.useCanRenderTransferOnProfile);
local v15 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableCommunityProfilePage);
local v16 = require(l_script_FirstAncestor_0.Flags.FFlagProfilePlatformEnableVR);
local l_FFlagProfilePlatformEnableCurrencyTransfer_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer;
return function() --[[ Line: 25 ]]
    -- upvalues: v11 (copy), v10 (copy), v12 (copy), v13 (copy), v14 (copy), v2 (copy), v6 (copy), v7 (copy), v16 (copy), l_FFlagProfilePlatformEnableCurrencyTransfer_0 (copy), v15 (copy), v8 (copy), v9 (copy), l_dependencyArray_0 (copy)
    local v18 = v11();
    local l_profileType_0 = v18.profileType;
    local v20 = v10(v18, "sourceInfo.contextualInfoType");
    local v21 = v12();
    local v22 = v13();
    local v23 = v14();
    return (v2.useMemo(function() --[[ Line: 35 ]]
        -- upvalues: l_profileType_0 (copy), v6 (ref), v7 (ref), v20 (copy), v16 (ref), v21 (copy), v22 (copy), l_FFlagProfilePlatformEnableCurrencyTransfer_0 (ref), v23 (copy), v15 (ref), v8 (ref), v9 (ref)
        if l_profileType_0 == v6.ProfileTypes.User then
            return v7(v20, if v16 then {
                areWebViewsSupported = v21, 
                isProfileQrCodeEnabled = v22, 
                canRenderTransferInProfile = if l_FFlagProfilePlatformEnableCurrencyTransfer_0 then v23 else false
            } else {
                canRenderTransferInProfile = if l_FFlagProfilePlatformEnableCurrencyTransfer_0 then v23 else false
            });
        elseif v15 and l_profileType_0 == v6.ProfileTypes.Community then
            return v8();
        elseif l_profileType_0 == v6.ProfileTypes.Contact then
            return v9();
        else
            return {};
        end;
    end, if v16 then l_dependencyArray_0(l_profileType_0, v20, if l_FFlagProfilePlatformEnableCurrencyTransfer_0 then v23 else nil) else l_dependencyArray_0(l_profileType_0, v20, v21, v22, if l_FFlagProfilePlatformEnableCurrencyTransfer_0 then v23 else nil)));
end;
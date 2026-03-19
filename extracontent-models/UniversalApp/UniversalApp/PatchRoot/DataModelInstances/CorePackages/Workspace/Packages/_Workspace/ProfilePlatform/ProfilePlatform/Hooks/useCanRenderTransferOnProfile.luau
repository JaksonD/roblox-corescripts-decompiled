local l_Parent_0 = script:FindFirstAncestor("ProfilePlatform").Parent;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local l_FFlagProfilePlatformEnableCurrencyTransfer_0 = require(l_Parent_0.SharedFlags).FFlagProfilePlatformEnableCurrencyTransfer;
return function() --[[ Line: 9 ]]
    -- upvalues: l_useAppPolicy_0 (copy), l_FFlagProfilePlatformEnableCurrencyTransfer_0 (copy)
    return l_useAppPolicy_0(function(v3) --[[ Line: 10 ]]
        -- upvalues: l_FFlagProfilePlatformEnableCurrencyTransfer_0 (ref)
        if l_FFlagProfilePlatformEnableCurrencyTransfer_0 then
            return (v3.getCanRenderTransferOnProfile());
        else
            return false;
        end;
    end);
end;
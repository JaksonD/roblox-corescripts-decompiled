local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Promise);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.CredentialsProtocol).CredentialsProtocol.default;
local l_KeystoreConstants_0 = require(l_CorePackages_0.Workspace.Packages.AuthCommon).Common.KeystoreConstants;
local l_GetFFlagCheckIsAvailableForKeystoreOperations_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagCheckIsAvailableForKeystoreOperations;
return function(v5) --[[ Line: 10 ]]
    -- upvalues: l_GetFFlagCheckIsAvailableForKeystoreOperations_0 (copy), l_default_0 (copy), l_KeystoreConstants_0 (copy), v1 (copy)
    if l_GetFFlagCheckIsAvailableForKeystoreOperations_0() then
        return l_default_0:isAvailable(l_default_0.CredentialsTypes.keystore, l_KeystoreConstants_0.KeystoreTimeout):andThen(function(v6) --[[ Line: 15 ]]
            -- upvalues: l_default_0 (ref), v5 (copy), l_KeystoreConstants_0 (ref), v1 (ref)
            if v6 and v6.keystore and v6.keystore.isAvailable then
                return l_default_0:deleteAllCredentialsFromKeystore(l_default_0.CredentialsTypes.keystore, v5, l_KeystoreConstants_0.KeystoreTimeout);
            else
                return v1.resolve(nil);
            end;
        end);
    else
        return l_default_0:deleteAllCredentialsFromKeystore(l_default_0.CredentialsTypes.keystore, v5, l_KeystoreConstants_0.KeystoreTimeout);
    end;
end;
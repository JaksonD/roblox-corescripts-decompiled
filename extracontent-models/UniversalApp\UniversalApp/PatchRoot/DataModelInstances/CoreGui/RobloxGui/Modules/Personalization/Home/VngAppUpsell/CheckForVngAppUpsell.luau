local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_LoginStatus_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).LoginStatus;
local l_useAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).useAppPolicy;
local v5 = require(script.Parent.CheckForVngAppUpsellForVnUsers);
return function(_) --[[ Line: 10 ]] --[[ Name: CheckForVngAppUpsell ]]
    -- upvalues: l_useSelector_0 (copy), l_LoginStatus_0 (copy), l_useAppPolicy_0 (copy), v1 (copy), v5 (copy)
    local v10 = l_useSelector_0(function(v7) --[[ Line: 11 ]]
        -- upvalues: l_LoginStatus_0 (ref)
        local l_CountryCode_0 = v7.CountryCode;
        local v9 = false;
        if v7.AuthenticationStatus.status == l_LoginStatus_0.LOGGED_IN then
            v9 = l_CountryCode_0 == "VN";
        end;
        return v9;
    end);
    local v12 = l_useAppPolicy_0(function(v11) --[[ Line: 15 ]]
        return v11.getVngAppUpsell();
    end);
    if v10 and v12 then
        return v1.createElement(v5);
    else
        return nil;
    end;
end;
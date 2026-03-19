local l_script_FirstAncestor_0 = script:FindFirstAncestor("PreHomePage");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Logger_0 = require(l_Parent_0.Loggers).Logger;
local v3 = require(l_Parent_0.Promise);
local v4 = require(l_Parent_0.SharedFlags);
local v5 = require(l_script_FirstAncestor_0.Common);
local l_HandlePasskeyUpsell_0 = require(l_script_FirstAncestor_0.Routes.PasskeyUpsell).HandlePasskeyUpsell;
local l_HandleTutorialUpsell_0 = require(l_script_FirstAncestor_0.Routes.TutorialUpsell).HandleTutorialUpsell;
local l_HandleSilentUpgrade_0 = require(l_script_FirstAncestor_0.Routes.SilentUpgrade).HandleSilentUpgrade;
local l_HandleNotificationsPermissions_0 = require(l_script_FirstAncestor_0.Routes.Notifications).HandleNotificationsPermissions;
local l_FFlagPreHomePageRoutingEnabled_0 = v4.FFlagPreHomePageRoutingEnabled;
local l_FFlagPasskeyUpsellEnabled_0 = v4.FFlagPasskeyUpsellEnabled;
local l_FFlagPasskeySilentUpgradeEnabled_0 = v4.FFlagPasskeySilentUpgradeEnabled;
local l_FFlagTutorialUpsellEnabled_0 = v4.FFlagTutorialUpsellEnabled;
local l_FFlagEnableSystemTrayModals_0 = v4.FFlagEnableSystemTrayModals;
local l_FFlagEnablePWManagerLoginCheck_0 = v4.FFlagEnablePWManagerLoginCheck;
local l_didUsePasswordManagerMediatedLogin_0 = v5.Checks.didUsePasswordManagerMediatedLogin;
local function v26(v17, v18, v19, v20, v21) --[[ Line: 40 ]] --[[ Name: handleUpsellRouting ]]
    -- upvalues: l_Logger_0 (copy)
    local v24, v25 = v18(v19, v20, v21):andThen(function(v22) --[[ Line: 42 ]]
        -- upvalues: l_Logger_0 (ref), v17 (copy)
        if v22 then
            l_Logger_0:info("User is eligible for {} upsell, proceeding with upsell", v17);
            return true;
        else
            l_Logger_0:info("User is not eligible for {} upsell", v17);
            return false;
        end;
    end):catch(function(v23) --[[ Line: 51 ]]
        -- upvalues: l_Logger_0 (ref), v17 (copy)
        l_Logger_0:warning("Error checking {} upsell eligibility: {}", v17, v23);
        return false;
    end):await();
    if not v24 then
        l_Logger_0:warning("Unknown error checking {} upsell eligibility", v17);
        return false;
    elseif v25 then
        return true;
    else
        return false;
    end;
end;
return function(v27, v28, v29) --[[ Line: 78 ]] --[[ Name: handlePreHomePageRouting ]]
    -- upvalues: l_FFlagPreHomePageRoutingEnabled_0 (copy), l_FFlagPasskeyUpsellEnabled_0 (copy), v3 (copy), l_FFlagEnablePWManagerLoginCheck_0 (copy), l_didUsePasswordManagerMediatedLogin_0 (copy), l_FFlagPasskeySilentUpgradeEnabled_0 (copy), l_HandleSilentUpgrade_0 (copy), v26 (copy), l_HandlePasskeyUpsell_0 (copy), l_FFlagTutorialUpsellEnabled_0 (copy), l_HandleTutorialUpsell_0 (copy), l_FFlagEnableSystemTrayModals_0 (copy), l_HandleNotificationsPermissions_0 (copy)
    if not l_FFlagPreHomePageRoutingEnabled_0 and not l_FFlagPasskeyUpsellEnabled_0 then
        return v3.resolve(false);
    else
        if l_FFlagEnablePWManagerLoginCheck_0 then
            if l_didUsePasswordManagerMediatedLogin_0() then
                if l_FFlagPasskeySilentUpgradeEnabled_0 then
                    l_HandleSilentUpgrade_0(v27, v28);
                end;
            elseif l_FFlagPasskeyUpsellEnabled_0 and v26("passkey", l_HandlePasskeyUpsell_0, v27, v28, v29) then
                return v3.resolve(true);
            end;
        elseif l_FFlagPasskeyUpsellEnabled_0 and v26("passkey", l_HandlePasskeyUpsell_0, v27, v28, v29) then
            return v3.resolve(true);
        end;
        if l_FFlagTutorialUpsellEnabled_0 and v26("tutorial", l_HandleTutorialUpsell_0, v27, v28, v29) then
            return v3.resolve(true);
        elseif l_FFlagEnableSystemTrayModals_0 and v26("notifications", l_HandleNotificationsPermissions_0, v27, v28, v29) then
            return v3.resolve(false);
        else
            if not l_FFlagEnablePWManagerLoginCheck_0 and l_FFlagPasskeySilentUpgradeEnabled_0 then
                l_HandleSilentUpgrade_0(v27, v28);
            end;
            return v3.resolve(false);
        end;
    end;
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.SharedFlags);
local l_Enums_0 = require(l_Parent_0.CurrencyTransfers).Enums;
local l_TransferDirection_0 = l_Enums_0.TransferDirection;
local l_TransferOrigination_0 = l_Enums_0.TransferOrigination;
local v6 = require(l_script_FirstAncestor_0.Common.Enums);
local _ = require(l_script_FirstAncestor_0.Components.CTARow.Types);
local v8 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local l_FFlagProfilePlatformEnableCurrencyTransfer_0 = v2.FFlagProfilePlatformEnableCurrencyTransfer;
return {
    [v6.ProfileActions.CurrencyTransfer] = l_FFlagProfilePlatformEnableCurrencyTransfer_0 and function(v10) --[[ Line: 17 ]]
        -- upvalues: v6 (copy), v8 (copy), l_TransferDirection_0 (copy), l_TransferOrigination_0 (copy)
        return {
            text = v10.localized[v6.ProfileActions.CurrencyTransfer], 
            onActivated = function() --[[ Line: 20 ]] --[[ Name: onActivated ]]
                -- upvalues: v10 (copy), v6 (ref), v8 (ref), l_TransferDirection_0 (ref), l_TransferOrigination_0 (ref)
                if v10.buttonSurface == v6.ButtonSurface.ContextualMenu then
                    v10.analytics.fireAnalyticsEvent(v8.ContextualMenuButtonCurrencyTransfer, {
                        buttonSurface = v10.buttonSurface
                    });
                else
                    v10.analytics.fireAnalyticsEvent(v8.CTAButtonCurrencyTransfer, {
                        buttonSurface = v10.buttonSurface
                    });
                end;
                local v11 = v10.navigateTo and v10.navigateTo.navigateToTransfer;
                if v11 then
                    v11({
                        recipientUserId = v10.profileId, 
                        direction = l_TransferDirection_0.Send, 
                        transferOrigination = l_TransferOrigination_0.Profile
                    });
                end;
            end
        };
    end or nil
};
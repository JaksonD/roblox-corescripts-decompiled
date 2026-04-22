local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_IconName_0 = require(l_Parent_0.Foundation).Enums.IconName;
local v3 = require(l_script_FirstAncestor_0.Common.Enums);
local _ = require(l_script_FirstAncestor_0.Components.CTARow.Types);
local v5 = require(l_script_FirstAncestor_0.Analytics.EventNames);
return {
    [v3.ProfileActions.QrCode] = function(v6) --[[ Line: 13 ]]
        -- upvalues: l_IconName_0 (copy), v5 (copy)
        return {
            icon = l_IconName_0.SquaresGridQr, 
            onActivated = function() --[[ Line: 16 ]] --[[ Name: onActivated ]]
                -- upvalues: v6 (copy), v5 (ref)
                v6.analytics.fireAnalyticsEvent(v5.CTAButtonShareProfileQRCode, {
                    buttonSurface = v6.buttonSurface
                });
                v6.navigateTo.qRCodePage();
            end
        };
    end
};
local l_Parent_0 = script:FindFirstAncestor("SduiSharedUtilities").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_SystemBanner_0 = v2.SystemBanner;
local l_AlertSeverity_0 = v2.Enums.AlertSeverity;
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
return v1.memo(function(v7) --[[ Line: 18 ]] --[[ Name: SduiPageErrorState ]]
    -- upvalues: l_useLocalization_0 (copy), v1 (copy), l_SystemBanner_0 (copy), l_AlertSeverity_0 (copy), l_ButtonVariant_0 (copy)
    local v8 = l_useLocalization_0({
        title = "CommonUI.Messages.Response.PageError", 
        description = "Feature.Toast.NetworkingError.SomethingIsWrong", 
        retry = "InGame.CommonUI.Button.Retry"
    });
    return v1.createElement(l_SystemBanner_0, {
        severity = l_AlertSeverity_0.Error, 
        title = v8.title, 
        description = v8.description, 
        actions = {
            {
                text = v8.retry, 
                variant = l_ButtonVariant_0.Standard, 
                onActivated = v7.refresh
            }
        }
    });
end);
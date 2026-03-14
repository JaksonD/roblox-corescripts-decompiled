local l_Parent_0 = script:FindFirstAncestor("EngagementScreen").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.UIBlox);
local l_Button_0 = v2.App.Button.Button;
local l_ButtonType_0 = v2.App.Button.Enum.ButtonType;
local l_StandardButtonSize_0 = v2.App.Button.Enum.StandardButtonSize;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
return function(v7) --[[ Line: 16 ]]
    -- upvalues: l_useLocalization_0 (copy), v1 (copy), l_Button_0 (copy), l_ButtonType_0 (copy), l_StandardButtonSize_0 (copy)
    local v8 = l_useLocalization_0({
        switchAccounts = {
            "CommonUI.Features.Label.EngagementScreen.SwitchAccounts"; 
            platform = "Console"
        }
    });
    return v1.createElement(l_Button_0, {
        buttonType = l_ButtonType_0.Secondary, 
        text = v8.switchAccounts, 
        fontStyle = v7.fontStyle, 
        standardSize = l_StandardButtonSize_0.Regular, 
        layoutOrder = v7.layoutOrder, 
        onActivated = v7.onActivated, 
        fitContent = true
    });
end;
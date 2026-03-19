local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local v7 = require(l_RobloxGui_0.Modules.InGameMenuConstants);
local l_ControllerBar_0 = v6.App.Bar.ControllerBar;
local _ = require(l_CorePackages_0.Workspace.Packages.RobloxTranslator);
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.InExperienceLocales).Localization;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v12 = {
    back = "CoreScripts.TopBar.Back", 
    leave = "CoreScripts.TopBar.Leave", 
    respawn = "CoreScripts.TopBar.Respawn", 
    showChat = "CoreScripts.TopBar.ShowChat", 
    hideChat = "CoreScripts.TopBar.HideChat"
};
return function(v13) --[[ Line: 27 ]] --[[ Name: QuickMenuControllerBar ]]
    -- upvalues: l_Localization_0 (copy), l_LocalizationService_0 (copy), v12 (copy), v4 (copy), l_useSelector_0 (copy), v5 (copy), l_CoreGui_0 (copy), v7 (copy), l_ControllerBar_0 (copy)
    local v14 = l_Localization_0.new(l_LocalizationService_0.RobloxLocaleId);
    local v15 = {
        {
            text = v14:Format(v12.respawn), 
            keyCode = Enum.KeyCode.ButtonY
        }, 
        {
            text = v14:Format(v12.leave), 
            keyCode = Enum.KeyCode.ButtonX
        }
    };
    if v13.chatMenuEnabled then
        local v17 = v4.useCallback(function(v16) --[[ Line: 44 ]]
            return v16.chat.visible;
        end);
        table.insert(v15, 1, {
            text = v14:Format(if l_useSelector_0(v17) then v12.hideChat else v12.showChat), 
            keyCode = Enum.KeyCode.ButtonR1
        });
    end;
    return v4.createElement(v5.Portal, {
        target = l_CoreGui_0
    }, {
        QuickMenuControllerBar = v4.createElement("ScreenGui", {
            DisplayOrder = v7.DisplayOrder.ControllerBar
        }, {
            ControllerBar = v4.createElement(l_ControllerBar_0, {
                leftHint = {
                    text = v14:Format(v12.back), 
                    keyCode = Enum.KeyCode.ButtonB
                }, 
                rightHints = v15
            })
        })
    });
end;
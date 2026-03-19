local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Chrome");
local v4 = require(l_script_FirstAncestor_0.ChromeShared.Unibar.Constants);
local l_FocusUtils_0 = require(l_CorePackages_0.Workspace.Packages.Chrome).FocusUtils;
local v6 = require(l_script_FirstAncestor_0.Service);
local v7 = require(l_script_FirstAncestor_0.Flags.FFlagChatIntegrationFixShortcut);
local _ = require(l_script_FirstAncestor_0.ChromeShared.Service.Types);
local v9 = require(l_CorePackages_0.Workspace.Packages.InputType);
local l_getInputGroup_0 = v9.getInputGroup;
local v11 = require(l_CorePackages_0.Workspace.Packages.ExpChat).Stores.GetFocusNavigationStore(false);
local v12 = require(l_RobloxGui_0.Modules.ChatSelector);
local function _() --[[ Line: 20 ]] --[[ Name: isUsingGamepad ]]
    -- upvalues: l_getInputGroup_0 (copy), l_UserInputService_0 (copy), v9 (copy)
    return l_getInputGroup_0(l_UserInputService_0:GetLastInputType()) == v9.InputTypeConstants.Gamepad;
end;
return function(_) --[[ Line: 25 ]]
    -- upvalues: v12 (copy), l_getInputGroup_0 (copy), l_UserInputService_0 (copy), v9 (copy), l_FocusUtils_0 (copy), v7 (copy), v6 (copy), v4 (copy), v11 (copy)
    if v12:GetVisibility() and l_getInputGroup_0(l_UserInputService_0:GetLastInputType()) == v9.InputTypeConstants.Gamepad then
        l_FocusUtils_0.FocusOffChrome(function() --[[ Line: 27 ]]
            -- upvalues: v7 (ref), v6 (ref), v4 (ref), v11 (ref)
            if not v7 then
                v6:setShortcutBar(v4.UNIBAR_SHORTCUTBAR_ID);
            end;
            v11.focusChatInputBar();
        end);
    end;
end;
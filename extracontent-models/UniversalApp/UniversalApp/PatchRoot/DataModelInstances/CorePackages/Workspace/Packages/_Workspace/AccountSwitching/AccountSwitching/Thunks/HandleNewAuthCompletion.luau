local l_script_FirstAncestor_0 = script:FindFirstAncestor("AccountSwitching");
local l_GuiService_0 = game:GetService("GuiService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 = require(l_Parent_0.SharedFlags).FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues;
local v5 = require(l_Parent_0.AuthCommon);
local l_NotificationType_0 = require(l_Parent_0.RobloxAppEnums).NotificationType;
local l_AccountSwitcherConstants_0 = v5.Common.AccountSwitcherConstants;
local l_AppStorageUtilities_0 = v5.Utils.AppStorageUtilities;
return function(v9, v10, v11, v12) --[[ Line: 15 ]]
    -- upvalues: l_AccountSwitcherConstants_0 (copy), l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 (copy), l_AppStorageUtilities_0 (copy), l_AppStorageService_0 (copy), l_GuiService_0 (copy), l_NotificationType_0 (copy)
    if v9 then
        v10();
        local l_AccountSwitcherSwitchedStatus_0 = l_AccountSwitcherConstants_0.AccountSwitcherSwitchedStatus;
        if l_FFlagLuaEnableLoginAndSignupDifferentiatedStatusValues_0 then
            l_AccountSwitcherSwitchedStatus_0 = if v12 then l_AccountSwitcherConstants_0.AccountSwitcherSwitchedFromSignupStatus else l_AccountSwitcherConstants_0.AccountSwitcherSwitchedFromLoginStatus;
        end;
        l_AppStorageUtilities_0.setAccountSwitchStatus(l_AccountSwitcherSwitchedStatus_0);
        l_AppStorageService_0:Flush();
        l_GuiService_0:BroadcastNotification("", l_NotificationType_0.DID_SWITCH_ACCOUNT);
        return;
    else
        v11();
        return;
    end;
end;
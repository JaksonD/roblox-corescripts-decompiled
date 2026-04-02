local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_VRService_0 = game:GetService("VRService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v5 = require(l_RobloxGui_0.Modules.PlayerList.PlayerListManager);
local l_MouseIconOverrideService_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService;
local l_FFlagGameInviteModalUnlockMouse_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagGameInviteModalUnlockMouse;
local v8 = require(l_CorePackages_0.Workspace.Packages.GameInvite);
local l_renderCoreScriptGameInviteModalContainer_0 = v8.renderCoreScriptGameInviteModalContainer;
local l_GameInviteModalManager_0 = v8.GameInviteModalManager;
local v11 = require(l_CoreGui_0.RobloxGui.Modules.ApolloClient);
local function v13(v12) --[[ Line: 19 ]]
    -- upvalues: v5 (copy), l_FFlagGameInviteModalUnlockMouse_0 (copy), l_UserInputService_0 (copy), l_VRService_0 (copy), l_MouseIconOverrideService_0 (copy)
    if v12 then
        v5:HideTemp("GameInviteMenu", true);
        if l_FFlagGameInviteModalUnlockMouse_0 and l_UserInputService_0.MouseEnabled and not l_VRService_0.VREnabled then
            l_MouseIconOverrideService_0.push("GameInviteModal", Enum.OverrideMouseIconBehavior.ForceShow);
            return;
        end;
    else
        v5:HideTemp("GameInviteMenu", false);
        if l_FFlagGameInviteModalUnlockMouse_0 then
            l_MouseIconOverrideService_0.pop("GameInviteModal");
        end;
    end;
end;
l_renderCoreScriptGameInviteModalContainer_0(v11);
l_GameInviteModalManager_0.ToggleGameInviteModalEvent.Event:Connect(v13);
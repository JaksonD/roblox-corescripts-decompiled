local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v3 = require(l_RobloxGui_0.Modules.PlayerList.PlayerListManager);
local v4 = require(l_CorePackages_0.Workspace.Packages.GameInvite);
local l_renderCoreScriptGameInviteModalContainer_0 = v4.renderCoreScriptGameInviteModalContainer;
local l_GameInviteModalManager_0 = v4.GameInviteModalManager;
local v7 = require(l_CoreGui_0.RobloxGui.Modules.ApolloClient);
local function v9(v8) --[[ Line: 11 ]]
    -- upvalues: v3 (copy)
    if v8 then
        v3:HideTemp("GameInviteMenu", true);
        return;
    else
        v3:HideTemp("GameInviteMenu", false);
        return;
    end;
end;
l_renderCoreScriptGameInviteModalContainer_0(v7);
l_GameInviteModalManager_0.ToggleGameInviteModalEvent.Event:Connect(v9);
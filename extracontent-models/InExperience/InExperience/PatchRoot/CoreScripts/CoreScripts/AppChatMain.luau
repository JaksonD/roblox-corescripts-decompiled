local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_ChatEntryPointNames_0 = require(l_CorePackages_0.Workspace.Packages.SocialCommon).Enums.ChatEntryPointNames;
local v4 = require(l_CoreGui_0.RobloxGui.Modules.ApolloClient);
local v5 = require(l_RobloxGui_0.Modules.Flags.GetFFlagFixSettingshubImportOrder);
local v6 = require(l_RobloxGui_0.Modules.Flags.FFlagRemoveLoadingTimeout);
local v7 = require(l_CorePackages_0.Workspace.Packages.Chrome).Enabled();
if v5() and (not v6 or not v7) then
    l_CoreGui_0:WaitForChild("TopBarApp", v6 and 1e999 or nil);
end;
local v8 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
local v9 = require(l_CorePackages_0.Workspace.Packages.AppChat);
local l_InExperienceAppChatModal_0 = v9.App.InExperienceAppChatModal;
local l_renderCoreScriptInExperienceAppChat_0 = v9.App.renderCoreScriptInExperienceAppChat;
local v12 = require(l_RobloxGui_0.Modules.Chrome.ChromeShared.Service.ViewportUtil);
local v13 = require(l_RobloxGui_0.Modules.ChatSelector);
local v14 = require(l_RobloxGui_0.Modules.PlayerList.PlayerListManager);
local v15 = require(l_RobloxGui_0.Modules.TopBar.Constants);
local l_GetFFlagIsSquadEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagIsSquadEnabled;
local v17 = v15.ApplyDisplayScale(v15.TopBarTopMargin);
l_InExperienceAppChatModal_0.default:initialize(v17, v8, v12, v13, v14);
l_renderCoreScriptInExperienceAppChat_0(v4, {
    getParentContainer = function() --[[ Line: 40 ]] --[[ Name: getParentContainer ]]
        -- upvalues: l_InExperienceAppChatModal_0 (copy)
        return l_InExperienceAppChatModal_0.default.frame;
    end, 
    visibilitySignal = l_InExperienceAppChatModal_0.default.visibilitySignal.Event, 
    getShouldSetAppChatVisible = function(...) --[[ Line: 44 ]] --[[ Name: getShouldSetAppChatVisible ]]
        -- upvalues: l_InExperienceAppChatModal_0 (copy)
        return l_InExperienceAppChatModal_0:getVisible();
    end, 
    entryPoint = l_ChatEntryPointNames_0.ChromeDropdown, 
    hideParentContainer = function() --[[ Line: 50 ]] --[[ Name: hideParentContainer ]]
        -- upvalues: l_InExperienceAppChatModal_0 (copy)
        l_InExperienceAppChatModal_0.default:setVisible(false);
    end, 
    showParentContainer = function() --[[ Line: 53 ]] --[[ Name: showParentContainer ]]
        -- upvalues: l_InExperienceAppChatModal_0 (copy)
        l_InExperienceAppChatModal_0.default:setVisible(true);
    end, 
    updateCurrentSquadId = function(v18) --[[ Line: 56 ]] --[[ Name: updateCurrentSquadId ]]
        -- upvalues: l_GetFFlagIsSquadEnabled_0 (copy), l_InExperienceAppChatModal_0 (copy)
        if l_GetFFlagIsSquadEnabled_0() then
            l_InExperienceAppChatModal_0:setCurrentSquadId(v18);
        end;
    end
}, function(v19) --[[ Line: 35 ]]
    -- upvalues: l_InExperienceAppChatModal_0 (copy)
    l_InExperienceAppChatModal_0:setUnreadCount(v19);
end);
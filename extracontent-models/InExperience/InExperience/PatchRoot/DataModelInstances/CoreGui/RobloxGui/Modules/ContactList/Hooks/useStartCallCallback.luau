local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local l_FaceAnimatorService_0 = game:GetService("FaceAnimatorService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v7 = nil;
local v8 = require(l_CorePackages_0.Packages.React);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.CallProtocol).CallProtocol.default;
local l_Sounds_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).Sounds;
local l_SoundGroups_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundGroups;
local l_SoundManager_0 = require(l_CorePackages_0.Workspace.Packages.SoundManager).SoundManager;
local l_ContactList_0 = l_RobloxGui_0.Modules.ContactList;
local l_dependencyArray_0 = require(l_ContactList_0.dependencies).Hooks.dependencyArray;
local v15 = require(l_ContactList_0.Analytics.useAnalytics);
local v16 = require(l_ContactList_0.Analytics.EventNamesEnum);
local _ = require(l_ContactList_0.Enums.Pages);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableIrisRerouteToRCC");
return function(v20, v21, v22, v23, v24) --[[ Line: 32 ]]
    -- upvalues: v15 (copy), v8 (copy), l_SoundManager_0 (copy), l_Sounds_0 (copy), l_SoundGroups_0 (copy), v7 (ref), l_RobloxGui_0 (copy), l_FaceAnimatorService_0 (copy), v16 (copy), l_game_EngineFeature_0 (copy), l_Players_0 (copy), l_default_0 (copy), l_HttpService_0 (copy), l_RobloxReplicatedStorage_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy)
    local v25 = v15();
    return v8.useCallback(function() --[[ Line: 42 ]]
        -- upvalues: l_SoundManager_0 (ref), l_Sounds_0 (ref), l_SoundGroups_0 (ref), v7 (ref), l_RobloxGui_0 (ref), l_FaceAnimatorService_0 (ref), v25 (copy), v16 (ref), v21 (copy), v24 (copy), l_game_EngineFeature_0 (ref), l_Players_0 (ref), l_default_0 (ref), v22 (copy), l_HttpService_0 (ref), v20 (copy), l_RobloxReplicatedStorage_0 (ref), v23 (copy)
        l_SoundManager_0:PlaySound(l_Sounds_0.Select.Name, {
            Volume = 0.5
        }, l_SoundGroups_0.Iris);
        if v7 == nil then
            v7 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
        end;
        local v26 = v7.localMuted == nil or v7.localMuted;
        local v27 = if l_FaceAnimatorService_0:IsStarted() then l_FaceAnimatorService_0.VideoAnimationEnabled else false;
        v25.fireEvent(v16.PhoneBookCallFriendClicked, {
            eventTimestampMs = os.time() * 1000, 
            friendUserId = tonumber(v21), 
            searchQueryString = v24.searchQueryString, 
            itemListIndex = v24.itemListIndex, 
            isSuggestedUser = v24.isSuggestedUser, 
            page = tostring(v24.page)
        });
        if l_game_EngineFeature_0 then
            local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
            if l_LocalPlayer_0 then
                l_default_0:initCall(tonumber(l_LocalPlayer_0.UserId) or 0, tonumber(v21) or 0, l_LocalPlayer_0.DisplayName, v22, v26, v27, l_HttpService_0:GenerateGUID(false), v20);
            end;
        else
            coroutine.wrap(function() --[[ Line: 79 ]]
                -- upvalues: l_RobloxReplicatedStorage_0 (ref), v20 (ref), v21 (ref), v22 (ref), v26 (copy), v27 (copy)
                l_RobloxReplicatedStorage_0:WaitForChild("ContactListInvokeIrisInvite", 1e999):FireServer(v20, tonumber(v21), v22, v26, v27);
            end)();
        end;
        v23();
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v20, 
        v21, 
        v22, 
        v23, 
        v24
    } else l_dependencyArray_0(v20, v21, v22, v23, v24));
end;
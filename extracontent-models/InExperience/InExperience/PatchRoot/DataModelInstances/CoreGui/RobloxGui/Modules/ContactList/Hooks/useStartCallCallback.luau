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
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableIrisRerouteToRCC");
return function(v19, v20, v21, v22, v23) --[[ Line: 29 ]]
    -- upvalues: v15 (copy), v8 (copy), l_SoundManager_0 (copy), l_Sounds_0 (copy), l_SoundGroups_0 (copy), v7 (ref), l_RobloxGui_0 (copy), l_FaceAnimatorService_0 (copy), v16 (copy), l_game_EngineFeature_0 (copy), l_Players_0 (copy), l_default_0 (copy), l_HttpService_0 (copy), l_RobloxReplicatedStorage_0 (copy), l_dependencyArray_0 (copy)
    local v24 = v15();
    return v8.useCallback(function() --[[ Line: 38 ]]
        -- upvalues: l_SoundManager_0 (ref), l_Sounds_0 (ref), l_SoundGroups_0 (ref), v7 (ref), l_RobloxGui_0 (ref), l_FaceAnimatorService_0 (ref), v24 (copy), v16 (ref), v20 (copy), v23 (copy), l_game_EngineFeature_0 (ref), l_Players_0 (ref), l_default_0 (ref), v21 (copy), l_HttpService_0 (ref), v19 (copy), l_RobloxReplicatedStorage_0 (ref), v22 (copy)
        l_SoundManager_0:PlaySound(l_Sounds_0.Select.Name, {
            Volume = 0.5
        }, l_SoundGroups_0.Iris);
        if v7 == nil then
            v7 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceChatServiceManager).default;
        end;
        local v25 = v7.localMuted == nil or v7.localMuted;
        local v26 = if l_FaceAnimatorService_0:IsStarted() then l_FaceAnimatorService_0.VideoAnimationEnabled else false;
        v24.fireEvent(v16.PhoneBookCallFriendClicked, {
            eventTimestampMs = os.time() * 1000, 
            friendUserId = tonumber(v20), 
            searchQueryString = v23.searchQueryString, 
            itemListIndex = v23.itemListIndex, 
            isSuggestedUser = v23.isSuggestedUser, 
            page = tostring(v23.page)
        });
        if l_game_EngineFeature_0 then
            local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
            if l_LocalPlayer_0 then
                l_default_0:initCall(tonumber(l_LocalPlayer_0.UserId) or 0, tonumber(v20) or 0, l_LocalPlayer_0.DisplayName, v21, v25, v26, l_HttpService_0:GenerateGUID(false), v19);
            end;
        else
            coroutine.wrap(function() --[[ Line: 73 ]]
                -- upvalues: l_RobloxReplicatedStorage_0 (ref), v19 (ref), v20 (ref), v21 (ref), v25 (copy), v26 (copy)
                l_RobloxReplicatedStorage_0:WaitForChild("ContactListInvokeIrisInvite", 1e999):FireServer(v19, tonumber(v20), v21, v25, v26);
            end)();
        end;
        v22();
    end, l_dependencyArray_0(v19, v20, v21, v22, v23));
end;
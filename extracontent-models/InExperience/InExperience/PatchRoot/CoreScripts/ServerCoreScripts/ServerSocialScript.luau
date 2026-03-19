local l_HttpService_0 = game:GetService("HttpService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_Players_0 = game:GetService("Players");
local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
local _ = game:GetService("RunService");
local l_Chat_0 = game:GetService("Chat");
local l_TextChatService_0 = game:GetService("TextChatService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).Url;
game:DefineFastFlag("EnableSetUserBlocklistInitialized", false);
local v11 = require(l_RobloxGui_0.Modules.Common.Flags.FFlagInExperienceUserProfileSettingsEnabled);
local v12 = require(l_RobloxGui_0.Modules.Common.Flags.FFlagInExperienceRequestProfileSettings);
local v13 = require(l_RobloxGui_0.Modules.Common.Flags.FStringRccInExperienceNameEnabledAllowList);
local v14 = game:DefineFastFlag("UseNewDirectChatAPI", false);
local v15 = game:DefineFastFlag("EnableCreatePartyNudge", false);
local v16 = game:DefineFastFlag("EnableCreatePartyNudgeWithVersion", false);
local l_FFlagEnablePartyNudgeAfterJoin_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnablePartyNudgeAfterJoin;
local l_FFlagBadgeVisibilitySettingEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagBadgeVisibilitySettingEnabled;
local l_FFlagEnableModerateChatRemoteEvent_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableModerateChatRemoteEvent;
local v20 = game:DefineFastFlag("ProfileSettingsSlidingWindowRateLimit", false);
local v21 = game:DefineFastInt("ProfileSettingsRateLimitSeconds", 5);
local v22 = game:DefineFastInt("ProfileSettingsMaxRequestsPerWindow", 3);
local v23 = game:DefineFastInt("ProfileSettingsRateLimitWindowSeconds", 60);
local v24 = game:DefineFastFlag("DisableRCCAntiHarrasmentAllowList", false);
local v25 = game:DefineFastFlag("UseGetCanManageAsync", false) and game:GetEngineFeature("LuaGetCanManageAsync");
local v26 = game:DefineFastFlag("GatePrivateServerNudge", false);
local v27 = {};
local v28 = {
    Admin = {
        GroupId = 1200769
    }, 
    Intern = {
        GroupId = 2868472, 
        GroupRank = 100
    }, 
    Star = {
        GroupId = 4199740
    }, 
    SpanishLocalizationExpert = {
        GroupId = 4265462, 
        GroupRank = 252
    }, 
    BrazilianLocalizationExpert = {
        GroupId = 4265456, 
        GroupRank = 252
    }, 
    FrenchLocalizationExpert = {
        GroupId = 4265443, 
        GroupRank = 252
    }, 
    GermanLocalizationExpert = {
        GroupId = 4265449, 
        GroupRank = 252
    }
};
if game.CreatorType == Enum.CreatorType.Group then
    v28.PlaceCreator = {
        GroupId = game.CreatorId, 
        GroupRank = 255
    };
end;
local v29 = {};
local v30 = {};
local v31 = {};
local v32 = {};
local v33 = {};
game:DefineFastInt("MaxBlockListSize", 500);
local l_RemoteEvent_0 = Instance.new("RemoteEvent");
l_RemoteEvent_0.Name = "CanChatWith";
l_RemoteEvent_0.Parent = l_RobloxReplicatedStorage_0;
local l_RemoteEvent_1 = Instance.new("RemoteEvent");
l_RemoteEvent_1.Name = "SetPlayerBlockList";
l_RemoteEvent_1.Parent = l_RobloxReplicatedStorage_0;
local l_RemoteEvent_2 = Instance.new("RemoteEvent");
l_RemoteEvent_2.Name = "UpdatePlayerBlockList";
l_RemoteEvent_2.Parent = l_RobloxReplicatedStorage_0;
local l_RemoteEvent_3 = Instance.new("RemoteEvent");
l_RemoteEvent_3.Name = "NewPlayerGroupDetails";
l_RemoteEvent_3.Parent = l_RobloxReplicatedStorage_0;
local l_RemoteEvent_4 = Instance.new("RemoteEvent");
l_RemoteEvent_4.Name = "NewPlayerCanManageDetails";
l_RemoteEvent_4.Parent = l_RobloxReplicatedStorage_0;
local l_RemoteEvent_5 = Instance.new("RemoteEvent");
l_RemoteEvent_5.Name = "SendPlayerBlockList";
l_RemoteEvent_5.Parent = l_RobloxReplicatedStorage_0;
local l_RemoteEvent_6 = Instance.new("RemoteEvent");
l_RemoteEvent_6.Name = "UpdateLocalPlayerBlockList";
l_RemoteEvent_6.Parent = l_RobloxReplicatedStorage_0;
local l_RemoteEvent_7 = Instance.new("RemoteEvent");
l_RemoteEvent_7.Name = "SendPlayerProfileSettings";
l_RemoteEvent_7.Parent = l_RobloxReplicatedStorage_0;
local v42 = nil;
if v12 then
    v42 = Instance.new("RemoteEvent");
    v42.Name = "RequestPlayerProfileSettings";
    v42.Parent = l_RobloxReplicatedStorage_0;
end;
local v43 = nil;
if l_FFlagBadgeVisibilitySettingEnabled_0 then
    v43 = Instance.new("RemoteEvent");
    v43.Name = "UpdatePlayerProfileSettings";
    v43.Parent = l_RobloxReplicatedStorage_0;
end;
local v44 = nil;
local v45 = nil;
if l_FFlagEnablePartyNudgeAfterJoin_0 then
    v45 = Instance.new("RemoteEvent");
    v45.Name = "ShowPlayerJoinedFriendsToast";
    v45.Parent = l_RobloxReplicatedStorage_0;
    v44 = Instance.new("RemoteEvent");
    v44.Name = "ShowFriendJoinedPlayerToast";
    v44.Parent = l_RobloxReplicatedStorage_0;
end;
local l_RemoteEvent_8 = Instance.new("RemoteEvent");
l_RemoteEvent_8.Name = "CreateOrJoinParty";
l_RemoteEvent_8.Parent = l_RobloxReplicatedStorage_0;
local v47 = nil;
if l_FFlagEnableModerateChatRemoteEvent_0 then
    v47 = Instance.new("RemoteEvent");
    v47.Name = "ModerateChatSettingUpdated";
    v47.Parent = l_RobloxReplicatedStorage_0;
end;
local v48 = {};
local function _(v49) --[[ Line: 158 ]] --[[ Name: verifyUserId ]]
    return type(v49) == "number";
end;
local function v54(v51) --[[ Line: 162 ]] --[[ Name: verifyBlockList ]]
    if #v51 == 0 or #v51 > game:GetFastInt("MaxBlockListSize") then
        return false;
    else
        for _, v53 in pairs(v51) do
            if not (type(v53) == "number") then
                return false;
            end;
        end;
        return true;
    end;
end;
local function _(v55) --[[ Line: 175 ]] --[[ Name: sendPlayerAllGroupDetails ]]
    -- upvalues: l_RemoteEvent_3 (copy), v29 (copy)
    l_RemoteEvent_3:FireClient(v55, v29);
end;
local function v66(v57) --[[ Line: 179 ]] --[[ Name: getPlayerGroupDetails ]]
    -- upvalues: v28 (copy), v29 (copy), l_RemoteEvent_3 (copy)
    local v58 = {};
    for v59, v60 in pairs(v28) do
        if v60.GroupRank ~= nil then
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 183 ]]
                -- upvalues: v57 (copy), v60 (copy)
                if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                    return v57:GetRankInGroupAsync(v60.GroupId) >= v60.GroupRank;
                else
                    return v57:GetRankInGroup(v60.GroupId) >= v60.GroupRank;
                end;
            end);
            v58[v59] = l_status_0 and l_result_0;
        else
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 193 ]]
                -- upvalues: v57 (copy), v60 (copy)
                if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                    return v57:IsInGroupAsync(v60.GroupId);
                else
                    return v57:IsInGroup(v60.GroupId);
                end;
            end);
            v58[v59] = l_status_1 and l_result_1;
        end;
    end;
    if v57.Parent then
        local v65 = tostring(v57.UserId);
        v29[v65] = v58;
        l_RemoteEvent_3:FireAllClients({
            [v65] = v58
        });
    end;
end;
local function v75(v67) --[[ Line: 214 ]] --[[ Name: sendCanChatWith ]]
    -- upvalues: l_Players_0 (copy), v14 (copy), l_TextChatService_0 (copy), l_RemoteEvent_0 (copy), l_Chat_0 (copy)
    local v68 = {};
    for _, v70 in ipairs(l_Players_0:GetPlayers()) do
        if v14 then
            local l_status_2, l_result_2 = pcall(function() --[[ Line: 219 ]]
                -- upvalues: l_TextChatService_0 (ref), v67 (copy), v70 (copy)
                return l_TextChatService_0:CanUsersDirectChatAsync(v67.UserId, {
                    v70.UserId
                });
            end);
            v68[v70.UserId] = l_status_2 and #l_result_2 > 0;
            l_RemoteEvent_0:FireClient(v70, {
                [v67.UserId] = l_status_2 and #l_result_2 > 0
            });
        else
            local l_status_3, l_result_3 = pcall(function() --[[ Line: 228 ]]
                -- upvalues: l_Chat_0 (ref), v67 (copy), v70 (copy)
                return l_Chat_0:CanUsersChatAsync(v67.UserId, v70.UserId);
            end);
            v68[v70.userId] = l_status_3 and l_result_3;
            l_RemoteEvent_0:FireClient(v70, {
                [v67.userId] = l_status_3 and l_result_3
            });
        end;
    end;
    l_RemoteEvent_0:FireClient(v67, v68);
end;
local function v79(v76) --[[ Line: 242 ]] --[[ Name: sendPlayerAllCanManage ]]
    -- upvalues: v30 (copy), l_RemoteEvent_4 (copy)
    for v77, v78 in pairs(v30) do
        l_RemoteEvent_4:FireClient(v76, v77, v78);
    end;
end;
local function v92(v80) --[[ Line: 248 ]] --[[ Name: getPlayerCanManage ]]
    -- upvalues: v25 (copy), v30 (copy), l_RemoteEvent_4 (copy), l_Url_0 (copy), l_HttpService_0 (copy), l_HttpRbxApiService_0 (copy)
    if v25 then
        if v80.UserId <= 0 or not v80.Parent then
            return;
        else
            local v81 = false;
            local l_status_4, l_result_4 = pcall(v80.GetCanManageAsync, v80);
            if l_status_4 and l_result_4 then
                v81 = true;
            end;
            local v84 = tostring(v80.UserId);
            v30[v84] = v81;
            l_RemoteEvent_4:FireAllClients(v84, v81);
            return;
        end;
    else
        local v85 = false;
        if v80.UserId > 0 then
            local l_status_5, l_result_5 = pcall(function() --[[ Line: 267 ]]
                -- upvalues: l_Url_0 (ref), l_HttpService_0 (ref), v80 (copy), l_HttpRbxApiService_0 (ref)
                local v86 = string.format(l_Url_0.APIS_URL .. "asset-permissions-api/v1/rcc/assets/check-permissions");
                local v87 = l_HttpService_0:JSONEncode({
                    requests = {
                        {
                            subject = {
                                subjectType = "User", 
                                subjectId = v80.UserId
                            }, 
                            action = "Edit", 
                            assetId = game.PlaceId
                        }
                    }
                });
                local v88 = l_HttpRbxApiService_0:PostAsyncFullUrl(v86, v87);
                return l_HttpService_0:JSONDecode(v88);
            end);
            if l_status_5 then
                l_result_5 = l_result_5.results[1];
                if l_result_5.value and l_result_5.value.status == "HasPermission" then
                    v85 = true;
                end;
            end;
        end;
        if v80.Parent then
            local v91 = tostring(v80.UserId);
            v30[v91] = v85;
            l_RemoteEvent_4:FireAllClients(v91, v85);
        end;
        return;
    end;
end;
local function _(v93, v94) --[[ Line: 303 ]]
    -- upvalues: l_Url_0 (copy), l_HttpService_0 (copy), l_HttpRbxApiService_0 (copy)
    return pcall(function() --[[ Line: 304 ]]
        -- upvalues: l_Url_0 (ref), l_HttpService_0 (ref), v94 (copy), v93 (copy), l_HttpRbxApiService_0 (ref)
        local v95 = string.format(l_Url_0.APIS_URL .. "user-blocking-api/v1/users/rcc/batch-check-reciprocal-block");
        local v96 = l_HttpService_0:JSONEncode({
            userIds = v94, 
            requesterUserId = v93.UserId
        });
        local v97 = l_HttpRbxApiService_0:PostAsyncFullUrl(v95, v96);
        return l_HttpService_0:JSONDecode(v97);
    end);
end;
local function v114(v99) --[[ Line: 318 ]] --[[ Name: sendPlayerBlockList ]]
    -- upvalues: l_Players_0 (copy), l_Url_0 (copy), l_HttpService_0 (copy), l_HttpRbxApiService_0 (copy), l_RemoteEvent_6 (copy), l_RemoteEvent_5 (copy)
    if v99.UserId <= 0 then
        return;
    else
        local l_l_Players_0_Players_0 = l_Players_0:GetPlayers();
        local v101 = {};
        for _, v103 in l_l_Players_0_Players_0 do
            if v99 ~= v103 then
                table.insert(v101, v103.UserId);
            end;
        end;
        local l_status_6, l_result_6 = pcall(function() --[[ Line: 304 ]]
            -- upvalues: l_Url_0 (ref), l_HttpService_0 (ref), v101 (copy), v99 (copy), l_HttpRbxApiService_0 (ref)
            local v104 = string.format(l_Url_0.APIS_URL .. "user-blocking-api/v1/users/rcc/batch-check-reciprocal-block");
            local v105 = l_HttpService_0:JSONEncode({
                userIds = v101, 
                requesterUserId = v99.UserId
            });
            local v106 = l_HttpRbxApiService_0:PostAsyncFullUrl(v104, v105);
            return l_HttpService_0:JSONDecode(v106);
        end);
        local l_l_status_6_0 = l_status_6;
        local l_l_result_6_0 = l_result_6;
        l_status_6 = {};
        l_result_6 = {};
        if l_l_status_6_0 and l_l_result_6_0 then
            for _, v112 in l_l_result_6_0.users do
                if v112.isBlocked then
                    l_result_6[v112.userId] = true;
                    table.insert(l_status_6, v112.userId);
                end;
                if v112.isBlockingViewer then
                    local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v112.userId);
                    l_l_Players_0_PlayerByUserId_0:UpdatePlayerBlocked(v99.UserId, true);
                    l_RemoteEvent_6:FireClient(l_l_Players_0_PlayerByUserId_0, v99.UserId, true);
                end;
            end;
        end;
        v99:AddToBlockList(l_status_6);
        if game:GetFastFlag("EnableSetUserBlocklistInitialized") then
            v99:SetBlockListInitialized();
        end;
        l_RemoteEvent_5:FireClient(v99, l_result_6);
        return;
    end;
end;
local function v118(v115) --[[ Line: 359 ]] --[[ Name: sendPlayerAllInExperienceNameEnabled ]]
    -- upvalues: v31 (copy), l_RemoteEvent_7 (copy)
    for v116, v117 in pairs(v31) do
        l_RemoteEvent_7:FireClient(v115, v116, {
            isInExperienceNameEnabled = v117
        });
    end;
end;
local function _(v119) --[[ Line: 369 ]]
    -- upvalues: l_Url_0 (copy), l_HttpRbxApiService_0 (copy), l_HttpService_0 (copy)
    return pcall(function() --[[ Line: 370 ]]
        -- upvalues: v119 (copy), l_Url_0 (ref), l_HttpRbxApiService_0 (ref), l_HttpService_0 (ref)
        local v120 = ("user-profile-api/v1/user/profiles/rcc/settings?userId=%*"):format(v119.UserId);
        local v121 = l_Url_0.APIS_URL .. v120;
        local l_l_HttpRbxApiService_0_AsyncFullUrl_0 = l_HttpRbxApiService_0:GetAsyncFullUrl(v121, Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Players);
        return l_HttpService_0:JSONDecode(l_l_HttpRbxApiService_0_AsyncFullUrl_0);
    end);
end;
local function v134(v124) --[[ Line: 380 ]]
    -- upvalues: v13 (copy), v24 (copy), l_Url_0 (copy), l_HttpRbxApiService_0 (copy), l_HttpService_0 (copy), v31 (copy), l_RemoteEvent_7 (copy)
    if v124.UserId <= 0 then
        return;
    else
        local v125 = false;
        if v13.isAllowListedUserId(v124.UserId) or v24 then
            local l_status_7, l_result_7 = pcall(function() --[[ Line: 370 ]]
                -- upvalues: v124 (copy), l_Url_0 (ref), l_HttpRbxApiService_0 (ref), l_HttpService_0 (ref)
                local v126 = ("user-profile-api/v1/user/profiles/rcc/settings?userId=%*"):format(v124.UserId);
                local v127 = l_Url_0.APIS_URL .. v126;
                local l_l_HttpRbxApiService_0_AsyncFullUrl_1 = l_HttpRbxApiService_0:GetAsyncFullUrl(v127, Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Players);
                return l_HttpService_0:JSONDecode(l_l_HttpRbxApiService_0_AsyncFullUrl_1);
            end);
            local l_l_status_7_0 = l_status_7;
            local l_l_result_7_0 = l_result_7;
            if l_l_status_7_0 and l_l_result_7_0 then
                v125 = l_l_result_7_0.isSettingsEnabled and l_l_result_7_0.userProfileSettings and l_l_result_7_0.userProfileSettings.isInExperienceNameEnabled;
            end;
        end;
        local v133 = tostring(v124.UserId);
        v31[v133] = v125;
        l_RemoteEvent_7:FireAllClients(v133, {
            isInExperienceNameEnabled = v125
        });
        return;
    end;
end;
if v12 then
    v42.OnServerEvent:Connect(function(v135) --[[ Line: 407 ]]
        -- upvalues: v31 (copy), l_RemoteEvent_7 (copy), v134 (copy)
        local v136 = tostring(v135.UserId);
        local v137 = v31[v136];
        if v137 ~= nil then
            l_RemoteEvent_7:FireClient(v135, v136, {
                isInExperienceNameEnabled = v137
            });
            return;
        else
            coroutine.wrap(v134)(v135);
            return;
        end;
    end);
end;
local function _(v138, v139, v140) --[[ Line: 424 ]]
    -- upvalues: l_Url_0 (copy), l_HttpService_0 (copy), v16 (copy), v26 (copy), l_HttpRbxApiService_0 (copy)
    return pcall(function() --[[ Line: 425 ]]
        -- upvalues: l_Url_0 (ref), l_HttpService_0 (ref), v138 (copy), v139 (copy), v140 (copy), v16 (ref), v26 (ref), l_HttpRbxApiService_0 (ref)
        local v141 = string.format(l_Url_0.APIS_URL .. "group-up/v1/create-party-nudge");
        local v142 = l_HttpService_0:JSONEncode({
            inviterId = v138, 
            inviteeId = v139, 
            nudgeType = v140, 
            placeId = game.PlaceId, 
            gameInstanceId = game.JobId, 
            universeId = game.GameId, 
            version = v16 and 1 or nil, 
            privateServerId = if v26 then game.PrivateServerId else nil, 
            privateServerOwnerId = if v26 then game.PrivateServerOwnerId else nil
        });
        local v143 = l_HttpRbxApiService_0:PostAsyncFullUrl(v141, v142);
        return l_HttpService_0:JSONDecode(v143);
    end);
end;
local function v148(v145) --[[ Line: 446 ]] --[[ Name: canCreatePartyNudge ]]
    if not v145 then
        return false;
    else
        local v146 = {
            Windows = true, 
            iOS = true, 
            Android = true, 
            OSX = true, 
            Win32 = true, 
            Windows_Universal = true
        };
        local v147 = false;
        if v145.PartyId == "" then
            v147 = false;
            if v145.VRDevice == "" then
                v147 = false;
                if typeof(v145.OsPlatform) == "string" then
                    v147 = v146[v145.OsPlatform];
                end;
            end;
        end;
        return v147;
    end;
end;
local function v166(v149) --[[ Line: 468 ]]
    -- upvalues: l_Players_0 (copy), v15 (copy), v148 (copy), l_Url_0 (copy), l_HttpService_0 (copy), v16 (copy), v26 (copy), l_HttpRbxApiService_0 (copy), l_RemoteEvent_8 (copy), v44 (ref), v45 (ref)
    local v150 = nil;
    local l_l_Players_0_Players_1 = l_Players_0:GetPlayers();
    for _, v153 in l_l_Players_0_Players_1 do
        if v153.UserId == v149.FollowUserId then
            v150 = v153;
            break;
        end;
    end;
    local v154 = false;
    if v15 and v148(v150) and v148(v149) then
        local v155 = nil;
        local l_UserId_0 = v149.UserId;
        local l_UserId_1 = v150.UserId;
        local l_pcall_0 = pcall;
        local v159 = "OneToOneNudgeInExperience";
        local v160;
        l_pcall_0, v160 = l_pcall_0(function() --[[ Line: 425 ]]
            -- upvalues: l_Url_0 (ref), l_HttpService_0 (ref), l_UserId_0 (copy), l_UserId_1 (copy), v159 (copy), v16 (ref), v26 (ref), l_HttpRbxApiService_0 (ref)
            local v161 = string.format(l_Url_0.APIS_URL .. "group-up/v1/create-party-nudge");
            local v162 = l_HttpService_0:JSONEncode({
                inviterId = l_UserId_0, 
                inviteeId = l_UserId_1, 
                nudgeType = v159, 
                placeId = game.PlaceId, 
                gameInstanceId = game.JobId, 
                universeId = game.GameId, 
                version = v16 and 1 or nil, 
                privateServerId = if v26 then game.PrivateServerId else nil, 
                privateServerOwnerId = if v26 then game.PrivateServerOwnerId else nil
            });
            local v163 = l_HttpRbxApiService_0:PostAsyncFullUrl(v161, v162);
            return l_HttpService_0:JSONDecode(v163);
        end);
        local l_l_pcall_0_0 = l_pcall_0;
        local l_v160_0 = v160;
        v154 = l_l_pcall_0_0;
        v155 = l_v160_0;
        if v154 and v155 and v155.shouldAutoCreateOrJoinGroupUp then
            l_RemoteEvent_8:FireClient(v149, "PartyNudge", v155.nudge);
        end;
    end;
    if not v154 and #l_l_Players_0_Players_1 > 0 then
        if v150 then
            v44:FireClient(v150, v149);
        end;
        v45:FireClient(v149);
    end;
end;
local function v168(v167) --[[ Line: 498 ]] --[[ Name: onPlayerAdded ]]
    -- upvalues: v114 (copy), l_RemoteEvent_3 (copy), v29 (copy), v66 (copy), v11 (copy), v118 (copy), v134 (copy), v79 (copy), v92 (copy), v75 (copy), l_FFlagEnablePartyNudgeAfterJoin_0 (copy), v166 (copy)
    coroutine.wrap(v114)(v167);
    l_RemoteEvent_3:FireClient(v167, v29);
    if v167.UserId > 0 then
        coroutine.wrap(v66)(v167);
    end;
    if v11 then
        v118(v167);
        coroutine.wrap(v134)(v167);
    end;
    v79(v167);
    coroutine.wrap(v92)(v167);
    v75(v167);
    if l_FFlagEnablePartyNudgeAfterJoin_0 then
        coroutine.wrap(v166)(v167);
    end;
end;
l_RemoteEvent_1.OnServerEvent:Connect(function(v169, v170) --[[ Line: 519 ]]
    -- upvalues: v54 (copy)
    if game:GetFastFlag("EnableSetUserBlocklistInitialized") then
        v169:SetBlockListInitialized();
    end;
    if type(v170) == "table" and v54(v170) then
        v169:AddToBlockList(v170);
    end;
end);
l_RemoteEvent_2.OnServerEvent:Connect(function(v171, v172, v173) --[[ Line: 530 ]]
    if type(v173) == "boolean" and type(v172) == "number" then
        v171:UpdatePlayerBlocked(v172, v173);
    end;
end);
if l_FFlagBadgeVisibilitySettingEnabled_0 then
    v43.OnServerEvent:Connect(function(v174, v175) --[[ Line: 539 ]]
        -- upvalues: v20 (copy), v33 (copy), v23 (copy), v22 (copy), v32 (copy), v21 (copy), v31 (copy), l_RemoteEvent_7 (copy)
        if type(v175) ~= "table" then
            return;
        else
            local v176 = {};
            if type(v175.isInExperienceNameEnabled) == "boolean" then
                v176.isInExperienceNameEnabled = v175.isInExperienceNameEnabled;
                local v177 = tostring(v174.UserId);
                local v178 = tick();
                if v20 then
                    if not v33[v177] then
                        v33[v177] = {};
                    end;
                    local v179 = v33[v177];
                    local v180 = v178 - v23;
                    for v181 = #v179, 1, -1 do
                        if v179[v181] < v180 then
                            table.remove(v179, v181);
                        end;
                    end;
                    if #v179 >= v22 then
                        return;
                    else
                        table.insert(v179, v178);
                    end;
                else
                    local v182 = v32[v177];
                    if v182 and v178 - v182 < v21 then
                        return;
                    else
                        v32[v177] = v178;
                    end;
                end;
                v31[v177] = v176.isInExperienceNameEnabled;
                l_RemoteEvent_7:FireAllClients(v177, v176);
                return;
            else
                return;
            end;
        end;
    end);
end;
if l_FFlagEnableModerateChatRemoteEvent_0 then
    v47.OnServerEvent:Connect(function(v183, v184) --[[ Line: 587 ]]
        -- upvalues: l_TextChatService_0 (copy), v47 (ref)
        if typeof(v184) == "boolean" and l_TextChatService_0:setModerationModeEnabled(v183.UserId, v184) then
            v47:FireClient(v183, v184);
        end;
    end);
end;
l_Players_0.PlayerAdded:connect(v168);
for _, v186 in pairs(l_Players_0:GetPlayers()) do
    v168(v186);
end;
l_Players_0.PlayerRemoving:connect(function(v187) --[[ Line: 600 ]]
    -- upvalues: v27 (copy), v48 (copy), v29 (copy), v30 (copy), v31 (copy), l_FFlagBadgeVisibilitySettingEnabled_0 (copy), v20 (copy), v33 (copy), v32 (copy)
    local v188 = tostring(v187.UserId);
    if v27[v188] then
        v27[v188] = nil;
        v48[v188] = nil;
    end;
    if v29[v188] then
        v29[v188] = nil;
    end;
    if v30[v188] ~= nil then
        v30[v188] = nil;
    end;
    if v31[v188] ~= nil then
        v31[v188] = nil;
    end;
    if l_FFlagBadgeVisibilitySettingEnabled_0 then
        if v20 then
            if v33[v188] ~= nil then
                v33[v188] = nil;
                return;
            end;
        elseif v32[v188] ~= nil then
            v32[v188] = nil;
        end;
    end;
end);
local function v189() --[[ Line: 628 ]]

end;
for _, v191 in ipairs(l_RobloxReplicatedStorage_0:GetChildren()) do
    if v191:IsA("RemoteEvent") then
        v191.OnServerEvent:Connect(v189);
    end;
end;
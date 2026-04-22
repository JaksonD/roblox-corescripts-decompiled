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
local l_FFlagEnableSummarySystemMessageOnLua_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableSummarySystemMessageOnLua;
local v21 = game:DefineFastFlag("ProfileSettingsSlidingWindowRateLimit", false);
local v22 = game:DefineFastInt("ProfileSettingsRateLimitSeconds", 5);
local v23 = game:DefineFastInt("ProfileSettingsMaxRequestsPerWindow", 3);
local v24 = game:DefineFastInt("ProfileSettingsRateLimitWindowSeconds", 60);
local v25 = game:DefineFastFlag("DisableRCCAntiHarrasmentAllowList", false);
local v26 = game:DefineFastFlag("UseGetCanManageAsync", false) and game:GetEngineFeature("LuaGetCanManageAsync");
local v27 = game:DefineFastFlag("GatePrivateServerNudge", false);
local v28 = {};
local v29 = {
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
    v29.PlaceCreator = {
        GroupId = game.CreatorId, 
        GroupRank = 255
    };
end;
local v30 = {};
local v31 = {};
local v32 = {};
local v33 = {};
local v34 = {};
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
local v43 = nil;
if v12 then
    v43 = Instance.new("RemoteEvent");
    v43.Name = "RequestPlayerProfileSettings";
    v43.Parent = l_RobloxReplicatedStorage_0;
end;
local v44 = nil;
if l_FFlagBadgeVisibilitySettingEnabled_0 then
    v44 = Instance.new("RemoteEvent");
    v44.Name = "UpdatePlayerProfileSettings";
    v44.Parent = l_RobloxReplicatedStorage_0;
end;
local v45 = nil;
local v46 = nil;
if l_FFlagEnablePartyNudgeAfterJoin_0 then
    v46 = Instance.new("RemoteEvent");
    v46.Name = "ShowPlayerJoinedFriendsToast";
    v46.Parent = l_RobloxReplicatedStorage_0;
    v45 = Instance.new("RemoteEvent");
    v45.Name = "ShowFriendJoinedPlayerToast";
    v45.Parent = l_RobloxReplicatedStorage_0;
end;
local l_RemoteEvent_8 = Instance.new("RemoteEvent");
l_RemoteEvent_8.Name = "CreateOrJoinParty";
l_RemoteEvent_8.Parent = l_RobloxReplicatedStorage_0;
local v48 = nil;
if l_FFlagEnableModerateChatRemoteEvent_0 then
    v48 = Instance.new("RemoteEvent");
    v48.Name = "ModerateChatSettingUpdated";
    v48.Parent = l_RobloxReplicatedStorage_0;
end;
local v49 = nil;
if l_FFlagEnableSummarySystemMessageOnLua_0 then
    v49 = Instance.new("RemoteEvent");
    v49.Name = "ExpChatFeatureValueChanged";
    v49.Parent = l_RobloxReplicatedStorage_0;
end;
local v50 = {};
local function _(v51) --[[ Line: 168 ]] --[[ Name: verifyUserId ]]
    return type(v51) == "number";
end;
local function v56(v53) --[[ Line: 172 ]] --[[ Name: verifyBlockList ]]
    if #v53 == 0 or #v53 > game:GetFastInt("MaxBlockListSize") then
        return false;
    else
        for _, v55 in pairs(v53) do
            if not (type(v55) == "number") then
                return false;
            end;
        end;
        return true;
    end;
end;
local function _(v57) --[[ Line: 185 ]] --[[ Name: sendPlayerAllGroupDetails ]]
    -- upvalues: l_RemoteEvent_3 (copy), v30 (copy)
    l_RemoteEvent_3:FireClient(v57, v30);
end;
local function v68(v59) --[[ Line: 189 ]] --[[ Name: getPlayerGroupDetails ]]
    -- upvalues: v29 (copy), v30 (copy), l_RemoteEvent_3 (copy)
    local v60 = {};
    for v61, v62 in pairs(v29) do
        if v62.GroupRank ~= nil then
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 193 ]]
                -- upvalues: v59 (copy), v62 (copy)
                if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                    return v59:GetRankInGroupAsync(v62.GroupId) >= v62.GroupRank;
                else
                    return v59:GetRankInGroup(v62.GroupId) >= v62.GroupRank;
                end;
            end);
            v60[v61] = l_status_0 and l_result_0;
        else
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 203 ]]
                -- upvalues: v59 (copy), v62 (copy)
                if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
                    return v59:IsInGroupAsync(v62.GroupId);
                else
                    return v59:IsInGroup(v62.GroupId);
                end;
            end);
            v60[v61] = l_status_1 and l_result_1;
        end;
    end;
    if v59.Parent then
        local v67 = tostring(v59.UserId);
        v30[v67] = v60;
        l_RemoteEvent_3:FireAllClients({
            [v67] = v60
        });
    end;
end;
local function v77(v69) --[[ Line: 224 ]] --[[ Name: sendCanChatWith ]]
    -- upvalues: l_Players_0 (copy), v14 (copy), l_TextChatService_0 (copy), l_RemoteEvent_0 (copy), l_Chat_0 (copy)
    local v70 = {};
    for _, v72 in ipairs(l_Players_0:GetPlayers()) do
        if v14 then
            local l_status_2, l_result_2 = pcall(function() --[[ Line: 229 ]]
                -- upvalues: l_TextChatService_0 (ref), v69 (copy), v72 (copy)
                return l_TextChatService_0:CanUsersDirectChatAsync(v69.UserId, {
                    v72.UserId
                });
            end);
            v70[v72.UserId] = l_status_2 and #l_result_2 > 0;
            l_RemoteEvent_0:FireClient(v72, {
                [v69.UserId] = l_status_2 and #l_result_2 > 0
            });
        else
            local l_status_3, l_result_3 = pcall(function() --[[ Line: 238 ]]
                -- upvalues: l_Chat_0 (ref), v69 (copy), v72 (copy)
                return l_Chat_0:CanUsersChatAsync(v69.UserId, v72.UserId);
            end);
            v70[v72.userId] = l_status_3 and l_result_3;
            l_RemoteEvent_0:FireClient(v72, {
                [v69.userId] = l_status_3 and l_result_3
            });
        end;
    end;
    l_RemoteEvent_0:FireClient(v69, v70);
end;
local function v81(v78) --[[ Line: 252 ]] --[[ Name: sendPlayerAllCanManage ]]
    -- upvalues: v31 (copy), l_RemoteEvent_4 (copy)
    for v79, v80 in pairs(v31) do
        l_RemoteEvent_4:FireClient(v78, v79, v80);
    end;
end;
local function v94(v82) --[[ Line: 258 ]] --[[ Name: getPlayerCanManage ]]
    -- upvalues: v26 (copy), v31 (copy), l_RemoteEvent_4 (copy), l_Url_0 (copy), l_HttpService_0 (copy), l_HttpRbxApiService_0 (copy)
    if v26 then
        if v82.UserId <= 0 or not v82.Parent then
            return;
        else
            local v83 = false;
            local l_status_4, l_result_4 = pcall(v82.GetCanManageAsync, v82);
            if l_status_4 and l_result_4 then
                v83 = true;
            end;
            local v86 = tostring(v82.UserId);
            v31[v86] = v83;
            l_RemoteEvent_4:FireAllClients(v86, v83);
            return;
        end;
    else
        local v87 = false;
        if v82.UserId > 0 then
            local l_status_5, l_result_5 = pcall(function() --[[ Line: 277 ]]
                -- upvalues: l_Url_0 (ref), l_HttpService_0 (ref), v82 (copy), l_HttpRbxApiService_0 (ref)
                local v88 = string.format(l_Url_0.APIS_URL .. "asset-permissions-api/v1/rcc/assets/check-permissions");
                local v89 = l_HttpService_0:JSONEncode({
                    requests = {
                        {
                            subject = {
                                subjectType = "User", 
                                subjectId = v82.UserId
                            }, 
                            action = "Edit", 
                            assetId = game.PlaceId
                        }
                    }
                });
                local v90 = l_HttpRbxApiService_0:PostAsyncFullUrl(v88, v89);
                return l_HttpService_0:JSONDecode(v90);
            end);
            if l_status_5 then
                l_result_5 = l_result_5.results[1];
                if l_result_5.value and l_result_5.value.status == "HasPermission" then
                    v87 = true;
                end;
            end;
        end;
        if v82.Parent then
            local v93 = tostring(v82.UserId);
            v31[v93] = v87;
            l_RemoteEvent_4:FireAllClients(v93, v87);
        end;
        return;
    end;
end;
local function _(v95, v96) --[[ Line: 313 ]]
    -- upvalues: l_Url_0 (copy), l_HttpService_0 (copy), l_HttpRbxApiService_0 (copy)
    return pcall(function() --[[ Line: 314 ]]
        -- upvalues: l_Url_0 (ref), l_HttpService_0 (ref), v96 (copy), v95 (copy), l_HttpRbxApiService_0 (ref)
        local v97 = string.format(l_Url_0.APIS_URL .. "user-blocking-api/v1/users/rcc/batch-check-reciprocal-block");
        local v98 = l_HttpService_0:JSONEncode({
            userIds = v96, 
            requesterUserId = v95.UserId
        });
        local v99 = l_HttpRbxApiService_0:PostAsyncFullUrl(v97, v98);
        return l_HttpService_0:JSONDecode(v99);
    end);
end;
local function v116(v101) --[[ Line: 328 ]] --[[ Name: sendPlayerBlockList ]]
    -- upvalues: l_Players_0 (copy), l_Url_0 (copy), l_HttpService_0 (copy), l_HttpRbxApiService_0 (copy), l_RemoteEvent_6 (copy), l_RemoteEvent_5 (copy)
    if v101.UserId <= 0 then
        return;
    else
        local l_l_Players_0_Players_0 = l_Players_0:GetPlayers();
        local v103 = {};
        for _, v105 in l_l_Players_0_Players_0 do
            if v101 ~= v105 then
                table.insert(v103, v105.UserId);
            end;
        end;
        local l_status_6, l_result_6 = pcall(function() --[[ Line: 314 ]]
            -- upvalues: l_Url_0 (ref), l_HttpService_0 (ref), v103 (copy), v101 (copy), l_HttpRbxApiService_0 (ref)
            local v106 = string.format(l_Url_0.APIS_URL .. "user-blocking-api/v1/users/rcc/batch-check-reciprocal-block");
            local v107 = l_HttpService_0:JSONEncode({
                userIds = v103, 
                requesterUserId = v101.UserId
            });
            local v108 = l_HttpRbxApiService_0:PostAsyncFullUrl(v106, v107);
            return l_HttpService_0:JSONDecode(v108);
        end);
        local l_l_status_6_0 = l_status_6;
        local l_l_result_6_0 = l_result_6;
        l_status_6 = {};
        l_result_6 = {};
        if l_l_status_6_0 and l_l_result_6_0 then
            for _, v114 in l_l_result_6_0.users do
                if v114.isBlocked then
                    l_result_6[v114.userId] = true;
                    table.insert(l_status_6, v114.userId);
                end;
                if v114.isBlockingViewer then
                    local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v114.userId);
                    l_l_Players_0_PlayerByUserId_0:UpdatePlayerBlocked(v101.UserId, true);
                    l_RemoteEvent_6:FireClient(l_l_Players_0_PlayerByUserId_0, v101.UserId, true);
                end;
            end;
        end;
        v101:AddToBlockList(l_status_6);
        if game:GetFastFlag("EnableSetUserBlocklistInitialized") then
            v101:SetBlockListInitialized();
        end;
        l_RemoteEvent_5:FireClient(v101, l_result_6);
        return;
    end;
end;
local function v120(v117) --[[ Line: 369 ]] --[[ Name: sendPlayerAllInExperienceNameEnabled ]]
    -- upvalues: v32 (copy), l_RemoteEvent_7 (copy)
    for v118, v119 in pairs(v32) do
        l_RemoteEvent_7:FireClient(v117, v118, {
            isInExperienceNameEnabled = v119
        });
    end;
end;
local function _(v121) --[[ Line: 379 ]]
    -- upvalues: l_Url_0 (copy), l_HttpRbxApiService_0 (copy), l_HttpService_0 (copy)
    return pcall(function() --[[ Line: 380 ]]
        -- upvalues: v121 (copy), l_Url_0 (ref), l_HttpRbxApiService_0 (ref), l_HttpService_0 (ref)
        local v122 = ("user-profile-api/v1/user/profiles/rcc/settings?userId=%*"):format(v121.UserId);
        local v123 = l_Url_0.APIS_URL .. v122;
        local l_l_HttpRbxApiService_0_AsyncFullUrl_0 = l_HttpRbxApiService_0:GetAsyncFullUrl(v123, Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Players);
        return l_HttpService_0:JSONDecode(l_l_HttpRbxApiService_0_AsyncFullUrl_0);
    end);
end;
local function v136(v126) --[[ Line: 390 ]]
    -- upvalues: v13 (copy), v25 (copy), l_Url_0 (copy), l_HttpRbxApiService_0 (copy), l_HttpService_0 (copy), v32 (copy), l_RemoteEvent_7 (copy)
    if v126.UserId <= 0 then
        return;
    else
        local v127 = false;
        if v13.isAllowListedUserId(v126.UserId) or v25 then
            local l_status_7, l_result_7 = pcall(function() --[[ Line: 380 ]]
                -- upvalues: v126 (copy), l_Url_0 (ref), l_HttpRbxApiService_0 (ref), l_HttpService_0 (ref)
                local v128 = ("user-profile-api/v1/user/profiles/rcc/settings?userId=%*"):format(v126.UserId);
                local v129 = l_Url_0.APIS_URL .. v128;
                local l_l_HttpRbxApiService_0_AsyncFullUrl_1 = l_HttpRbxApiService_0:GetAsyncFullUrl(v129, Enum.ThrottlingPriority.Default, Enum.HttpRequestType.Players);
                return l_HttpService_0:JSONDecode(l_l_HttpRbxApiService_0_AsyncFullUrl_1);
            end);
            local l_l_status_7_0 = l_status_7;
            local l_l_result_7_0 = l_result_7;
            if l_l_status_7_0 and l_l_result_7_0 then
                v127 = l_l_result_7_0.isSettingsEnabled and l_l_result_7_0.userProfileSettings and l_l_result_7_0.userProfileSettings.isInExperienceNameEnabled;
            end;
        end;
        local v135 = tostring(v126.UserId);
        v32[v135] = v127;
        l_RemoteEvent_7:FireAllClients(v135, {
            isInExperienceNameEnabled = v127
        });
        return;
    end;
end;
if v12 then
    v43.OnServerEvent:Connect(function(v137) --[[ Line: 417 ]]
        -- upvalues: v32 (copy), l_RemoteEvent_7 (copy), v136 (copy)
        local v138 = tostring(v137.UserId);
        local v139 = v32[v138];
        if v139 ~= nil then
            l_RemoteEvent_7:FireClient(v137, v138, {
                isInExperienceNameEnabled = v139
            });
            return;
        else
            coroutine.wrap(v136)(v137);
            return;
        end;
    end);
end;
local function _(v140, v141, v142) --[[ Line: 434 ]]
    -- upvalues: l_Url_0 (copy), l_HttpService_0 (copy), v16 (copy), v27 (copy), l_HttpRbxApiService_0 (copy)
    return pcall(function() --[[ Line: 435 ]]
        -- upvalues: l_Url_0 (ref), l_HttpService_0 (ref), v140 (copy), v141 (copy), v142 (copy), v16 (ref), v27 (ref), l_HttpRbxApiService_0 (ref)
        local v143 = string.format(l_Url_0.APIS_URL .. "group-up/v1/create-party-nudge");
        local v144 = l_HttpService_0:JSONEncode({
            inviterId = v140, 
            inviteeId = v141, 
            nudgeType = v142, 
            placeId = game.PlaceId, 
            gameInstanceId = game.JobId, 
            universeId = game.GameId, 
            version = v16 and 1 or nil, 
            privateServerId = if v27 then game.PrivateServerId else nil, 
            privateServerOwnerId = if v27 then game.PrivateServerOwnerId else nil
        });
        local v145 = l_HttpRbxApiService_0:PostAsyncFullUrl(v143, v144);
        return l_HttpService_0:JSONDecode(v145);
    end);
end;
local function v150(v147) --[[ Line: 456 ]] --[[ Name: canCreatePartyNudge ]]
    if not v147 then
        return false;
    else
        local v148 = {
            Windows = true, 
            iOS = true, 
            Android = true, 
            OSX = true, 
            Win32 = true, 
            Windows_Universal = true
        };
        local v149 = false;
        if v147.PartyId == "" then
            v149 = false;
            if v147.VRDevice == "" then
                v149 = false;
                if typeof(v147.OsPlatform) == "string" then
                    v149 = v148[v147.OsPlatform];
                end;
            end;
        end;
        return v149;
    end;
end;
local function v168(v151) --[[ Line: 478 ]]
    -- upvalues: l_Players_0 (copy), v15 (copy), v150 (copy), l_Url_0 (copy), l_HttpService_0 (copy), v16 (copy), v27 (copy), l_HttpRbxApiService_0 (copy), l_RemoteEvent_8 (copy), v45 (ref), v46 (ref)
    local v152 = nil;
    local l_l_Players_0_Players_1 = l_Players_0:GetPlayers();
    for _, v155 in l_l_Players_0_Players_1 do
        if v155.UserId == v151.FollowUserId then
            v152 = v155;
            break;
        end;
    end;
    local v156 = false;
    if v15 and v150(v152) and v150(v151) then
        local v157 = nil;
        local l_UserId_0 = v151.UserId;
        local l_UserId_1 = v152.UserId;
        local l_pcall_0 = pcall;
        local v161 = "OneToOneNudgeInExperience";
        local v162;
        l_pcall_0, v162 = l_pcall_0(function() --[[ Line: 435 ]]
            -- upvalues: l_Url_0 (ref), l_HttpService_0 (ref), l_UserId_0 (copy), l_UserId_1 (copy), v161 (copy), v16 (ref), v27 (ref), l_HttpRbxApiService_0 (ref)
            local v163 = string.format(l_Url_0.APIS_URL .. "group-up/v1/create-party-nudge");
            local v164 = l_HttpService_0:JSONEncode({
                inviterId = l_UserId_0, 
                inviteeId = l_UserId_1, 
                nudgeType = v161, 
                placeId = game.PlaceId, 
                gameInstanceId = game.JobId, 
                universeId = game.GameId, 
                version = v16 and 1 or nil, 
                privateServerId = if v27 then game.PrivateServerId else nil, 
                privateServerOwnerId = if v27 then game.PrivateServerOwnerId else nil
            });
            local v165 = l_HttpRbxApiService_0:PostAsyncFullUrl(v163, v164);
            return l_HttpService_0:JSONDecode(v165);
        end);
        local l_l_pcall_0_0 = l_pcall_0;
        local l_v162_0 = v162;
        v156 = l_l_pcall_0_0;
        v157 = l_v162_0;
        if v156 and v157 and v157.shouldAutoCreateOrJoinGroupUp then
            l_RemoteEvent_8:FireClient(v151, "PartyNudge", v157.nudge);
        end;
    end;
    if not v156 and #l_l_Players_0_Players_1 > 0 then
        if v152 then
            v45:FireClient(v152, v151);
        end;
        v46:FireClient(v151);
    end;
end;
local function v170(v169) --[[ Line: 508 ]] --[[ Name: onPlayerAdded ]]
    -- upvalues: v116 (copy), l_RemoteEvent_3 (copy), v30 (copy), v68 (copy), v11 (copy), v120 (copy), v136 (copy), v81 (copy), v94 (copy), v77 (copy), l_FFlagEnablePartyNudgeAfterJoin_0 (copy), v168 (copy)
    coroutine.wrap(v116)(v169);
    l_RemoteEvent_3:FireClient(v169, v30);
    if v169.UserId > 0 then
        coroutine.wrap(v68)(v169);
    end;
    if v11 then
        v120(v169);
        coroutine.wrap(v136)(v169);
    end;
    v81(v169);
    coroutine.wrap(v94)(v169);
    v77(v169);
    if l_FFlagEnablePartyNudgeAfterJoin_0 then
        coroutine.wrap(v168)(v169);
    end;
end;
l_RemoteEvent_1.OnServerEvent:Connect(function(v171, v172) --[[ Line: 529 ]]
    -- upvalues: v56 (copy)
    if game:GetFastFlag("EnableSetUserBlocklistInitialized") then
        v171:SetBlockListInitialized();
    end;
    if type(v172) == "table" and v56(v172) then
        v171:AddToBlockList(v172);
    end;
end);
l_RemoteEvent_2.OnServerEvent:Connect(function(v173, v174, v175) --[[ Line: 540 ]]
    if type(v175) == "boolean" and type(v174) == "number" then
        v173:UpdatePlayerBlocked(v174, v175);
    end;
end);
if l_FFlagBadgeVisibilitySettingEnabled_0 then
    v44.OnServerEvent:Connect(function(v176, v177) --[[ Line: 549 ]]
        -- upvalues: v21 (copy), v34 (copy), v24 (copy), v23 (copy), v33 (copy), v22 (copy), v32 (copy), l_RemoteEvent_7 (copy)
        if type(v177) ~= "table" then
            return;
        else
            local v178 = {};
            if type(v177.isInExperienceNameEnabled) == "boolean" then
                v178.isInExperienceNameEnabled = v177.isInExperienceNameEnabled;
                local v179 = tostring(v176.UserId);
                local v180 = tick();
                if v21 then
                    if not v34[v179] then
                        v34[v179] = {};
                    end;
                    local v181 = v34[v179];
                    local v182 = v180 - v24;
                    for v183 = #v181, 1, -1 do
                        if v181[v183] < v182 then
                            table.remove(v181, v183);
                        end;
                    end;
                    if #v181 >= v23 then
                        return;
                    else
                        table.insert(v181, v180);
                    end;
                else
                    local v184 = v33[v179];
                    if v184 and v180 - v184 < v22 then
                        return;
                    else
                        v33[v179] = v180;
                    end;
                end;
                v32[v179] = v178.isInExperienceNameEnabled;
                l_RemoteEvent_7:FireAllClients(v179, v178);
                return;
            else
                return;
            end;
        end;
    end);
end;
if l_FFlagEnableModerateChatRemoteEvent_0 then
    v48.OnServerEvent:Connect(function(v185, v186) --[[ Line: 597 ]]
        -- upvalues: l_TextChatService_0 (copy), v48 (ref)
        if typeof(v186) == "boolean" and l_TextChatService_0:setModerationModeEnabled(v185.UserId, v186) then
            v48:FireClient(v185, v186);
        end;
    end);
end;
if l_FFlagEnableSummarySystemMessageOnLua_0 then
    l_TextChatService_0.ExpChatFeatureValueChanged:Connect(function(v187, v188, v189) --[[ Line: 607 ]]
        -- upvalues: l_Players_0 (copy), v49 (ref)
        local l_l_Players_0_PlayerByUserId_1 = l_Players_0:GetPlayerByUserId(v187);
        if l_l_Players_0_PlayerByUserId_1 then
            v49:FireClient(l_l_Players_0_PlayerByUserId_1, v187, v188, v189);
        end;
    end);
end;
l_Players_0.PlayerAdded:connect(v170);
for _, v192 in pairs(l_Players_0:GetPlayers()) do
    v170(v192);
end;
l_Players_0.PlayerRemoving:connect(function(v193) --[[ Line: 621 ]]
    -- upvalues: v28 (copy), v50 (copy), v30 (copy), v31 (copy), v32 (copy), l_FFlagBadgeVisibilitySettingEnabled_0 (copy), v21 (copy), v34 (copy), v33 (copy)
    local v194 = tostring(v193.UserId);
    if v28[v194] then
        v28[v194] = nil;
        v50[v194] = nil;
    end;
    if v30[v194] then
        v30[v194] = nil;
    end;
    if v31[v194] ~= nil then
        v31[v194] = nil;
    end;
    if v32[v194] ~= nil then
        v32[v194] = nil;
    end;
    if l_FFlagBadgeVisibilitySettingEnabled_0 then
        if v21 then
            if v34[v194] ~= nil then
                v34[v194] = nil;
                return;
            end;
        elseif v33[v194] ~= nil then
            v33[v194] = nil;
        end;
    end;
end);
local function v195() --[[ Line: 649 ]]

end;
for _, v197 in ipairs(l_RobloxReplicatedStorage_0:GetChildren()) do
    if v197:IsA("RemoteEvent") then
        v197.OnServerEvent:Connect(v195);
    end;
end;
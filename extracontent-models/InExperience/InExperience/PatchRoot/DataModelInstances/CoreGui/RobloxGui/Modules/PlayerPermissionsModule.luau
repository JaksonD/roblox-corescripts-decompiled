local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local v7 = {};
local l_Players_0 = game:GetService("Players");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local _ = l_RobloxGui_0:WaitForChild("Modules");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_HttpService_0 = game:GetService("HttpService");
local _ = UserSettings().GameSettings;
local l_Url_0 = require(l_CorePackages_0.Workspace.Packages.CoreScriptsCommon).Url;
local v16 = require(l_RobloxGui_0.Modules.Common.Flags.FFlagInExperienceUserProfileSettingsEnabled);
local l_FFlagBadgeVisibilitySettingEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagBadgeVisibilitySettingEnabled;
local v18 = require(l_RobloxGui_0.Modules.Common.Flags.FFlagInExperienceRequestProfileSettings);
local l_VerifiedBadgeDisplayStore_0 = require(l_CorePackages_0.Workspace.Packages.UserProfiles).Stores.VerifiedBadgeDisplayStore;
local l_FFlagEnableVerifiedBadgeStore_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableVerifiedBadgeStore;
local v21 = {};
v21.__index = v21;
v21.new = function(v22) --[[ Line: 27 ]] --[[ Name: new ]]
    -- upvalues: v21 (copy)
    local v23 = setmetatable({}, v21);
    v23.player = v22;
    v23.pendingGroupData = {};
    v23.pendingCanManage = {};
    v23.pendingProfileSettings = {};
    v23.groupData = nil;
    v23.canManage = nil;
    v23.profileSettings = nil;
    return v23;
end;
v21.getGroupDataAsync = function(v24) --[[ Line: 39 ]] --[[ Name: getGroupDataAsync ]]
    if v24.groupData then
        return v24.groupData;
    else
        local v25 = coroutine.running();
        table.insert(v24.pendingGroupData, v25);
        coroutine.yield();
        return v24.groupData;
    end;
end;
v21.getCanManageAsync = function(v26) --[[ Line: 50 ]] --[[ Name: getCanManageAsync ]]
    if v26.canManage ~= nil then
        return v26.canManage;
    else
        local v27 = coroutine.running();
        table.insert(v26.pendingCanManage, v27);
        coroutine.yield();
        return v26.canManage;
    end;
end;
v21.getProfileSettingsAsync = function(v28) --[[ Line: 61 ]] --[[ Name: getProfileSettingsAsync ]]
    if v28.profileSettings ~= nil then
        return v28.profileSettings;
    else
        local v29 = coroutine.running();
        table.insert(v28.pendingProfileSettings, v29);
        coroutine.yield();
        return v28.profileSettings;
    end;
end;
v21.setGroupData = function(v30, v31) --[[ Line: 72 ]] --[[ Name: setGroupData ]]
    v30.groupData = v31;
    local l_pendingGroupData_0 = v30.pendingGroupData;
    v30.pendingGroupData = {};
    for _, v34 in pairs(l_pendingGroupData_0) do
        coroutine.resume(v34);
    end;
end;
v21.setCanManage = function(v35, v36) --[[ Line: 81 ]] --[[ Name: setCanManage ]]
    v35.canManage = v36 and true or false;
    local l_pendingCanManage_0 = v35.pendingCanManage;
    v35.pendingCanManage = {};
    for _, v39 in pairs(l_pendingCanManage_0) do
        coroutine.resume(v39);
    end;
end;
v21.setProfileSettings = function(v40, v41) --[[ Line: 91 ]] --[[ Name: setProfileSettings ]]
    v40.profileSettings = v41;
    local l_pendingProfileSettings_0 = v40.pendingProfileSettings;
    v40.pendingProfileSettings = {};
    for _, v44 in pairs(l_pendingProfileSettings_0) do
        coroutine.resume(v44);
    end;
end;
v21.destroy = function(v45) --[[ Line: 100 ]] --[[ Name: destroy ]]
    -- upvalues: v16 (copy)
    for _, v47 in pairs(v45.pendingGroupData) do
        coroutine.resume(v47);
    end;
    for _, v49 in pairs(v45.pendingCanManage) do
        coroutine.resume(v49);
    end;
    if v16 then
        for _, v51 in pairs(v45.pendingProfileSettings) do
            coroutine.resume(v51);
        end;
    end;
end;
local v52 = {};
local function _(v53) --[[ Line: 118 ]] --[[ Name: getPlayerInfo ]]
    -- upvalues: v52 (copy), v21 (copy)
    local v54 = v52[v53];
    if not v54 and v53.Parent ~= nil then
        v54 = v21.new(v53);
        v52[v53] = v54;
    end;
    return v54;
end;
spawn(function() --[[ Line: 127 ]]
    -- upvalues: l_Players_0 (copy), v52 (copy), v21 (copy)
    game:GetService("RobloxReplicatedStorage"):WaitForChild("NewPlayerGroupDetails", 1e999).OnClientEvent:Connect(function(...) --[[ Line: 131 ]]
        -- upvalues: l_Players_0 (ref), v52 (ref), v21 (ref)
        local v56 = {
            ...
        };
        if #v56 == 1 then
            local v57 = v56[1];
            for v58, v59 in pairs(v57) do
                local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId((tonumber(v58)));
                if l_l_Players_0_PlayerByUserId_0 then
                    local v61 = v52[l_l_Players_0_PlayerByUserId_0];
                    if not v61 and l_l_Players_0_PlayerByUserId_0.Parent ~= nil then
                        v61 = v21.new(l_l_Players_0_PlayerByUserId_0);
                        v52[l_l_Players_0_PlayerByUserId_0] = v61;
                    end;
                    local l_v61_0 = v61;
                    if l_v61_0 then
                        l_v61_0:setGroupData(v59);
                    end;
                end;
            end;
            return;
        else
            local v63 = v56[1];
            local v64 = v56[2];
            local l_l_Players_0_PlayerByUserId_1 = l_Players_0:GetPlayerByUserId((tonumber(v63)));
            if l_l_Players_0_PlayerByUserId_1 then
                local v66 = v52[l_l_Players_0_PlayerByUserId_1];
                if not v66 and l_l_Players_0_PlayerByUserId_1.Parent ~= nil then
                    v66 = v21.new(l_l_Players_0_PlayerByUserId_1);
                    v52[l_l_Players_0_PlayerByUserId_1] = v66;
                end;
                local l_v66_0 = v66;
                if l_v66_0 then
                    l_v66_0:setGroupData(v64);
                end;
            end;
            return;
        end;
    end);
end);
coroutine.wrap(function() --[[ Line: 162 ]]
    -- upvalues: l_Players_0 (copy), v52 (copy), v21 (copy)
    game:GetService("RobloxReplicatedStorage"):WaitForChild("NewPlayerCanManageDetails", 1e999).OnClientEvent:Connect(function(v68, v69) --[[ Line: 168 ]]
        -- upvalues: l_Players_0 (ref), v52 (ref), v21 (ref)
        local l_l_Players_0_PlayerByUserId_2 = l_Players_0:GetPlayerByUserId((tonumber(v68)));
        if l_l_Players_0_PlayerByUserId_2 then
            local v71 = v52[l_l_Players_0_PlayerByUserId_2];
            if not v71 and l_l_Players_0_PlayerByUserId_2.Parent ~= nil then
                v71 = v21.new(l_l_Players_0_PlayerByUserId_2);
                v52[l_l_Players_0_PlayerByUserId_2] = v71;
            end;
            local l_v71_0 = v71;
            if l_v71_0 then
                l_v71_0:setCanManage(v69);
            end;
        end;
    end);
end)();
if v16 then
    coroutine.wrap(function() --[[ Line: 180 ]]
        -- upvalues: l_Players_0 (copy), v52 (copy), v21 (copy), l_FFlagEnableVerifiedBadgeStore_0 (copy), l_VerifiedBadgeDisplayStore_0 (copy), v18 (copy)
        local l_RobloxReplicatedStorage_0 = game:GetService("RobloxReplicatedStorage");
        l_RobloxReplicatedStorage_0:WaitForChild("SendPlayerProfileSettings", 1e999).OnClientEvent:Connect(function(v74, v75) --[[ Line: 186 ]]
            -- upvalues: l_Players_0 (ref), v52 (ref), v21 (ref), l_FFlagEnableVerifiedBadgeStore_0 (ref), l_VerifiedBadgeDisplayStore_0 (ref)
            local l_l_Players_0_PlayerByUserId_3 = l_Players_0:GetPlayerByUserId((tonumber(v74)));
            if l_l_Players_0_PlayerByUserId_3 then
                local v77 = v52[l_l_Players_0_PlayerByUserId_3];
                if not v77 and l_l_Players_0_PlayerByUserId_3.Parent ~= nil then
                    v77 = v21.new(l_l_Players_0_PlayerByUserId_3);
                    v52[l_l_Players_0_PlayerByUserId_3] = v77;
                end;
                local l_v77_0 = v77;
                if l_v77_0 then
                    l_v77_0:setProfileSettings(v75);
                end;
                if l_FFlagEnableVerifiedBadgeStore_0 and v75.isInExperienceNameEnabled ~= nil then
                    l_VerifiedBadgeDisplayStore_0.get().setBadgeVisibility(l_l_Players_0_PlayerByUserId_3.UserId, not v75.isInExperienceNameEnabled);
                end;
            end;
        end);
        if v18 then
            l_RobloxReplicatedStorage_0:WaitForChild("RequestPlayerProfileSettings", 1e999):FireServer();
        end;
    end)();
end;
l_Players_0.PlayerRemoving:Connect(function(v79) --[[ Line: 212 ]]
    -- upvalues: v52 (copy)
    if v52[v79] then
        local v80 = v52[v79];
        v52[v79] = nil;
        v80:destroy();
    end;
end);
local function _(v81) --[[ Line: 220 ]] --[[ Name: NewInGroupFunctionFactory ]]
    -- upvalues: v52 (copy), v21 (copy)
    return function(v82) --[[ Line: 221 ]]
        -- upvalues: v52 (ref), v21 (ref), v81 (copy)
        local v83 = v52[v82];
        if not v83 and v82.Parent ~= nil then
            v83 = v21.new(v82);
            v52[v82] = v83;
        end;
        local l_v83_0 = v83;
        if l_v83_0 then
            v83 = l_v83_0:getGroupDataAsync();
            if v83 and v83[v81] then
                return true;
            end;
        end;
        return false;
    end;
end;
local v86 = {};
local v87 = "SpanishLocalizationExpert";
local l_v87_0 = v87 --[[ copy: 23 -> 29 ]];
local function v92(v89) --[[ Line: 221 ]]
    -- upvalues: v52 (copy), v21 (copy), l_v87_0 (copy)
    local v90 = v52[v89];
    if not v90 and v89.Parent ~= nil then
        v90 = v21.new(v89);
        v52[v89] = v90;
    end;
    local l_v90_0 = v90;
    if l_v90_0 then
        v90 = l_v90_0:getGroupDataAsync();
        if v90 and v90[l_v87_0] then
            return true;
        end;
    end;
    return false;
end;
local v93 = "BrazilianLocalizationExpert";
local l_v93_0 = v93 --[[ copy: 24 -> 30 ]];
v87 = function(v95) --[[ Line: 221 ]]
    -- upvalues: v52 (copy), v21 (copy), l_v93_0 (copy)
    local v96 = v52[v95];
    if not v96 and v95.Parent ~= nil then
        v96 = v21.new(v95);
        v52[v95] = v96;
    end;
    local l_v96_0 = v96;
    if l_v96_0 then
        v96 = l_v96_0:getGroupDataAsync();
        if v96 and v96[l_v93_0] then
            return true;
        end;
    end;
    return false;
end;
local v98 = "FrenchLocalizationExpert";
local l_v98_0 = v98 --[[ copy: 25 -> 31 ]];
v93 = function(v100) --[[ Line: 221 ]]
    -- upvalues: v52 (copy), v21 (copy), l_v98_0 (copy)
    local v101 = v52[v100];
    if not v101 and v100.Parent ~= nil then
        v101 = v21.new(v100);
        v52[v100] = v101;
    end;
    local l_v101_0 = v101;
    if l_v101_0 then
        v101 = l_v101_0:getGroupDataAsync();
        if v101 and v101[l_v98_0] then
            return true;
        end;
    end;
    return false;
end;
local v103 = "GermanLocalizationExpert";
local l_v103_0 = v103 --[[ copy: 26 -> 32 ]];
v98 = function(v105) --[[ Line: 221 ]]
    -- upvalues: v52 (copy), v21 (copy), l_v103_0 (copy)
    local v106 = v52[v105];
    if not v106 and v105.Parent ~= nil then
        v106 = v21.new(v105);
        v52[v105] = v106;
    end;
    local l_v106_0 = v106;
    if l_v106_0 then
        v106 = l_v106_0:getGroupDataAsync();
        if v106 and v106[l_v103_0] then
            return true;
        end;
    end;
    return false;
end;
v6(v86, 1, v92, v87, v93, v98);
v92 = function() --[[ Line: 240 ]] --[[ Name: NewIsLocalizationExpertFunctionFactory ]]
    -- upvalues: v86 (copy)
    return function(v108) --[[ Line: 241 ]]
        -- upvalues: v86 (ref)
        for v109 = 1, #v86 do
            if v86[v109](v108) then
                return true;
            end;
        end;
        return false;
    end;
end;
v87 = function() --[[ Line: 251 ]] --[[ Name: IsPlaceOwnerFunctionFactory ]]
    -- upvalues: v52 (copy), v21 (copy)
    if game.CreatorType == Enum.CreatorType.Group then
        local v110 = "PlaceCreator";
        return function(v111) --[[ Line: 221 ]]
            -- upvalues: v52 (ref), v21 (ref), v110 (copy)
            local v112 = v52[v111];
            if not v112 and v111.Parent ~= nil then
                v112 = v21.new(v111);
                v52[v111] = v112;
            end;
            local l_v112_0 = v112;
            if l_v112_0 then
                v112 = l_v112_0:getGroupDataAsync();
                if v112 and v112[v110] then
                    return true;
                end;
            end;
            return false;
        end;
    else
        return function(v114) --[[ Line: 255 ]]
            return v114.UserId == game.CreatorId;
        end;
    end;
end;
v93 = function(v115) --[[ Line: 260 ]] --[[ Name: CanPlayerManagePlace ]]
    -- upvalues: v52 (copy), v21 (copy)
    local v116 = v52[v115];
    if not v116 and v115.Parent ~= nil then
        v116 = v21.new(v115);
        v52[v115] = v116;
    end;
    local l_v116_0 = v116;
    if l_v116_0 then
        return l_v116_0:getCanManageAsync() or false;
    else
        return false;
    end;
end;
v98 = function(v118) --[[ Line: 269 ]] --[[ Name: IsPlayerInExperienceNameEnabled ]]
    -- upvalues: v52 (copy), v21 (copy)
    local v119 = v52[v118];
    if not v119 and v118.Parent ~= nil then
        v119 = v21.new(v118);
        v52[v118] = v119;
    end;
    local l_v119_0 = v119;
    if l_v119_0 then
        v119 = l_v119_0:getProfileSettingsAsync();
        if v119 then
            return v119.isInExperienceNameEnabled;
        end;
    end;
    return false;
end;
v103 = function(_, v122) --[[ Line: 280 ]] --[[ Name: SetPlayerInExperienceNameEnabled ]]
    -- upvalues: l_Url_0 (copy), l_HttpService_0 (copy), l_HttpRbxApiService_0 (copy)
    pcall(function() --[[ Line: 281 ]]
        -- upvalues: l_Url_0 (ref), l_HttpService_0 (ref), v122 (copy), l_HttpRbxApiService_0 (ref)
        local v123 = game:GetService("RobloxReplicatedStorage"):WaitForChild("UpdatePlayerProfileSettings", 1e999);
        local v124 = l_Url_0.APIS_URL .. "user-profile-api/v1/user/profiles/settings";
        local v125 = l_HttpService_0:JSONEncode({
            userProfileSettings = {
                isInExperienceNameEnabled = v122
            }
        });
        l_HttpRbxApiService_0:PostAsyncFullUrl(v124, v125, Enum.ThrottlingPriority.Default, Enum.HttpContentType.ApplicationJson, Enum.HttpRequestType.Players);
        v123:FireServer({
            isInExperienceNameEnabled = v122
        });
    end);
end;
local v126 = "Admin";
local l_v126_0 = v126 --[[ copy: 28 -> 33 ]];
v7.IsPlayerAdminAsync = function(v128) --[[ Line: 221 ]]
    -- upvalues: v52 (copy), v21 (copy), l_v126_0 (copy)
    local v129 = v52[v128];
    if not v129 and v128.Parent ~= nil then
        v129 = v21.new(v128);
        v52[v128] = v129;
    end;
    local l_v129_0 = v129;
    if l_v129_0 then
        v129 = l_v129_0:getGroupDataAsync();
        if v129 and v129[l_v126_0] then
            return true;
        end;
    end;
    return false;
end;
v126 = "Intern";
local l_v126_1 = v126 --[[ copy: 28 -> 34 ]];
v7.IsPlayerInternAsync = function(v132) --[[ Line: 221 ]]
    -- upvalues: v52 (copy), v21 (copy), l_v126_1 (copy)
    local v133 = v52[v132];
    if not v133 and v132.Parent ~= nil then
        v133 = v21.new(v132);
        v52[v132] = v133;
    end;
    local l_v133_0 = v133;
    if l_v133_0 then
        v133 = l_v133_0:getGroupDataAsync();
        if v133 and v133[l_v126_1] then
            return true;
        end;
    end;
    return false;
end;
v126 = "Star";
local l_v126_2 = v126 --[[ copy: 28 -> 35 ]];
v7.IsPlayerStarAsync = function(v136) --[[ Line: 221 ]]
    -- upvalues: v52 (copy), v21 (copy), l_v126_2 (copy)
    local v137 = v52[v136];
    if not v137 and v136.Parent ~= nil then
        v137 = v21.new(v136);
        v52[v136] = v137;
    end;
    local l_v137_0 = v137;
    if l_v137_0 then
        v137 = l_v137_0:getGroupDataAsync();
        if v137 and v137[l_v126_2] then
            return true;
        end;
    end;
    return false;
end;
v7.IsPlayerLocalizationExpertAsync = function(v139) --[[ Line: 241 ]]
    -- upvalues: v86 (copy)
    for v140 = 1, #v86 do
        if v86[v140](v139) then
            return true;
        end;
    end;
    return false;
end;
local v141;
if game.CreatorType == Enum.CreatorType.Group then
    v126 = "PlaceCreator";
    v141 = function(v142) --[[ Line: 221 ]]
        -- upvalues: v52 (copy), v21 (copy), v126 (copy)
        local v143 = v52[v142];
        if not v143 and v142.Parent ~= nil then
            v143 = v21.new(v142);
            v52[v142] = v143;
        end;
        local l_v143_0 = v143;
        if l_v143_0 then
            v143 = l_v143_0:getGroupDataAsync();
            if v143 and v143[v126] then
                return true;
            end;
        end;
        return false;
    end;
else
    v141 = function(v145) --[[ Line: 255 ]]
        return v145.UserId == game.CreatorId;
    end;
end;
v7.IsPlayerPlaceOwnerAsync = v141;
v7.CanPlayerManagePlaceAsync = v93;
if v16 then
    v7.IsPlayerInExperienceNameEnabledAsync = v98;
end;
if l_FFlagBadgeVisibilitySettingEnabled_0 then
    v7.SetPlayerInExperienceNameEnabled = v103;
end;
return v7;
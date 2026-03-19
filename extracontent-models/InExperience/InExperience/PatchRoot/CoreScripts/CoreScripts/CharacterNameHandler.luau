local l_Players_0 = game:GetService("Players");
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("CoreGui");
local l_UserProfileStore_0 = require(l_CorePackages_0.Workspace.Packages.UserProfiles).Stores.UserProfileStore;
local l_FFlagUserProfileStoreQueryRefetch_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUserProfileStoreQueryRefetch;
local v5 = {};
local v6 = {
    CharacterAdded = "CharacterAdded", 
    CharacterRemoving = "CharacterRemoving", 
    HumanoidDisplayNameChanged = "HumanoidDisplayNameChanged", 
    CharacterHumanoidAdded = "CharacterHumanoidAdded"
};
local function v12(v7, v8, v9) --[[ Line: 26 ]] --[[ Name: setName ]]
    -- upvalues: v5 (copy), v6 (copy)
    local l_inExperienceCombinedName_0 = v9.names.inExperienceCombinedName;
    local l_displayName_0 = v9.names.displayName;
    if v9.names.displayName == v7.DisplayName then
        v7.InternalDisplayName = l_inExperienceCombinedName_0;
        v5[v8][v6.HumanoidDisplayNameChanged] = v7:GetPropertyChangedSignal("DisplayName"):Connect(function() --[[ Line: 33 ]]
            -- upvalues: l_displayName_0 (copy), v7 (copy)
            if l_displayName_0 ~= v7.DisplayName then
                v7.InternalDisplayName = "";
            end;
        end);
    end;
end;
local function v18(v13, v14, v15) --[[ Line: 41 ]] --[[ Name: checkHumanoid ]]
    -- upvalues: v12 (copy), v5 (copy), v6 (copy)
    local l_Humanoid_0 = v14:FindFirstChildWhichIsA("Humanoid");
    if l_Humanoid_0 then
        v12(l_Humanoid_0, v13, v15);
    end;
    v5[v13][v6.CharacterHumanoidAdded] = v14.ChildAdded:Connect(function(v17) --[[ Line: 46 ]]
        -- upvalues: v12 (ref), v13 (copy), v15 (copy)
        if v17:IsA("Humanoid") then
            v12(v17, v13, v15);
        end;
    end);
end;
local function v24(v19, v20) --[[ Line: 53 ]] --[[ Name: setNameOnCharacterAdded ]]
    -- upvalues: v5 (copy), v18 (copy), v6 (copy)
    v5[v19] = {};
    if v19.Character then
        v18(v19, v19.Character, v20);
    end;
    v5[v19][v6.CharacterAdded] = v19.CharacterAdded:Connect(function(v21) --[[ Line: 59 ]]
        -- upvalues: v18 (ref), v19 (copy), v20 (copy)
        v18(v19, v21, v20);
    end);
    v5[v19][v6.CharacterRemoving] = v19.CharacterRemoving:Connect(function() --[[ Line: 62 ]]
        -- upvalues: v5 (ref), v19 (copy), v6 (ref)
        local v22 = v5[v19][v6.CharacterHumanoidAdded];
        local v23 = v5[v19][v6.HumanoidDisplayNameChanged];
        if v22 then
            v5[v19][v6.CharacterHumanoidAdded]:Disconnect();
        end;
        if v23 then
            v5[v19][v6.HumanoidDisplayNameChanged]:Disconnect();
        end;
    end);
end;
local function v36() --[[ Line: 74 ]] --[[ Name: setCurrentPlayersNames ]]
    -- upvalues: l_Players_0 (copy), l_UserProfileStore_0 (copy), v24 (copy)
    local l_l_Players_0_Players_0 = l_Players_0:GetPlayers();
    local v26 = {};
    local v27 = {};
    for _, v29 in pairs(l_l_Players_0_Players_0) do
        table.insert(v26, (tostring(v29.UserId)));
        v27[tostring(v29.UserId)] = v29;
    end;
    l_UserProfileStore_0.get().fetchNamesByUserIds(v26, function(v30) --[[ Line: 82 ]]
        -- upvalues: v27 (copy), v24 (ref)
        local l_status_0 = v30.status;
        local l_data_0 = v30.data;
        if l_status_0 == "success" then
            for _, v34 in l_data_0 do
                local v35 = v27[v34.userId];
                v24(v35, {
                    names = {
                        inExperienceCombinedName = v34.names.getInExperienceCombinedName(false), 
                        displayName = v34.names.getDisplayName(false)
                    }
                });
            end;
        end;
    end);
end;
local function v42(v37) --[[ Line: 98 ]] --[[ Name: onPlayerAdded ]]
    -- upvalues: l_UserProfileStore_0 (copy), v24 (copy)
    l_UserProfileStore_0.get().fetchNamesByUserIds({
        (tostring(v37.UserId))
    }, function(v38) --[[ Line: 99 ]]
        -- upvalues: v24 (ref), v37 (copy)
        local l_status_1 = v38.status;
        local l_data_1 = v38.data;
        if l_status_1 == "success" then
            local v41 = l_data_1[1];
            v24(v37, {
                names = {
                    inExperienceCombinedName = v41.names.getInExperienceCombinedName(false), 
                    displayName = v41.names.getDisplayName(false)
                }
            });
        end;
    end);
end;
local function v47(v43) --[[ Line: 113 ]] --[[ Name: onPlayerRemoving ]]
    -- upvalues: v5 (copy), l_FFlagUserProfileStoreQueryRefetch_0 (copy), l_UserProfileStore_0 (copy)
    local v44 = v5[v43];
    if v5[v43] then
        for _, v46 in pairs(v44) do
            v46:Disconnect();
        end;
        v5[v43] = nil;
    end;
    if l_FFlagUserProfileStoreQueryRefetch_0 then
        l_UserProfileStore_0.get().invalidateCachedNamesForUserIds({
            (tostring(v43.UserId))
        });
    end;
end;
v36();
l_Players_0.PlayerAdded:Connect(v42);
l_Players_0.PlayerRemoving:Connect(v47);
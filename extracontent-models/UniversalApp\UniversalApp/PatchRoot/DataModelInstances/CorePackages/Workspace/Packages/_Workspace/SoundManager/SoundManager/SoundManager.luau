local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_RobloxGui_0 = l_CoreGui_0.RobloxGui;
local l_Parent_0 = script.Parent.Parent;
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.Lumberyak).Logger.new(nil, "SoundManager");
local v6 = require(script.Parent.Sounds);
local v7 = require(script.Parent.SoundEffects);
local v8 = require(script.Parent.SoundGroups);
local v9 = {};
v9.__index = v9;
local v10 = {
    Looped = false, 
    PlaybackSpeed = 1, 
    Volume = 1, 
    FadeInTime = nil, 
    FadeOutTime = nil, 
    SoundEffects = nil
};
local v11 = {};
local function v21(v12, v13, v14, v15) --[[ Line: 36 ]] --[[ Name: fadeVolume ]]
    -- upvalues: v11 (copy), l_RunService_0 (copy)
    if v13 < 0 then
        error(v15 .. " cannot have a negative fadeIn/fadeOut time.");
    end;
    local v16 = (v14 - v12.Volume) / v13;
    local function v20(v17) --[[ Line: 45 ]] --[[ Name: onHeartBeat ]]
        -- upvalues: v16 (copy), v12 (copy), v11 (ref), v14 (copy)
        local v18 = v16 * v17;
        local v19 = v12.Volume + v18;
        if v19 <= 0 then
            v12.Volume = 0;
            v12:Stop();
            v11[v12.SoundId]:Disconnect();
            return;
        elseif v14 <= v19 then
            v12.Volume = v14;
            v11[v12.SoundId]:Disconnect();
            return;
        else
            v12.Volume = v19;
            return;
        end;
    end;
    if v11[v12.SoundId] and v11[v12.SoundId].Connected then
        v11[v12.SoundId]:Disconnect();
    end;
    v11[v12.SoundId] = l_RunService_0.Heartbeat:Connect(v20);
end;
v9._createSoundEffect = function(_, v23, v24, v25, v26) --[[ Line: 76 ]] --[[ Name: _createSoundEffect ]]
    -- upvalues: v7 (copy)
    if not v7[v23] then
        error(v23 .. " does not exist in list of SoundEffects");
    end;
    local v27 = Instance.new(v23);
    for v28, v29 in pairs(v25) do
        v27[v28] = v29;
    end;
    v27.Parent = v26;
    v27.Name = v24;
end;
v9.PlaySound = function(v30, v31, v32, v33) --[[ Line: 107 ]]
    -- upvalues: l_RobloxGui_0 (copy), v6 (copy), v4 (copy), v10 (copy), v21 (copy)
    local l_SoundManager_Sounds_0 = l_RobloxGui_0:FindFirstChild("SoundManager_Sounds");
    if not l_SoundManager_Sounds_0 then
        error("SoundManager's Sounds folder is missing. SoundManager has not been initialized.");
    end;
    local v35 = v6[v31];
    if not v35 then
        error(v31 .. " does not exist in library of Sounds");
        return;
    else
        local v36 = v4.Dictionary.join(v10, v35.DefaultPlaybackProperties or {}, v32 or {});
        local l_l_SoundManager_Sounds_0_FirstChild_0 = l_SoundManager_Sounds_0:FindFirstChild(v35.Name);
        if not l_l_SoundManager_Sounds_0_FirstChild_0 then
            l_l_SoundManager_Sounds_0_FirstChild_0 = Instance.new("Sound");
            l_l_SoundManager_Sounds_0_FirstChild_0.Parent = l_SoundManager_Sounds_0;
            l_l_SoundManager_Sounds_0_FirstChild_0.SoundId = v35.SoundId;
            l_l_SoundManager_Sounds_0_FirstChild_0.Name = v35.Name;
        end;
        for _, v39 in pairs(l_l_SoundManager_Sounds_0_FirstChild_0:GetChildren()) do
            v39:Destroy();
        end;
        if v33 then
            l_l_SoundManager_Sounds_0_FirstChild_0.SoundGroup = l_RobloxGui_0:FindFirstChild("SoundManager_SoundGroups"):FindFirstChild(v33.Name);
        end;
        for v40, v41 in pairs(v36) do
            if v40 ~= "FadeInTime" and v40 ~= "FadeOutTime" and v40 ~= "Effects" then
                l_l_SoundManager_Sounds_0_FirstChild_0[v40] = v41;
            end;
        end;
        local l_ipairs_0 = ipairs;
        local v43 = v36.SoundEffects or {};
        for _, v45 in l_ipairs_0(v43) do
            v30:_createSoundEffect(v45.Type, v45.Name, v45.Properties, l_l_SoundManager_Sounds_0_FirstChild_0);
        end;
        if v36.FadeInTime then
            l_l_SoundManager_Sounds_0_FirstChild_0.Volume = 0;
            v21(l_l_SoundManager_Sounds_0_FirstChild_0, v36.FadeInTime, v36.Volume, v31);
        end;
        l_l_SoundManager_Sounds_0_FirstChild_0:Play();
        return;
    end;
end;
v9.StopSound = function(_, v47) --[[ Line: 168 ]] --[[ Name: StopSound ]]
    -- upvalues: l_RobloxGui_0 (copy), v6 (copy), v21 (copy)
    local l_SoundManager_Sounds_1 = l_RobloxGui_0:FindFirstChild("SoundManager_Sounds");
    if not l_SoundManager_Sounds_1 then
        error("SoundManager's Sounds folder is missing. SoundManager has not been initialized.");
    end;
    local v49 = v6[v47];
    if not v49 then
        error(v47 .. " does not exist in list of Sounds");
        return;
    else
        local l_l_SoundManager_Sounds_1_FirstChild_0 = l_SoundManager_Sounds_1:FindFirstChild(v49.Name);
        if not l_l_SoundManager_Sounds_1_FirstChild_0 then
            error(v47 .. " does not exist");
            return;
        else
            local l_DefaultPlaybackProperties_0 = v49.DefaultPlaybackProperties;
            local v52 = if l_DefaultPlaybackProperties_0 then l_DefaultPlaybackProperties_0.FadeOutTime else nil;
            if v52 then
                v21(l_l_SoundManager_Sounds_1_FirstChild_0, v52, 0, v47);
                return;
            else
                l_l_SoundManager_Sounds_1_FirstChild_0:Stop();
                return;
            end;
        end;
    end;
end;
v9.CreateSoundGroup = function(v53, v54) --[[ Line: 202 ]] --[[ Name: CreateSoundGroup ]]
    -- upvalues: v8 (copy), l_RobloxGui_0 (copy)
    local v55 = v8[v54];
    if not v55 then
        error("SoundGroup does not exist in list of SoundGroups");
        return;
    else
        local l_SoundManager_SoundGroups_0 = l_RobloxGui_0:FindFirstChild("SoundManager_SoundGroups");
        if not l_SoundManager_SoundGroups_0 then
            error("SoundManager's SoundGroups folder is missing. SoundManager has not been initialized.");
            return;
        elseif l_SoundManager_SoundGroups_0:FindFirstChild(v54) then
            warn("SoundGroup already exists");
            return;
        else
            local l_SoundGroup_0 = Instance.new("SoundGroup");
            l_SoundGroup_0.Name = v55.Name;
            l_SoundGroup_0.Parent = l_SoundManager_SoundGroups_0;
            l_SoundGroup_0.Volume = v55.Volume;
            for _, v59 in ipairs(v55.SoundEffects) do
                v53:_createSoundEffect(v59.Type, v59.Name, v59.Properties, l_SoundGroup_0);
            end;
            return;
        end;
    end;
end;
v9.SoundGroupAddSoundEffect = function(v60, v61, v62) --[[ Line: 236 ]] --[[ Name: SoundGroupAddSoundEffect ]]
    -- upvalues: v8 (copy), l_RobloxGui_0 (copy)
    if not v8[v61] then
        error("SoundGroup does not exist in list of SoundGroups");
        return;
    else
        local l_SoundManager_SoundGroups_1 = l_RobloxGui_0:FindFirstChild("SoundManager_SoundGroups");
        if not l_SoundManager_SoundGroups_1 then
            error("SoundManager's SoundGroups folder is missing. SoundManager has not been initialized.");
            return;
        else
            local l_l_SoundManager_SoundGroups_1_FirstChild_0 = l_SoundManager_SoundGroups_1:FindFirstChild(v61);
            if not l_l_SoundManager_SoundGroups_1_FirstChild_0 then
                error("SoundGroup Instance not created");
                return;
            elseif l_l_SoundManager_SoundGroups_1_FirstChild_0:FindFirstChild(v62.Name) then
                error("SoundEffect with name " .. v62.Name .. " already exists for sound group " .. v61);
                return;
            else
                v60:_createSoundEffect(v62.Type, v62.Name, v62.Properties, l_l_SoundManager_SoundGroups_1_FirstChild_0);
                return;
            end;
        end;
    end;
end;
v9.SoundGroupRemoveSoundEffect = function(_, v66, v67) --[[ Line: 269 ]] --[[ Name: SoundGroupRemoveSoundEffect ]]
    -- upvalues: v8 (copy), l_RobloxGui_0 (copy)
    local v68 = v8[v66];
    if not v68 then
        error("SoundGroup does not exist in list of SoundGroups");
        return;
    else
        local l_SoundManager_SoundGroups_2 = l_RobloxGui_0:FindFirstChild("SoundManager_SoundGroups");
        if not l_SoundManager_SoundGroups_2 then
            error("SoundManager's SoundGroups folder is missing. SoundManager has not been initialized.");
            return;
        else
            local l_l_SoundManager_SoundGroups_2_FirstChild_0 = l_SoundManager_SoundGroups_2:FindFirstChild(v66);
            if not l_l_SoundManager_SoundGroups_2_FirstChild_0 then
                error("SoundGroup Instance not created");
                return;
            else
                local l_l_l_SoundManager_SoundGroups_2_FirstChild_0_FirstChild_0 = l_l_SoundManager_SoundGroups_2_FirstChild_0:FindFirstChild(v67);
                if not l_l_l_SoundManager_SoundGroups_2_FirstChild_0_FirstChild_0 then
                    error(v67 .. " not found in " .. v68.Name);
                end;
                l_l_l_SoundManager_SoundGroups_2_FirstChild_0_FirstChild_0:Destroy();
                return;
            end;
        end;
    end;
end;
v9.init = function() --[[ Line: 300 ]] --[[ Name: init ]]
    -- upvalues: v9 (copy), l_RobloxGui_0 (copy), v5 (copy)
    local v72 = setmetatable({}, v9);
    if not l_RobloxGui_0:FindFirstChild("SoundManager_Sounds") then
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = "SoundManager_Sounds";
        l_Folder_0.Parent = l_RobloxGui_0;
        local l_Folder_1 = Instance.new("Folder");
        l_Folder_1.Name = "SoundManager_SoundGroups";
        l_Folder_1.Parent = l_RobloxGui_0;
        return v72;
    else
        v5:warning("SoundManager already initialized");
        return v72;
    end;
end;
return v9;
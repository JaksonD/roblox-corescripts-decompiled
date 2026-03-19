local l_Parent_0 = script:FindFirstAncestor("VrCommon").Parent;
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_Players_0 = game:GetService("Players");
local l_VRService_0 = game:GetService("VRService");
local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local v5 = {};
v5.__index = v5;
local l_Create_0 = require(l_Parent_0.AppCommonLib).Create;
local v7 = require(script.Parent.FIntSafetyBubbleRadius);
local v8 = require(script.Parent.FIntSafetyBubbleTransparencyPercent) * 0.01;
v5.new = function() --[[ Line: 26 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), l_UserGameSettings_0 (copy), l_Create_0 (copy), l_RbxAnalyticsService_0 (copy)
    local v9 = setmetatable({}, v5);
    v9.subjects = {};
    v9.mode = l_UserGameSettings_0.VRSafetyBubbleMode;
    v9.enabled = v9.mode ~= Enum.VRSafetyBubbleMode.Anyone;
    v9.updateCadence = 0.2;
    v9.Toggled = l_Create_0("BindableEvent")({
        Name = "SafetyBubbleToggled"
    });
    l_UserGameSettings_0:GetPropertyChangedSignal("VRSafetyBubbleMode"):Connect(function() --[[ Line: 39 ]]
        -- upvalues: v9 (copy), l_UserGameSettings_0 (ref), l_RbxAnalyticsService_0 (ref)
        v9.mode = l_UserGameSettings_0.VRSafetyBubbleMode;
        local v10 = v9.mode ~= Enum.VRSafetyBubbleMode.Anyone;
        if v9.enabled ~= v10 then
            v9.enabled = v10;
            v9.Toggled:Fire();
            local v11 = v10 and "On" or "Off";
            l_RbxAnalyticsService_0:ReportCounter("VR-SafetyBubble-" .. v11);
        end;
    end);
    return v9;
end;
v5.ToggleEnabled = function(v12) --[[ Line: 54 ]] --[[ Name: ToggleEnabled ]]
    -- upvalues: l_UserGameSettings_0 (copy)
    l_UserGameSettings_0.VRSafetyBubbleMode = v12.enabled and Enum.VRSafetyBubbleMode.Anyone or Enum.VRSafetyBubbleMode.NoOne;
end;
v5.HasToolAncestor = function(v13, v14) --[[ Line: 59 ]] --[[ Name: HasToolAncestor ]]
    if v14 == nil or v14.Parent == nil then
        return false;
    else
        return v14.Parent:IsA("Tool") or v13:HasToolAncestor(v14.Parent);
    end;
end;
v5.IsValidPartToModify = function(v15, v16) --[[ Line: 66 ]] --[[ Name: IsValidPartToModify ]]
    if v16:IsA("BasePart") or v16:IsA("Decal") then
        return not v15:HasToolAncestor(v16);
    else
        return false;
    end;
end;
v5.CachePartsRecursive = function(v17, v18, v19) --[[ Line: 73 ]] --[[ Name: CachePartsRecursive ]]
    if v18 then
        if v17:IsValidPartToModify(v18) then
            v17.subjects[v19].cachedParts[v18] = true;
            v17.subjects[v19].transparencyDirty = true;
        end;
        for _, v21 in pairs(v18:GetChildren()) do
            v17:CachePartsRecursive(v21, v19);
        end;
    end;
end;
v5.TeardownTransparency = function(v22, v23) --[[ Line: 85 ]] --[[ Name: TeardownTransparency ]]
    for v24, _ in pairs(v22.subjects[v23].cachedParts) do
        v24.LocalTransparencyModifier = 0;
    end;
    v22.subjects[v23].cachedParts = {};
    v22.subjects[v23].transparencyDirty = true;
    v22.subjects[v23].lastTransparency = nil;
    if v22.subjects[v23].descendantAddedConn then
        v22.subjects[v23].descendantAddedConn:disconnect();
        v22.subjects[v23].descendantAddedConn = nil;
    end;
    if v22.subjects[v23].descendantRemovingConn then
        v22.subjects[v23].descendantRemovingConn:disconnect();
        v22.subjects[v23].descendantRemovingConn = nil;
    end;
    for v26, v27 in pairs(v22.subjects[v23].toolDescendantAddedConns) do
        v27:Disconnect();
        v22.subjects[v23].toolDescendantAddedConns[v26] = nil;
    end;
    for v28, v29 in pairs(v22.subjects[v23].toolDescendantRemovingConns) do
        v29:Disconnect();
        v22.subjects[v23].toolDescendantRemovingConns[v28] = nil;
    end;
end;
v5.GetSubjectIndex = function(v30, v31) --[[ Line: 111 ]] --[[ Name: GetSubjectIndex ]]
    local v32 = #v30.subjects;
    local v33 = 1;
    while true do
        if v33 <= v32 then
            if v30.subjects[v33].character == v31 then
                return v33;
            else
                v33 = v33 + 1;
            end;
        else
            return 0;
        end;
    end;
end;
v5.SubjectExists = function(v34, v35) --[[ Line: 125 ]] --[[ Name: SubjectExists ]]
    return v34:GetSubjectIndex(v35) > 0;
end;
v5.SetupTransparency = function(v36, v37) --[[ Line: 131 ]] --[[ Name: SetupTransparency ]]
    local l_v36_SubjectIndex_0 = v36:GetSubjectIndex(v37);
    if l_v36_SubjectIndex_0 == 0 then
        return;
    else
        if v36.subjects[l_v36_SubjectIndex_0].descendantAddedConn then
            v36.subjects[l_v36_SubjectIndex_0].descendantAddedConn:disconnect();
        end;
        v36.subjects[l_v36_SubjectIndex_0].descendantAddedConn = v37.DescendantAdded:Connect(function(v39) --[[ Line: 140 ]]
            -- upvalues: l_v36_SubjectIndex_0 (ref), v36 (copy), v37 (copy)
            l_v36_SubjectIndex_0 = v36:GetSubjectIndex(v37);
            if l_v36_SubjectIndex_0 == 0 then
                return;
            else
                if v36:IsValidPartToModify(v39) then
                    v36.subjects[l_v36_SubjectIndex_0].cachedParts[v39] = true;
                    v36.subjects[l_v36_SubjectIndex_0].transparencyDirty = true;
                end;
                return;
            end;
        end);
        if v36.descendantRemovingConn then
            v36.descendantRemovingConn:disconnect();
        end;
        v36.descendantRemovingConn = v37.DescendantRemoving:connect(function(v40) --[[ Line: 156 ]]
            -- upvalues: l_v36_SubjectIndex_0 (ref), v36 (copy), v37 (copy)
            l_v36_SubjectIndex_0 = v36:GetSubjectIndex(v37);
            if l_v36_SubjectIndex_0 == 0 then
                return;
            else
                if v36.subjects[l_v36_SubjectIndex_0] and v36.subjects[l_v36_SubjectIndex_0].cachedParts[v40] then
                    v36.subjects[l_v36_SubjectIndex_0].cachedParts[v40] = nil;
                    v40.LocalTransparencyModifier = 0;
                end;
                return;
            end;
        end);
        v36:CachePartsRecursive(v37, l_v36_SubjectIndex_0);
        return;
    end;
end;
v5.AddSubject = function(v41, v42) --[[ Line: 172 ]] --[[ Name: AddSubject ]]
    local v43 = #v41.subjects;
    local v44 = 1;
    while true do
        if v44 <= v43 then
            if v41.subjects[v44].character == v42 then
                return;
            else
                v44 = v44 + 1;
            end;
        else
            local v45 = {
                transparencyDirty = false, 
                lastTransparency = nil, 
                descendantAddedConn = nil, 
                descendantRemovingConn = nil, 
                toolDescendantAddedConns = {}, 
                toolDescendantRemovingConns = {}, 
                cachedParts = {}, 
                character = nil
            };
            table.insert(v41.subjects, v45);
            v41.subjects[v44].character = v42;
            v41:SetupTransparency(v42);
            return;
        end;
    end;
end;
v5.update = function(v46, v47) --[[ Line: 202 ]] --[[ Name: update ]]
    -- upvalues: v7 (copy), l_VRService_0 (copy), l_Players_0 (copy), v8 (copy)
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    if not l_CurrentCamera_0 then
        return;
    elseif not v46.enabled then
        if v46.subjects and #v46.subjects > 0 then
            for v49 = 1, #v46.subjects do
                v46:TeardownTransparency(v49);
            end;
            v46.subjects = {};
        end;
        return;
    else
        local v50 = math.max(v7 * l_CurrentCamera_0.HeadScale, 0.1);
        local v51 = nil;
        local v52 = v50 + 3;
        local l_l_VRService_0_UserCFrame_0 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
        local v54 = l_CurrentCamera_0.CFrame * l_l_VRService_0_UserCFrame_0;
        v46.updateCadence = v46.updateCadence - v47;
        if v46.updateCadence <= 0 then
            v46.updateCadence = 0.2;
            for _, v56 in pairs(l_Players_0:GetPlayers()) do
                if v56.Character and v56 ~= l_Players_0.LocalPlayer then
                    if v46.mode == Enum.VRSafetyBubbleMode.OnlyFriends and if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then l_Players_0.LocalPlayer:IsFriendsWithAsync(v56.UserId) else l_Players_0.LocalPlayer:IsFriendsWith(v56.UserId) then
                        local l_v46_SubjectIndex_0 = v46:GetSubjectIndex(v56.Character);
                        if l_v46_SubjectIndex_0 > 0 then
                            v46:TeardownTransparency(l_v46_SubjectIndex_0);
                            table.remove(v46.subjects, l_v46_SubjectIndex_0);
                        end;
                    elseif not v46:SubjectExists(v56.Character) and v56.Character then
                        local l_BoundingBox_0, v59 = v56.Character:GetBoundingBox();
                        local v60 = (l_BoundingBox_0.Position - v54.Position).Magnitude - v59.Z;
                        if v60 < v52 then
                            v52 = v60;
                            v51 = v56.Character;
                        end;
                    end;
                end;
            end;
            if v51 then
                v46:AddSubject(v51);
            end;
        end;
        if not v46.subjects or #v46.subjects == 0 then
            return;
        else
            local v61 = #v46.subjects;
            while v61 > 0 do
                local l_BoundingBox_1, v63 = v46.subjects[v61].character:GetBoundingBox();
                if (l_BoundingBox_1.Position - v54.Position).Magnitude - v63.Z > v50 * 2 then
                    v46:TeardownTransparency(v61);
                    table.remove(v46.subjects, v61);
                end;
                v61 = v61 - 1;
            end;
            local v64 = #v46.subjects;
            v61 = 1;
            while v61 <= v64 do
                local v65 = 0;
                local l_character_0 = v46.subjects[v61].character;
                local v67 = 0;
                if l_character_0.PrimaryPart then
                    v67 = (Vector3.new(l_character_0:GetPrimaryPartCFrame().p.x, v54.Position.Y, l_character_0:GetPrimaryPartCFrame().p.z) - v54.Position).Magnitude;
                else
                    local l_l_character_0_BoundingBox_0, v69 = l_character_0:GetBoundingBox();
                    v67 = (l_l_character_0_BoundingBox_0.Position - v54.Position).Magnitude - v69.Z;
                end;
                if v67 < v50 then
                    if v64 > 3 then
                        v65 = 1;
                    else
                        local v70 = v50 * 0.75;
                        v65 = if v67 < v70 then v8 else (1 - (v67 - v70) / (v50 - v70)) * v8;
                    end;
                end;
                if not v46.subjects[v61].lastTransparency then
                    v46.subjects[v61].transparencyDirty = true;
                end;
                v65 = math.clamp(v65, 0, 1);
                if v46.subjects[v61].transparencyDirty or v46.subjects[v61].lastTransparency ~= v65 then
                    for v71, _ in pairs(v46.subjects[v61].cachedParts) do
                        v71.LocalTransparencyModifier = v65;
                    end;
                    v46.subjects[v61].transparencyDirty = false;
                    v46.subjects[v61].lastTransparency = v65;
                end;
                local l_Tool_0 = l_character_0:FindFirstChildOfClass("Tool");
                if l_Tool_0 then
                    for _, v75 in pairs(l_Tool_0:GetChildren()) do
                        if v75:IsA("BasePart") then
                            v75.LocalTransparencyModifier = v65;
                        end;
                    end;
                end;
                v61 = v61 + 1;
            end;
            return;
        end;
    end;
end;
return v5;
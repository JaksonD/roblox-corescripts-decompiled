local l_Workspace_0 = game:GetService("Workspace");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v4 = require(l_CorePackages_0.Packages.Cryo);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v6 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v8 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v9 = {};
v9.__index = v9;
v9.new = function(v10, v11) --[[ Line: 25 ]] --[[ Name: new ]]
    -- upvalues: v9 (copy), l_ReplicatedStorage_0 (copy)
    local v12 = {};
    setmetatable(v12, v9);
    v12.connections = {};
    v12.store = v10;
    v12.avatarRoute = v11;
    v12.avatarSwapPFX = {};
    for _ = 1, 4 do
        table.insert(v12.avatarSwapPFX, l_ReplicatedStorage_0:WaitForChild("AvatarSwap-PFX"):Clone());
    end;
    v12.emissionId = 0;
    v12.destroyed = false;
    return v12;
end;
v9.setAvatarRoute = function(v14, v15) --[[ Line: 46 ]] --[[ Name: setAvatarRoute ]]
    v14.avatarRoute = v15;
end;
v9.start = function(v16) --[[ Line: 50 ]] --[[ Name: start ]]
    -- upvalues: l_Workspace_0 (copy)
    for _, v18 in v16.avatarSwapPFX do
        v18.Parent = l_Workspace_0;
        v18.MainEmitter.Rate = 10;
        v18.MediumEmitter.MediumEmissions.Rate = 20;
        v18.SmallerEmitter.SmallerEmissions.Rate = 20;
    end;
    local v21 = v16.store.changed:connect(function(v19, v20) --[[ Line: 57 ]]
        -- upvalues: v16 (copy)
        v16:update(v19, v20);
    end);
    table.insert(v16.connections, v21);
    v16.oldAccessories = {};
    v16.changedAccessories = {};
    v16.curCharacter = nil;
    v16.accessoryPositions = {};
end;
v9.stop = function(v22) --[[ Line: 68 ]] --[[ Name: stop ]]
    -- upvalues: l_ReplicatedStorage_0 (copy)
    for _, v24 in v22.avatarSwapPFX do
        v24.Parent = l_ReplicatedStorage_0;
    end;
    for _, v26 in v22.connections do
        v26:disconnect();
    end;
    v22.connections = {};
end;
local l_next_0 = next;
v9.getAttachmentOrPartPosition = function(v28, v29) --[[ Line: 79 ]] --[[ Name: getAttachmentOrPartPosition ]]
    -- upvalues: v8 (copy), v6 (copy)
    local l_AvatarType_0 = v28.store:getState().AvatarExperience.AvatarEditor.Character.AvatarType;
    local v31 = v8.AssetTypeIdToPartsAndAttachments[l_AvatarType_0][v29];
    if v31 == nil then
        return nil;
    else
        local v32 = {};
        for _, v34 in v31 do
            local v35 = v34 and (v34.Attachment and v6.getAttachmentCFrame(v28.curCharacter, v34.Part, v34.Attachment) or v6.getPartCFrame(v28.curCharacter, v34.Part)) or nil;
            if v35 ~= nil and v35.Position ~= nil then
                table.insert(v32, v35.Position);
            end;
        end;
        return v32;
    end;
end;
v9.getChangedTryOnPart = function(v36, v37, v38) --[[ Line: 102 ]] --[[ Name: getChangedTryOnPart ]]
    local v39 = v38.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem or {};
    local v40 = v37.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem or {};
    if v40 == v39 then
        return nil, nil;
    else
        return v40.itemId or v39.itemId, v36:getAttachmentOrPartPosition(v40.itemSubType or v39.itemSubType);
    end;
end;
v9.getChangedEquippedPart = function(v41, v42, v43) --[[ Line: 112 ]] --[[ Name: getChangedEquippedPart ]]
    -- upvalues: v7 (copy), l_next_0 (copy)
    local v44 = v43.AvatarExperience.AvatarEditor.Character.EquippedAssets or {};
    local v45 = v42.AvatarExperience.AvatarEditor.Character.EquippedAssets or {};
    local v46 = v7.getEquippedDiffs(v45, v44);
    local v47, v48 = l_next_0(v46);
    if v47 then
        return v48[1], v41:getAttachmentOrPartPosition(v47);
    else
        return nil, nil;
    end;
end;
v9.setPositions = function(v49, v50) --[[ Line: 123 ]] --[[ Name: setPositions ]]
    for v51, v52 in v50 do
        if v51 <= 4 then
            v49.avatarSwapPFX[v51].Position = v52;
            v49.avatarSwapPFX[v51].MediumEmitter.Position = v52;
            v49.avatarSwapPFX[v51].SmallerEmitter.Position = v52;
        else
            break;
        end;
    end;
end;
v9.getChangedAttachmentPosition = function(v53, v54, v55) --[[ Line: 137 ]] --[[ Name: getChangedAttachmentPosition ]]
    -- upvalues: l_next_0 (copy)
    if l_next_0(v53.changedAccessories) then
        local v56 = {};
        local v57 = {};
        for _, v59 in v53.changedAccessories do
            local v60 = v53.accessoryPositions[v59.accessory.Name];
            if v60 then
                table.insert(v56, v60);
                if v59.removed then
                    v53.accessoryPositions[v59.accessory.Name] = nil;
                end;
            elseif not v59.removed then
                table.insert(v57, v59);
            end;
        end;
        v53.changedAccessories = v57;
        return v56;
    else
        local v61, v62 = v53:getChangedEquippedPart(v54, v55);
        if not v62 then
            local v63, v64 = v53:getChangedTryOnPart(v54, v55);
            v61 = v63;
            v62 = v64;
        end;
        return v62;
    end;
end;
v9.getAccessories = function(v65, _) --[[ Line: 166 ]] --[[ Name: getAccessories ]]
    return (v65.curCharacter:FindFirstChildOfClass("Humanoid"):GetAccessories());
end;
v9.cachePosition = function(v67, v68) --[[ Line: 172 ]] --[[ Name: cachePosition ]]
    local l_BasePart_0 = v68:FindFirstChildWhichIsA("BasePart");
    if l_BasePart_0 then
        v67.accessoryPositions[v68.Name] = l_BasePart_0.Position;
    end;
    return l_BasePart_0;
end;
v9.updateChangedAccessory = function(v70, v71) --[[ Line: 180 ]] --[[ Name: updateChangedAccessory ]]
    -- upvalues: v7 (copy), v4 (copy)
    local v72 = v70:getAccessories(v71);
    local v73 = v7.diffList(v72, v70.oldAccessories);
    local l_oldAccessories_0 = v70.oldAccessories;
    v73 = v4.List.map(v73, function(v75) --[[ Line: 184 ]]
        -- upvalues: v4 (ref), l_oldAccessories_0 (copy)
        if v4.List.find(l_oldAccessories_0, v75) then
            return {
                accessory = v75, 
                removed = true
            };
        else
            return {
                accessory = v75, 
                removed = false
            };
        end;
    end);
    v70.changedAccessories = v4.List.join(v70.changedAccessories, v73);
    for _, v77 in v70.changedAccessories do
        if not v70.accessoryPositions[v77.accessory.Name] then
            v70:cachePosition(v77.accessory);
        end;
    end;
    v70.oldAccessories = v72;
end;
v9.update = function(v78, v79, v80) --[[ Line: 201 ]] --[[ Name: update ]]
    -- upvalues: l_next_0 (copy)
    if not v79.AvatarExperience.AvatarScene.Character.CurrentCharacter then
        return;
    else
        v78.curCharacter = v79.AvatarExperience.AvatarScene.Character.CurrentCharacter;
        v78:updateChangedAccessory(v79);
        local v81 = v79.AvatarExperience.AvatarEditor.Character.EquippedAssets ~= v80.AvatarExperience.AvatarEditor.Character.EquippedAssets;
        local v82 = v79.AvatarExperience.AvatarEditor.Character.AvatarType ~= v80.AvatarExperience.AvatarEditor.Character.AvatarType;
        local v83 = v79.AvatarExperience.AvatarEditor.Character.BodyColors ~= v80.AvatarExperience.AvatarEditor.Character.BodyColors;
        local v84 = v79.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems ~= v80.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
        local l_name_0 = v78.avatarRoute.opaque.name;
        if l_name_0 == "ProfilePictureEditorEmotes" or l_name_0 == "ProfilePictureEditorCamera" or l_name_0 == "ProfilePictureEditorFinal" then
            for v86 = 1, #v78.avatarSwapPFX do
                v78.avatarSwapPFX[v86].MainEmitter.Enabled = false;
                v78.avatarSwapPFX[v86].MediumEmitter.MediumEmissions.Enabled = false;
                v78.avatarSwapPFX[v86].SmallerEmitter.SmallerEmissions.Enabled = false;
            end;
            return;
        else
            if v81 or v82 or v83 or v84 or l_next_0(v78.changedAccessories) then
                local v87 = v78:getChangedAttachmentPosition(v79, v80);
                if v87 and l_next_0(v87) then
                    v78:setPositions(v87);
                    v78:runParticleEmitter(#v87);
                end;
            end;
            return;
        end;
    end;
end;
v9.runParticleEmitter = function(v88, v89) --[[ Line: 249 ]] --[[ Name: runParticleEmitter ]]
    task.spawn(function() --[[ Line: 250 ]]
        -- upvalues: v89 (copy), v88 (copy)
        local v90 = math.min(v89, 4);
        for v91, v92 in v88.avatarSwapPFX do
            if v90 < v91 then
                v92.MainEmitter.Enabled = false;
                v92.MediumEmitter.MediumEmissions.Enabled = false;
                v92.SmallerEmitter.SmallerEmissions.Enabled = false;
            else
                v92.MainEmitter.Enabled = true;
                v92.MediumEmitter.MediumEmissions.Enabled = true;
                v92.SmallerEmitter.SmallerEmissions.Enabled = true;
            end;
        end;
        v88.emissionId = v88.emissionId + 1;
        local l_emissionId_0 = v88.emissionId;
        task.wait(0.3);
        if v88.destroyed then
            return;
        else
            if v88.emissionId == l_emissionId_0 then
                for v94 = 1, v90 do
                    v88.avatarSwapPFX[v94].MainEmitter.Enabled = false;
                    v88.avatarSwapPFX[v94].MediumEmitter.MediumEmissions.Enabled = false;
                    v88.avatarSwapPFX[v94].SmallerEmitter.SmallerEmissions.Enabled = false;
                end;
            end;
            return;
        end;
    end);
end;
v9.onDestroy = function(v95) --[[ Line: 283 ]] --[[ Name: onDestroy ]]
    v95.avatarSwapPFX[1]:Destroy();
    v95.avatarSwapPFX[2]:Destroy();
    v95.avatarSwapPFX[3]:Destroy();
    v95.avatarSwapPFX[4]:Destroy();
    v95.destroyed = true;
end;
return v9;
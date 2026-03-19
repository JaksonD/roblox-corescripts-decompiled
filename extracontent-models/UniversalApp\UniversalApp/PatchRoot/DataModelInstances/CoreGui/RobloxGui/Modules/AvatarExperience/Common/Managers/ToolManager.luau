local l_InsertService_0 = game:GetService("InsertService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.IncrementCharacterModelVersion);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Actions.IncrementTryOnCharacterModelVersion);
local v7 = require(l_Modules_0.LuaApp.mutedError);
local v8 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v9 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v10 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.PPEThumbnailType);
local v11 = require(l_Modules_0.AvatarExperience.Common.Utils);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v13 = {};
v13.__index = v13;
local function _(v14) --[[ Line: 26 ]] --[[ Name: isTool ]]
    return v14:IsA("Tool");
end;
local function _(v16) --[[ Line: 30 ]] --[[ Name: isScript ]]
    return v16:IsA("Script");
end;
local function v18(v19) --[[ Line: 34 ]] --[[ Name: disableScripts ]]
    -- upvalues: v18 (copy)
    for _, v21 in v19:GetChildren() do
        if v21:IsA("Script") then
            v21.Disabled = true;
        end;
        v18(v21);
    end;
end;
local function _(v22) --[[ Line: 44 ]] --[[ Name: getToolAssetIdFromOutfitDetails ]]
    -- upvalues: v8 (copy)
    local l_assets_0 = v22.assets;
    if not l_assets_0 then
        return;
    else
        local v24 = l_assets_0[v8.AssetTypeIdStrings.Gear];
        if not v24 then
            return;
        else
            return v24[1];
        end;
    end;
end;
v13.new = function(v26, v27, v28) --[[ Line: 58 ]] --[[ Name: new ]]
    -- upvalues: v13 (copy)
    local v29 = {};
    setmetatable(v29, v13);
    v29.store = v26;
    v29.characterManager = v28;
    v29.animationManager = v27;
    v29.animationManager:setToolManager(v29);
    v29.equippedToolModel = nil;
    v29.isCurToolTryOn = false;
    v29.destroyed = false;
    v29.curToolId = nil;
    return v29;
end;
v13.getEquippedToolModel = function(v30) --[[ Line: 73 ]] --[[ Name: getEquippedToolModel ]]
    return v30.equippedToolModel;
end;
v13.checkAndEquipTool = function(v31) --[[ Line: 80 ]] --[[ Name: checkAndEquipTool ]]
    -- upvalues: v8 (copy)
    local l_EquippedAssets_0 = v31.store:getState().AvatarExperience.AvatarEditor.Character.EquippedAssets;
    local v33 = l_EquippedAssets_0 and l_EquippedAssets_0[v8.AssetTypeIdStrings.Gear];
    if v33 and next(v33) then
        v31:loadAndEquipTool(next(v33), false);
    end;
end;
v13.checkOutfitAndEquipTool = function(v34, v35) --[[ Line: 93 ]] --[[ Name: checkOutfitAndEquipTool ]]
    -- upvalues: v8 (copy)
    if v34.equippedToolModel then
        v34:unequipTool();
    end;
    local l_assets_1 = v35.assets;
    local v37;
    if not l_assets_1 then
        v37 = nil;
    else
        local v38 = l_assets_1[v8.AssetTypeIdStrings.Gear];
        v37 = if not v38 then nil else v38[1];
    end;
    if v37 then
        v34:loadAndEquipTool(v37, true);
    end;
end;
local function _(v39, v40) --[[ Line: 104 ]] --[[ Name: shouldHideToolForPPE ]]
    -- upvalues: v9 (copy), l_AvatarScreen_0 (copy), v10 (copy)
    if not v39 or not v40 then
        return false;
    elseif not v9.routeIsProfilePictureEditor(v39) then
        return false;
    elseif v39.opaque.name == l_AvatarScreen_0.ProfilePictureEditorFinal and v40.AvatarExperience.ProfilePictureEditor.FinalPageViewMode.finalPageViewMode == v10.FullBody then
        return false;
    else
        return true;
    end;
end;
v13.updateAvatarRoute = function(v42, v43, v44) --[[ Line: 122 ]] --[[ Name: updateAvatarRoute ]]
    -- upvalues: l_AvatarScreen_0 (copy), v9 (copy)
    v42.currentAvatarRoute = v43;
    local v45 = v43.opaque.name == l_AvatarScreen_0.ProfilePictureEditorFinal;
    local v46 = v44.opaque.name == l_AvatarScreen_0.ProfilePictureEditorFinal;
    local v47 = v9.routeIsProfilePictureEditor(v43);
    local v48 = v9.routeIsProfilePictureEditor(v44);
    if v45 ~= v46 or v47 ~= v48 then
        v42:update(v42.store:getState());
    end;
end;
v13.update = function(v49, v50) --[[ Line: 136 ]] --[[ Name: update ]]
    -- upvalues: v8 (copy), v11 (copy), v9 (copy), l_AvatarScreen_0 (copy), v10 (copy)
    local l_curToolId_0 = v49.curToolId;
    local v52 = nil;
    for _, v54 in v50.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems do
        if v54.selectedInTryOnManager then
            if v54.itemType == v8.ItemType.Asset and v54.itemSubType == v8.AssetTypeIdStrings.Gear then
                v52 = v54.itemId;
            end;
            if v54.itemType == v8.ItemType.Bundle and v54.bundleInfo then
                for v55, v56 in v54.bundleInfo do
                    if v56.assetType == v8.AssetTypeIdStrings.Gear then
                        v52 = v55;
                    end;
                end;
            end;
        end;
    end;
    local v57 = v11.getEquippedToolId(v50);
    local l_currentAvatarRoute_0 = v49.currentAvatarRoute;
    if if l_currentAvatarRoute_0 and v50 then if v9.routeIsProfilePictureEditor(l_currentAvatarRoute_0) then l_currentAvatarRoute_0.opaque.name ~= l_AvatarScreen_0.ProfilePictureEditorFinal or v50.AvatarExperience.ProfilePictureEditor.FinalPageViewMode.finalPageViewMode ~= v10.FullBody else false else false then
        v49:unequipTool(true);
    elseif v52 then
        v49:unequipTool();
        v49:loadAndEquipTool(v52, true);
    elseif v57 then
        v49:unequipTool(v49.curToolIsTryOn);
        v49:loadAndEquipTool(v57, false);
    elseif v49.equippedToolModel then
        v49:unequipTool(true);
    else
        v49.curToolId = nil;
    end;
    local v59 = false;
    if v49.curToolId ~= nil then
        v59 = v49.curToolId ~= l_curToolId_0;
    end;
    v49.checkForChangedTool = v59;
end;
v13.loadAndEquipTool = function(v60, v61, v62) --[[ Line: 186 ]] --[[ Name: loadAndEquipTool ]]
    -- upvalues: l_InsertService_0 (copy), v18 (copy), v9 (copy), v7 (copy), v5 (copy), v6 (copy)
    v60.curToolId = v61;
    task.spawn(function() --[[ Line: 189 ]]
        -- upvalues: l_InsertService_0 (ref), v61 (copy), v60 (copy), v18 (ref), v9 (ref), v7 (ref), v62 (copy), v5 (ref), v6 (ref)
        local v63 = nil;
        local _, l_result_0 = pcall(function() --[[ Line: 191 ]]
            -- upvalues: v63 (ref), l_InsertService_0 (ref), v61 (ref)
            v63 = l_InsertService_0:LoadAsset(v61);
        end);
        if v60.destroyed then
            if v63 then
                v63:Destroy();
            end;
            return;
        elseif l_result_0 or not v63 then
            warn("Error loading tool in CharacterManager: " .. l_result_0);
            return;
        elseif v61 ~= v60.curToolId then
            warn("Tool unequipped without getting a chance to get equipped.");
            v63:Destroy();
            return;
        else
            local _, v67 = next(v63:GetChildren());
            if v67 and v67:IsA("Tool") then
                v18(v67);
                v60:equipTool(v67);
                if v60.checkForChangedTool then
                    v60.checkForChangedTool = false;
                    local l_BoundingBox_0, v69 = v60.characterManager:getCurrentCharacter():GetBoundingBox();
                    if not v9.isBoundingBoxVectorSane(v69) or not v9.isBoundingBoxCFrameSane(l_BoundingBox_0) then
                        v7("(Avatar Experience) bad bounding box on adding tool: " .. v61);
                    end;
                end;
            end;
            if not v62 then
                v60.curToolIsTryOn = false;
                v60.store:dispatch(v5());
            else
                v60.curToolIsTryOn = true;
                v60.store:dispatch(v6());
            end;
            return;
        end;
    end);
end;
v13.equipTool = function(v70, v71) --[[ Line: 243 ]] --[[ Name: equipTool ]]
    v70.equippedToolModel = v71;
    v70.characterManager:getCurrentCharacter().Humanoid:EquipTool(v71);
end;
v13.unequipTool = function(v72, v73) --[[ Line: 248 ]] --[[ Name: unequipTool ]]
    -- upvalues: v6 (copy), v5 (copy)
    v72.curToolId = nil;
    local l_equippedToolModel_0 = v72.equippedToolModel;
    if l_equippedToolModel_0 then
        if v73 then
            if v72.curToolIsTryOn then
                v72.store:dispatch(v6());
            else
                v72.store:dispatch(v5());
            end;
        end;
        v72.equippedToolModel = nil;
        v72.characterManager:getCurrentCharacter().Humanoid:UnequipTools();
        l_equippedToolModel_0:Destroy();
    end;
end;
v13.notifySwitchedAvatarType = function(v75) --[[ Line: 266 ]] --[[ Name: notifySwitchedAvatarType ]]
    if v75.equippedToolModel then
        v75:equipTool(v75.equippedToolModel);
    end;
end;
v13.start = function(_) --[[ Line: 272 ]] --[[ Name: start ]]

end;
v13.stop = function(v77) --[[ Line: 274 ]] --[[ Name: stop ]]
    -- upvalues: v8 (copy)
    local l_EquippedAssets_1 = v77.store:getState().AvatarExperience.AvatarEditor.Character.EquippedAssets;
    local v79 = l_EquippedAssets_1 and l_EquippedAssets_1[v8.AssetTypeIdStrings.Gear];
    if (not v79 or not next(v79)) and v77.equippedToolModel then
        v77:unequipTool();
    end;
    v77:checkAndEquipTool();
end;
v13.onDestroy = function(v80) --[[ Line: 285 ]] --[[ Name: onDestroy ]]
    v80.destroyed = true;
end;
return v13;
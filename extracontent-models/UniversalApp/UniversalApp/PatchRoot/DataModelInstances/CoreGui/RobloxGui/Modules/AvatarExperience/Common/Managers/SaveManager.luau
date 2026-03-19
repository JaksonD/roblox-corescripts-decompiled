local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_GuiService_0 = game:GetService("GuiService");
local l_AvatarEditorService_0 = game:GetService("AvatarEditorService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v4 = require(l_CorePackages_0.Packages.Cryo);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v7 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.ToggleEquipAsset);
local v9 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v10 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v11 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveSaveDelay);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v13 = require(l_Modules_0.AvatarExperience.Common.Utils);
local l_reportAvatarEventCounterNoAnalyticsArgument_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).reportAvatarEventCounterNoAnalyticsArgument;
local v15 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v16 = require(l_CorePackages_0.Packages.tutils);
local v17 = require(l_Modules_0.AvatarExperience.Common.Actions.IncrementSavedCharacterModelVersion);
local l_sendAXCounterV2_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2;
local v19 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.PreventSaveAvatar);
local v20 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableAvatarDataRefresh);
local v21 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableAvatarEditorServiceAPIErrorLogging);
local v22 = game:DefineFastFlag("AXFixSaveManagerOnAXExit", false);
local l_FFlagAXAvatarTimeoutFlow_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXAvatarTimeoutFlow;
local v24 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v25 = l_GuiService_0:IsTenFootInterface();
local v26 = {
    toastMessage = "Feature.Avatar.Message.InvalidAssetsEquipped", 
    isLocalized = false, 
    toastType = v10.InformationMessage
};
local v27 = nil;
if v25 then
    v27 = require(l_Modules_0.Shell.EventHub);
end;
local v28 = {};
v28.__index = v28;
local v29 = game:DefineFastInt("AvatarEditorTimeBetweenSaves", 5);
v28.setLastSavedVariables = function(v30) --[[ Line: 55 ]] --[[ Name: setLastSavedVariables ]]
    local v31 = v30.store:getState();
    v30.lastSavedBodyColor3s = v31.AvatarExperience.AvatarEditor.Character.BodyColor3s;
    v30.lastSavedAvatarType = v31.AvatarExperience.AvatarEditor.Character.AvatarType;
    v30.lastSavedScales = v31.AvatarExperience.AvatarEditor.Character.AvatarScales;
    v30.lastSavedAssets = v31.AvatarExperience.AvatarEditor.Character.EquippedAssets;
    v30.lastSavedEmotes = v31.AvatarExperience.AvatarEditor.EquippedEmotes.slotInfo;
end;
v28.new = function(v32, v33, v34) --[[ Line: 66 ]] --[[ Name: new ]]
    -- upvalues: v28 (copy)
    local v35 = {
        store = v32, 
        connections = {}, 
        networking = v33, 
        analytics = v34
    };
    setmetatable(v35, v28);
    v35.timeOfLastSave = 0;
    v35:setLastSavedVariables();
    return v35;
end;
v28.start = function(v36) --[[ Line: 80 ]] --[[ Name: start ]]
    local v39 = v36.store.changed:connect(function(v37, v38) --[[ Line: 81 ]]
        -- upvalues: v36 (copy)
        v36:update(v37, v38);
    end);
    table.insert(v36.connections, v39);
    local v40 = game.Close:Connect(function() --[[ Line: 86 ]]
        -- upvalues: v36 (copy)
        v36:save(true);
    end);
    table.insert(v36.connections, v40);
    v36.timeOfLastSave = 0;
    v36.waitingForSave = false;
    v36.characterUpdated = false;
    v36.characterEquipped = false;
    v36:setLastSavedVariables();
end;
v28.update = function(v41, v42, _) --[[ Line: 98 ]] --[[ Name: update ]]
    -- upvalues: v20 (copy), v19 (copy), l_FFlagAXAvatarTimeoutFlow_0 (copy), v24 (copy), v16 (copy)
    if v20() and v42.AvatarExperience.AvatarEditor.PreventSaveAvatar then
        v41.store:dispatch(v19(false));
        return;
    else
        if l_FFlagAXAvatarTimeoutFlow_0 then
            local v44 = v24.Stores.getTimeoutStatusStore();
            if v44 and v44.getIsTimedOut and v44.getIsTimedOut(false) then
                return;
            end;
        end;
        local l_BodyColor3s_0 = v42.AvatarExperience.AvatarEditor.Character.BodyColor3s;
        local l_AvatarType_0 = v42.AvatarExperience.AvatarEditor.Character.AvatarType;
        local l_AvatarScales_0 = v42.AvatarExperience.AvatarEditor.Character.AvatarScales;
        local l_EquippedAssets_0 = v42.AvatarExperience.AvatarEditor.Character.EquippedAssets;
        local l_slotInfo_0 = v42.AvatarExperience.AvatarEditor.EquippedEmotes.slotInfo;
        local v50 = false;
        local v51 = if v20() then not v16.deepEqual(l_BodyColor3s_0, v41.lastSavedBodyColor3s) else l_BodyColor3s_0 ~= v41.lastSavedBodyColor3s;
        if v20() then
            if v51 or not v16.deepEqual(l_AvatarType_0, v41.lastSavedAvatarType) or not v16.deepEqual(l_AvatarScales_0, v41.lastSavedScales) or not v16.deepEqual(l_EquippedAssets_0, v41.lastSavedAssets) or not v16.deepEqual(l_slotInfo_0, v41.lastSavedEmotes) then
                v50 = true;
            end;
        elseif v51 or l_AvatarType_0 ~= v41.lastSavedAvatarType or l_AvatarScales_0 ~= v41.lastSavedScales or l_EquippedAssets_0 ~= v41.lastSavedAssets or l_slotInfo_0 ~= v41.lastSavedEmotes then
            v50 = true;
        end;
        if v50 and not v41.saving then
            v41:save(false);
        end;
        return;
    end;
end;
v28.stop = function(v52) --[[ Line: 153 ]] --[[ Name: stop ]]
    -- upvalues: v25 (copy), v27 (ref)
    v52:save(true);
    for _, v54 in v52.connections do
        v54:disconnect();
    end;
    v52.connections = {};
    if v25 then
        spawn(function() --[[ Line: 162 ]]
            -- upvalues: v52 (copy), v27 (ref)
            if v52.characterUpdated then
                v27:dispatchEvent(v27.Notifications.CharacterUpdated);
            end;
            if v52.characterEquipped then
                v27:dispatchEvent(v27.Notifications.CharacterEquipped, v52.store:getState().AvatarExperience.AvatarEditor.Character.EquippedAssets, v52.characterUpdated);
            end;
            v52.characterUpdated = false;
            v52.characterEquipped = false;
        end);
    end;
end;
local function _(v55) --[[ Line: 181 ]] --[[ Name: notifyUserAboutInvalidAssetsInCostume ]]
    -- upvalues: v9 (copy), v26 (copy)
    v55:dispatch(v9(v26));
end;
local function v67(v57) --[[ Line: 185 ]] --[[ Name: getAssetIdsFromDescription ]]
    -- upvalues: v7 (copy)
    local v58 = {};
    local v59 = {};
    for v60, v61 in v7.AssetTypeIdStringToHumanoidDescriptionProp do
        if v7.AssetTypeIdToAccessoryTypeEnum[v60] == nil then
            local v62 = v57[v61];
            if typeof(v62) == "number" and v62 > 0 then
                table.insert(v58, v62);
                v59[v62] = tostring(v60);
            elseif typeof(v62) == "string" and v62 ~= "" then
                for v63 in v62:gmatch("([%d]+),?") do
                    table.insert(v58, (tonumber(v63)));
                    v59[tonumber(v63)] = tostring(v60);
                end;
            end;
        end;
    end;
    for _, v65 in (v57:GetAccessories(true)) do
        table.insert(v58, v65.AssetId);
        local l_AccessoryType_0 = v65.AccessoryType;
        v59[v65.AssetId] = v7.AccessoryTypeEnumToAssetTypeId[l_AccessoryType_0];
    end;
    return v58, v59;
end;
local function v80(v68, v69, v70, v71) --[[ Line: 219 ]] --[[ Name: removeInvalidAssetsWithHumanoidDescription ]]
    -- upvalues: v67 (copy), v4 (copy), v6 (copy), v8 (copy), v9 (copy), v26 (copy)
    local v72, v73 = v67(v69);
    local v74 = v67(v70);
    local v75 = v4.List.toSet(v74);
    local v77 = v4.List.filter(v72, function(v76) --[[ Line: 226 ]]
        -- upvalues: v75 (copy)
        return v75[v76] == nil;
    end);
    for _, v79 in v77 do
        if v6.isAssetEquipped(tostring(v79), v73[v79], v71) then
            v68:dispatch(v8(v73[v79], (tostring(v79))));
        end;
    end;
    if #v77 > 0 then
        v68:dispatch(v9(v26));
    end;
end;
v28.shouldDelaySaveManager = function(v81) --[[ Line: 247 ]] --[[ Name: shouldDelaySaveManager ]]
    return v81.store:getState().AvatarExperience.AvatarScene.Character.ShouldDelaySaveManager;
end;
v28.save = function(v82, v83) --[[ Line: 252 ]] --[[ Name: save ]]
    -- upvalues: l_sendAXCounterV2_0 (copy), v7 (copy), v29 (copy), v22 (copy), v11 (copy), v20 (copy), v16 (copy), l_FFlagAXAvatarTimeoutFlow_0 (copy), v24 (copy), v6 (copy), l_AvatarEditorService_0 (copy), v21 (copy), l_reportAvatarEventCounterNoAnalyticsArgument_0 (copy), v15 (copy), v80 (copy), v17 (copy)
    v82.saving = true;
    l_sendAXCounterV2_0(v7.Counter.SaveManager.Attempt, {
        skipWait = tostring(v83), 
        shouldDelay = tostring(v82:shouldDelaySaveManager()), 
        timeBetweenSaves = tostring(v29)
    });
    task.spawn(function() --[[ Line: 261 ]]
        -- upvalues: v82 (copy), v22 (ref), v83 (copy), v29 (ref), v11 (ref), v20 (ref), v16 (ref), l_FFlagAXAvatarTimeoutFlow_0 (ref), v24 (ref), v6 (ref), l_AvatarEditorService_0 (ref), v21 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v15 (ref), l_sendAXCounterV2_0 (ref), v7 (ref), v80 (ref), v17 (ref)
        local v84 = tick() - v82.timeOfLastSave;
        if v22 then
            if not v83 then
                if v84 < v29 then
                    task.wait(v29 - v84);
                    if v82:shouldDelaySaveManager() then
                        v82.store:dispatch(v11());
                    end;
                elseif v82:shouldDelaySaveManager() then
                    wait(v29);
                    v82.store:dispatch(v11());
                end;
            elseif v82:shouldDelaySaveManager() then
                v82.store:dispatch(v11());
            end;
        elseif not v83 and v84 < v29 then
            task.wait(v29 - v84);
            if v82:shouldDelaySaveManager() then
                v82.store:dispatch(v11());
            end;
        elseif v82:shouldDelaySaveManager() then
            wait(v29);
            v82.store:dispatch(v11());
        end;
        local l_BodyColor3s_1 = v82.store:getState().AvatarExperience.AvatarEditor.Character.BodyColor3s;
        local l_AvatarType_1 = v82.store:getState().AvatarExperience.AvatarEditor.Character.AvatarType;
        local l_AvatarScales_1 = v82.store:getState().AvatarExperience.AvatarEditor.Character.AvatarScales;
        local l_EquippedAssets_1 = v82.store:getState().AvatarExperience.AvatarEditor.Character.EquippedAssets;
        local l_slotInfo_1 = v82.store:getState().AvatarExperience.AvatarEditor.EquippedEmotes.slotInfo;
        local v90 = {};
        if v20() then
            v90.BodyColors = not v16.deepEqual(l_BodyColor3s_1, v82.lastSavedBodyColor3s);
            v90.AvatarType = not v16.deepEqual(v82.lastSavedAvatarType, l_AvatarType_1);
            v90.Scales = not v16.deepEqual(l_AvatarScales_1, v82.lastSavedScales);
            v90.Assets = l_EquippedAssets_1 and not v16.deepEqual(l_EquippedAssets_1, v82.lastSavedAssets);
            v90.Emotes = not v16.deepEqual(l_slotInfo_1, v82.lastSavedEmotes);
        else
            v90.BodyColors = l_BodyColor3s_1 ~= v82.lastSavedBodyColor3s;
            v90.AvatarType = l_AvatarType_1 ~= v82.lastSavedAvatarType;
            v90.Scales = l_AvatarScales_1 ~= v82.lastSavedScales;
            v90.Assets = l_EquippedAssets_1 and l_EquippedAssets_1 ~= v82.lastSavedAssets;
            v90.Emotes = l_slotInfo_1 ~= v82.lastSavedEmotes;
        end;
        if not v90.BodyColors and not v90.AvatarType and not v90.Scales and not v90.Assets and not v90.Emotes then
            v82.timeOfLastSave = tick();
            v82.saving = false;
            return;
        else
            if l_FFlagAXAvatarTimeoutFlow_0 then
                local v91 = v24.Stores.getTimeoutStatusStore();
                if v91 and v91.getIsTimedOut and v91.getIsTimedOut(false) then
                    v82.saving = false;
                    return;
                end;
            end;
            local v92 = v6.getHumanoidDescriptionFromState(v82.store:getState().AvatarExperience);
            local v93 = Enum.HumanoidRigType[l_AvatarType_1];
            task.spawn(function() --[[ Line: 364 ]]
                -- upvalues: v90 (copy), l_EquippedAssets_1 (copy), l_AvatarEditorService_0 (ref), v92 (copy), v93 (copy), v21 (ref), l_reportAvatarEventCounterNoAnalyticsArgument_0 (ref), v15 (ref), l_sendAXCounterV2_0 (ref), v7 (ref), l_BodyColor3s_1 (copy), v82 (ref), l_AvatarType_1 (copy), l_AvatarScales_1 (copy), v80 (ref), l_slotInfo_1 (copy), l_FFlagAXAvatarTimeoutFlow_0 (ref), v24 (ref), v17 (ref)
                local v94 = 0;
                if v90.Assets then
                    local v95 = l_EquippedAssets_1[tostring(Enum.AssetType.Gear.Value)];
                    if v95 then
                        local v96, _ = next(v95);
                        if v96 then
                            v94 = tonumber(v96);
                        end;
                    end;
                end;
                local v98 = l_AvatarEditorService_0:NoPromptSaveAvatar(v92, v93, v90, v94);
                local v99 = 0;
                while not v98 do
                    v99 = v99 + 1;
                    l_AvatarEditorService_0.PromptSaveAvatarCompleted:Wait();
                    v98 = l_AvatarEditorService_0:NoPromptSaveAvatar(v92, v93, v90);
                    if v21() then
                        l_reportAvatarEventCounterNoAnalyticsArgument_0(v15.Counter.AvatarEditorServiceErrors.NoPromptSaveAvatar);
                    end;
                end;
                if v99 > 0 then
                    l_sendAXCounterV2_0(v7.Counter.SaveManager.BlockedByOngoingSave, {
                        blockedCount = tostring(v99)
                    });
                end;
                local v100, v101 = l_AvatarEditorService_0.PromptSaveAvatarCompleted:Wait();
                if v100 == Enum.AvatarPromptResult.Success then
                    if l_BodyColor3s_1 ~= v82.lastSavedBodyColor3s then
                        v82.lastSavedBodyColor3s = l_BodyColor3s_1;
                        v82.characterUpdated = true;
                    end;
                    if l_AvatarType_1 ~= v82.lastSavedAvatarType then
                        v82.lastSavedAvatarType = l_AvatarType_1;
                        v82.characterUpdated = true;
                    end;
                    if l_AvatarScales_1 ~= v82.lastSavedScales then
                        v82.lastSavedScales = l_AvatarScales_1;
                        v82.characterUpdated = true;
                    end;
                    if l_EquippedAssets_1 and l_EquippedAssets_1 ~= v82.lastSavedAssets then
                        v82.lastSavedAssets = l_EquippedAssets_1;
                        v82.characterUpdated = true;
                        v82.characterEquipped = true;
                        v80(v82.store, v92, v101, l_EquippedAssets_1);
                    end;
                    if l_slotInfo_1 ~= v82.lastSavedEmotes then
                        v82.lastSavedEmotes = l_slotInfo_1;
                        v82.characterUpdated = true;
                        v82.characterEquipped = true;
                    end;
                    l_sendAXCounterV2_0(v7.Counter.SaveManager.Success);
                else
                    warn("Failure saving.");
                    l_sendAXCounterV2_0(v7.Counter.SaveManager.Failure);
                    if v21() then
                        l_reportAvatarEventCounterNoAnalyticsArgument_0(v15.Counter.AvatarEditorServiceErrors.PromptSaveAvatarCompleted);
                    end;
                    if l_FFlagAXAvatarTimeoutFlow_0 and v100 == Enum.AvatarPromptResult.PermissionDenied then
                        local v102 = v24.Stores.getTimeoutStatusStore();
                        if v102 and v102.fetchStatus then
                            v102.fetchStatus();
                        end;
                    end;
                end;
                v82.store:dispatch(v17());
                v82.timeOfLastSave = tick();
                v82.saving = false;
            end);
            return;
        end;
    end);
end;
v28.updateAvatarRoute = function(v103, v104, v105) --[[ Line: 461 ]] --[[ Name: updateAvatarRoute ]]
    -- upvalues: v13 (copy)
    if v13.didLeaveAvatarEditor(v104, v105) then
        v103:save(true);
    end;
end;
v28.onDestroy = function(_) --[[ Line: 470 ]] --[[ Name: onDestroy ]]

end;
return v28;
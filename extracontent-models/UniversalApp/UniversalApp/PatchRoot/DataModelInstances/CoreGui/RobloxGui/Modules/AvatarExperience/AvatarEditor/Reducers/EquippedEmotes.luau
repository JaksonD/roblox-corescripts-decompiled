local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.Rodux);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local v6 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.ReceivedAvatarData);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetSelectedEmoteSlot);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.ToggleEquipAsset);
local l_CharacterHistoryStateChangeButtonActivated_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).State.Actions.CharacterHistoryStateChangeButtonActivated;
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local v12 = {
    slotInfo = {}, 
    selectedSlot = 1
};
local function v18(v13) --[[ Line: 48 ]] --[[ Name: createSlotInfo ]]
    local v14 = {};
    for _, v16 in v13 do
        local l_position_0 = v16.position;
        v14[l_position_0] = {
            assetId = tostring(v16.assetId), 
            position = l_position_0
        };
    end;
    return v14;
end;
local function _(v19, v20, v21) --[[ Line: 64 ]] --[[ Name: addEmoteToSlot ]]
    -- upvalues: v3 (copy)
    return v3.Dictionary.join(v19, {
        [v20] = v21
    });
end;
local function _(v23, v24) --[[ Line: 74 ]] --[[ Name: removeEmoteFromSlot ]]
    -- upvalues: v3 (copy)
    return v3.Dictionary.join(v23, {
        [v24] = v3.None
    });
end;
return v4.createReducer(v12, {
    [v7.name] = function(v26, v27) --[[ Line: 83 ]]
        -- upvalues: v18 (copy), v3 (copy)
        local v28 = v27.avatarData.emotes or {};
        v28 = v18(v28);
        return v3.Dictionary.join(v26, {
            slotInfo = v28
        });
    end, 
    [l_CharacterHistoryStateChangeButtonActivated_0.name] = function(v29, v30) --[[ Line: 94 ]]
        -- upvalues: l_FFlagAXRootSlotBasedEditorFlag_0 (copy), v3 (copy)
        if l_FFlagAXRootSlotBasedEditorFlag_0 and v30.equipped and next(v30.equipped) ~= nil and v30.equipped.EquippedEmotes then
            return v3.Dictionary.join(v29, {
                slotInfo = v30.equipped.EquippedEmotes.slotInfo
            });
        else
            return v29;
        end;
    end, 
    [v9.name] = function(v31, v32) --[[ Line: 115 ]]
        -- upvalues: v6 (copy), v3 (copy)
        if v32.assetTypeId ~= v6.AssetTypeIdStrings.EmoteAnimation then
            return v31;
        else
            local v33 = v31.slotInfo[v31.selectedSlot];
            local v34 = {
                assetId = v32.assetId, 
                position = v31.selectedSlot
            };
            local v35 = nil;
            if not v33 or v33.assetId ~= v34.assetId then
                local l_slotInfo_0 = v31.slotInfo;
                local l_selectedSlot_0 = v31.selectedSlot;
                v35 = v3.Dictionary.join(l_slotInfo_0, {
                    [l_selectedSlot_0] = v34
                });
            else
                local l_slotInfo_1 = v31.slotInfo;
                local l_selectedSlot_1 = v31.selectedSlot;
                v35 = v3.Dictionary.join(l_slotInfo_1, {
                    [l_selectedSlot_1] = v3.None
                });
            end;
            return v3.Dictionary.join(v31, {
                slotInfo = v35
            });
        end;
    end, 
    [v8.name] = function(v40, v41) --[[ Line: 139 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v40, {
            selectedSlot = v41.selectedSlot
        });
    end
});
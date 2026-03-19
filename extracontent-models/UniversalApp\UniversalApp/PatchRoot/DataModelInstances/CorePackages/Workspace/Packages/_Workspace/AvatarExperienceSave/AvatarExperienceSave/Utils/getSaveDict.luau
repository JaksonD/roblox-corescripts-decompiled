local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSave");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.tutils);
local _ = require(l_script_FirstAncestor_0.Context.AvatarSaveContext);
local v4 = require(l_Parent_0.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag and game:DefineFastFlag("AXFixEmptyDictionaryKeysForSaveDict2", false);
local function v9(v5) --[[ Line: 21 ]] --[[ Name: filterEmptyDicts ]]
    local v6 = table.clone(v5);
    for v7, v8 in v6 do
        if type(v8) == "table" and next(v8) == nil then
            v6[v7] = nil;
        end;
    end;
    return v6;
end;
local function _(v10, v11) --[[ Line: 31 ]] --[[ Name: deepEqualWithoutEmptyDicts ]]
    -- upvalues: v9 (copy), v2 (copy)
    local v12 = v9(v10);
    local v13 = v9(v11);
    return v2.deepEqual(v12, v13);
end;
return function(v15, v16) --[[ Line: 41 ]] --[[ Name: getSaveDict ]]
    -- upvalues: v4 (copy), v9 (copy), v2 (copy)
    local l_equipped_0 = v15.equipped;
    local l_equipped_1 = v16.equipped;
    if v4 then
        local v19 = {};
        local l_BodyColor3s_0 = l_equipped_0.BodyColor3s;
        local l_BodyColor3s_1 = l_equipped_1.BodyColor3s;
        local v22 = v9(l_BodyColor3s_0);
        local v23 = v9(l_BodyColor3s_1);
        v19.BodyColors = not v2.deepEqual(v22, v23);
        v19.AvatarType = l_equipped_0.AvatarType ~= l_equipped_1.AvatarType;
        l_BodyColor3s_0 = l_equipped_0.AvatarScales;
        l_BodyColor3s_1 = l_equipped_1.AvatarScales;
        v22 = v9(l_BodyColor3s_0);
        v23 = v9(l_BodyColor3s_1);
        v19.Scales = not v2.deepEqual(v22, v23);
        local l_EquippedAssets_0 = l_equipped_0.EquippedAssets;
        if l_EquippedAssets_0 then
            l_BodyColor3s_0 = l_equipped_0.EquippedAssets;
            l_BodyColor3s_1 = l_equipped_1.EquippedAssets;
            v22 = v9(l_BodyColor3s_0);
            v23 = v9(l_BodyColor3s_1);
            l_EquippedAssets_0 = not v2.deepEqual(v22, v23);
        end;
        v19.Assets = l_EquippedAssets_0;
        l_BodyColor3s_0 = l_equipped_0.EquippedEmotes.slotInfo;
        l_BodyColor3s_1 = l_equipped_1.EquippedEmotes.slotInfo;
        v22 = v9(l_BodyColor3s_0);
        v23 = v9(l_BodyColor3s_1);
        v19.Emotes = not v2.deepEqual(v22, v23);
        return v19;
    else
        return {
            BodyColors = not v2.deepEqual(l_equipped_0.BodyColor3s, l_equipped_1.BodyColor3s), 
            AvatarType = l_equipped_0.AvatarType ~= l_equipped_1.AvatarType, 
            Scales = not v2.deepEqual(l_equipped_0.AvatarScales, l_equipped_1.AvatarScales), 
            Assets = l_equipped_0.EquippedAssets and not v2.deepEqual(l_equipped_0.EquippedAssets, l_equipped_1.EquippedAssets), 
            Emotes = not v2.deepEqual(l_equipped_0.EquippedEmotes.slotInfo, l_equipped_1.EquippedEmotes.slotInfo)
        };
    end;
end;
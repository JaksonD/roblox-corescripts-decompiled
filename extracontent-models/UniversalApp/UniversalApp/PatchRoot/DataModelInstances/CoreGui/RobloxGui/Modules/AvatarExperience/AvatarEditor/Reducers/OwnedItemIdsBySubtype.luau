local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local v5 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetOwnedItemIdsBySubtype);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.GrantAsset);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.RevokeAsset);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.GrantOutfit);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.GrantEditableOutfit);
local v10 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.GrantPurchasedOutfit);
local v11 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.GrantOutfitByType);
local v12 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.RevokeOutfit);
local v13 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.UpdateOutfit);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v15 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v16 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v17 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorStructure);
local l_FFlagAXFixMakeupLookGrantOutfitHoisting_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixMakeupLookGrantOutfitHoisting;
local function _() --[[ Line: 27 ]] --[[ Name: GetAssetTypeToSearchUuids ]]
    -- upvalues: v17 (copy)
    return v17().AssetTypeToSearchUuids;
end;
return v2.createReducer({}, {
    [v5.name] = function(v20, v21) --[[ Line: 39 ]]
        -- upvalues: v3 (copy)
        local v22 = {};
        local v23 = v20[v21.itemSubType] and v20[v21.itemSubType] or {};
        for _, v25 in v23 do
            v22[v25] = v25;
        end;
        for _, v27 in v21.itemIds do
            if not v22[v27] then
                v23[#v23 + 1] = v27;
                v22[v27] = v27;
            end;
        end;
        return v3.Dictionary.join(v20, {
            [v21.itemSubType] = v23
        });
    end, 
    [v6.name] = function(v28, v29) --[[ Line: 61 ]]
        -- upvalues: v17 (copy), v3 (copy)
        local v30 = {};
        local v31 = tostring(v29.assetTypeId);
        local v32 = tostring(v29.assetId);
        local v33 = v17().AssetTypeToSearchUuids[v31];
        if not v33 then
            return v28;
        else
            for _, v35 in v33 do
                local v36 = v28[v35] and v28[v35] or {};
                local v37 = {
                    v32
                };
                local v38 = false;
                for v39, v40 in v36 do
                    if v40 == v32 then
                        v38 = true;
                        break;
                    else
                        v37[v39 + 1] = v40;
                    end;
                end;
                if not v38 then
                    v30[v35] = v37;
                end;
            end;
            if next(v30) then
                return v3.Dictionary.join(v28, v30);
            else
                return v28;
            end;
        end;
    end, 
    [v7.name] = function(v41, v42) --[[ Line: 105 ]]
        -- upvalues: v17 (copy), v3 (copy)
        local v43 = {};
        local v44 = tostring(v42.assetTypeId);
        local v45 = tostring(v42.assetId);
        local v46 = v17().AssetTypeToSearchUuids[v44];
        if not v46 then
            return v41;
        else
            for _, v48 in v46 do
                local v49 = v41[v48] and v41[v48] or {};
                local v50 = v3.List.removeValue(v49, v45);
                if #v49 ~= #v50 then
                    v43[v48] = v50;
                end;
            end;
            if next(v43) then
                return v3.Dictionary.join(v41, v43);
            else
                return v41;
            end;
        end;
    end, 
    [v11.name] = function(v51, v52) --[[ Line: 138 ]]
        -- upvalues: v3 (copy)
        local v53 = tostring(v52.outfitId);
        local l_outfitTypeId_0 = v52.outfitTypeId;
        local v55 = v51[l_outfitTypeId_0] or {};
        local v56 = {
            v53
        };
        for _, v58 in v55 do
            if v58 == v53 then
                return v51;
            else
                table.insert(v56, v58);
            end;
        end;
        return v3.Dictionary.join(v51, {
            [l_outfitTypeId_0] = v56
        });
    end, 
    [v8.name] = function(v59, v60) --[[ Line: 161 ]]
        -- upvalues: v16 (copy), v3 (copy)
        local v61 = tostring(v60.outfitId);
        local v62 = v59[v16.CharacterKey] or {};
        local v63 = {
            v61
        };
        for v64, v65 in v62 do
            if v65 == v61 then
                return v59;
            else
                v63[v64 + 1] = v65;
            end;
        end;
        return v3.Dictionary.join(v59, {
            [v16.CharacterKey] = v63
        });
    end, 
    [v9.name] = function(v66, v67) --[[ Line: 182 ]]
        -- upvalues: v16 (copy), v3 (copy)
        local v68 = tostring(v67.outfitId);
        local v69 = v66[v16.EditableCharacterKey] or {};
        local v70 = {
            v68
        };
        for v71, v72 in v69 do
            if v72 == v68 then
                return v66;
            else
                v70[v71 + 1] = v72;
            end;
        end;
        return v3.Dictionary.join(v66, {
            [v16.EditableCharacterKey] = v70
        });
    end, 
    [v10.name] = function(v73, v74) --[[ Line: 203 ]]
        -- upvalues: v16 (copy), v3 (copy)
        local v75 = tostring(v74.outfitId);
        local v76 = v73[v16.PurchasedCharacterKey] or {};
        local v77 = {
            v75
        };
        for v78, v79 in v76 do
            if v79 == v75 then
                return v73;
            else
                v77[v78 + 1] = v79;
            end;
        end;
        return v3.Dictionary.join(v73, {
            [v16.PurchasedCharacterKey] = v77
        });
    end, 
    [v13.name] = function(v80, v81) --[[ Line: 225 ]]
        -- upvalues: l_FFlagAXFixMakeupLookGrantOutfitHoisting_0 (copy), v15 (copy), v16 (copy), v3 (copy)
        local v82 = tostring(v81.outfitId);
        if l_FFlagAXFixMakeupLookGrantOutfitHoisting_0 and v81.outfitType == v15.OutfitTypes.Makeup then
            local v83 = v80[v16.MakeupOutfitKey] or {};
            local v84 = v3.List.join({
                v82
            }, v3.List.removeValue(v83, v82));
            return v3.Dictionary.join(v80, {
                [v16.MakeupOutfitKey] = v84
            });
        else
            local v85 = v80[v16.CharacterKey] or {};
            local v86 = v80[v16.EditableCharacterKey] or {};
            local v87 = nil;
            local v88 = nil;
            if v81.isEditable then
                v87 = v85;
                v88 = v3.List.join({
                    v82
                }, v3.List.removeValue(v86, v82));
            else
                v87 = v3.List.join({
                    v82
                }, v3.List.removeValue(v85, v82));
                v88 = v86;
            end;
            return v3.Dictionary.join(v80, {
                [v16.CharacterKey] = v87, 
                [v16.EditableCharacterKey] = v88
            });
        end;
    end, 
    [v12.name] = function(v89, v90) --[[ Line: 267 ]]
        -- upvalues: v16 (copy), v3 (copy)
        local v91 = tostring(v90.outfitId);
        local v92 = v89[v16.CharacterKey] or {};
        local v93 = v3.List.removeValue(v92, v91);
        local v94 = v89[v16.EditableCharacterKey] or {};
        local v95 = v3.List.removeValue(v94, v91);
        return v3.Dictionary.join(v89, {
            [v16.CharacterKey] = v93, 
            [v16.EditableCharacterKey] = v95
        });
    end
});
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
local v15 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v16 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorStructure);
local function _() --[[ Line: 23 ]] --[[ Name: GetAssetTypeToSearchUuids ]]
    -- upvalues: v16 (copy)
    return v16().AssetTypeToSearchUuids;
end;
return v2.createReducer({}, {
    [v5.name] = function(v18, v19) --[[ Line: 35 ]]
        -- upvalues: v3 (copy)
        local v20 = {};
        local v21 = v18[v19.itemSubType] and v18[v19.itemSubType] or {};
        for _, v23 in v21 do
            v20[v23] = v23;
        end;
        for _, v25 in v19.itemIds do
            if not v20[v25] then
                v21[#v21 + 1] = v25;
                v20[v25] = v25;
            end;
        end;
        return v3.Dictionary.join(v18, {
            [v19.itemSubType] = v21
        });
    end, 
    [v6.name] = function(v26, v27) --[[ Line: 57 ]]
        -- upvalues: v16 (copy), v3 (copy)
        local v28 = {};
        local v29 = tostring(v27.assetTypeId);
        local v30 = tostring(v27.assetId);
        local v31 = v16().AssetTypeToSearchUuids[v29];
        if not v31 then
            return v26;
        else
            for _, v33 in v31 do
                local v34 = v26[v33] and v26[v33] or {};
                local v35 = {
                    v30
                };
                local v36 = false;
                for v37, v38 in v34 do
                    if v38 == v30 then
                        v36 = true;
                        break;
                    else
                        v35[v37 + 1] = v38;
                    end;
                end;
                if not v36 then
                    v28[v33] = v35;
                end;
            end;
            if next(v28) then
                return v3.Dictionary.join(v26, v28);
            else
                return v26;
            end;
        end;
    end, 
    [v7.name] = function(v39, v40) --[[ Line: 101 ]]
        -- upvalues: v16 (copy), v3 (copy)
        local v41 = {};
        local v42 = tostring(v40.assetTypeId);
        local v43 = tostring(v40.assetId);
        local v44 = v16().AssetTypeToSearchUuids[v42];
        if not v44 then
            return v39;
        else
            for _, v46 in v44 do
                local v47 = v39[v46] and v39[v46] or {};
                local v48 = v3.List.removeValue(v47, v43);
                if #v47 ~= #v48 then
                    v41[v46] = v48;
                end;
            end;
            if next(v41) then
                return v3.Dictionary.join(v39, v41);
            else
                return v39;
            end;
        end;
    end, 
    [v11.name] = function(v49, v50) --[[ Line: 134 ]]
        -- upvalues: v3 (copy)
        local v51 = tostring(v50.outfitId);
        local l_outfitTypeId_0 = v50.outfitTypeId;
        local v53 = v49[l_outfitTypeId_0] or {};
        local v54 = {
            v51
        };
        for _, v56 in v53 do
            if v56 == v51 then
                return v49;
            else
                table.insert(v54, v56);
            end;
        end;
        return v3.Dictionary.join(v49, {
            [l_outfitTypeId_0] = v54
        });
    end, 
    [v8.name] = function(v57, v58) --[[ Line: 157 ]]
        -- upvalues: v15 (copy), v3 (copy)
        local v59 = tostring(v58.outfitId);
        local v60 = v57[v15.CharacterKey] or {};
        local v61 = {
            v59
        };
        for v62, v63 in v60 do
            if v63 == v59 then
                return v57;
            else
                v61[v62 + 1] = v63;
            end;
        end;
        return v3.Dictionary.join(v57, {
            [v15.CharacterKey] = v61
        });
    end, 
    [v9.name] = function(v64, v65) --[[ Line: 178 ]]
        -- upvalues: v15 (copy), v3 (copy)
        local v66 = tostring(v65.outfitId);
        local v67 = v64[v15.EditableCharacterKey] or {};
        local v68 = {
            v66
        };
        for v69, v70 in v67 do
            if v70 == v66 then
                return v64;
            else
                v68[v69 + 1] = v70;
            end;
        end;
        return v3.Dictionary.join(v64, {
            [v15.EditableCharacterKey] = v68
        });
    end, 
    [v10.name] = function(v71, v72) --[[ Line: 199 ]]
        -- upvalues: v15 (copy), v3 (copy)
        local v73 = tostring(v72.outfitId);
        local v74 = v71[v15.PurchasedCharacterKey] or {};
        local v75 = {
            v73
        };
        for v76, v77 in v74 do
            if v77 == v73 then
                return v71;
            else
                v75[v76 + 1] = v77;
            end;
        end;
        return v3.Dictionary.join(v71, {
            [v15.PurchasedCharacterKey] = v75
        });
    end, 
    [v13.name] = function(v78, v79) --[[ Line: 221 ]]
        -- upvalues: v15 (copy), v3 (copy)
        local v80 = tostring(v79.outfitId);
        local v81 = v78[v15.CharacterKey] or {};
        local v82 = v78[v15.EditableCharacterKey] or {};
        local v83 = nil;
        local v84 = nil;
        if v79.isEditable then
            v83 = v81;
            v84 = v3.List.join({
                v80
            }, v3.List.removeValue(v82, v80));
        else
            v83 = v3.List.join({
                v80
            }, v3.List.removeValue(v81, v80));
            v84 = v82;
        end;
        return v3.Dictionary.join(v78, {
            [v15.CharacterKey] = v83, 
            [v15.EditableCharacterKey] = v84
        });
    end, 
    [v12.name] = function(v85, v86) --[[ Line: 252 ]]
        -- upvalues: v15 (copy), v3 (copy)
        local v87 = tostring(v86.outfitId);
        local v88 = v85[v15.CharacterKey] or {};
        local v89 = v3.List.removeValue(v88, v87);
        local v90 = v85[v15.EditableCharacterKey] or {};
        local v91 = v3.List.removeValue(v90, v87);
        return v3.Dictionary.join(v85, {
            [v15.CharacterKey] = v89, 
            [v15.EditableCharacterKey] = v91
        });
    end
});
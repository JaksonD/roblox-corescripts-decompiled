local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.Constants);
local v3 = require(l_Parent_0.util.createIndividualBodyPartSchema);
local v4 = require(l_Parent_0.util.createLayeredClothingSchema);
local v5 = require(l_Parent_0.util.createEyebrowEyelashSchema);
local v6 = require(l_Parent_0.util.createMeshPartAccessorySchema);
local v7 = require(l_Parent_0.util.createMakeupSchema);
local v8 = require(l_Parent_0.util.createDynamicHeadMeshPartSchema);
local v9 = require(l_Parent_0.util.createAccessorySchema);
local v10 = require(l_Parent_0.util.createEmoteSchema);
local v11 = require(l_Parent_0.util.getUploadCategory);
local v12 = require(l_Parent_0.flags.getFFlagUGCValidateMakeupAssetTypeNewPipeline);
local v13 = require(l_Parent_0.flags.getFFlagUGCValidateEyebrowEyelashThumbnailSchema);
local v14 = {};
local _ = function(v15) --[[ Line: 21 ]] --[[ Name: getRootInstance ]]
    -- upvalues: v2 (copy)
    for _, v17 in v15 do
        if v17.Name == v2.FOLDER_NAMES.R15ArtistIntent then
            return v17;
        end;
    end;
    return v15[1];
end;
v14.generateBundleSchema = function(v19) --[[ Line: 32 ]] --[[ Name: generateBundleSchema ]]
    -- upvalues: v2 (copy), v11 (copy), v14 (copy)
    local v20 = false;
    local v21 = {
        ClassName = "Folder", 
        _children = {}
    };
    for _, v23 in v19 do
        local l_allSelectedInstances_0 = v23.allSelectedInstances;
        local v25;
        for _, v27 in l_allSelectedInstances_0 do
            if v27.Name == v2.FOLDER_NAMES.R15ArtistIntent then
                v25 = v27;
                v20 = true;
            end;
            if v20 then
                break;
            end;
        end;
        if not v20 then
            v25 = l_allSelectedInstances_0[1];
        end;
        v20 = false;
        l_allSelectedInstances_0 = v11(v25, v23.assetTypeEnum, nil);
        local v28 = v14.generateAssetSchema(l_allSelectedInstances_0, v23.assetTypeEnum, v25);
        if v28.ClassName == "Folder" then
            for _, v30 in v28._children do
                table.insert(v21._children, v30);
            end;
        else
            table.insert(v21._children, v28);
        end;
    end;
    return v21;
end;
local function v36(v31) --[[ Line: 58 ]] --[[ Name: createBodyPartSchema ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v32 = v2.ASSET_TYPE_INFO[v31];
    local v33 = {
        ClassName = "Folder", 
        _children = {}
    };
    for v34 in pairs(v32.subParts) do
        local v35 = v3(v31, v34);
        table.insert(v33._children, v35);
    end;
    return v33;
end;
local v50 = {
    EMOTE_ANIMATION = function(_, _) --[[ Line: 74 ]] --[[ Name: EMOTE_ANIMATION ]]
        -- upvalues: v10 (copy)
        return v10();
    end, 
    DYNAMIC_HEAD = function(_, _) --[[ Line: 77 ]] --[[ Name: DYNAMIC_HEAD ]]
        -- upvalues: v8 (copy)
        return v8();
    end, 
    TORSO_AND_LIMBS = function(v41, _) --[[ Line: 80 ]] --[[ Name: TORSO_AND_LIMBS ]]
        -- upvalues: v36 (copy)
        return (v36(v41));
    end, 
    LAYERED_CLOTHING = function(v43, _) --[[ Line: 83 ]] --[[ Name: LAYERED_CLOTHING ]]
        -- upvalues: v13 (copy), v5 (copy), v2 (copy), v4 (copy)
        if v13() then
            if v43 == Enum.AssetType.EyebrowAccessory or v43 == Enum.AssetType.EyelashAccessory then
                return v5(v2.ASSET_TYPE_INFO[v43].attachmentNames);
            else
                return v4(v2.ASSET_TYPE_INFO[v43].attachmentNames);
            end;
        else
            return v4(v2.ASSET_TYPE_INFO[v43].attachmentNames);
        end;
    end, 
    RIGID_ACCESSORY = function(v45, v46) --[[ Line: 94 ]] --[[ Name: RIGID_ACCESSORY ]]
        -- upvalues: v2 (copy), v6 (copy), v9 (copy)
        local v47 = v2.ASSET_TYPE_INFO[v45];
        if v46:FindFirstChildOfClass("MeshPart") then
            return v6(v47.attachmentNames);
        else
            return v9(v47.attachmentNames);
        end;
    end, 
    MAKEUP = v12() and function(_, _) --[[ Line: 104 ]]
        -- upvalues: v7 (copy)
        return v7();
    end or nil
};
v14.generateAssetSchema = function(v51, v52, v53) --[[ Line: 109 ]] --[[ Name: generateAssetSchema ]]
    -- upvalues: v50 (copy)
    return v50[v51](v52, v53);
end;
return v14;
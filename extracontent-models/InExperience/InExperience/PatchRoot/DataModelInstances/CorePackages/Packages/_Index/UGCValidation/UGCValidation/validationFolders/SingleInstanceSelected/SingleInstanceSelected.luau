local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Constants);
local _ = require(l_Parent_0.util.Types);
local v3 = {};
local v4 = require(l_Parent_0.validationSystem.ValidationEnums);
local v5 = require(l_Parent_0.validationSystem.ErrorSourceStrings);
v3.categories = v1.AllAssetUploadCategories;
v3.requiredData = {
    v4.SharedDataMember.entrypointInput, 
    v4.SharedDataMember.consumerConfig, 
    v4.SharedDataMember.uploadEnum
};
local _ = function(_, _) --[[ Line: 16 ]] --[[ Name: deepEquals ]]
    return true;
end;
local function v14(v9) --[[ Line: 21 ]] --[[ Name: getFoldersMapping ]]
    local v10 = {
        R15ArtistIntent = true, 
        R15Fixed = true, 
        R6 = true
    };
    local v11 = {};
    for _, v13 in v9 do
        if v13:IsA("Folder") and v10[v13.Name] then
            v11[v13.Name] = v13;
        end;
    end;
    return v11;
end;
v3.run = function(v15, v16) --[[ Line: 38 ]]
    -- upvalues: v1 (copy), v5 (copy), v14 (copy)
    local v17 = false;
    local l_entrypointInput_0 = v16.entrypointInput;
    local l_consumerConfig_0 = v16.consumerConfig;
    local l_assetType_0 = v16.uploadEnum.assetType;
    if v1.AssetUploadsWithFolderStructure[l_assetType_0] and l_consumerConfig_0.enforceR15FolderStructure then
        if #l_entrypointInput_0 ~= 3 then
            v15:fail(v5.Keys.FolderStructureMismatch);
            return;
        else
            local v21 = v14(l_entrypointInput_0);
            if v21.R15ArtistIntent and v21.R15Fixed and v21.R6 and #v21.R6:GetChildren() == 0 then
                local _ = v21.R15ArtistIntent;
                local _ = v21.R15Fixed;
                v17 = true;
            end;
            if not v17 then
                v15:fail(v5.Keys.FolderStructureMismatch);
                return;
            end;
        end;
    elseif #l_entrypointInput_0 ~= 1 then
        v15:fail(v5.Keys.SelectionCountNotOne);
    end;
    v17 = false;
end;
return v3;
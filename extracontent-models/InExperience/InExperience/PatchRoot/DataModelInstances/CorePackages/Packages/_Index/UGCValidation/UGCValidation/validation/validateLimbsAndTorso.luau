local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Analytics);
local v2 = require(l_Parent_0.Constants);
local v3 = require(l_Parent_0.validation.validateMeshPartBodyPart);
local v4 = require(l_Parent_0.validation.validateTags);
local v5 = require(l_Parent_0.validation.validatePropertyRequirements);
local v6 = require(l_Parent_0.validation.validateAttributes);
local v7 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v8 = require(l_Parent_0.util.createLimbsAndTorsoSchema);
local _ = require(l_Parent_0.util.Types);
local _ = function(v10, v11) --[[ Line: 15 ]] --[[ Name: getInstance ]]
    for _, v13 in pairs(v10) do
        if v13.Name == v11 then
            return v13;
        end;
    end;
    return nil;
end;
local function v23(v15, v16) --[[ Line: 24 ]] --[[ Name: areTopLevelFoldersCorrect ]]
    local v17 = false;
    if not (#v15 == #v16) then
        return false;
    else
        for _, v19 in v16 do
            local v20;
            for _, v22 in pairs(v15) do
                if v22.Name == v19 then
                    v20 = v22;
                    v17 = true;
                end;
                if v17 then
                    break;
                end;
            end;
            if not v17 then
                v20 = nil;
            end;
            v17 = false;
            if not v20 or v20.ClassName ~= "Folder" then
                return false;
            end;
        end;
        return true;
    end;
end;
local function _(v24, v25) --[[ Line: 38 ]] --[[ Name: getFullNameWithoutRootFolder ]]
    local l_v24_FullName_0 = v24:GetFullName();
    local v27, v28 = string.find(l_v24_FullName_0, v25 .. "%.");
    assert(v27 and v28);
    return (string.sub(l_v24_FullName_0, v28 + 1, #l_v24_FullName_0));
end;
local function v36(v30, v31, v32) --[[ Line: 45 ]] --[[ Name: compareFolderInfo ]]
    -- upvalues: v7 (copy), v1 (copy)
    local v33 = v7.new();
    for v34, v35 in v30 do
        if v31[v34] == nil or v31[v34] ~= v35 then
            v1.reportFailure(v1.ErrorType.validateLimbsAndTorso_FolderInfoMismatch, nil, v32);
            v33:updateReasons(false, {
                (("Attribute %* has different values in different children folders. You need to use the same value in all folders."):format(v34))
            });
        end;
    end;
    return v33:getFinalResults();
end;
local function v57(v37, v38, v39) --[[ Line: 67 ]] --[[ Name: validateFolderAssetIdsMatch ]]
    -- upvalues: v7 (copy), v2 (copy), v36 (copy)
    local v40 = false;
    if #v38 == 1 then
        return true;
    else
        local v41 = nil;
        local v42 = v7.new();
        for _, v44 in v38 do
            if v44 ~= v2.FOLDER_NAMES.R6 then
                local v45;
                for _, v47 in pairs(v37) do
                    if v47.Name == v44 then
                        v45 = v47;
                        v40 = true;
                    end;
                    if v40 then
                        break;
                    end;
                end;
                if not v40 then
                    v45 = nil;
                end;
                v40 = false;
                assert(v45);
                local v48 = {};
                for _, v50 in v45:GetDescendants() do
                    local v51 = v2.CONTENT_ID_FIELDS[v50.ClassName];
                    if v51 then
                        for _, v53 in v51 do
                            local l_v50_FullName_0 = v50:GetFullName();
                            local v55, v56 = string.find(l_v50_FullName_0, v44 .. "%.");
                            assert(v55 and v56);
                            v48[string.sub(l_v50_FullName_0, v56 + 1, #l_v50_FullName_0) .. "." .. v53] = v50[v53];
                        end;
                    end;
                end;
                if not v41 then
                    v41 = v48;
                else
                    v42:updateReasons(v36(v41, v48, v39));
                    v42:updateReasons(v36(v48, v41, v39));
                end;
            end;
        end;
        return v42:getFinalResults();
    end;
end;
local function v62(v58, v59, v60) --[[ Line: 110 ]] --[[ Name: validateR6Folder ]]
    -- upvalues: v7 (copy), v1 (copy), v4 (copy), v5 (copy), v6 (copy)
    local v61 = v7.new();
    if #v58:GetChildren() > 0 then
        v1.reportFailure(v1.ErrorType.validateLimbsAndTorso_R6FolderHasChildren, nil, v60);
        v61:updateReasons(false, {
            string.format("Deprecated R6 folder for '%s' should be empty. You need to clear that folder and try again.", v59.Name)
        });
    end;
    v61:updateReasons(v4(v58, v60));
    v61:updateReasons(v5(v58, v59, v60));
    v61:updateReasons(v6(v58, v60));
    return v61:getFinalResults();
end;
return function(v63) --[[ Line: 136 ]] --[[ Name: validateLimbsAndTorso ]]
    -- upvalues: v2 (copy), v23 (copy), v1 (copy), v62 (copy), v3 (copy), v8 (copy), v57 (copy)
    local v64 = false;
    assert(v63.instances ~= nil, "instances required in validationContext for validateLimbsAndTorso");
    local l_instances_0 = v63.instances;
    assert(v63.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateLimbsAndTorso");
    local l_requireAllFolders_0 = v63.requireAllFolders;
    local l_assetTypeEnum_0 = v63.assetTypeEnum;
    local v68 = {
        v2.FOLDER_NAMES.R15ArtistIntent
    };
    if l_requireAllFolders_0 then
        table.insert(v68, v2.FOLDER_NAMES.R15Fixed);
        table.insert(v68, v2.FOLDER_NAMES.R6);
    end;
    if not v23(l_instances_0, v68) then
        v1.reportFailure(v1.ErrorType.validateLimbsAndTorso_TopLevelFolders, nil, v63);
        return false, {
            "Incorrect hierarchy for asset with the following missing folders: " .. table.concat(v68, ", ")
        };
    else
        for _, v70 in v68 do
            local v71;
            for _, v73 in pairs(l_instances_0) do
                if v73.Name == v70 then
                    v71 = v73;
                    v64 = true;
                end;
                if v64 then
                    break;
                end;
            end;
            if not v64 then
                v71 = nil;
            end;
            v64 = false;
            local v74 = nil;
            local v75 = nil;
            if v70 == v2.FOLDER_NAMES.R6 then
                local v76, v77 = v62(v71, l_assetTypeEnum_0, v63);
                v74 = v76;
                v75 = v77;
            else
                local v78, v79 = v3(v71, v8(l_assetTypeEnum_0, v70, v63), v63);
                v74 = v78;
                v75 = v79;
            end;
            if not v74 then
                return v74, v75;
            end;
        end;
        return v57(l_instances_0, v68, v63);
    end;
end;
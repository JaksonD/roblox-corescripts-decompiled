local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.validationSystem.ValidationManager);
local v3 = require(l_Parent_0.flags.getFFlagUGCValidationCombineEntrypointResults);
local v4 = require(l_Parent_0.validationSystem.ErrorSourceStrings);
local v5 = {};
local function v15(v6) --[[ Line: 9 ]] --[[ Name: fallbackLocalizationFunction ]]
    -- upvalues: v4 (copy)
    local v7 = v6.key:split(".");
    local v8 = v7[#v7];
    local v9 = v4.Values[v8];
    if not v9 then
        return v6.key;
    else
        local v10 = {};
        local v11 = nil;
        for v12 = 1, #v9 do
            local v13 = string.sub(v9, v12, v12);
            if v13 == "{" then
                v11 = {};
            elseif v13 == "}" then
                if v11 ~= nil then
                    local v14 = table.concat(v11);
                    if v6.params[v14] ~= nil then
                        table.insert(v10, (tostring(v6.params[v14])));
                    end;
                    v11 = nil;
                end;
            elseif v11 ~= nil then
                table.insert(v11, v13);
            else
                table.insert(v10, v13);
            end;
        end;
        return table.concat(v10);
    end;
end;
v5.getPrecomputedEditables = function(v16, v17) --[[ Line: 45 ]] --[[ Name: getPrecomputedEditables ]]
    local v18 = {
        {}, 
        {}
    };
    for v19, v20 in {
        v16, 
        v17
    } do
        for v21, v22 in v20 do
            for v23, v24 in v22 do
                pcall(function() --[[ Line: 54 ]]
                    -- upvalues: v21 (copy), v23 (copy), v18 (copy), v19 (copy), v24 (copy)
                    local v25 = v21[v23];
                    if v25 ~= nil and v25 ~= "" then
                        v18[v19][v25] = v24.instance;
                    end;
                end);
            end;
        end;
    end;
    return v18[1], v18[2];
end;
local function v32(v26, v27) --[[ Line: 67 ]] --[[ Name: fetchString ]]
    -- upvalues: v15 (copy)
    local v28 = nil;
    local v29 = nil;
    if v26 then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 73 ]]
            -- upvalues: v26 (copy), v27 (copy)
            return v26(v27);
        end);
        v28 = l_status_0;
        v29 = l_result_0;
    end;
    if v28 and v29 ~= v27.key then
        return v29;
    else
        return v15(v27);
    end;
end;
v5.combineResultsIntoLegacy = function(v33, v34, v35, v36) --[[ Line: 85 ]] --[[ Name: combineResultsIntoLegacy ]]
    -- upvalues: v32 (copy), v4 (copy)
    local l_v33_0 = v33;
    local l_v34_0 = v34;
    l_v33_0 = l_v33_0 and v35.pass;
    if #v35.errorTranslationContexts > 0 then
        if l_v34_0 == nil then
            l_v34_0 = {};
        end;
        for _, v40 in v35.errorTranslationContexts do
            table.insert(l_v34_0, v32(v36, v40));
        end;
    end;
    if not l_v33_0 and (l_v34_0 == nil or #l_v34_0 == 0) then
        if l_v34_0 == nil then
            l_v34_0 = {};
        end;
        table.insert(l_v34_0, v32(v36, {
            key = v4.Keys.FailureWithoutReason, 
            params = {}
        }));
    end;
    return l_v33_0, l_v34_0;
end;
v5.studioRFUAssetValidation = function(v41, v42, v43, v44) --[[ Line: 124 ]] --[[ Name: studioRFUAssetValidation ]]
    -- upvalues: v5 (copy), v2 (copy), v3 (copy)
    local v45 = "Toolbox";
    local v46 = v41.bypassFlags and v41.bypassFlags.enforceShadowValidations or false;
    if v41.bypassFlags and v41.bypassFlags.studioPluginName then
        v45 = v41.bypassFlags.studioPluginName;
    end;
    local v47, v48 = v5.getPrecomputedEditables(v41.editableMeshes or {}, v41.editableImages or {});
    local v49 = v2.ValidateAsset(v41.instances, v41.assetTypeEnum, {
        source = v45, 
        enforceR15FolderStructure = v41.requireAllFolders or false, 
        enforceShadowValidations = v46, 
        telemetryBundleId = v42, 
        preloadedEditableMeshes = v47, 
        preloadedEditableImages = v48
    });
    if v3() then
        return v5.combineResultsIntoLegacy(v43, v44, v49, if v41.bypassFlags ~= nil then v41.bypassFlags.localizationCallback else nil);
    else
        return v43, v44;
    end;
end;
v5.studioRFUBundleValidation = function(v50, v51, v52, v53, v54, v55) --[[ Line: 167 ]] --[[ Name: studioRFUBundleValidation ]]
    -- upvalues: v5 (copy), v2 (copy), v3 (copy)
    local v56 = "Toolbox";
    if v52.bypassFlags and v52.bypassFlags.studioPluginName then
        v56 = v52.bypassFlags.studioPluginName;
    end;
    local v57 = v52.bypassFlags and v52.bypassFlags.enforceShadowValidations or false;
    local v58, v59 = v5.getPrecomputedEditables(v52.editableMeshes or {}, v52.editableImages or {});
    local v60 = v2.ValidateFinalizedBundle(v50, v51, {
        source = v56, 
        enforceR15FolderStructure = v52.requireAllFolders or false, 
        enforceShadowValidations = v57, 
        telemetryBundleId = v53, 
        preloadedEditableMeshes = v58, 
        preloadedEditableImages = v59
    });
    if v3() then
        assert(v52.bypassFlags);
        assert(v52.bypassFlags.localizationCallback);
        return v5.combineResultsIntoLegacy(v54, v55, v60, if v52.bypassFlags ~= nil then v52.bypassFlags.localizationCallback else nil);
    else
        return v54, v55;
    end;
end;
return v5;
local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Constants);
local v2 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v3 = require(l_Parent_0.flags.getFFlagFixPackageIDFieldName);
local v4 = {};
local function _(v5) --[[ Line: 17 ]] --[[ Name: getRbxAssetId ]]
    return (string.match(v5, "^rbxassetid://(%d+)$"));
end;
local function v8(v7) --[[ Line: 23 ]] --[[ Name: getAssetUrlId ]]
    v7 = string.match(v7, "^https?://www%.(.+)") or string.match(v7, "^https?://(.+)");
    if not v7 then
        return nil;
    else
        v7 = string.match(v7, "^sitetest%d%.robloxlabs(.+)") or string.match(v7, "^roblox(.+)");
        if not v7 then
            return nil;
        else
            return (string.match(v7, "^%.com//?asset/%?id=(%d+)$"));
        end;
    end;
end;
local function v10(v9) --[[ Line: 38 ]] --[[ Name: getAssetDeliveryAssetUrlId ]]
    v9 = string.match(v9, "^https?://assetdelivery%.(.+)");
    if not v9 then
        return nil;
    else
        v9 = string.match(v9, "^sitetest%d%.robloxlabs(.+)") or string.match(v9, "^roblox(.+)");
        if not v9 then
            return nil;
        else
            return (string.match(v9, "^%.com/v1/asset/%?id=(%d+)$"));
        end;
    end;
end;
local function v13(v11) --[[ Line: 52 ]] --[[ Name: tryGetAssetIdFromContentIdInternal ]]
    -- upvalues: v3 (copy), v8 (copy), v10 (copy)
    local v12 = tonumber(v11);
    if v12 ~= nil then
        if v3() then
            return (tostring(v12));
        else
            return v12;
        end;
    else
        v12 = string.match(v11, "^rbxassetid://(%d+)$");
        if v12 ~= nil then
            return v12;
        else
            v12 = v8(v11);
            if v12 ~= nil then
                return v12;
            else
                v12 = v10(v11);
                if v12 ~= nil then
                    return v12;
                else
                    return nil;
                end;
            end;
        end;
    end;
end;
local function _(v14, v15, v16) --[[ Line: 80 ]] --[[ Name: hasInExpCreatedEditableInstance ]]
    if not v16 then
        return false;
    elseif not v16.allowEditableInstances then
        return false;
    else
        local v17 = v16.editableImages[v14];
        if v17 and v17[v15] and v17[v15].instance then
            return true;
        else
            local v18 = v16.editableMeshes[v14];
            if v18 and v18[v15] and v18[v15].instance then
                return true;
            else
                return false;
            end;
        end;
    end;
end;
local function v32(v20, v21, v22, v23, v24, v25, v26) --[[ Line: 110 ]] --[[ Name: parseContentId ]]
    -- upvalues: v13 (copy)
    local v27 = v23[v24];
    if v27 == "" then
        local v28;
        if not v26 then
            v28 = false;
        elseif not v26.allowEditableInstances then
            v28 = false;
        else
            local v29 = v26.editableImages[v23];
            if v29 and v29[v24] and v29[v24].instance then
                v28 = true;
            else
                local v30 = v26.editableMeshes[v23];
                v28 = v30 and v30[v24] and v30[v24].instance and true or false;
            end;
        end;
        if v28 then
            if v22 then
                table.insert(v22, {
                    fieldName = v24, 
                    instance = v23
                });
            end;
        elseif v25 then
            return false, {
                string.format("%s.%s cannot be empty", v23:GetFullName(), v24)
            };
        end;
        return true;
    else
        local v31 = v13(v27);
        if v31 == nil then
            return false, {
                string.format("Could not parse ContentId %s in %s.%s. Please make sure you are using a valid URL with a valid ID.", v27, v23:GetFullName(), v24)
            };
        else
            if v21[v31] == nil then
                v21[v31] = {
                    fieldName = v24, 
                    instance = v23
                };
                table.insert(v20, v31);
            end;
            if v22 then
                table.insert(v22, {
                    fieldName = v24, 
                    instance = v23, 
                    id = v31
                });
            end;
            return true;
        end;
    end;
end;
local function v49(v33, v34, v35, v36, v37, v38, v39) --[[ Line: 155 ]] --[[ Name: parseWithErrorCheckInternal ]]
    -- upvalues: v1 (copy), v2 (copy), v32 (copy)
    v37 = v37 or v1.CONTENT_ID_FIELDS;
    local v40 = v2.new();
    local l_v36_Descendants_0 = v36:GetDescendants();
    table.insert(l_v36_Descendants_0, v36);
    for _, v43 in pairs(l_v36_Descendants_0) do
        local v44 = v37[v43.ClassName];
        if v44 then
            local v45 = v38 and v38[v43.ClassName];
            for _, v47 in ipairs(v44) do
                local v48 = v45 and v45[v47];
                v40:updateReasons(v32(v33, v34, v35, v43, v47, v48, v39));
            end;
        end;
    end;
    return v40:getFinalResults();
end;
v4.tryGetAssetIdFromContentId = function(v50) --[[ Line: 194 ]] --[[ Name: tryGetAssetIdFromContentId ]]
    -- upvalues: v13 (copy)
    return (v13(v50));
end;
v4.parseWithErrorCheck = function(v51, v52, v53, v54, v55, v56) --[[ Line: 198 ]] --[[ Name: parseWithErrorCheck ]]
    -- upvalues: v49 (copy)
    return v49(v51, v52, nil, v53, v54, v55, v56);
end;
v4.parse = function(v57, v58, v59) --[[ Line: 217 ]] --[[ Name: parse ]]
    -- upvalues: v49 (copy)
    local v60 = {};
    local v61 = {};
    local v62 = {};
    assert((v49(v61, v60, v62, v57, v58, nil, v59)));
    return v62;
end;
return v4;
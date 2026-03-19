local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Constants);
local v2 = require(l_Parent_0.util.FailureReasonsAccumulator);
local v3 = {};
local function _(v4) --[[ Line: 16 ]] --[[ Name: getRbxAssetId ]]
    return (string.match(v4, "^rbxassetid://(%d+)$"));
end;
local function v7(v6) --[[ Line: 22 ]] --[[ Name: getAssetUrlId ]]
    v6 = string.match(v6, "^https?://www%.(.+)") or string.match(v6, "^https?://(.+)");
    if not v6 then
        return nil;
    else
        v6 = string.match(v6, "^sitetest%d%.robloxlabs(.+)") or string.match(v6, "^roblox(.+)");
        if not v6 then
            return nil;
        else
            return (string.match(v6, "^%.com//?asset/%?id=(%d+)$"));
        end;
    end;
end;
local function v9(v8) --[[ Line: 37 ]] --[[ Name: getAssetDeliveryAssetUrlId ]]
    v8 = string.match(v8, "^https?://assetdelivery%.(.+)");
    if not v8 then
        return nil;
    else
        v8 = string.match(v8, "^sitetest%d%.robloxlabs(.+)") or string.match(v8, "^roblox(.+)");
        if not v8 then
            return nil;
        else
            return (string.match(v8, "^%.com/v1/asset/%?id=(%d+)$"));
        end;
    end;
end;
local function _(v10) --[[ Line: 51 ]] --[[ Name: tryGetAssetIdFromContentIdInternal ]]
    -- upvalues: v7 (copy), v9 (copy)
    local v11 = tonumber(v10);
    if v11 ~= nil then
        return v11;
    else
        v11 = string.match(v10, "^rbxassetid://(%d+)$");
        if v11 ~= nil then
            return v11;
        else
            v11 = v7(v10);
            if v11 ~= nil then
                return v11;
            else
                v11 = v9(v10);
                if v11 ~= nil then
                    return v11;
                else
                    return nil;
                end;
            end;
        end;
    end;
end;
local function _(v13, v14, v15) --[[ Line: 75 ]] --[[ Name: hasInExpCreatedEditableInstance ]]
    if not v15 then
        return false;
    elseif not v15.allowEditableInstances then
        return false;
    else
        local v16 = v15.editableImages[v13];
        if v16 and v16[v14] and v16[v14].instance then
            return true;
        else
            local v17 = v15.editableMeshes[v13];
            if v17 and v17[v14] and v17[v14].instance then
                return true;
            else
                return false;
            end;
        end;
    end;
end;
local function v32(v19, v20, v21, v22, v23, v24, v25) --[[ Line: 105 ]] --[[ Name: parseContentId ]]
    -- upvalues: v7 (copy), v9 (copy)
    local v26 = v22[v23];
    if v26 == "" then
        local v27;
        if not v25 then
            v27 = false;
        elseif not v25.allowEditableInstances then
            v27 = false;
        else
            local v28 = v25.editableImages[v22];
            if v28 and v28[v23] and v28[v23].instance then
                v27 = true;
            else
                local v29 = v25.editableMeshes[v22];
                v27 = v29 and v29[v23] and v29[v23].instance and true or false;
            end;
        end;
        if v27 then
            if v21 then
                table.insert(v21, {
                    fieldName = v23, 
                    instance = v22
                });
            end;
        elseif v24 then
            return false, {
                string.format("%s.%s cannot be empty", v22:GetFullName(), v23)
            };
        end;
        return true;
    else
        local v30 = tonumber(v26);
        local v31;
        if v30 ~= nil then
            v31 = v30;
        else
            v30 = string.match(v26, "^rbxassetid://(%d+)$");
            if v30 ~= nil then
                v31 = v30;
            else
                v30 = v7(v26);
                if v30 ~= nil then
                    v31 = v30;
                else
                    v30 = v9(v26);
                    v31 = if v30 ~= nil then v30 else nil;
                end;
            end;
        end;
        if v31 == nil then
            return false, {
                string.format("Could not parse ContentId %s in %s.%s. Please make sure you are using a valid URL with a valid ID.", v26, v22:GetFullName(), v23)
            };
        else
            if v20[v31] == nil then
                v20[v31] = {
                    fieldName = v23, 
                    instance = v22
                };
                table.insert(v19, v31);
            end;
            if v21 then
                table.insert(v21, {
                    fieldName = v23, 
                    instance = v22, 
                    id = v31
                });
            end;
            return true;
        end;
    end;
end;
local function v49(v33, v34, v35, v36, v37, v38, v39) --[[ Line: 150 ]] --[[ Name: parseWithErrorCheckInternal ]]
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
v3.tryGetAssetIdFromContentId = function(v50) --[[ Line: 189 ]] --[[ Name: tryGetAssetIdFromContentId ]]
    -- upvalues: v7 (copy), v9 (copy)
    local v51 = tonumber(v50);
    if v51 ~= nil then
        return v51;
    else
        v51 = string.match(v50, "^rbxassetid://(%d+)$");
        if v51 ~= nil then
            return v51;
        else
            v51 = v7(v50);
            if v51 ~= nil then
                return v51;
            else
                v51 = v9(v50);
                if v51 ~= nil then
                    return v51;
                else
                    return nil;
                end;
            end;
        end;
    end;
end;
v3.parseWithErrorCheck = function(v52, v53, v54, v55, v56, v57) --[[ Line: 193 ]] --[[ Name: parseWithErrorCheck ]]
    -- upvalues: v49 (copy)
    return v49(v52, v53, nil, v54, v55, v56, v57);
end;
v3.parse = function(v58, v59, v60) --[[ Line: 212 ]] --[[ Name: parse ]]
    -- upvalues: v49 (copy)
    local v61 = {};
    local v62 = {};
    local v63 = {};
    assert((v49(v62, v61, v63, v58, v59, nil, v60)));
    return v63;
end;
return v3;
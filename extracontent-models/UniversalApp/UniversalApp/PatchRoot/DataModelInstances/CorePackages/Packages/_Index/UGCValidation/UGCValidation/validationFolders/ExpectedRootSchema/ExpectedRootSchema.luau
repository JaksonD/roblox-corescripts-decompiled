local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.Constants);
local v3 = require(l_Parent_0.validationSystem.ValidationEnums);
local v4 = require(l_Parent_0.util.CreateExpectedSchema);
local v5 = require(l_Parent_0.validationSystem.ErrorSourceStrings);
local v6 = require(l_Parent_0.flags.getFFlagUGCValidationExtendSchemaToIgnoreDescendants);
local v7 = {
    categories = v2.AllUploadCategories, 
    requiredData = {
        v3.SharedDataMember.entrypointInput, 
        v3.SharedDataMember.rootInstance, 
        v3.SharedDataMember.uploadCategory, 
        v3.SharedDataMember.uploadEnum
    }
};
local function _(v8, v9) --[[ Line: 20 ]] --[[ Name: checkName ]]
    if type(v8) == "table" then
        return table.find(v8, v9) ~= nil;
    else
        return v8 == v9;
    end;
end;
local function _(v11) --[[ Line: 27 ]] --[[ Name: getReadableName ]]
    if type(v11) == "table" then
        return table.concat(v11, " or ");
    elseif type(v11) == "string" then
        return v11;
    else
        return "*";
    end;
end;
local function v13(v14, v15, v16, v17) --[[ Line: 36 ]] --[[ Name: validateInstancesFromSchema ]]
    -- upvalues: v6 (copy), v13 (copy), v5 (copy)
    v16[v14] = true;
    if v6() and v15._ignoreDescendants then
        assert(not v15._children, "if _ignoreDescendants is true, there should be no descendants in the schema as they would be ignored anyway");
        for _, v19 in v14:GetDescendants() do
            v16[v19] = true;
        end;
        return;
    else
        local v20 = v15._children or {};
        for _, v22 in v20 do
            local v23 = false;
            for _, v25 in v14:GetChildren() do
                if v16[v25] == nil and v25.ClassName == v22.ClassName then
                    if v22.Name ~= nil then
                        local l_Name_0 = v22.Name;
                        local l_Name_1 = v25.Name;
                        if not if type(l_Name_0) == "table" then table.find(l_Name_0, l_Name_1) ~= nil else l_Name_0 == l_Name_1 then
                            continue;
                        end;
                    end;
                    v13(v25, v22, v16, v17);
                    v23 = true;
                    break;
                end;
            end;
            if not v23 and not v22._optional then
                local l_AssetSchemaMissingItem_0 = v5.Keys.AssetSchemaMissingItem;
                local v29 = {
                    ParentPath = v14:GetFullName(), 
                    ExpectedClass = v22.ClassName
                };
                local l_Name_2 = v22.Name;
                v29.ExpectedName = if type(l_Name_2) == "table" then table.concat(l_Name_2, " or ") else if type(l_Name_2) == "string" then l_Name_2 else "*";
                v17:fail(l_AssetSchemaMissingItem_0, v29);
            end;
        end;
        return;
    end;
end;
local function v37(v31, v32, v33) --[[ Line: 81 ]] --[[ Name: validateNoInstancesOutsideSchema ]]
    -- upvalues: v5 (copy)
    local v34 = {};
    for _, v36 in pairs(v31:GetDescendants()) do
        if v32[v36] == nil then
            table.insert(v34, v36:GetFullName());
        end;
    end;
    if #v34 > 0 then
        v33:fail(v5.Keys.AssetSchemaUnexpectedItems, {
            UnexpectedDescendantPaths = table.concat(v34, ", ")
        });
    end;
end;
v7.run = function(v38, v39) --[[ Line: 100 ]]
    -- upvalues: v5 (copy), v4 (copy), v13 (copy), v37 (copy)
    local l_rootInstance_0 = v39.rootInstance;
    local l_uploadCategory_0 = v39.uploadCategory;
    local l_uploadEnum_0 = v39.uploadEnum;
    if l_rootInstance_0 == nil then
        v38:fail(v5.Keys.SelectionCountNotOne);
        return;
    else
        local v43 = nil;
        if l_uploadEnum_0.bundleType then
            local l_entrypointInput_0 = v39.entrypointInput;
            v43 = v4.generateBundleSchema(l_entrypointInput_0);
        else
            v43 = v4.generateAssetSchema(l_uploadCategory_0, l_uploadEnum_0.assetType, l_rootInstance_0);
        end;
        local v45 = {};
        if v43.ClassName ~= l_rootInstance_0.ClassName then
            v38:fail(v5.Keys.AssetSchemaWrongRootClass, {
                RootClass = l_rootInstance_0.ClassName, 
                ExpectedClass = v43.ClassName
            });
            return;
        else
            if v43.Name ~= nil then
                local l_Name_3 = v43.Name;
                local l_Name_4 = l_rootInstance_0.Name;
                if not if type(l_Name_3) == "table" then table.find(l_Name_3, l_Name_4) ~= nil else l_Name_3 == l_Name_4 then
                    v38:fail(v5.Keys.AssetSchemaWrongRootName, {
                        RootName = l_rootInstance_0.Name, 
                        ExpectedName = v43.Name
                    });
                    return;
                end;
            end;
            v13(l_rootInstance_0, v43, v45, v38);
            v37(l_rootInstance_0, v45, v38);
            return;
        end;
    end;
end;
return v7;
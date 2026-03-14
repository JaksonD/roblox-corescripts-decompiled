local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.util.Types);
local v2 = require(l_Parent_0.Constants);
local v3 = require(l_Parent_0.validationSystem.ValidationEnums);
local v4 = require(l_Parent_0.util.CreateExpectedSchema);
local v5 = require(l_Parent_0.validationSystem.ErrorSourceStrings);
local v6 = {
    categories = v2.AllUploadCategories, 
    requiredData = {
        v3.SharedDataMember.entrypointInput, 
        v3.SharedDataMember.rootInstance, 
        v3.SharedDataMember.uploadCategory, 
        v3.SharedDataMember.uploadEnum
    }
};
local function _(v7, v8) --[[ Line: 18 ]] --[[ Name: checkName ]]
    if type(v7) == "table" then
        return table.find(v7, v8) ~= nil;
    else
        return v7 == v8;
    end;
end;
local function _(v10) --[[ Line: 25 ]] --[[ Name: getReadableName ]]
    if type(v10) == "table" then
        return table.concat(v10, " or ");
    elseif type(v10) == "string" then
        return v10;
    else
        return "*";
    end;
end;
local function v12(v13, v14, v15, v16) --[[ Line: 34 ]] --[[ Name: validateInstancesFromSchema ]]
    -- upvalues: v12 (copy), v5 (copy)
    v15[v13] = true;
    local v17 = v14._children or {};
    for _, v19 in v17 do
        local v20 = false;
        for _, v22 in v13:GetChildren() do
            if v15[v22] == nil and v22.ClassName == v19.ClassName then
                if v19.Name ~= nil then
                    local l_Name_0 = v19.Name;
                    local l_Name_1 = v22.Name;
                    if not if type(l_Name_0) == "table" then table.find(l_Name_0, l_Name_1) ~= nil else l_Name_0 == l_Name_1 then
                        continue;
                    end;
                end;
                v12(v22, v19, v15, v16);
                v20 = true;
                break;
            end;
        end;
        if not v20 and not v19._optional then
            local l_AssetSchemaMissingItem_0 = v5.Keys.AssetSchemaMissingItem;
            local v26 = {
                ParentPath = v13:GetFullName(), 
                ExpectedClass = v19.ClassName
            };
            local l_Name_2 = v19.Name;
            v26.ExpectedName = if type(l_Name_2) == "table" then table.concat(l_Name_2, " or ") else if type(l_Name_2) == "string" then l_Name_2 else "*";
            v16:fail(l_AssetSchemaMissingItem_0, v26);
        end;
    end;
end;
local function v34(v28, v29, v30) --[[ Line: 65 ]] --[[ Name: validateNoInstancesOutsideSchema ]]
    -- upvalues: v5 (copy)
    local v31 = {};
    for _, v33 in pairs(v28:GetDescendants()) do
        if v29[v33] == nil then
            table.insert(v31, v33:GetFullName());
        end;
    end;
    if #v31 > 0 then
        v30:fail(v5.Keys.AssetSchemaUnexpectedItems, {
            UnexpectedDescendantPaths = table.concat(v31, ", ")
        });
    end;
end;
v6.run = function(v35, v36) --[[ Line: 84 ]]
    -- upvalues: v5 (copy), v4 (copy), v12 (copy), v34 (copy)
    local l_rootInstance_0 = v36.rootInstance;
    local l_uploadCategory_0 = v36.uploadCategory;
    local l_uploadEnum_0 = v36.uploadEnum;
    if l_rootInstance_0 == nil then
        v35:fail(v5.Keys.SelectionCountNotOne);
        return;
    else
        local v40 = nil;
        if l_uploadEnum_0.bundleType then
            local l_entrypointInput_0 = v36.entrypointInput;
            v40 = v4.generateBundleSchema(l_entrypointInput_0);
        else
            v40 = v4.generateAssetSchema(l_uploadCategory_0, l_uploadEnum_0.assetType, l_rootInstance_0);
        end;
        local v42 = {};
        if v40.ClassName ~= l_rootInstance_0.ClassName then
            v35:fail(v5.Keys.AssetSchemaWrongRootClass, {
                RootClass = l_rootInstance_0.ClassName, 
                ExpectedClass = v40.ClassName
            });
            return;
        else
            if v40.Name ~= nil then
                local l_Name_3 = v40.Name;
                local l_Name_4 = l_rootInstance_0.Name;
                if not if type(l_Name_3) == "table" then table.find(l_Name_3, l_Name_4) ~= nil else l_Name_3 == l_Name_4 then
                    v35:fail(v5.Keys.AssetSchemaWrongRootName, {
                        RootName = l_rootInstance_0.Name, 
                        ExpectedName = v40.Name
                    });
                    return;
                end;
            end;
            v12(l_rootInstance_0, v40, v42, v35);
            v34(l_rootInstance_0, v42, v35);
            return;
        end;
    end;
end;
return v6;
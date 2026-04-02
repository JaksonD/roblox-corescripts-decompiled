local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.flags.getFFlagUGCValidationEnableFolderStructure);
local v2 = require(l_Parent_0.flags.getFFlagUGCValidationCombineEntrypointResults);
local v3 = require(l_Parent_0.flags.getFFlagUGCValidationExtendSchemaToIgnoreDescendants);
local _ = function(v4, v5) --[[ Line: 9 ]] --[[ Name: checkName ]]
    if type(v4) == "table" then
        for _, v7 in pairs(v4) do
            if v7 == v5 then
                return true;
            end;
        end;
    elseif type(v4) == "string" then
        return v4 == v5;
    end;
    return false;
end;
local function _(v9) --[[ Line: 22 ]] --[[ Name: getReadableName ]]
    if type(v9) == "table" then
        return table.concat(v9, " or ");
    elseif type(v9) == "string" then
        return v9;
    else
        return "*";
    end;
end;
local function v11(v12, v13, v14) --[[ Line: 31 ]] --[[ Name: validateWithSchemaHelper ]]
    -- upvalues: v3 (copy), v11 (copy)
    local v15 = false;
    local v16 = false;
    if v13.ClassName == v12.ClassName then
        if v12.Name ~= nil then
            local l_Name_0 = v12.Name;
            local l_Name_1 = v13.Name;
            local v19;
            if type(l_Name_0) == "table" then
                for _, v21 in pairs(l_Name_0) do
                    if v21 == l_Name_1 then
                        v19 = true;
                        v16 = true;
                    end;
                    if v16 then
                        break;
                    end;
                end;
            elseif type(l_Name_0) == "string" then
                v19 = l_Name_0 == l_Name_1;
                v16 = true;
            end;
            if not v16 then
                if not v16 then
                    v19 = false;
                end;
            end;
            v16 = false;
            v15 = not v19;
        end;
        if not v15 then
            if v3() and v12._ignoreDescendants then
                assert(not v12._children, "if _ignoreDescendants is true, there should be no descendants in the schema as they would be ignored anyway");
                for _, v23 in v13:GetDescendants() do
                    v14[v23] = true;
                end;
                v14[v13] = true;
                return {
                    success = true
                };
            else
                if v12._children then
                    for _, v25 in pairs(v12._children) do
                        local v26 = false;
                        local v27 = nil;
                        for _, v29 in pairs(v13:GetChildren()) do
                            if not v3() or not v14[v29] then
                                local v30 = v11(v25, v29, v14);
                                if v30.success then
                                    v26 = true;
                                    break;
                                elseif v30.message then
                                    v27 = v30;
                                end;
                            end;
                        end;
                        if not v26 and not v25._optional then
                            if v27 then
                                return v27;
                            else
                                local v31 = {
                                    success = false
                                };
                                local v32 = "Could not find a ";
                                local l_ClassName_0 = v25.ClassName;
                                local v34 = " called ";
                                local l_Name_2 = v25.Name;
                                v31.message = v32 .. l_ClassName_0 .. v34 .. (if type(l_Name_2) == "table" then table.concat(l_Name_2, " or ") else if type(l_Name_2) == "string" then l_Name_2 else "*") .. " inside " .. v13.Name;
                                return v31;
                            end;
                        end;
                    end;
                end;
                v14[v13] = true;
                return {
                    success = true
                };
            end;
        end;
    end;
    v15 = false;
    return {
        success = false
    };
end;
return function(v36, v37, _) --[[ Line: 92 ]] --[[ Name: validateWithSchema ]]
    -- upvalues: v11 (copy), v1 (copy), v2 (copy)
    local v39 = false;
    local v40 = false;
    if v37.ClassName == v36.ClassName then
        if v36.Name ~= nil then
            local l_Name_3 = v36.Name;
            local l_Name_4 = v37.Name;
            local v43;
            if type(l_Name_3) == "table" then
                for _, v45 in pairs(l_Name_3) do
                    if v45 == l_Name_4 then
                        v43 = true;
                        v40 = true;
                    end;
                    if v40 then
                        break;
                    end;
                end;
            elseif type(l_Name_3) == "string" then
                v43 = l_Name_3 == l_Name_4;
                v40 = true;
            end;
            if not v40 then
                if not v40 then
                    v43 = false;
                end;
            end;
            v40 = false;
            v39 = not v43;
        end;
        if not v39 then
            local v46 = {};
            local v47 = v11(v36, v37, v46);
            if not v47.success then
                if v1() and v2() then
                    return {
                        success = false, 
                        message = ""
                    };
                else
                    return v47;
                end;
            else
                local v48 = {};
                for _, v50 in pairs(v37:GetDescendants()) do
                    if v46[v50] == nil then
                        v48[#v48 + 1] = v50:GetFullName();
                    end;
                end;
                if #v48 > 0 then
                    if v1() and v2() then
                        return {
                            success = false, 
                            message = ""
                        };
                    else
                        return {
                            success = false, 
                            message = "Unexpected Descendants:\n" .. table.concat(v48, "\n")
                        };
                    end;
                else
                    return {
                        success = true
                    };
                end;
            end;
        end;
    end;
    v39 = false;
    local v51 = {
        success = false
    };
    local v52 = "Expected top-level instance to be a ";
    local l_ClassName_1 = v36.ClassName;
    local v54 = " named ";
    local l_Name_5 = v36.Name;
    v51.message = v52 .. l_ClassName_1 .. v54 .. if type(l_Name_5) == "table" then table.concat(l_Name_5, " or ") else if type(l_Name_5) == "string" then l_Name_5 else "*";
    return v51;
end;
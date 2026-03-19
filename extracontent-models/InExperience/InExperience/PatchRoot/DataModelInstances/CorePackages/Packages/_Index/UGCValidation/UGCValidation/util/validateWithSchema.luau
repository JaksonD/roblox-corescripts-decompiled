local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.flags.getFFlagUGCValidationEnableFolderStructure);
local v2 = require(l_Parent_0.flags.getFFlagUGCValidationCombineEntrypointResults);
local _ = function(v3, v4) --[[ Line: 7 ]] --[[ Name: checkName ]]
    if type(v3) == "table" then
        for _, v6 in pairs(v3) do
            if v6 == v4 then
                return true;
            end;
        end;
    elseif type(v3) == "string" then
        return v3 == v4;
    end;
    return false;
end;
local function _(v8) --[[ Line: 20 ]] --[[ Name: getReadableName ]]
    if type(v8) == "table" then
        return table.concat(v8, " or ");
    elseif type(v8) == "string" then
        return v8;
    else
        return "*";
    end;
end;
local function v10(v11, v12, v13) --[[ Line: 29 ]] --[[ Name: validateWithSchemaHelper ]]
    -- upvalues: v10 (copy)
    local v14 = false;
    local v15 = false;
    if v12.ClassName == v11.ClassName then
        if v11.Name ~= nil then
            local l_Name_0 = v11.Name;
            local l_Name_1 = v12.Name;
            local v18;
            if type(l_Name_0) == "table" then
                for _, v20 in pairs(l_Name_0) do
                    if v20 == l_Name_1 then
                        v18 = true;
                        v15 = true;
                    end;
                    if v15 then
                        break;
                    end;
                end;
            elseif type(l_Name_0) == "string" then
                v18 = l_Name_0 == l_Name_1;
                v15 = true;
            end;
            if not v15 then
                if not v15 then
                    v18 = false;
                end;
            end;
            v15 = false;
            v14 = not v18;
        end;
        if not v14 then
            if v11._children then
                for _, v22 in pairs(v11._children) do
                    local v23 = false;
                    local v24 = nil;
                    for _, v26 in pairs(v12:GetChildren()) do
                        local v27 = v10(v22, v26, v13);
                        if v27.success then
                            v23 = true;
                            break;
                        elseif v27.message then
                            v24 = v27;
                        end;
                    end;
                    if not v23 and not v22._optional then
                        if v24 then
                            return v24;
                        else
                            local v28 = {
                                success = false
                            };
                            local v29 = "Could not find a ";
                            local l_ClassName_0 = v22.ClassName;
                            local v31 = " called ";
                            local l_Name_2 = v22.Name;
                            v28.message = v29 .. l_ClassName_0 .. v31 .. (if type(l_Name_2) == "table" then table.concat(l_Name_2, " or ") else if type(l_Name_2) == "string" then l_Name_2 else "*") .. " inside " .. v12.Name;
                            return v28;
                        end;
                    end;
                end;
            end;
            v13[v12] = true;
            return {
                success = true
            };
        end;
    end;
    v14 = false;
    return {
        success = false
    };
end;
return function(v33, v34, _) --[[ Line: 69 ]] --[[ Name: validateWithSchema ]]
    -- upvalues: v10 (copy), v1 (copy), v2 (copy)
    local v36 = false;
    local v37 = false;
    if v34.ClassName == v33.ClassName then
        if v33.Name ~= nil then
            local l_Name_3 = v33.Name;
            local l_Name_4 = v34.Name;
            local v40;
            if type(l_Name_3) == "table" then
                for _, v42 in pairs(l_Name_3) do
                    if v42 == l_Name_4 then
                        v40 = true;
                        v37 = true;
                    end;
                    if v37 then
                        break;
                    end;
                end;
            elseif type(l_Name_3) == "string" then
                v40 = l_Name_3 == l_Name_4;
                v37 = true;
            end;
            if not v37 then
                if not v37 then
                    v40 = false;
                end;
            end;
            v37 = false;
            v36 = not v40;
        end;
        if not v36 then
            local v43 = {};
            local v44 = v10(v33, v34, v43);
            if not v44.success then
                if v1() and v2() then
                    return {
                        success = false, 
                        message = ""
                    };
                else
                    return v44;
                end;
            else
                local v45 = {};
                for _, v47 in pairs(v34:GetDescendants()) do
                    if v43[v47] == nil then
                        v45[#v45 + 1] = v47:GetFullName();
                    end;
                end;
                if #v45 > 0 then
                    if v1() and v2() then
                        return {
                            success = false, 
                            message = ""
                        };
                    else
                        return {
                            success = false, 
                            message = "Unexpected Descendants:\n" .. table.concat(v45, "\n")
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
    v36 = false;
    local v48 = {
        success = false
    };
    local v49 = "Expected top-level instance to be a ";
    local l_ClassName_1 = v33.ClassName;
    local v51 = " named ";
    local l_Name_5 = v33.Name;
    v48.message = v49 .. l_ClassName_1 .. v51 .. if type(l_Name_5) == "table" then table.concat(l_Name_5, " or ") else if type(l_Name_5) == "string" then l_Name_5 else "*";
    return v48;
end;
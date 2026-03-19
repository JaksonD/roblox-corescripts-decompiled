local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_1 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_0.StyleRule);
local _ = require(l_Parent_0.Rules.Types);
local _ = require(l_script_FirstAncestor_0.Enums.Device);
local _ = require(l_script_FirstAncestor_0.Enums.Theme);
local v8 = require(l_script_FirstAncestor_0.Utility.scaleValue);
local function v16(v9, v10, v11) --[[ Line: 20 ]] --[[ Name: insertRule ]]
    -- upvalues: v3 (copy), v4 (copy)
    local l_properties_0 = v10.properties;
    local v13 = "." .. v11;
    local v14 = if v10.modifier ~= nil then ":" .. v10.modifier else "";
    local v15 = v13 .. v14 .. if v10.pseudo ~= nil then " ::" .. v10.pseudo else "";
    if v10.pseudo ~= nil then
        v15 = v15 .. ", " .. v13 .. v14 .. " > " .. v10.pseudo;
    end;
    table.insert(v9, v3.createElement(v4, {
        key = v15, 
        Priority = v10.priority, 
        Selector = v15, 
        properties = l_properties_0
    }));
end;
local function v24(v17, v18, v19, v20) --[[ Line: 43 ]] --[[ Name: updateRuleAttributes ]]
    -- upvalues: v8 (copy)
    v18 = v18 or {};
    v20 = v20 or 1;
    for _, v22 in v18 do
        if v19[v22.name] ~= v20 then
            local v23 = v8(v22.value, v20);
            v17:SetAttribute(v22.name, v23);
            v19[v22.name] = v20;
        end;
    end;
end;
return function(v25, v26, v27, v28, v29) --[[ Line: 61 ]] --[[ Name: createStyleSheetRules ]]
    -- upvalues: v24 (copy), v16 (copy)
    local v30 = {};
    for v31, _ in v26 do
        local v33 = v25[v31];
        if v33 ~= nil then
            if v27 and v28 then
                v24(v27, v33.attributes, v28, v29);
            end;
            v16(v30, v33, v31);
            if v33.children then
                for _, v35 in v33.children do
                    if v27 and v28 then
                        v24(v27, v35.attributes, v28, v29);
                    end;
                    v16(v30, v35, v35.tag);
                end;
            end;
        end;
    end;
    return v30;
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("GenericAbuseReporting");
local _ = require(l_script_FirstAncestor_0.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes);
local _ = require(script.Parent.ResolverTypes);
local v3 = require(script.Parent.transformJsonLeafFirst);
local _ = require(l_script_FirstAncestor_0.BeduiV2.Types);
local function v11(v5, v6) --[[ Line: 20 ]] --[[ Name: getByPath ]]
    local v7 = string.split(v6, ".");
    local l_v5_0 = v5;
    for _, v10 in ipairs(v7) do
        if type(l_v5_0) == "table" and l_v5_0 ~= nil then
            l_v5_0 = l_v5_0[v10];
            if l_v5_0 == nil then
                return nil;
            end;
        else
            return nil;
        end;
    end;
    return l_v5_0;
end;
local function _(v12) --[[ Line: 50 ]] --[[ Name: isTruthy ]]
    local v13 = false;
    if v12 ~= nil then
        v13 = false;
        if v12 ~= false then
            v13 = v12 ~= "";
        end;
    end;
    return v13;
end;
local v40 = {
    ["$attribute"] = {
        is = function(v15) --[[ Line: 60 ]] --[[ Name: is ]]
            local v16 = false;
            if type(v15) == "table" then
                v16 = false;
                if v15["$attribute"] ~= nil then
                    v16 = type(v15["$attribute"]) == "string";
                end;
            end;
            return v16;
        end, 
        resolve = function(v17, v18) --[[ Line: 63 ]] --[[ Name: resolve ]]
            -- upvalues: v11 (copy)
            return (v11(v18.attribute, v17["$attribute"]));
        end
    }, 
    ["$resource"] = {
        is = function(v19) --[[ Line: 69 ]] --[[ Name: is ]]
            local v20 = false;
            if type(v19) == "table" then
                v20 = false;
                if v19["$resource"] ~= nil then
                    v20 = type(v19["$resource"]) == "string";
                end;
            end;
            return v20;
        end, 
        resolve = function(v21, v22) --[[ Line: 72 ]] --[[ Name: resolve ]]
            local v23 = v22.resources[v21["$resource"]];
            if v23 then
                return v23.value;
            else
                return nil;
            end;
        end
    }, 
    ["$context"] = {
        is = function(v24) --[[ Line: 78 ]] --[[ Name: is ]]
            local v25 = false;
            if type(v24) == "table" then
                v25 = false;
                if v24["$context"] ~= nil then
                    v25 = type(v24["$context"]) == "string";
                end;
            end;
            return v25;
        end, 
        resolve = function(v26, v27) --[[ Line: 81 ]] --[[ Name: resolve ]]
            -- upvalues: v11 (copy)
            return (v11(v27.context, v26["$context"]));
        end
    }, 
    ["$switch"] = {
        is = function(v28) --[[ Line: 86 ]] --[[ Name: is ]]
            local v29 = false;
            if type(v28) == "table" then
                v29 = false;
                if v28["$switch"] ~= nil then
                    v29 = type(v28["$switch"]) == "table";
                end;
            end;
            return v29;
        end, 
        resolve = function(v30, _) --[[ Line: 89 ]] --[[ Name: resolve ]]
            for _, v33 in ipairs(v30["$switch"]) do
                if type(v33) == "string" then
                    return v33;
                elseif type(v33) == "table" and v33.condition then
                    local l_condition_0 = v33.condition;
                    local v35 = false;
                    if l_condition_0 ~= nil then
                        v35 = false;
                        if l_condition_0 ~= false then
                            v35 = l_condition_0 ~= "";
                        end;
                    end;
                    if v35 then
                        return v33.value;
                    end;
                end;
            end;
            return nil;
        end
    }, 
    ["$formData"] = {
        is = function(v36) --[[ Line: 104 ]] --[[ Name: is ]]
            local v37 = false;
            if type(v36) == "table" then
                v37 = false;
                if v36["$formData"] ~= nil then
                    v37 = type(v36["$formData"]) == "string";
                end;
            end;
            return v37;
        end, 
        resolve = function(v38, v39) --[[ Line: 107 ]] --[[ Name: resolve ]]
            -- upvalues: v11 (copy)
            return (v11(v39.formData, v38["$formData"]));
        end
    }
};
local function _(v41, v42) --[[ Line: 116 ]] --[[ Name: resolveConfig ]]
    -- upvalues: v40 (copy), v3 (copy)
    return (v3(v41, function(v43) --[[ Line: 125 ]] --[[ Name: replacerFn ]]
        -- upvalues: v40 (ref), v42 (copy)
        if type(v43) == "table" then
            if v40["$attribute"].is(v43) then
                return v40["$attribute"].resolve(v43, v42);
            elseif v40["$resource"].is(v43) then
                return v40["$resource"].resolve(v43, v42);
            elseif v40["$context"].is(v43) then
                return v40["$context"].resolve(v43, v42);
            elseif v40["$switch"].is(v43) then
                return v40["$switch"].resolve(v43, v42);
            elseif v40["$formData"].is(v43) then
                return v40["$formData"].resolve(v43, v42);
            end;
        end;
        return v43;
    end));
end;
return {
    resolveArConfig = function(v45, v46) --[[ Line: 153 ]] --[[ Name: resolveArConfig ]]
        -- upvalues: v40 (copy), v3 (copy)
        local l_resources_0 = v45.resources;
        local v48 = {
            attribute = v45.attributes, 
            resources = {}, 
            context = v46.context, 
            formData = v46.formData
        };
        local l_v48_0 = v48 --[[ copy: 4 -> 5 ]];
        local v51 = v3(l_resources_0, function(v50) --[[ Line: 125 ]] --[[ Name: replacerFn ]]
            -- upvalues: v40 (ref), l_v48_0 (copy)
            if type(v50) == "table" then
                if v40["$attribute"].is(v50) then
                    return v40["$attribute"].resolve(v50, l_v48_0);
                elseif v40["$resource"].is(v50) then
                    return v40["$resource"].resolve(v50, l_v48_0);
                elseif v40["$context"].is(v50) then
                    return v40["$context"].resolve(v50, l_v48_0);
                elseif v40["$switch"].is(v50) then
                    return v40["$switch"].resolve(v50, l_v48_0);
                elseif v40["$formData"].is(v50) then
                    return v40["$formData"].resolve(v50, l_v48_0);
                end;
            end;
            return v50;
        end);
        v48 = {
            attribute = v45.attributes, 
            resources = v51, 
            context = v46.context, 
            formData = v46.formData
        };
        return (v3(v45, function(v52) --[[ Line: 125 ]] --[[ Name: replacerFn ]]
            -- upvalues: v40 (ref), v48 (copy)
            if type(v52) == "table" then
                if v40["$attribute"].is(v52) then
                    return v40["$attribute"].resolve(v52, v48);
                elseif v40["$resource"].is(v52) then
                    return v40["$resource"].resolve(v52, v48);
                elseif v40["$context"].is(v52) then
                    return v40["$context"].resolve(v52, v48);
                elseif v40["$switch"].is(v52) then
                    return v40["$switch"].resolve(v52, v48);
                elseif v40["$formData"].is(v52) then
                    return v40["$formData"].resolve(v52, v48);
                end;
            end;
            return v52;
        end));
    end
};
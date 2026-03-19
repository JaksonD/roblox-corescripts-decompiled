local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(script.Parent.PresenceChild);
local v4 = require(l_Parent_0.Enums.PresenceState);
local function _(v5, v6) --[[ Line: 55 ]] --[[ Name: getCompositeKey ]]
    if typeof(v6) == "table" and v6.props and v6.props.presenceId then
        return string.format("%s:%s", v5, (tostring(v6.props.presenceId)));
    else
        return v5;
    end;
end;
return function(v8) --[[ Line: 63 ]] --[[ Name: AnimatePresence ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy)
    local l_children_0 = v8.children;
    local v10 = if v8.childData ~= nil then v8.childData else nil;
    local v11 = if v8.onExitComplete ~= nil then v8.onExitComplete else nil;
    local v12, v13 = v2.useState({});
    local v14 = v2.useRef({});
    v2.useEffect(function() --[[ Line: 73 ]]
        -- upvalues: l_children_0 (copy), v4 (ref), v12 (copy), v13 (copy), v14 (copy)
        local v15 = {};
        if l_children_0 ~= nil and typeof(l_children_0) == "table" then
            for v16, v17 in pairs(l_children_0) do
                if typeof(v17) == "table" and v17.type ~= nil then
                    v15[if typeof(v17) == "table" and v17.props and v17.props.presenceId then string.format("%s:%s", v16, (tostring(v17.props.presenceId))) else v16] = {
                        type = v4.Entering, 
                        component = v17, 
                        dictionaryKey = v16
                    };
                end;
            end;
        end;
        for v18, v19 in pairs(v12) do
            local v20 = false;
            if l_children_0 ~= nil and typeof(l_children_0) == "table" then
                for v21, v22 in pairs(l_children_0) do
                    if typeof(v22) == "table" and v22.type ~= nil and (if typeof(v22) == "table" and v22.props and v22.props.presenceId then string.format("%s:%s", v21, (tostring(v22.props.presenceId))) else v21) == v18 then
                        v20 = true;
                        break;
                    end;
                end;
            end;
            if not v20 and v19.isPresent then
                v15[v18] = {
                    type = v4.Exiting, 
                    component = v19.component, 
                    dictionaryKey = v19.dictionaryKey
                };
            end;
        end;
        if next(v15) ~= nil then
            v13(function(v23) --[[ Line: 120 ]]
                -- upvalues: v15 (copy), v4 (ref), v14 (ref)
                local v24 = table.clone(v23);
                for v25, v26 in pairs(v15) do
                    if v26.type == v4.Entering then
                        v24[v25] = {
                            isPresent = true, 
                            component = v26.component, 
                            safeToRemove = false, 
                            dictionaryKey = v26.dictionaryKey
                        };
                    elseif v26.type == v4.Exiting and v24[v25] and v24[v25].isPresent then
                        v24[v25] = {
                            isPresent = false, 
                            component = v26.component, 
                            safeToRemove = false, 
                            dictionaryKey = v26.dictionaryKey
                        };
                        v14.current[v25] = true;
                    end;
                end;
                return v24;
            end);
        end;
    end, {
        l_children_0
    });
    local v30 = v2.useCallback(function(v27) --[[ Line: 150 ]]
        -- upvalues: v14 (copy), v13 (copy)
        if v14.current[v27] then
            v14.current[v27] = nil;
            v13(function(v28) --[[ Line: 154 ]]
                -- upvalues: v27 (copy)
                local v29 = table.clone(v28);
                if v29[v27] then
                    v29[v27] = {
                        isPresent = false, 
                        component = v29[v27].component, 
                        safeToRemove = true, 
                        dictionaryKey = v29[v27].dictionaryKey
                    };
                end;
                return v29;
            end);
        end;
    end, {});
    v2.useEffect(function() --[[ Line: 170 ]]
        -- upvalues: v12 (copy), v13 (copy), v11 (copy)
        local v31 = {};
        local v32 = false;
        for v33, v34 in pairs(v12) do
            if v34.safeToRemove then
                v32 = true;
                v31[v33] = true;
            end;
        end;
        if v32 then
            v13(function(v35) --[[ Line: 182 ]]
                -- upvalues: v31 (copy), v11 (ref)
                local v36 = {};
                for v37, v38 in pairs(v35) do
                    if not v31[v37] then
                        v36[v37] = v38;
                    elseif v11 then
                        v11(v37);
                    end;
                end;
                return v36;
            end);
        end;
    end, {
        v12
    });
    local v39 = {};
    for v40, v41 in pairs(v12) do
        if not v41.safeToRemove then
            table.insert(v39, v2.createElement(v3, {
                key = v40, 
                presenceId = v40, 
                isPresent = v41.isPresent, 
                onExitComplete = function() --[[ Line: 208 ]] --[[ Name: onExitComplete ]]
                    -- upvalues: v30 (copy), v40 (copy)
                    v30(v40);
                end, 
                childData = v10, 
                children = v41.component
            }, v41.component));
        end;
    end;
    return v2.createElement(v2.Fragment, {}, v39);
end;
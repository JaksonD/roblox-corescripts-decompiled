local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_dependencyArray_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.dependencyArray;
local v3 = require(script.Parent.TooltipContext);
TooltipProvider = function(v4) --[[ Line: 30 ]] --[[ Name: TooltipProvider ]]
    -- upvalues: v1 (copy), l_dependencyArray_0 (copy), v3 (copy)
    local v5, v6 = v1.useState(nil);
    local v7 = v1.useRef(nil);
    local v8 = v1.useRef(nil);
    local v9 = v1.useRef(nil);
    local v10 = v1.useRef({});
    local v12 = v1.useCallback(function(v11) --[[ Line: 41 ]]
        -- upvalues: v6 (copy), v7 (copy), v8 (copy)
        v6(v11);
        v7.current = v11;
        if v7.current and v8.current and v7.current.id == v8.current.id then
            v8.current = nil;
        end;
    end, {});
    local v17 = v1.useCallback(function(v13) --[[ Line: 53 ]]
        -- upvalues: v7 (copy), v12 (copy), v8 (copy), v10 (copy)
        if v7 and v7.current and v7.current.id == v13 then
            v12(nil);
        end;
        if v8 and v8.current and v8.current.id == v13 then
            v8.current = nil;
        end;
        local v14 = nil;
        for _, v16 in pairs(v10.current) do
            if v16.id == v13 then
                v14 = v16;
                break;
            end;
        end;
        if v14 and v14.priority and v10.current[v14.priority] then
            v10.current[v14.priority] = nil;
        end;
    end, l_dependencyArray_0(v5));
    v9.current = v1.useCallback(function() --[[ Line: 74 ]]
        -- upvalues: v7 (copy), v8 (copy), v10 (copy), v12 (copy), v17 (copy), v9 (copy)
        if v7.current or v8.current then
            return;
        else
            local l_current_0 = v10.current;
            local v19 = {};
            for _, v21 in pairs(l_current_0) do
                table.insert(v19, v21);
            end;
            table.sort(v19, function(v22, v23) --[[ Line: 86 ]]
                return v22.priority > v23.priority;
            end);
            local v24 = v19[1];
            if not v24 then
                return;
            else
                v8.current = v24;
                task.delay(v24.showDelay / 1000, function() --[[ Line: 97 ]]
                    -- upvalues: v12 (ref), v24 (copy), v17 (ref), v9 (ref)
                    v12(v24);
                    task.delay(v24.dismissDelay / 1000, function() --[[ Line: 100 ]]
                        -- upvalues: v17 (ref), v24 (ref), v9 (ref)
                        v17(v24.id);
                        if v9.current then
                            v9.current();
                        end;
                    end);
                end);
                return;
            end;
        end;
    end, l_dependencyArray_0(v5));
    local function _() --[[ Line: 109 ]]
        -- upvalues: v9 (copy)
        if v9.current then
            v9.current();
        end;
    end;
    local v34 = v1.useMemo(function() --[[ Line: 115 ]]
        -- upvalues: v10 (copy), v9 (copy), v17 (copy), v5 (copy)
        return {
            registerTooltip = function(v26, v27, v28, v29) --[[ Line: 117 ]] --[[ Name: registerTooltip ]]
                -- upvalues: v10 (ref), v9 (ref)
                if not v10.current[v27] then
                    table.insert(v10.current, v27, {
                        id = v26, 
                        priority = v27, 
                        showDelay = v28, 
                        dismissDelay = v29
                    });
                    if v9.current then
                        v9.current();
                    end;
                end;
            end, 
            unregisterTooltip = function(v30) --[[ Line: 128 ]] --[[ Name: unregisterTooltip ]]
                -- upvalues: v17 (ref), v9 (ref)
                v17(v30);
                if v9.current then
                    v9.current();
                end;
            end, 
            dismissTooltip = function(v31, _) --[[ Line: 132 ]] --[[ Name: dismissTooltip ]]
                -- upvalues: v17 (ref), v9 (ref)
                v17(v31);
                if v9.current then
                    v9.current();
                end;
            end, 
            isCurrentTooltip = function(v33) --[[ Line: 136 ]] --[[ Name: isCurrentTooltip ]]
                -- upvalues: v5 (ref)
                return v5 and v5.id == v33;
            end
        };
    end, l_dependencyArray_0(v5));
    return v1.createElement(v3.Provider, {
        value = v34
    }, v4.children);
end;
return TooltipProvider;
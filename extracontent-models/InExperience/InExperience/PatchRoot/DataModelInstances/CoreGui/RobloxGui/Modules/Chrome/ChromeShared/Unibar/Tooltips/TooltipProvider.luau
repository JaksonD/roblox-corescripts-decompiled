local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_dependencyArray_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.dependencyArray;
local v3 = require(script.Parent.TooltipContext);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
TooltipProvider = function(v5) --[[ Line: 33 ]] --[[ Name: TooltipProvider ]]
    -- upvalues: v1 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy), v3 (copy)
    local v6, v7 = v1.useState(nil);
    local v8 = v1.useRef(nil);
    local v9 = v1.useRef(nil);
    local v10 = v1.useRef(nil);
    local v11 = v1.useRef({});
    local v13 = v1.useCallback(function(v12) --[[ Line: 44 ]]
        -- upvalues: v7 (copy), v8 (copy), v9 (copy)
        v7(v12);
        v8.current = v12;
        if v8.current and v9.current and v8.current.id == v9.current.id then
            v9.current = nil;
        end;
    end, {});
    local v18 = v1.useCallback(function(v14) --[[ Line: 56 ]]
        -- upvalues: v8 (copy), v13 (copy), v9 (copy), v11 (copy)
        if v8 and v8.current and v8.current.id == v14 then
            v13(nil);
        end;
        if v9 and v9.current and v9.current.id == v14 then
            v9.current = nil;
        end;
        local v15 = nil;
        for _, v17 in pairs(v11.current) do
            if v17.id == v14 then
                v15 = v17;
                break;
            end;
        end;
        if v15 and v15.priority and v11.current[v15.priority] then
            v11.current[v15.priority] = nil;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v6
    } else l_dependencyArray_0(v6));
    v10.current = v1.useCallback(function() --[[ Line: 77 ]]
        -- upvalues: v8 (copy), v9 (copy), v11 (copy), v13 (copy), v18 (copy), v10 (copy)
        if v8.current or v9.current then
            return;
        else
            local l_current_0 = v11.current;
            local v20 = {};
            for _, v22 in pairs(l_current_0) do
                table.insert(v20, v22);
            end;
            table.sort(v20, function(v23, v24) --[[ Line: 89 ]]
                return v23.priority > v24.priority;
            end);
            local v25 = v20[1];
            if not v25 then
                return;
            else
                v9.current = v25;
                task.delay(v25.showDelay / 1000, function() --[[ Line: 100 ]]
                    -- upvalues: v13 (ref), v25 (copy), v18 (ref), v10 (ref)
                    v13(v25);
                    task.delay(v25.dismissDelay / 1000, function() --[[ Line: 103 ]]
                        -- upvalues: v18 (ref), v25 (ref), v10 (ref)
                        v18(v25.id);
                        if v10.current then
                            v10.current();
                        end;
                    end);
                end);
                return;
            end;
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v6
    } else l_dependencyArray_0(v6));
    local function _() --[[ Line: 112 ]]
        -- upvalues: v10 (copy)
        if v10.current then
            v10.current();
        end;
    end;
    local v35 = v1.useMemo(function() --[[ Line: 118 ]]
        -- upvalues: v11 (copy), v10 (copy), v18 (copy), v6 (copy)
        return {
            registerTooltip = function(v27, v28, v29, v30) --[[ Line: 120 ]] --[[ Name: registerTooltip ]]
                -- upvalues: v11 (ref), v10 (ref)
                if not v11.current[v28] then
                    table.insert(v11.current, v28, {
                        id = v27, 
                        priority = v28, 
                        showDelay = v29, 
                        dismissDelay = v30
                    });
                    if v10.current then
                        v10.current();
                    end;
                end;
            end, 
            unregisterTooltip = function(v31) --[[ Line: 131 ]] --[[ Name: unregisterTooltip ]]
                -- upvalues: v18 (ref), v10 (ref)
                v18(v31);
                if v10.current then
                    v10.current();
                end;
            end, 
            dismissTooltip = function(v32, _) --[[ Line: 135 ]] --[[ Name: dismissTooltip ]]
                -- upvalues: v18 (ref), v10 (ref)
                v18(v32);
                if v10.current then
                    v10.current();
                end;
            end, 
            isCurrentTooltip = function(v34) --[[ Line: 139 ]] --[[ Name: isCurrentTooltip ]]
                -- upvalues: v6 (ref)
                return v6 and v6.id == v34;
            end
        };
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v6
    } else l_dependencyArray_0(v6));
    return v1.createElement(v3.Provider, {
        value = v35
    }, v5.children);
end;
return TooltipProvider;
local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local l_console_0 = require(l_Parent_0.Shared).console;
local v3 = {};
local function _(v4, v5) --[[ Line: 16 ]] --[[ Name: warnNoop ]]
    -- upvalues: v1 (copy), v3 (copy), l_console_0 (copy)
    if v1.__DEV__ then
        local v6 = v4.__componentName or "ReactClass";
        local v7 = v6 .. "." .. v5;
        if v3[v7] then
            return;
        else
            l_console_0.error("Can't call %s on a component that is not yet mounted. This is a no-op, but it might indicate a bug in your application. Instead, assign to `self.state` directly with the desired state in the %s component's `init` method.", v5, v6);
            v3[v7] = true;
        end;
    end;
end;
return {
    isMounted = function(_) --[[ Line: 51 ]] --[[ Name: isMounted ]]
        return false;
    end, 
    enqueueForceUpdate = function(v10, _, _) --[[ Line: 69 ]] --[[ Name: enqueueForceUpdate ]]
        -- upvalues: v1 (copy), v3 (copy), l_console_0 (copy)
        if v1.__DEV__ then
            local v13 = v10.__componentName or "ReactClass";
            local v14 = v13 .. "." .. "forceUpdate";
            if v3[v14] then
                return;
            else
                l_console_0.error("Can't call %s on a component that is not yet mounted. This is a no-op, but it might indicate a bug in your application. Instead, assign to `self.state` directly with the desired state in the %s component's `init` method.", "forceUpdate", v13);
                v3[v14] = true;
            end;
        end;
    end, 
    enqueueReplaceState = function(v15, _, _, _) --[[ Line: 85 ]] --[[ Name: enqueueReplaceState ]]
        -- upvalues: v1 (copy), v3 (copy), l_console_0 (copy)
        if v1.__DEV__ then
            local v19 = v15.__componentName or "ReactClass";
            local v20 = v19 .. "." .. "replaceState";
            if v3[v20] then
                return;
            else
                l_console_0.error("Can't call %s on a component that is not yet mounted. This is a no-op, but it might indicate a bug in your application. Instead, assign to `self.state` directly with the desired state in the %s component's `init` method.", "replaceState", v19);
                v3[v20] = true;
            end;
        end;
    end, 
    enqueueSetState = function(v21, _, _, _) --[[ Line: 100 ]] --[[ Name: enqueueSetState ]]
        -- upvalues: v1 (copy), v3 (copy), l_console_0 (copy)
        if v1.__DEV__ then
            local v25 = v21.__componentName or "ReactClass";
            local v26 = v25 .. "." .. "setState";
            if v3[v26] then
                return;
            else
                l_console_0.error("Can't call %s on a component that is not yet mounted. This is a no-op, but it might indicate a bug in your application. Instead, assign to `self.state` directly with the desired state in the %s component's `init` method.", "setState", v25);
                v3[v26] = true;
            end;
        end;
    end
};
local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(l_Parent_0.LuauPolyfill);
local v4 = {};
local function _(v5) --[[ Line: 29 ]] --[[ Name: isCallable ]]
    if typeof(v5) == "function" then
        return true;
    else
        if typeof(v5) == "table" then
            local v6 = getmetatable(v5);
            if v6 and rawget(v6, "__call") then
                return true;
            elseif v5._isMockFunction then
                return true;
            end;
        end;
        return false;
    end;
end;
local l_enableProfilerTimer_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableProfilerTimer;
local _ = require(script.Parent.ReactInternalTypes);
local _ = require(l_Parent_0.Shared);
local l_DidCapture_0 = require(script.Parent.ReactFiberFlags).DidCapture;
local v12 = nil;
local v13 = nil;
local v14 = false;
v4.isDevToolsPresent = function() --[[ Line: 64 ]]
    -- upvalues: v1 (copy)
    return v1.__REACT_DEVTOOLS_GLOBAL_HOOK__ ~= nil;
end;
v4.injectInternals = function(v15) --[[ Line: 68 ]]
    -- upvalues: v1 (copy), l_console_0 (copy), v12 (ref), v13 (ref)
    if v1.__REACT_DEVTOOLS_GLOBAL_HOOK__ == nil then
        return false;
    else
        local l___REACT_DEVTOOLS_GLOBAL_HOOK___0 = v1.__REACT_DEVTOOLS_GLOBAL_HOOK__;
        if l___REACT_DEVTOOLS_GLOBAL_HOOK___0.isDisabled then
            return true;
        elseif not l___REACT_DEVTOOLS_GLOBAL_HOOK___0.supportsFiber then
            if v1.__DEV__ then
                l_console_0.error("The installed version of React DevTools is too old and will not work with the current version of React. Please update React DevTools. https://reactjs.org/link/react-devtools");
            end;
            return true;
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 91 ]]
                -- upvalues: v12 (ref), l___REACT_DEVTOOLS_GLOBAL_HOOK___0 (copy), v15 (copy), v13 (ref)
                v12 = l___REACT_DEVTOOLS_GLOBAL_HOOK___0.inject(v15);
                v13 = l___REACT_DEVTOOLS_GLOBAL_HOOK___0;
            end);
            if not l_status_0 and v1.__DEV__ then
                l_console_0.error("React instrumentation encountered an error: %s.", l_result_0);
            end;
            return true;
        end;
    end;
end;
v4.onScheduleRoot = function(v19, v20) --[[ Line: 107 ]]
    -- upvalues: v1 (copy), v13 (ref), v12 (ref), v14 (ref), l_console_0 (copy)
    local v21 = false;
    if v1.__DEV__ and v13 then
        local l_onScheduleFiberRoot_0 = v13.onScheduleFiberRoot;
        local v23;
        if typeof(l_onScheduleFiberRoot_0) == "function" then
            v23 = true;
        else
            if typeof(l_onScheduleFiberRoot_0) == "table" then
                local v24 = getmetatable(l_onScheduleFiberRoot_0);
                if v24 and rawget(v24, "__call") then
                    v23 = true;
                    v21 = true;
                elseif l_onScheduleFiberRoot_0._isMockFunction then
                    v23 = true;
                    v21 = true;
                end;
            end;
            if not v21 then
                if not v21 then
                    v23 = false;
                end;
            end;
        end;
        v21 = false;
        if v23 then
            v23, l_onScheduleFiberRoot_0 = pcall(v13.onScheduleFiberRoot, v12, v19, v20);
            if not v23 and v1.__DEV__ and not v14 then
                v14 = true;
                l_console_0.error("React instrumentation encountered an error: %s", l_onScheduleFiberRoot_0);
            end;
        end;
    end;
end;
v4.onCommitRoot = function(v25, v26) --[[ Line: 127 ]]
    -- upvalues: v13 (ref), l_DidCapture_0 (copy), l_enableProfilerTimer_0 (copy), v12 (ref), v1 (copy), v14 (ref), l_console_0 (copy)
    local v27 = false;
    if v13 then
        local l_onCommitFiberRoot_0 = v13.onCommitFiberRoot;
        local v29;
        if typeof(l_onCommitFiberRoot_0) == "function" then
            v29 = true;
        else
            if typeof(l_onCommitFiberRoot_0) == "table" then
                local v30 = getmetatable(l_onCommitFiberRoot_0);
                if v30 and rawget(v30, "__call") then
                    v29 = true;
                    v27 = true;
                elseif l_onCommitFiberRoot_0._isMockFunction then
                    v29 = true;
                    v27 = true;
                end;
            end;
            if not v27 then
                if not v27 then
                    v29 = false;
                end;
            end;
        end;
        v27 = false;
        if v29 then
            v29, l_onCommitFiberRoot_0 = pcall(function() --[[ Line: 133 ]]
                -- upvalues: v25 (copy), l_DidCapture_0 (ref), l_enableProfilerTimer_0 (ref), v13 (ref), v12 (ref), v26 (copy)
                local v31 = bit32.band(v25.current.flags, l_DidCapture_0) == l_DidCapture_0;
                if l_enableProfilerTimer_0 then
                    v13.onCommitFiberRoot(v12, v25, v26, v31);
                    return;
                else
                    v13.onCommitFiberRoot(v12, v25, nil, v31);
                    return;
                end;
            end);
            if not v29 and v1.__DEV__ and not v14 then
                v14 = true;
                l_console_0.error("React instrumentation encountered an error: %s", l_onCommitFiberRoot_0);
            end;
        end;
    end;
end;
v4.onCommitUnmount = function(v32) --[[ Line: 152 ]]
    -- upvalues: v13 (ref), v12 (ref), v1 (copy), v14 (ref), l_console_0 (copy)
    local v33 = false;
    if v13 then
        local l_onCommitFiberUnmount_0 = v13.onCommitFiberUnmount;
        local v35;
        if typeof(l_onCommitFiberUnmount_0) == "function" then
            v35 = true;
        else
            if typeof(l_onCommitFiberUnmount_0) == "table" then
                local v36 = getmetatable(l_onCommitFiberUnmount_0);
                if v36 and rawget(v36, "__call") then
                    v35 = true;
                    v33 = true;
                elseif l_onCommitFiberUnmount_0._isMockFunction then
                    v35 = true;
                    v33 = true;
                end;
            end;
            if not v33 then
                if not v33 then
                    v35 = false;
                end;
            end;
        end;
        v33 = false;
        if v35 then
            v35, l_onCommitFiberUnmount_0 = pcall(v13.onCommitFiberUnmount, v12, v32);
            if not v35 and v1.__DEV__ and not v14 then
                v14 = true;
                l_console_0.error("React instrumentation encountered an error: %s", l_onCommitFiberUnmount_0);
            end;
        end;
    end;
end;
return v4;
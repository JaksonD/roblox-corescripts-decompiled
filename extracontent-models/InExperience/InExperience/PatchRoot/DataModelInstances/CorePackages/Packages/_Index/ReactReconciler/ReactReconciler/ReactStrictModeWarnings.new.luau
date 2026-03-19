local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(script.Parent.ReactInternalTypes);
local v4 = require(script.Parent.ReactCurrentFiber);
local l_resetCurrentFiber_0 = v4.resetCurrentFiber;
local l_setCurrentFiber_0 = v4.setCurrentFiber;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_StrictMode_0 = require(script.Parent.ReactTypeOfMode).StrictMode;
local v13 = {
    recordUnsafeLifecycleWarnings = function(_, _) --[[ Line: 32 ]] --[[ Name: recordUnsafeLifecycleWarnings ]]

    end, 
    flushPendingUnsafeLifecycleWarnings = function() --[[ Line: 33 ]] --[[ Name: flushPendingUnsafeLifecycleWarnings ]]

    end, 
    recordLegacyContextWarning = function(_, _) --[[ Line: 34 ]] --[[ Name: recordLegacyContextWarning ]]

    end, 
    flushLegacyContextWarning = function() --[[ Line: 35 ]] --[[ Name: flushLegacyContextWarning ]]

    end, 
    discardPendingWarnings = function() --[[ Line: 36 ]] --[[ Name: discardPendingWarnings ]]

    end
};
if v1.__DEV__ then
    local function _(v14) --[[ Line: 40 ]]
        -- upvalues: l_StrictMode_0 (copy)
        local v15 = nil;
        local l_v14_0 = v14;
        while l_v14_0 ~= nil do
            if bit32.band(l_v14_0.mode, l_StrictMode_0) ~= 0 then
                v15 = l_v14_0;
            end;
            l_v14_0 = l_v14_0.return_;
        end;
        return v15;
    end;
    local function v22(v18) --[[ Line: 55 ]]
        local v19 = {};
        for v20, _ in v18 do
            table.insert(v19, v20);
        end;
        table.sort(v19);
        return table.concat(v19, ", ");
    end;
    local v23 = {};
    local v24 = {};
    local v25 = {};
    local v26 = {};
    local v27 = {};
    local v28 = {};
    local v29 = {};
    v13.recordUnsafeLifecycleWarnings = function(v30, v31) --[[ Line: 74 ]]
        -- upvalues: v29 (copy), v23 (copy), l_StrictMode_0 (copy), v24 (copy), v25 (copy), v26 (copy), v27 (copy), v28 (copy)
        if v29[v30.type] then
            return;
        else
            if typeof(v31.componentWillMount) == "function" then
                table.insert(v23, v30);
            end;
            if bit32.band(v30.mode, l_StrictMode_0) ~= 0 and typeof(v31.UNSAFE_componentWillMount) == "function" then
                table.insert(v24, v30);
            end;
            if typeof(v31.componentWillReceiveProps) == "function" then
                table.insert(v25, v30);
            end;
            if bit32.band(v30.mode, l_StrictMode_0) ~= 0 and typeof(v31.UNSAFE_componentWillReceiveProps) == "function" then
                table.insert(v26, v30);
            end;
            if typeof(v31.componentWillUpdate) == "function" then
                table.insert(v27, v30);
            end;
            if bit32.band(v30.mode, l_StrictMode_0) ~= 0 and typeof(v31.UNSAFE_componentWillUpdate) == "function" then
                table.insert(v28, v30);
            end;
            return;
        end;
    end;
    v13.flushPendingUnsafeLifecycleWarnings = function() --[[ Line: 130 ]]
        -- upvalues: v23 (copy), l_getComponentName_0 (copy), v29 (copy), v24 (copy), v25 (copy), v26 (copy), v27 (copy), v28 (copy), v22 (copy), l_console_0 (copy)
        local v32 = {};
        if #v23 > 0 then
            for _, v34 in v23 do
                v32[l_getComponentName_0(v34.type) or "Component"] = true;
                v29[v34.type] = true;
            end;
            table.clear(v23);
        end;
        local v35 = {};
        if #v24 > 0 then
            for _, v37 in v24 do
                v35[l_getComponentName_0(v37.type) or "Component"] = true;
                v29[v37.type] = true;
            end;
            table.clear(v24);
        end;
        local v38 = {};
        if #v25 > 0 then
            for _, v40 in v25 do
                v38[l_getComponentName_0(v40.type) or "Component"] = true;
                v29[v40.type] = true;
            end;
            table.clear(v25);
        end;
        local v41 = {};
        if #v26 > 0 then
            for _, v43 in v26 do
                v41[l_getComponentName_0(v43.type) or "Component"] = true;
                v29[v43.type] = true;
            end;
            table.clear(v26);
        end;
        local v44 = {};
        if #v27 > 0 then
            for _, v46 in v27 do
                v44[l_getComponentName_0(v46.type) or "Component"] = true;
                v29[v46.type] = true;
            end;
            table.clear(v27);
        end;
        local v47 = {};
        if #v28 > 0 then
            for _, v49 in v28 do
                v47[l_getComponentName_0(v49.type) or "Component"] = true;
                v29[v49.type] = true;
            end;
            table.clear(v28);
        end;
        if next(v35) ~= nil then
            local v50 = v22(v35);
            l_console_0.error("Using UNSAFE_componentWillMount in strict mode is not recommended and may indicate bugs in your code. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move code with side effects to componentDidMount, and set initial state in the constructor.\n\nPlease update the following components: %s", v50);
        end;
        if next(v41) ~= nil then
            local v51 = v22(v41);
            l_console_0.error("Using UNSAFE_componentWillReceiveProps in strict mode is not recommended and may indicate bugs in your code. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move data fetching code or side effects to componentDidUpdate.\n* If you're updating state whenever props change, refactor your code to use memoization techniques or move it to static getDerivedStateFromProps. Learn more at: https://reactjs.org/link/derived-state\n\nPlease update the following components: %s", v51);
        end;
        if next(v47) ~= nil then
            local v52 = v22(v47);
            l_console_0.error("Using UNSAFE_componentWillUpdate in strict mode is not recommended and may indicate bugs in your code. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move data fetching code or side effects to componentDidUpdate.\n\nPlease update the following components: %s", v52);
        end;
        if next(v32) ~= nil then
            local v53 = v22(v32);
            l_console_0.warn("componentWillMount has been renamed, and is not recommended for use. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move code with side effects to componentDidMount, and set initial state in the constructor.\n* Rename componentWillMount to UNSAFE_componentWillMount to suppress this warning in non-strict mode. In React 18.x, only the UNSAFE_ name will work.\n\nPlease update the following components: %s", v53);
        end;
        if next(v38) ~= nil then
            local v54 = v22(v38);
            l_console_0.warn("componentWillReceiveProps has been renamed, and is not recommended for use. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move data fetching code or side effects to componentDidUpdate.\n* If you're updating state whenever props change, refactor your code to use memoization techniques or move it to static getDerivedStateFromProps. Learn more at: https://reactjs.org/link/derived-state\n* Rename componentWillReceiveProps to UNSAFE_componentWillReceiveProps to suppress this warning in non-strict mode. In React 18.x, only the UNSAFE_ name will work.\n\nPlease update the following components: %s", v54);
        end;
        if next(v44) ~= nil then
            local v55 = v22(v44);
            l_console_0.warn("componentWillUpdate has been renamed, and is not recommended for use. See https://reactjs.org/link/unsafe-component-lifecycles for details.\n\n* Move data fetching code or side effects to componentDidUpdate.\n* Rename componentWillUpdate to UNSAFE_componentWillUpdate to suppress this warning in non-strict mode. In React 18.x, only the UNSAFE_ name will work.\n\nPlease update the following components: %s", v55);
        end;
    end;
    local v56 = {};
    local v57 = {};
    v13.recordLegacyContextWarning = function(v58, v59) --[[ Line: 303 ]]
        -- upvalues: l_StrictMode_0 (copy), l_console_0 (copy), v57 (copy), v56 (copy)
        local v60 = nil;
        local l_v58_0 = v58;
        while l_v58_0 ~= nil do
            if bit32.band(l_v58_0.mode, l_StrictMode_0) ~= 0 then
                v60 = l_v58_0;
            end;
            l_v58_0 = l_v58_0.return_;
        end;
        local l_v60_0 = v60;
        if l_v60_0 == nil then
            l_console_0.error("Expected to find a StrictMode component in a strict mode tree. This error is likely caused by a bug in React. Please file an issue.");
            return;
        elseif v57[v58.type] then
            return;
        else
            v60 = v56[l_v60_0];
            if typeof(v58.type) ~= "function" and (v58.type.contextTypes ~= nil or v58.type.childContextTypes ~= nil or v59 ~= nil and typeof(v59.getChildContext) == "function") then
                if v60 == nil then
                    v60 = {};
                    v56[l_v60_0] = v60;
                end;
                table.insert(v60, v58);
            end;
            return;
        end;
    end;
    v13.flushLegacyContextWarning = function() --[[ Line: 342 ]]
        -- upvalues: v56 (copy), l_getComponentName_0 (copy), v57 (copy), v22 (copy), l_setCurrentFiber_0 (copy), l_console_0 (copy), l_resetCurrentFiber_0 (copy)
        for _, v64 in v56 do
            if #v64 == 0 then
                return;
            else
                local v65 = v64[1];
                local v66 = {};
                for _, v68 in v64 do
                    v66[l_getComponentName_0(v68.type) or "Component"] = true;
                    v57[v68.type] = true;
                end;
                local v69 = v22(v66);
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 357 ]]
                    -- upvalues: l_setCurrentFiber_0 (ref), v65 (copy), l_console_0 (ref), v69 (copy)
                    l_setCurrentFiber_0(v65);
                    l_console_0.error("Legacy context API has been detected within a strict-mode tree.\n\nThe old API will be supported in all 16.x releases, but applications using it should migrate to the new version.\n\nPlease update the following components: %s\n\nLearn more about this warning here: https://reactjs.org/link/legacy-context", v69);
                end);
                l_resetCurrentFiber_0();
                if not l_status_0 then
                    error(l_result_0);
                end;
            end;
        end;
    end;
    v13.discardPendingWarnings = function() --[[ Line: 378 ]]
        -- upvalues: v23 (copy), v24 (copy), v25 (copy), v26 (copy), v27 (copy), v28 (copy), v56 (copy)
        table.clear(v23);
        table.clear(v24);
        table.clear(v25);
        table.clear(v26);
        table.clear(v27);
        table.clear(v28);
        table.clear(v56);
    end;
end;
return v13;
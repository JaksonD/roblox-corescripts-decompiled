local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(l_Parent_0.Shared);
local _ = require(l_Parent_0.Shared);
local l_ReactCurrentDispatcher_0 = require(l_Parent_0.Shared).ReactSharedInternals.ReactCurrentDispatcher;
local function _() --[[ Line: 46 ]] --[[ Name: resolveDispatcher ]]
    -- upvalues: l_ReactCurrentDispatcher_0 (copy), v1 (copy), l_console_0 (copy)
    local l_current_0 = l_ReactCurrentDispatcher_0.current;
    if v1.__DEV__ and l_current_0 == nil then
        l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
    end;
    return l_current_0;
end;
return {
    useContext = function(v9, v10, ...) --[[ Line: 76 ]] --[[ Name: useContext ]]
        -- upvalues: l_ReactCurrentDispatcher_0 (copy), v1 (copy), l_console_0 (copy), l_Array_0 (copy)
        local l_current_1 = l_ReactCurrentDispatcher_0.current;
        if v1.__DEV__ and l_current_1 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        local l_l_current_1_0 = l_current_1;
        if v1.__DEV__ then
            if v10 ~= nil then
                l_console_0.error("useContext() second argument is reserved for future use in React. Passing it is not supported. You passed: %s.%s", v10, typeof(v10) == "number" and l_Array_0.isArray({
                    ...
                }) and "\n\nDid you call Array.map(useContext)? Calling Hooks inside a loop is not supported. Learn more at https://reactjs.org/link/rules-of-hooks" or "");
            end;
            if v9._context ~= nil then
                l_current_1 = v9._context;
                if l_current_1.Consumer == v9 then
                    l_console_0.error("Calling useContext(Context.Consumer) is not supported, may cause bugs, and will be removed in a future major release. Did you mean to call useContext(Context) instead?");
                elseif l_current_1.Provider == v9 then
                    l_console_0.error("Calling useContext(Context.Provider) is not supported. Did you mean to call useContext(Context) instead?");
                end;
            end;
        end;
        return l_l_current_1_0.useContext(v9, v10);
    end, 
    useState = function(v13, ...) --[[ Line: 122 ]] --[[ Name: useState ]]
        -- upvalues: l_ReactCurrentDispatcher_0 (copy), v1 (copy), l_console_0 (copy)
        local l_current_2 = l_ReactCurrentDispatcher_0.current;
        if v1.__DEV__ and l_current_2 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        return l_current_2.useState(v13, ...);
    end, 
    useReducer = function(v15, v16, v17) --[[ Line: 141 ]] --[[ Name: useReducer ]]
        -- upvalues: l_ReactCurrentDispatcher_0 (copy), v1 (copy), l_console_0 (copy)
        local l_current_3 = l_ReactCurrentDispatcher_0.current;
        if v1.__DEV__ and l_current_3 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        return l_current_3.useReducer(v15, v16, v17);
    end, 
    useRef = function(v19) --[[ Line: 163 ]] --[[ Name: useRef ]]
        -- upvalues: l_ReactCurrentDispatcher_0 (copy), v1 (copy), l_console_0 (copy)
        local l_current_4 = l_ReactCurrentDispatcher_0.current;
        if v1.__DEV__ and l_current_4 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        return l_current_4.useRef(v19);
    end, 
    useBinding = function(v21) --[[ Line: 175 ]] --[[ Name: useBinding ]]
        -- upvalues: l_ReactCurrentDispatcher_0 (copy), v1 (copy), l_console_0 (copy)
        local l_current_5 = l_ReactCurrentDispatcher_0.current;
        if v1.__DEV__ and l_current_5 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        return l_current_5.useBinding(v21);
    end, 
    useEffect = function(v23, v24) --[[ Line: 195 ]] --[[ Name: useEffect ]]
        -- upvalues: l_ReactCurrentDispatcher_0 (copy), v1 (copy), l_console_0 (copy)
        local l_current_6 = l_ReactCurrentDispatcher_0.current;
        if v1.__DEV__ and l_current_6 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        return l_current_6.useEffect(v23, v24);
    end, 
    useLayoutEffect = function(v26, v27) --[[ Line: 219 ]] --[[ Name: useLayoutEffect ]]
        -- upvalues: l_ReactCurrentDispatcher_0 (copy), v1 (copy), l_console_0 (copy)
        local l_current_7 = l_ReactCurrentDispatcher_0.current;
        if v1.__DEV__ and l_current_7 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        return l_current_7.useLayoutEffect(v26, v27);
    end, 
    useCallback = function(v29, v30) --[[ Line: 235 ]] --[[ Name: useCallback ]]
        -- upvalues: l_ReactCurrentDispatcher_0 (copy), v1 (copy), l_console_0 (copy)
        local l_current_8 = l_ReactCurrentDispatcher_0.current;
        if v1.__DEV__ and l_current_8 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        return l_current_8.useCallback(v29, v30);
    end, 
    useMemo = function(v32, v33) --[[ Line: 246 ]] --[[ Name: useMemo ]]
        -- upvalues: l_ReactCurrentDispatcher_0 (copy), v1 (copy), l_console_0 (copy)
        local l_current_9 = l_ReactCurrentDispatcher_0.current;
        if v1.__DEV__ and l_current_9 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        return l_current_9.useMemo(v32, v33);
    end, 
    useImperativeHandle = function(v35, v36, v37) --[[ Line: 261 ]] --[[ Name: useImperativeHandle ]]
        -- upvalues: l_ReactCurrentDispatcher_0 (copy), v1 (copy), l_console_0 (copy)
        local l_current_10 = l_ReactCurrentDispatcher_0.current;
        if v1.__DEV__ and l_current_10 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        return l_current_10.useImperativeHandle(v35, v36, v37);
    end, 
    useDebugValue = function(v39, v40) --[[ Line: 279 ]] --[[ Name: useDebugValue ]]
        -- upvalues: v1 (copy), l_ReactCurrentDispatcher_0 (copy), l_console_0 (copy)
        if v1.__DEV__ then
            local l_current_11 = l_ReactCurrentDispatcher_0.current;
            if v1.__DEV__ and l_current_11 == nil then
                l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
            end;
            return l_current_11.useDebugValue(v39, v40);
        else
            return nil;
        end;
    end, 
    emptyObject = {}, 
    useOpaqueIdentifier = function() --[[ Line: 304 ]]
        -- upvalues: l_ReactCurrentDispatcher_0 (copy), v1 (copy), l_console_0 (copy)
        local l_current_12 = l_ReactCurrentDispatcher_0.current;
        if v1.__DEV__ and l_current_12 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        return l_current_12.useOpaqueIdentifier();
    end, 
    useMutableSource = function(v43, v44, v45) --[[ Line: 309 ]]
        -- upvalues: l_ReactCurrentDispatcher_0 (copy), v1 (copy), l_console_0 (copy)
        local l_current_13 = l_ReactCurrentDispatcher_0.current;
        if v1.__DEV__ and l_current_13 == nil then
            l_console_0.error("Invalid hook call. Hooks can only be called inside of the body of a function component. This could happen for one of the following reasons:\n1. You might have mismatching versions of React and the renderer (such as React DOM)\n2. You might be breaking the Rules of Hooks\n3. You might have more than one copy of React in the same app\nSee https://reactjs.org/link/invalid-hook-call for tips about how to debug and fix this problem.");
        end;
        return l_current_13.useMutableSource(v43, v44, v45);
    end
};
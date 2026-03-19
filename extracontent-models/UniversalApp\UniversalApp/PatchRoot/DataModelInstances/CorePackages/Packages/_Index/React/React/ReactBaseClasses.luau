local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(l_Parent_0.Shared);
local v5 = require(script.Parent.ReactNoopUpdateQueue);
local v6 = {};
local l___DEV___0 = v1.__DEV__;
local l___COMPAT_WARNINGS___0 = v1.__COMPAT_WARNINGS__;
if l___DEV___0 then
    l_Object_0.freeze(v6);
end;
local l_UninitializedState_0 = require(l_Parent_0.Shared).UninitializedState;
local v10 = {
    isReactComponent = true
};
local function _(v11) --[[ Line: 51 ]] --[[ Name: trimPath ]]
    local v12 = string.match(v11, "%.%u[%.%w]-$");
    if v12 then
        return string.gsub(v12, "^%.", "");
    else
        return v11;
    end;
end;
local function _(v14, v15, v16) --[[ Line: 65 ]] --[[ Name: warnAboutExistingLifecycle ]]
    -- upvalues: l_console_0 (copy)
    l_console_0.warn("%s already defined '%s', but it also defining the deprecated Roact method '%s'. %s should only implement one of these methods, preferably using the non-deprecated name.", v14, v16, v15, v14);
end;
local function _(v18, v19, v20) --[[ Line: 75 ]] --[[ Name: warnAboutDeprecatedLifecycleName ]]
    -- upvalues: l___DEV___0 (copy), l___COMPAT_WARNINGS___0 (copy), l_console_0 (copy)
    if l___DEV___0 and l___COMPAT_WARNINGS___0 then
        local v21, v22 = debug.info(3, "sln");
        local l_warn_0 = l_console_0.warn;
        local v24 = "%s is using method '%s', which is no longer supported and should be updated to '%s'\nFile: %s:%s";
        local l_v18_0 = v18;
        local l_v19_0 = v19;
        local l_v20_0 = v20;
        local v28 = string.match(v21, "%.%u[%.%w]-$");
        l_warn_0(v24, l_v18_0, l_v19_0, l_v20_0, if v28 then string.gsub(v28, "^%.", "") else v21, (tostring(v22)));
    end;
end;
local v30 = {
    didMount = "componentDidMount", 
    shouldUpdate = "shouldComponentUpdate", 
    willUpdate = "UNSAFE_componentWillUpdate", 
    didUpdate = "componentDidUpdate", 
    willUnmount = "componentWillUnmount"
};
local function v49(v31, v32, v33) --[[ Line: 97 ]] --[[ Name: handleNewLifecycle ]]
    -- upvalues: v30 (copy), l_console_0 (copy), l___DEV___0 (copy), l___COMPAT_WARNINGS___0 (copy)
    if v30[v32] ~= nil then
        if v31[v30[v32]] ~= nil then
            local l___componentName_0 = v31.__componentName;
            local l_v32_0 = v32;
            local v36 = v30[v32];
            l_console_0.warn("%s already defined '%s', but it also defining the deprecated Roact method '%s'. %s should only implement one of these methods, preferably using the non-deprecated name.", l___componentName_0, v36, l_v32_0, l___componentName_0);
        elseif v32 == "willUpdate" and v31.componentWillUpdate then
            local l___componentName_1 = v31.__componentName;
            l_console_0.warn("%s already defined '%s', but it also defining the deprecated Roact method '%s'. %s should only implement one of these methods, preferably using the non-deprecated name.", l___componentName_1, "UNSAFE_componentWillUpdate", v32, l___componentName_1);
        else
            local l___componentName_2 = v31.__componentName;
            local l_v32_1 = v32;
            local v40 = v30[v32];
            if l___DEV___0 and l___COMPAT_WARNINGS___0 then
                local v41, v42 = debug.info(3, "sln");
                local l_warn_1 = l_console_0.warn;
                local v44 = "%s is using method '%s', which is no longer supported and should be updated to '%s'\nFile: %s:%s";
                local l_l___componentName_2_0 = l___componentName_2;
                local l_l_v32_1_0 = l_v32_1;
                local l_v40_0 = v40;
                local v48 = string.match(v41, "%.%u[%.%w]-$");
                l_warn_1(v44, l_l___componentName_2_0, l_l_v32_1_0, l_v40_0, if v48 then string.gsub(v48, "^%.", "") else v41, (tostring(v42)));
            end;
        end;
        v32 = v30[v32];
    end;
    rawset(v31, v32, v33);
end;
local v51 = {
    __newindex = v49, 
    __index = v10, 
    __tostring = function(v50) --[[ Line: 127 ]] --[[ Name: __tostring ]]
        return v50.__componentName;
    end
};
local v52 = setmetatable({
    __componentName = "Component"
}, v51);
local v53 = not v1.__TESTEZ_RUNNING_TEST__ and 900 or 0;
local v54 = 1;
local v55 = table.create(v53);
for _ = 1, v53 do
    table.insert(v55, {
        props = nil, 
        context = nil, 
        state = l_UninitializedState_0, 
        __refs = v6, 
        __updater = v5
    });
end;
local function v63(v57, v58, v59) --[[ Line: 163 ]] --[[ Name: setStateInInit ]]
    -- upvalues: l___DEV___0 (copy), l_console_0 (copy), l_Object_0 (copy)
    if l___DEV___0 and v59 ~= nil then
        l_console_0.warn("Received a `callback` argument to `setState` during initialization of \"%s\". The callback behavior is not supported when using `setState` in `init`.\n\nConsider defining similar behavior in a `compontentDidMount` method instead.", v57.__componentName);
    end;
    local v60 = v58 and type(v58);
    if v58 == nil or v60 ~= "table" and v60 ~= "function" then
        error("setState(...): takes an object of state variables to update or a function which returns an object of state variables.");
    end;
    local l_state_0 = v57.state;
    local v62 = nil;
    v62 = if v60 == "function" then v58(l_state_0, v57.props) else v58;
    v57.state = l_Object_0.assign({}, l_state_0, v62);
end;
v52.extend = function(v64, v65) --[[ Line: 203 ]] --[[ Name: extend ]]
    -- upvalues: l___COMPAT_WARNINGS___0 (copy), l_console_0 (copy), v54 (ref), v53 (copy), v55 (copy), l_UninitializedState_0 (copy), v6 (copy), v5 (copy), v63 (copy)
    if v65 == nil then
        if l___COMPAT_WARNINGS___0 then
            l_console_0.warn("Component:extend() accepting no arguments is deprecated, and will not be supported in a future version of Roact. Please provide an explicit name.");
        end;
        v65 = "";
    elseif type(v65) ~= "string" then
        error("Component class name must be a string");
    end;
    local v66 = {
        __componentName = v65, 
        setState = v64.setState, 
        forceUpdate = v64.forceUpdate, 
        init = nil
    };
    v66.__index = v66;
    v66.__ctor = function(v67, v68, v69) --[[ Line: 237 ]] --[[ Name: __ctor ]]
        -- upvalues: v54 (ref), v53 (ref), v55 (ref), l_UninitializedState_0 (ref), v6 (ref), v5 (ref), v66 (copy), v63 (ref)
        local v70 = nil;
        if v54 <= v53 then
            v70 = v55[v54];
            v70.props = v67;
            v70.context = v68;
            v55[v54] = nil;
            v54 = v54 + 1;
        else
            v70 = {
                props = v67, 
                context = v68, 
                state = l_UninitializedState_0, 
                __refs = v6, 
                __updater = v69 or v5
            };
        end;
        v70 = setmetatable(v70, v66);
        if v66.init and type(v66.init) == "function" then
            v70.setState = v63;
            v66.init(v70, v67, v68);
            v70.setState = nil;
        end;
        return v70;
    end;
    setmetatable(v66, (getmetatable(v64)));
    return v66;
end;
v52.setState = function(v71, v72, v73) --[[ Line: 329 ]] --[[ Name: setState ]]
    if v72 ~= nil and type(v72) ~= "table" and type(v72) ~= "function" then
        error("setState(...): takes an object of state variables to update or a function which returns an object of state variables.");
    end;
    v71.__updater.enqueueSetState(v71, v72, v73, "setState");
end;
v52.forceUpdate = function(v74, v75) --[[ Line: 358 ]] --[[ Name: forceUpdate ]]
    v74.__updater.enqueueForceUpdate(v74, v75, "forceUpdate");
end;
if l___DEV___0 then
    local v76 = {
        isMounted = {
            "isMounted", 
            "Instead, make sure to clean up subscriptions and pending requests in componentWillUnmount to prevent memory leaks."
        }, 
        replaceState = {
            "replaceState", 
            "Refactor your code to use setState instead (see https://github.com/facebook/react/issues/3236)."
        }
    };
    local function _(v77, v78) --[[ Line: 382 ]]
        -- upvalues: v52 (copy), l_console_0 (copy)
        v52[v77] = function() --[[ Line: 383 ]]
            -- upvalues: l_console_0 (ref), v78 (copy)
            l_console_0.warn("%s(...) is deprecated in plain JavaScript React classes. %s", v78[1], v78[2]);
            return nil;
        end;
    end;
    for v80, _ in v76 do
        if v76[v80] ~= nil then
            local v82 = v76[v80];
            v52[v80] = function() --[[ Line: 383 ]]
                -- upvalues: l_console_0 (copy), v82 (copy)
                l_console_0.warn("%s(...) is deprecated in plain JavaScript React classes. %s", v82[1], v82[2]);
                return nil;
            end;
        end;
    end;
end;
local v83 = v52:extend("PureComponent");
v83.extend = v52.extend;
local v84 = {
    isReactComponent = true, 
    isPureReactComponent = true
};
setmetatable(v83, {
    __newindex = v49, 
    __index = v84, 
    __tostring = function(v85) --[[ Line: 430 ]] --[[ Name: __tostring ]]
        return v85.__componentName;
    end
});
return {
    Component = v52, 
    PureComponent = v83
};
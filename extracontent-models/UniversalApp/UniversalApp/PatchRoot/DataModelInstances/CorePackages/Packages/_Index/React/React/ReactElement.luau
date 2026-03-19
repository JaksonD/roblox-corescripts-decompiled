local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local l_Error_0 = require(l_Parent_0.LuauPolyfill).Error;
local l___DEV___0 = v1.__DEV__;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(l_Parent_0.Shared);
local _ = require(script.Parent.ReactLazy);
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_REACT_ELEMENT_TYPE_0 = require(l_Parent_0.Shared).ReactSymbols.REACT_ELEMENT_TYPE;
local l_ReactCurrentOwner_0 = require(l_Parent_0.Shared).ReactSharedInternals.ReactCurrentOwner;
local v10 = {
    key = true, 
    ref = true, 
    __self = true, 
    __source = true
};
local v11 = nil;
local v12 = nil;
local v13 = nil;
if l___DEV___0 then
    v13 = {};
end;
local v14 = {};
local function _(v15) --[[ Line: 60 ]] --[[ Name: hasValidRef ]]
    -- upvalues: l___DEV___0 (copy)
    if l___DEV___0 and v15.ref ~= nil and type(v15.ref) == "table" and v15.ref.isReactWarning then
        return false;
    else
        return v15.ref ~= nil;
    end;
end;
local function _(v17) --[[ Line: 74 ]] --[[ Name: hasValidKey ]]
    -- upvalues: l___DEV___0 (copy)
    if l___DEV___0 and v17.key ~= nil and type(v17.key) == "table" and v17.key.isReactWarning then
        return false;
    else
        return v17.key ~= nil;
    end;
end;
local v19 = {
    isReactWarning = true
};
local function v25(v20, v21) --[[ Line: 93 ]] --[[ Name: defineKeyPropWarningGetter ]]
    -- upvalues: l___DEV___0 (copy), v11 (ref), l_console_0 (copy), v19 (copy)
    local function _() --[[ Line: 94 ]]
        -- upvalues: l___DEV___0 (ref), v11 (ref), l_console_0 (ref), v21 (copy)
        if l___DEV___0 and not v11 then
            v11 = true;
            l_console_0.error("%s: `key` is not a prop. Trying to access it will result in `nil` being returned. If you need to access the same value within the child component, you should pass it as a different prop. (https://reactjs.org/link/special-props)", v21);
        end;
    end;
    v20.key = nil;
    setmetatable(v20, {
        __index = function(_, v24) --[[ Line: 113 ]] --[[ Name: __index ]]
            -- upvalues: l___DEV___0 (ref), v11 (ref), l_console_0 (ref), v21 (copy), v19 (ref)
            if v24 == "key" then
                if l___DEV___0 and not v11 then
                    v11 = true;
                    l_console_0.error("%s: `key` is not a prop. Trying to access it will result in `nil` being returned. If you need to access the same value within the child component, you should pass it as a different prop. (https://reactjs.org/link/special-props)", v21);
                end;
                return v19;
            else
                return nil;
            end;
        end
    });
end;
local function v31(v26, v27) --[[ Line: 125 ]] --[[ Name: defineRefPropWarningGetter ]]
    -- upvalues: l___DEV___0 (copy), v12 (ref), l_console_0 (copy), v19 (copy)
    local function _() --[[ Line: 128 ]]
        -- upvalues: l___DEV___0 (ref), v12 (ref), l_console_0 (ref), v27 (copy)
        if l___DEV___0 and not v12 then
            v12 = true;
            l_console_0.error("%s: `ref` is not a prop. Trying to access it will result in `nil` being returned. If you need to access the same value within the child component, you should pass it as a different prop. (https://reactjs.org/link/special-props)", v27);
        end;
    end;
    v26.ref = nil;
    setmetatable(v26, {
        __index = function(_, v30) --[[ Line: 147 ]] --[[ Name: __index ]]
            -- upvalues: l___DEV___0 (ref), v12 (ref), l_console_0 (ref), v27 (copy), v19 (ref)
            if v30 == "ref" then
                if l___DEV___0 and not v12 then
                    v12 = true;
                    l_console_0.error("%s: `ref` is not a prop. Trying to access it will result in `nil` being returned. If you need to access the same value within the child component, you should pass it as a different prop. (https://reactjs.org/link/special-props)", v27);
                end;
                return v19;
            else
                return nil;
            end;
        end
    });
end;
local function v34(v32) --[[ Line: 159 ]] --[[ Name: warnIfStringRefCannotBeAutoConverted ]]
    -- upvalues: l___DEV___0 (copy), l_ReactCurrentOwner_0 (copy), l_getComponentName_0 (copy), v13 (ref)
    if l___DEV___0 and type(v32.ref) == "string" and l_ReactCurrentOwner_0.current then
        local v33 = l_getComponentName_0(l_ReactCurrentOwner_0.current.type);
        if not v13[v33] then
            error(string.format("Component \"%s\" contains the string ref \"%s\". Support for string refs has been removed. We recommend using useRef() or createRef() instead. Learn more about using refs safely here: https://reactjs.org/link/strict-mode-string-ref", v33 or "Unknown", v32.ref));
        end;
    end;
end;
local function v47(v35, v36, v37, v38, v39, v40, v41) --[[ Line: 210 ]] --[[ Name: ReactElement ]]
    -- upvalues: l_REACT_ELEMENT_TYPE_0 (copy), l___DEV___0 (copy)
    local v42 = {
        type = v35, 
        key = v36, 
        ref = v37, 
        props = v41, 
        _owner = v40, 
        ["$$typeof"] = l_REACT_ELEMENT_TYPE_0
    };
    if l___DEV___0 then
        local v43 = {
            validated = false
        };
        v42._store = setmetatable({}, {
            __index = v43, 
            __newindex = function(v44, v45, v46) --[[ Line: 247 ]] --[[ Name: __newindex ]]
                -- upvalues: v43 (copy)
                if v45 == "validated" then
                    v43.validated = v46;
                    return;
                else
                    rawset(v44, v45, v46);
                    return;
                end;
            end
        });
        setmetatable(v42, {
            __index = {
                _self = v38, 
                _source = v39
            }
        });
    end;
    return v42;
end;
v14.jsx = function(_, _, _) --[[ Line: 278 ]]
    error("JSX is currently unsupported");
end;
v14.jsxDEV = function(_, _, _, _, _) --[[ Line: 333 ]]
    error("JSX is currently unsupported");
    return nil;
end;
v14.createElement = function(v56, v57, ...) --[[ Line: 409 ]] --[[ Name: createElement ]]
    -- upvalues: l___DEV___0 (copy), v34 (copy), v25 (copy), v31 (copy), v47 (copy), l_ReactCurrentOwner_0 (copy)
    local v58 = if v57 ~= nil then table.clone(v57) else {};
    local v59 = nil;
    local v60 = nil;
    local v61 = nil;
    if v57 ~= nil then
        if (not (l___DEV___0 and v57.ref ~= nil and type(v57.ref) == "table") or not v57.ref.isReactWarning) and v57.ref ~= nil then
            v60 = v57.ref;
            if l___DEV___0 then
                v34(v57);
            end;
        end;
        if (not (l___DEV___0 and v57.key ~= nil and type(v57.key) == "table") or not v57.key.isReactWarning) and v57.key ~= nil then
            local l_key_0 = v57.key;
            v59 = if type(l_key_0) == "number" then l_key_0 else tostring(l_key_0);
        end;
        v61 = if v57.__source == nil then nil else v57.__source;
        if v58.key ~= nil then
            v58.key = nil;
        end;
        if v58.ref ~= nil then
            v58.ref = nil;
        end;
        if v58.__self ~= nil then
            v58.__self = nil;
        end;
        if v58.__source ~= nil then
            v58.__source = nil;
        end;
    end;
    local v63 = select("#", ...);
    if v63 == 1 then
        v58.children = select(1, ...);
    elseif v63 > 1 then
        local v64 = table.create(v63);
        for v65 = 1, v63 do
            table.insert(v64, (select(v65, ...)));
        end;
        if l___DEV___0 then
            table.freeze(v64);
        end;
        v58.children = v64;
    end;
    if type(v56) == "table" and v56.defaultProps then
        local l_defaultProps_0 = v56.defaultProps;
        for v67, _ in l_defaultProps_0 do
            if v58[v67] == nil then
                v58[v67] = l_defaultProps_0[v67];
            end;
        end;
    end;
    if l___DEV___0 then
        if v59 or v60 then
            local v69 = nil;
            v69 = if type(v56) == "function" then debug.info(v56, "n") or "<function>" else if type(v56) == "table" then v56.displayName or v56.name or "Unknown" else v56;
            if v59 then
                v25(v58, v69);
            end;
            if v60 then
                v31(v58, v69);
            end;
        end;
        if v61 == nil then
            v61 = {
                fileName = debug.info(3, "s"), 
                lineNumber = debug.info(3, "l")
            };
        end;
    end;
    return (v47(v56, v59, v60, nil, v61, l_ReactCurrentOwner_0.current, v58));
end;
v14.cloneAndReplaceKey = function(v70, v71) --[[ Line: 587 ]]
    -- upvalues: v47 (copy)
    return (v47(v70.type, v71, v70.ref, v70._self, v70._source, v70._owner, v70.props));
end;
v14.cloneElement = function(v72, v73, ...) --[[ Line: 608 ]]
    -- upvalues: l_Error_0 (copy), l_ReactCurrentOwner_0 (copy), l___DEV___0 (copy), v10 (copy), v47 (copy)
    if v72 == nil then
        error(l_Error_0.new("React.cloneElement(...): The argument must be a React element, but you passed " .. tostring(v72)));
    end;
    local l_props_0 = v72.props;
    local v75 = if l_props_0 ~= nil then table.clone(l_props_0) else {};
    local l_key_1 = v72.key;
    local l_ref_0 = v72.ref;
    local l__source_0 = v72._source;
    local l__owner_0 = v72._owner;
    if v73 ~= nil then
        local l_ref_1 = v73.ref;
        if l_ref_1 ~= nil then
            l_ref_0 = l_ref_1;
            l__owner_0 = l_ReactCurrentOwner_0.current;
        elseif not l___DEV___0 or v73.ref == nil or type(v73.ref) ~= "table" or not v73.ref.isReactWarning then
            local _ = v73.ref ~= nil;
        end;
        local l_key_2 = v73.key;
        if l_key_2 ~= nil then
            l_key_1 = if type(l_key_2) == "number" then l_key_2 else l_key_2 or "nil";
        elseif not l___DEV___0 or v73.key == nil or type(v73.key) ~= "table" or not v73.key.isReactWarning then
            local _ = v73.key ~= nil;
        end;
    end;
    local l_type_0 = v72.type;
    local v85 = if type(l_type_0) == "table" then l_type_0.defaultProps else nil;
    if v73 ~= nil then
        for v86, _ in v73 do
            if v73[v86] ~= nil and not v10[v86] then
                if v73[v86] == nil and v85 ~= nil then
                    v75[v86] = v85[v86];
                else
                    v75[v86] = v73[v86];
                end;
            end;
        end;
    end;
    local v88 = select("#", ...);
    if v88 == 1 then
        v75.children = select(1, ...);
    elseif v88 > 1 then
        v75.children = {
            ...
        };
    end;
    return (v47(v72.type, l_key_1, l_ref_0, nil, l__source_0, l__owner_0, v75));
end;
v14.isValidElement = function(v89) --[[ Line: 724 ]]
    -- upvalues: l_REACT_ELEMENT_TYPE_0 (copy)
    local v90 = false;
    if type(v89) == "table" then
        v90 = v89["$$typeof"] == l_REACT_ELEMENT_TYPE_0;
    end;
    return v90;
end;
return v14;
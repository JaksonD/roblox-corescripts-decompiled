local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Boolean_0 = v2.Boolean;
local l_Object_0 = v2.Object;
local l_console_0 = require(l_Parent_0.Shared).console;
local l_inspect_0 = v2.util.inspect;
local _ = require(l_Parent_0.Shared);
local l_isValidElementType_0 = require(l_Parent_0.Shared).isValidElementType;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local l_getIteratorFn_0 = l_ReactSymbols_0.getIteratorFn;
local _ = l_ReactSymbols_0.REACT_FORWARD_REF_TYPE;
local _ = l_ReactSymbols_0.REACT_MEMO_TYPE;
local l_REACT_FRAGMENT_TYPE_0 = l_ReactSymbols_0.REACT_FRAGMENT_TYPE;
local l_REACT_ELEMENT_TYPE_0 = l_ReactSymbols_0.REACT_ELEMENT_TYPE;
local l_warnAboutSpreadingKeyToJSX_0 = require(l_Parent_0.Shared).ReactFeatureFlags.warnAboutSpreadingKeyToJSX;
local l_checkPropTypes_0 = require(l_Parent_0.Shared).checkPropTypes;
local l_ReactCurrentOwner_0 = require(l_Parent_0.Shared).ReactSharedInternals.ReactCurrentOwner;
local v20 = require(script.Parent.ReactElement);
local l_isValidElement_0 = v20.isValidElement;
local l_createElement_0 = v20.createElement;
local l_cloneElement_0 = v20.cloneElement;
local l_jsxDEV_0 = v20.jsxDEV;
local l_setExtraStackFrame_0 = require(l_Parent_0.Shared).ReactSharedInternals.ReactDebugCurrentFrame.setExtraStackFrame;
local l_describeUnknownElementTypeFrameInDEV_0 = require(l_Parent_0.Shared).ReactComponentStackFrame.describeUnknownElementTypeFrameInDEV;
local v27 = {};
local function _(v28) --[[ Line: 64 ]] --[[ Name: setCurrentlyValidatingElement ]]
    -- upvalues: v1 (copy), l_describeUnknownElementTypeFrameInDEV_0 (copy), l_setExtraStackFrame_0 (copy)
    if v1.__DEV__ then
        if v28 then
            local l__owner_0 = v28._owner;
            local v30 = nil;
            if l__owner_0 then
                v30 = l__owner_0.type;
            end;
            local v31 = l_describeUnknownElementTypeFrameInDEV_0(v28.type, v28._source, v30);
            l_setExtraStackFrame_0(v31);
            return;
        else
            l_setExtraStackFrame_0(nil);
        end;
    end;
end;
local v33 = nil;
if v1.__DEV__ then
    v33 = false;
end;
local function _(v34, v35) --[[ Line: 92 ]] --[[ Name: hasOwnProperty ]]
    return v34[v35] ~= nil;
end;
local function _() --[[ Line: 96 ]] --[[ Name: getDeclarationErrorAddendum ]]
    -- upvalues: l_ReactCurrentOwner_0 (copy), l_getComponentName_0 (copy)
    if l_ReactCurrentOwner_0.current then
        local v37 = l_getComponentName_0(l_ReactCurrentOwner_0.current.type);
        if v37 then
            return "\n\nCheck the render method of `" .. v37 .. "`.";
        end;
    end;
    return "";
end;
local function _(v39) --[[ Line: 107 ]] --[[ Name: getSourceInfoErrorAddendum ]]
    if v39 ~= nil then
        return "\n\nCheck your code at " .. string.gsub(v39.fileName, "^.*[\\/]", "") .. ":" .. v39.lineNumber .. ".";
    else
        return "";
    end;
end;
local function _(v41) --[[ Line: 117 ]] --[[ Name: getSourceInfoErrorAddendumForProps ]]
    if v41 ~= nil then
        local l___source_0 = v41.__source;
        if l___source_0 ~= nil then
            return "\n\nCheck your code at " .. string.gsub(l___source_0.fileName, "^.*[\\/]", "") .. ":" .. l___source_0.lineNumber .. ".";
        else
            return "";
        end;
    else
        return "";
    end;
end;
local v44 = {};
local function v51(v45) --[[ Line: 134 ]] --[[ Name: getCurrentComponentErrorInfo ]]
    -- upvalues: l_ReactCurrentOwner_0 (copy), l_getComponentName_0 (copy), l_Boolean_0 (copy)
    local v46 = false;
    local v47;
    if l_ReactCurrentOwner_0.current then
        local v48 = l_getComponentName_0(l_ReactCurrentOwner_0.current.type);
        if v48 then
            v47 = "\n\nCheck the render method of `" .. v48 .. "`.";
            v46 = true;
        end;
    end;
    if not v46 then
        v47 = "";
    end;
    v46 = false;
    if not l_Boolean_0.toJSBoolean(v47) then
        local v49 = if typeof(v45) == "string" then v45 else if typeof(v45) == "table" then v45.displayName or v45.name else nil;
        if not v49 and typeof(v45) == "function" then
            local v50 = debug.info(v45, "n");
            v49 = if v50 ~= "" then v50 else nil;
        end;
        if v49 then
            v47 = string.format("\n\nCheck the top-level render call using <%s>.", v49);
        end;
    end;
    return v47;
end;
local function v60(v52, v53, v54) --[[ Line: 176 ]] --[[ Name: validateExplicitKey ]]
    -- upvalues: v51 (copy), v44 (copy), l_ReactCurrentOwner_0 (copy), l_getComponentName_0 (copy), v1 (copy), l_describeUnknownElementTypeFrameInDEV_0 (copy), l_setExtraStackFrame_0 (copy), l_console_0 (copy)
    if v52._store == nil or v52._store.validated then
        return;
    else
        v52._store.validated = true;
        if v52.key ~= nil ~= (v54 ~= nil) then
            return;
        else
            local v55 = v51(v53);
            if v44[v55] then
                return;
            else
                v44[v55] = true;
                local v56 = "";
                if v52 and v52._owner and v52._owner ~= l_ReactCurrentOwner_0.current then
                    v56 = string.format(" It was passed a child from %s.", (tostring(l_getComponentName_0(v52._owner.type))));
                end;
                if v1.__DEV__ then
                    if v1.__DEV__ then
                        if v52 then
                            local l__owner_1 = v52._owner;
                            local v58 = nil;
                            if l__owner_1 then
                                v58 = l__owner_1.type;
                            end;
                            local v59 = l_describeUnknownElementTypeFrameInDEV_0(v52.type, v52._source, v58);
                            l_setExtraStackFrame_0(v59);
                        else
                            l_setExtraStackFrame_0(nil);
                        end;
                    end;
                    if v52.key ~= nil and v54 ~= nil then
                        l_console_0.error("Child element received a \"key\" prop (\"%s\") in addition to a key in the \"children\" table of its parent (\"%s\"). Please provide only one key definition. When both are present, the \"key\" prop will take precedence.%s%s See https://reactjs.org/link/warning-keys for more information.", tostring(v52.key), tostring(v54), v55, v56);
                    else
                        l_console_0.error("Each child in a list should have a unique \"key\" prop.%s%s See https://reactjs.org/link/warning-keys for more information.", v55, v56);
                    end;
                    if v1.__DEV__ then
                        l_setExtraStackFrame_0(nil);
                    end;
                end;
                return;
            end;
        end;
    end;
end;
local function v68(v61, v62) --[[ Line: 251 ]] --[[ Name: validateChildKeys ]]
    -- upvalues: l_Array_0 (copy), l_isValidElement_0 (copy), v60 (copy), l_getIteratorFn_0 (copy)
    if typeof(v61) ~= "table" then
        return;
    elseif l_Array_0.isArray(v61) then
        for v63 = 1, #v61 do
            local v64 = v61[v63];
            if l_isValidElement_0(v64) then
                v60(v64, v62);
            end;
        end;
        return;
    else
        if l_isValidElement_0(v61) then
            if v61._store then
                v61._store.validated = true;
                return;
            end;
        elseif v61 then
            local v65 = l_getIteratorFn_0(v61);
            if typeof(v65) == "function" and v65 ~= v61.entries then
                local v66 = v65(v61);
                local v67 = v66.next();
                while not v67.done do
                    if l_isValidElement_0(v67.value) then
                        v60(v67.value, v62, v67.key);
                    end;
                    v67 = v66.next();
                end;
            end;
        end;
        return;
    end;
end;
local function v75(v69) --[[ Line: 294 ]] --[[ Name: validatePropTypes ]]
    -- upvalues: v1 (copy), l_getComponentName_0 (copy), l_checkPropTypes_0 (copy), v33 (ref), l_console_0 (copy)
    if v1.__DEV__ or v1.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__ then
        local l_type_0 = v69.type;
        if l_type_0 == nil or typeof(l_type_0) == "string" then
            return;
        else
            local v71 = nil;
            local v72 = nil;
            if typeof(l_type_0) == "function" then
                return;
            elseif typeof(l_type_0) == "table" then
                v71 = l_type_0.propTypes;
                v72 = l_type_0.validateProps;
                if v71 or v72 then
                    local v73 = l_getComponentName_0(l_type_0);
                    l_checkPropTypes_0(v71, v72, v69.props, "prop", v73, v69);
                elseif l_type_0.PropTypes ~= nil and not v33 then
                    v33 = true;
                    local v74 = l_getComponentName_0(l_type_0);
                    l_console_0.error("Component %s declared `PropTypes` instead of `propTypes`. Did you misspell the property assignment?", v74 or "Unknown");
                end;
                if l_type_0.getDefaultProps ~= nil then
                    l_console_0.error("getDefaultProps is only used on classic React.createClass definitions. Use a static property named `defaultProps` instead.");
                end;
            else
                return;
            end;
        end;
    end;
end;
local function v86(v76) --[[ Line: 347 ]] --[[ Name: validateFragmentProps ]]
    -- upvalues: v1 (copy), l_Object_0 (copy), l_describeUnknownElementTypeFrameInDEV_0 (copy), l_setExtraStackFrame_0 (copy), l_console_0 (copy)
    if v1.__DEV__ then
        local v77 = l_Object_0.keys(v76.props);
        for v78 = 1, #v77 do
            local v79 = v77[v78];
            if v79 ~= "children" and v79 ~= "key" then
                if v1.__DEV__ then
                    if v76 then
                        local l__owner_2 = v76._owner;
                        local v81 = nil;
                        if l__owner_2 then
                            v81 = l__owner_2.type;
                        end;
                        local v82 = l_describeUnknownElementTypeFrameInDEV_0(v76.type, v76._source, v81);
                        l_setExtraStackFrame_0(v82);
                    else
                        l_setExtraStackFrame_0(nil);
                    end;
                end;
                l_console_0.error("Invalid prop `%s` supplied to `React.Fragment`. React.Fragment can only have `key` and `children` props.", v79);
                if v1.__DEV__ then
                    l_setExtraStackFrame_0(nil);
                    break;
                else
                    break;
                end;
            end;
        end;
        if v76.ref ~= nil then
            if v1.__DEV__ then
                if v76 then
                    local l__owner_3 = v76._owner;
                    local v84 = nil;
                    if l__owner_3 then
                        v84 = l__owner_3.type;
                    end;
                    local v85 = l_describeUnknownElementTypeFrameInDEV_0(v76.type, v76._source, v84);
                    l_setExtraStackFrame_0(v85);
                else
                    l_setExtraStackFrame_0(nil);
                end;
            end;
            l_console_0.error("Invalid attribute `ref` supplied to `React.Fragment`.");
            if v1.__DEV__ then
                l_setExtraStackFrame_0(nil);
            end;
        end;
    end;
end;
local function v104(v87, v88, v89, v90, v91, v92) --[[ Line: 373 ]] --[[ Name: jsxWithValidation ]]
    -- upvalues: l_isValidElementType_0 (copy), l_Object_0 (copy), l_ReactCurrentOwner_0 (copy), l_getComponentName_0 (copy), l_Array_0 (copy), l_REACT_ELEMENT_TYPE_0 (copy), l_inspect_0 (copy), v1 (copy), l_console_0 (copy), l_jsxDEV_0 (copy), v68 (copy), l_warnAboutSpreadingKeyToJSX_0 (copy), l_REACT_FRAGMENT_TYPE_0 (copy), v86 (copy), v75 (copy)
    local v93 = false;
    local v94 = l_isValidElementType_0(v87);
    if not v94 then
        local v95 = "";
        if v87 == nil or typeof(v87) == "table" and #l_Object_0.keys(v87) == 0 then
            v95 = v95 .. " You likely forgot to export your component from the file it's defined in, or you might have mixed up default and named imports.";
        end;
        local v96 = if v91 ~= nil then "\n\nCheck your code at " .. string.gsub(v91.fileName, "^.*[\\/]", "") .. ":" .. v91.lineNumber .. "." else "";
        if v96 then
            v95 = v95 .. v96;
        else
            local l_v95_0 = v95;
            local v98;
            if l_ReactCurrentOwner_0.current then
                local v99 = l_getComponentName_0(l_ReactCurrentOwner_0.current.type);
                if v99 then
                    v98 = "\n\nCheck the render method of `" .. v99 .. "`.";
                    v93 = true;
                end;
            end;
            if not v93 then
                v98 = "";
            end;
            v93 = false;
            v95 = l_v95_0 .. v98;
        end;
        local v100 = nil;
        if v87 == nil then
            v100 = "nil";
        elseif l_Array_0.isArray(v87) then
            v100 = "array";
        elseif typeof(v87) == "table" and v87["$$typeof"] == l_REACT_ELEMENT_TYPE_0 then
            v100 = string.format("<%s />", l_getComponentName_0(v87.type) or "Unknown");
            v95 = v95 .. " Did you accidentally export a JSX literal or Element instead of a component?";
        else
            v100 = typeof(v87);
            v95 = v95 .. "\n" .. l_inspect_0(v87);
        end;
        if v1.__DEV__ then
            l_console_0.error("React.jsx: type is invalid -- expected a string (for built-in components) or a class/function (for composite components) but got: %s.%s", v100, v95);
        end;
    end;
    local v101 = l_jsxDEV_0(v87, v88, v89, v91, v92);
    if v101 == nil then
        return v101;
    else
        if v94 then
            local l_children_0 = v88.children;
            if l_children_0 ~= nil then
                if v90 then
                    if l_Array_0.isArray(l_children_0) then
                        for v103 = 1, #l_children_0 do
                            v68(l_children_0[v103], v87);
                        end;
                        l_Object_0.freeze(l_children_0);
                    elseif v1.__DEV__ then
                        l_console_0.error("React.jsx: Static children should always be an array. You are likely explicitly calling React.jsxs or React.jsxDEV. Use the Babel transform instead.");
                    end;
                else
                    v68(l_children_0, v87);
                end;
            end;
        end;
        if v1.__DEV__ and l_warnAboutSpreadingKeyToJSX_0 and v88.key ~= nil then
            l_console_0.error("React.jsx: Spreading a key to JSX is a deprecated pattern. Explicitly pass a key after spreading props in your JSX call. E.g. <%s {...props} key={key} />", l_getComponentName_0(v87) or "ComponentName");
        end;
        if v87 == l_REACT_FRAGMENT_TYPE_0 then
            v86(v101);
            return v101;
        else
            v75(v101);
            return v101;
        end;
    end;
end;
v27.jsxWithValidation = v104;
v27.jsxWithValidationStatic = function(v105, v106, v107) --[[ Line: 495 ]]
    -- upvalues: v104 (copy)
    return (v104(v105, v106, v107, true));
end;
v27.jsxWithValidationDynamic = function(v108, v109, v110) --[[ Line: 499 ]]
    -- upvalues: v104 (copy)
    return (v104(v108, v109, v110, false));
end;
v27.createElementWithValidation = function(v111, v112, ...) --[[ Line: 504 ]] --[[ Name: createElementWithValidation ]]
    -- upvalues: l_isValidElementType_0 (copy), l_Object_0 (copy), l_ReactCurrentOwner_0 (copy), l_getComponentName_0 (copy), l_Array_0 (copy), l_REACT_ELEMENT_TYPE_0 (copy), l_inspect_0 (copy), v1 (copy), l_console_0 (copy), l_createElement_0 (copy), v68 (copy), l_REACT_FRAGMENT_TYPE_0 (copy), v86 (copy), v75 (copy)
    local v113 = false;
    local v114 = l_isValidElementType_0(v111);
    if not v114 then
        local v115 = "";
        if v111 == nil or typeof(v111) == "table" and #l_Object_0.keys(v111) == 0 then
            v115 = v115 .. " You likely forgot to export your component from the file it's defined in, or you might have mixed up default and named imports.";
        end;
        local v116;
        if v112 ~= nil then
            local l___source_1 = v112.__source;
            v116 = if l___source_1 ~= nil then "\n\nCheck your code at " .. string.gsub(l___source_1.fileName, "^.*[\\/]", "") .. ":" .. l___source_1.lineNumber .. "." else "";
        else
            v116 = "";
        end;
        if v116 then
            v115 = v115 .. v116;
        else
            local l_v115_0 = v115;
            local v119;
            if l_ReactCurrentOwner_0.current then
                local v120 = l_getComponentName_0(l_ReactCurrentOwner_0.current.type);
                if v120 then
                    v119 = "\n\nCheck the render method of `" .. v120 .. "`.";
                    v113 = true;
                end;
            end;
            if not v113 then
                v119 = "";
            end;
            v113 = false;
            v115 = l_v115_0 .. v119;
        end;
        local v121 = nil;
        if v111 == nil then
            v121 = "nil";
        elseif l_Array_0.isArray(v111) then
            v121 = "array";
        elseif v111 ~= nil and typeof(v111) == "table" and v111["$$typeof"] == l_REACT_ELEMENT_TYPE_0 then
            v121 = string.format("<%s />", l_getComponentName_0(v111.type) or "Unknown");
            v115 = v115 .. " Did you accidentally export a JSX literal or Element instead of a component?";
        else
            v121 = typeof(v111);
            if v111 ~= nil then
                v115 = v115 .. "\n" .. l_inspect_0(v111);
            end;
        end;
        if v1.__DEV__ then
            l_console_0.error("React.createElement: type is invalid -- expected a string (for built-in components) or a class/function (for composite components) but got: %s.%s", v121, v115);
        end;
    end;
    local v122 = l_createElement_0(v111, v112, ...);
    if v122 == nil then
        return v122;
    else
        if v114 then
            for v123 = 1, select("#", ...) do
                v68(select(v123, ...), v111);
            end;
        end;
        if v111 == l_REACT_FRAGMENT_TYPE_0 then
            v86(v122);
            return v122;
        else
            v75(v122);
            return v122;
        end;
    end;
end;
v27.cloneElementWithValidation = function(v124, v125, ...) --[[ Line: 637 ]]
    -- upvalues: l_cloneElement_0 (copy), v68 (copy), v75 (copy)
    local v126 = {
        v124, 
        v125, 
        ...
    };
    local v127 = l_cloneElement_0(v124, v125, ...);
    for v128 = 3, #v126 do
        v68(v126[v128], v127.type);
    end;
    v75(v127);
    return v127;
end;
return v27;
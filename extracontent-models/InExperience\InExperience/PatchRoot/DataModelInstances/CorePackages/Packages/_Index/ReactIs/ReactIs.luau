local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local l_console_0 = require(l_Parent_0.Shared).console;
local v3 = {};
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local l_REACT_CONTEXT_TYPE_0 = l_ReactSymbols_0.REACT_CONTEXT_TYPE;
local l_REACT_ELEMENT_TYPE_0 = l_ReactSymbols_0.REACT_ELEMENT_TYPE;
local l_REACT_FORWARD_REF_TYPE_0 = l_ReactSymbols_0.REACT_FORWARD_REF_TYPE;
local l_REACT_FRAGMENT_TYPE_0 = l_ReactSymbols_0.REACT_FRAGMENT_TYPE;
local l_REACT_LAZY_TYPE_0 = l_ReactSymbols_0.REACT_LAZY_TYPE;
local l_REACT_MEMO_TYPE_0 = l_ReactSymbols_0.REACT_MEMO_TYPE;
local l_REACT_PORTAL_TYPE_0 = l_ReactSymbols_0.REACT_PORTAL_TYPE;
local l_REACT_PROFILER_TYPE_0 = l_ReactSymbols_0.REACT_PROFILER_TYPE;
local l_REACT_PROVIDER_TYPE_0 = l_ReactSymbols_0.REACT_PROVIDER_TYPE;
local l_REACT_STRICT_MODE_TYPE_0 = l_ReactSymbols_0.REACT_STRICT_MODE_TYPE;
local l_REACT_SUSPENSE_TYPE_0 = l_ReactSymbols_0.REACT_SUSPENSE_TYPE;
local l_REACT_SUSPENSE_LIST_TYPE_0 = l_ReactSymbols_0.REACT_SUSPENSE_LIST_TYPE;
local l_isValidElementType_0 = require(l_Parent_0.Shared).isValidElementType;
local l_REACT_BINDING_TYPE_0 = l_ReactSymbols_0.REACT_BINDING_TYPE;
local v19 = require(l_Parent_0.SafeFlags).createGetFFlag("ReactIsProtectedTypeOf", false)();
local function v27(v20) --[[ Line: 50 ]] --[[ Name: typeOf ]]
    -- upvalues: v19 (copy), l_REACT_ELEMENT_TYPE_0 (copy), l_REACT_FRAGMENT_TYPE_0 (copy), l_REACT_PROFILER_TYPE_0 (copy), l_REACT_STRICT_MODE_TYPE_0 (copy), l_REACT_SUSPENSE_TYPE_0 (copy), l_REACT_SUSPENSE_LIST_TYPE_0 (copy), l_REACT_CONTEXT_TYPE_0 (copy), l_REACT_FORWARD_REF_TYPE_0 (copy), l_REACT_LAZY_TYPE_0 (copy), l_REACT_MEMO_TYPE_0 (copy), l_REACT_PROVIDER_TYPE_0 (copy), l_REACT_PORTAL_TYPE_0 (copy), l_REACT_BINDING_TYPE_0 (copy)
    if typeof(v20) == "table" and v20 ~= nil then
        local v21 = nil;
        if v19 then
            local v22 = nil;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 58 ]]
                -- upvalues: v20 (copy)
                return v20["$$typeof"];
            end);
            v22 = l_status_0;
            v21 = l_result_0;
            if not v22 then
                return nil;
            end;
        else
            v21 = v20["$$typeof"];
        end;
        if v21 == l_REACT_ELEMENT_TYPE_0 then
            local l_type_0 = v20.type;
            if l_type_0 == l_REACT_FRAGMENT_TYPE_0 or l_type_0 == l_REACT_PROFILER_TYPE_0 or l_type_0 == l_REACT_STRICT_MODE_TYPE_0 or l_type_0 == l_REACT_SUSPENSE_TYPE_0 or l_type_0 == l_REACT_SUSPENSE_LIST_TYPE_0 then
                return l_type_0;
            else
                local v26 = l_type_0 and typeof(l_type_0) == "table" and l_type_0["$$typeof"];
                if v26 == l_REACT_CONTEXT_TYPE_0 or v26 == l_REACT_FORWARD_REF_TYPE_0 or v26 == l_REACT_LAZY_TYPE_0 or v26 == l_REACT_MEMO_TYPE_0 or v26 == l_REACT_PROVIDER_TYPE_0 then
                    return v26;
                else
                    return v21;
                end;
            end;
        elseif v21 == l_REACT_PORTAL_TYPE_0 or v21 == l_REACT_BINDING_TYPE_0 then
            return v21;
        end;
    end;
    return nil;
end;
v3.typeOf = v27;
v3.ContextConsumer = l_REACT_CONTEXT_TYPE_0;
v3.ContextProvider = l_REACT_PROVIDER_TYPE_0;
v3.Element = l_REACT_ELEMENT_TYPE_0;
v3.ForwardRef = l_REACT_FORWARD_REF_TYPE_0;
v3.Fragment = l_REACT_FRAGMENT_TYPE_0;
v3.Lazy = l_REACT_LAZY_TYPE_0;
v3.Memo = l_REACT_MEMO_TYPE_0;
v3.Portal = l_REACT_PORTAL_TYPE_0;
v3.Profiler = l_REACT_PROFILER_TYPE_0;
v3.StrictMode = l_REACT_STRICT_MODE_TYPE_0;
v3.Suspense = l_REACT_SUSPENSE_TYPE_0;
v3.Binding = l_ReactSymbols_0.REACT_BINDING_TYPE;
v3.isValidElementType = l_isValidElementType_0;
local v28 = false;
local v29 = false;
v3.isAsyncMode = function(_) --[[ Line: 183 ]] --[[ Name: isAsyncMode ]]
    -- upvalues: v1 (copy), v28 (ref), l_console_0 (copy)
    if v1.__DEV__ and not v28 then
        v28 = true;
        l_console_0.warn("The ReactIs.isAsyncMode() alias has been deprecated, and will be removed in React 18+.");
    end;
    return false;
end;
v3.isConcurrentMode = function(_) --[[ Line: 200 ]] --[[ Name: isConcurrentMode ]]
    -- upvalues: v1 (copy), v29 (ref), l_console_0 (copy)
    if v1.__DEV__ and not v29 then
        v29 = true;
        l_console_0.warn("The ReactIs.isConcurrentMode() alias has been deprecated, and will be removed in React 18+.");
    end;
    return false;
end;
v3.isContextConsumer = function(v32) --[[ Line: 217 ]] --[[ Name: isContextConsumer ]]
    -- upvalues: v27 (copy), l_REACT_CONTEXT_TYPE_0 (copy)
    return v27(v32) == l_REACT_CONTEXT_TYPE_0;
end;
v3.isContextProvider = function(v33) --[[ Line: 221 ]] --[[ Name: isContextProvider ]]
    -- upvalues: v27 (copy), l_REACT_PROVIDER_TYPE_0 (copy)
    return v27(v33) == l_REACT_PROVIDER_TYPE_0;
end;
v3.isElement = function(v34) --[[ Line: 225 ]] --[[ Name: isElement ]]
    -- upvalues: l_REACT_ELEMENT_TYPE_0 (copy)
    local v35 = false;
    if typeof(v34) == "table" then
        v35 = false;
        if v34 ~= nil then
            v35 = v34["$$typeof"] == l_REACT_ELEMENT_TYPE_0;
        end;
    end;
    return v35;
end;
v3.isForwardRef = function(v36) --[[ Line: 231 ]] --[[ Name: isForwardRef ]]
    -- upvalues: v27 (copy), l_REACT_FORWARD_REF_TYPE_0 (copy)
    return v27(v36) == l_REACT_FORWARD_REF_TYPE_0;
end;
v3.isFragment = function(v37) --[[ Line: 235 ]] --[[ Name: isFragment ]]
    -- upvalues: v27 (copy), l_REACT_FRAGMENT_TYPE_0 (copy)
    return v27(v37) == l_REACT_FRAGMENT_TYPE_0;
end;
v3.isLazy = function(v38) --[[ Line: 239 ]] --[[ Name: isLazy ]]
    -- upvalues: v27 (copy), l_REACT_LAZY_TYPE_0 (copy)
    return v27(v38) == l_REACT_LAZY_TYPE_0;
end;
v3.isMemo = function(v39) --[[ Line: 243 ]] --[[ Name: isMemo ]]
    -- upvalues: v27 (copy), l_REACT_MEMO_TYPE_0 (copy)
    return v27(v39) == l_REACT_MEMO_TYPE_0;
end;
v3.isPortal = function(v40) --[[ Line: 247 ]] --[[ Name: isPortal ]]
    -- upvalues: v27 (copy), l_REACT_PORTAL_TYPE_0 (copy)
    return v27(v40) == l_REACT_PORTAL_TYPE_0;
end;
v3.isProfiler = function(v41) --[[ Line: 251 ]] --[[ Name: isProfiler ]]
    -- upvalues: v27 (copy), l_REACT_PROFILER_TYPE_0 (copy)
    return v27(v41) == l_REACT_PROFILER_TYPE_0;
end;
v3.isStrictMode = function(v42) --[[ Line: 255 ]] --[[ Name: isStrictMode ]]
    -- upvalues: v27 (copy), l_REACT_STRICT_MODE_TYPE_0 (copy)
    return v27(v42) == l_REACT_STRICT_MODE_TYPE_0;
end;
v3.isSuspense = function(v43) --[[ Line: 259 ]] --[[ Name: isSuspense ]]
    -- upvalues: v27 (copy), l_REACT_SUSPENSE_TYPE_0 (copy)
    return v27(v43) == l_REACT_SUSPENSE_TYPE_0;
end;
v3.isBinding = function(v44) --[[ Line: 264 ]]
    -- upvalues: v27 (copy), l_REACT_BINDING_TYPE_0 (copy)
    return v27(v44) == l_REACT_BINDING_TYPE_0;
end;
return v3;
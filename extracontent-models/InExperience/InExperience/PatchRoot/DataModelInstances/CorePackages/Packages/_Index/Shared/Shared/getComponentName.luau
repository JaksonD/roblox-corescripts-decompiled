local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local v2 = require(script.Parent.console);
local v3 = require(script.Parent.ReactSymbols);
local l_REACT_CONTEXT_TYPE_0 = v3.REACT_CONTEXT_TYPE;
local l_REACT_FORWARD_REF_TYPE_0 = v3.REACT_FORWARD_REF_TYPE;
local l_REACT_FRAGMENT_TYPE_0 = v3.REACT_FRAGMENT_TYPE;
local l_REACT_PORTAL_TYPE_0 = v3.REACT_PORTAL_TYPE;
local l_REACT_MEMO_TYPE_0 = v3.REACT_MEMO_TYPE;
local l_REACT_PROFILER_TYPE_0 = v3.REACT_PROFILER_TYPE;
local l_REACT_PROVIDER_TYPE_0 = v3.REACT_PROVIDER_TYPE;
local l_REACT_STRICT_MODE_TYPE_0 = v3.REACT_STRICT_MODE_TYPE;
local l_REACT_SUSPENSE_TYPE_0 = v3.REACT_SUSPENSE_TYPE;
local l_REACT_SUSPENSE_LIST_TYPE_0 = v3.REACT_SUSPENSE_LIST_TYPE;
local l_REACT_LAZY_TYPE_0 = v3.REACT_LAZY_TYPE;
local l_REACT_BLOCK_TYPE_0 = v3.REACT_BLOCK_TYPE;
local _ = require(script.Parent.ReactTypes);
local l_describeError_0 = require(script.Parent["ErrorHandling.roblox"]).describeError;
local function _(v18, v19, v20) --[[ Line: 44 ]] --[[ Name: getWrappedName ]]
    local v21 = "<function>";
    if typeof(v19) == "table" then
        v21 = v19.displayName or v19.name or "";
    end;
    return v18.displayName or v21 ~= "" and string.format("%s(%s)", v20, v21) or v20;
end;
local function _(v23) --[[ Line: 57 ]] --[[ Name: getContextName ]]
    return v23.displayName or "Context";
end;
local function v25(v26) --[[ Line: 61 ]] --[[ Name: getComponentName ]]
    -- upvalues: v1 (copy), v2 (copy), l_REACT_FRAGMENT_TYPE_0 (copy), l_REACT_PORTAL_TYPE_0 (copy), l_REACT_PROFILER_TYPE_0 (copy), l_REACT_STRICT_MODE_TYPE_0 (copy), l_REACT_SUSPENSE_TYPE_0 (copy), l_REACT_SUSPENSE_LIST_TYPE_0 (copy), l_REACT_CONTEXT_TYPE_0 (copy), l_REACT_PROVIDER_TYPE_0 (copy), l_REACT_FORWARD_REF_TYPE_0 (copy), l_REACT_MEMO_TYPE_0 (copy), v25 (copy), l_REACT_BLOCK_TYPE_0 (copy), l_REACT_LAZY_TYPE_0 (copy), l_describeError_0 (copy)
    if v26 == nil then
        return nil;
    else
        local v27 = typeof(v26);
        if v1.__DEV__ and v27 == "table" and typeof(v26.tag) == "number" then
            v2.warn("Received an unexpected object in getComponentName(). This is likely a bug in React. Please file an issue.");
        end;
        if v27 == "function" then
            local v28 = debug.info(v26, "n");
            if v28 and string.len(v28) > 0 then
                return v28;
            else
                local v29, v30 = debug.info(v26, "sl");
                return string.format("%s:%d", v29, v30);
            end;
        elseif v27 == "string" then
            return v26;
        elseif v26 == l_REACT_FRAGMENT_TYPE_0 then
            return "Fragment";
        elseif v26 == l_REACT_PORTAL_TYPE_0 then
            return "Portal";
        elseif v26 == l_REACT_PROFILER_TYPE_0 then
            return "Profiler";
        elseif v26 == l_REACT_STRICT_MODE_TYPE_0 then
            return "StrictMode";
        elseif v26 == l_REACT_SUSPENSE_TYPE_0 then
            return "Suspense";
        elseif v26 == l_REACT_SUSPENSE_LIST_TYPE_0 then
            return "SuspenseList";
        else
            if v27 == "table" then
                local v31 = v26["$$typeof"];
                if v31 == l_REACT_CONTEXT_TYPE_0 then
                    return (v26.displayName or "Context") .. ".Consumer";
                elseif v31 == l_REACT_PROVIDER_TYPE_0 then
                    return (v26._context.displayName or "Context") .. ".Provider";
                elseif v31 == l_REACT_FORWARD_REF_TYPE_0 then
                    local l_render_0 = v26.render;
                    local v33 = "<function>";
                    if typeof(l_render_0) == "table" then
                        v33 = l_render_0.displayName or l_render_0.name or "";
                    end;
                    return v26.displayName or v33 ~= "" and string.format("%s(%s)", "ForwardRef", v33) or "ForwardRef";
                elseif v31 == l_REACT_MEMO_TYPE_0 then
                    return v25(v26.type);
                elseif v31 == l_REACT_BLOCK_TYPE_0 then
                    return v25(v26._render);
                elseif v31 == l_REACT_LAZY_TYPE_0 then
                    local l__payload_0 = v26._payload;
                    local l__init_0 = v26._init;
                    local v36, v37 = xpcall(l__init_0, l_describeError_0, l__payload_0);
                    if v36 then
                        return v25(v37);
                    else
                        return nil;
                    end;
                elseif v26.displayName then
                    return v26.displayName;
                elseif v26.name then
                    return v26.name;
                else
                    local v38 = getmetatable(v26);
                    if v38 and rawget(v38, "__tostring") then
                        return (tostring(v26));
                    end;
                end;
            end;
            return nil;
        end;
    end;
end;
return v25;
local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Shared);
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local l_getIteratorFn_0 = l_ReactSymbols_0.getIteratorFn;
local l_REACT_ELEMENT_TYPE_0 = l_ReactSymbols_0.REACT_ELEMENT_TYPE;
local l_REACT_PORTAL_TYPE_0 = l_ReactSymbols_0.REACT_PORTAL_TYPE;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local v8 = require(script.Parent.ReactElement);
local l_isValidElement_0 = v8.isValidElement;
local l_cloneAndReplaceKey_0 = v8.cloneAndReplaceKey;
local function _(v11) --[[ Line: 45 ]] --[[ Name: escape ]]
    local v12 = string.gsub(v11, "=", "=0");
    return "$" .. string.gsub(v12, ":", "=2");
end;
local function _(v14) --[[ Line: 60 ]] --[[ Name: escapeUserProvidedKey ]]
    return v14;
end;
local function _(v16, v17) --[[ Line: 73 ]] --[[ Name: getElementKey ]]
    if typeof(v16) == "table" and v16 ~= nil and v16.key ~= nil then
        local v18 = tostring(v16.key);
        local v19 = string.gsub(v18, "=", "=0");
        return "$" .. string.gsub(v19, ":", "=2");
    else
        return (tostring(v17));
    end;
end;
local function v21(v22, v23, v24, v25, v26) --[[ Line: 86 ]] --[[ Name: mapIntoArray ]]
    -- upvalues: l_REACT_ELEMENT_TYPE_0 (copy), l_REACT_PORTAL_TYPE_0 (copy), l_Array_0 (copy), v21 (copy), l_isValidElement_0 (copy), l_cloneAndReplaceKey_0 (copy), l_getIteratorFn_0 (copy)
    local v27 = typeof(v22);
    if v27 == "nil" or v27 == "boolean" or v27 == "userdata" then
        v22 = nil;
    end;
    local v28 = false;
    if v22 == nil then
        v28 = true;
    elseif v27 == "string" or v27 == "number" then
        v28 = true;
    elseif v27 == "table" then
        local v29 = v22["$$typeof"];
        if v29 == l_REACT_ELEMENT_TYPE_0 or v29 == l_REACT_PORTAL_TYPE_0 then
            v28 = true;
        end;
    end;
    if v28 then
        local l_v22_0 = v22;
        local v31 = v26(l_v22_0);
        local v32;
        if v25 == "" then
            local v33 = ".";
            local v34;
            if typeof(l_v22_0) == "table" and l_v22_0 ~= nil and l_v22_0.key ~= nil then
                local v35 = tostring(l_v22_0.key);
                local v36 = string.gsub(v35, "=", "=0");
                v34 = "$" .. string.gsub(v36, ":", "=2");
            else
                v34 = tostring(1);
            end;
            v32 = v33 .. v34;
        else
            v32 = v25;
        end;
        if l_Array_0.isArray(v31) then
            local v37 = "";
            if v32 ~= nil then
                v37 = v32 .. "/";
            end;
            v21(v31, v23, v37, "", function(v38) --[[ Line: 135 ]]
                return v38;
            end);
        elseif v31 ~= nil then
            if l_isValidElement_0(v31) then
                local l_key_0 = v31.key;
                v31 = l_cloneAndReplaceKey_0(v31, v24 .. (if l_key_0 and (not l_v22_0 or l_v22_0.key ~= l_key_0) then tostring(l_key_0) .. "/" else "") .. v32);
            end;
            table.insert(v23, v31);
        end;
        return 1;
    else
        local v40 = nil;
        local v41 = nil;
        local v42 = 0;
        local v43 = v25 == "" and "." or v25 .. ":";
        if l_Array_0.isArray(v22) then
            for v44 = 1, #v22 do
                v40 = v22[v44];
                local l_v43_0 = v43;
                local l_v40_0 = v40;
                local v47;
                if typeof(l_v40_0) == "table" and l_v40_0 ~= nil and l_v40_0.key ~= nil then
                    local v48 = tostring(l_v40_0.key);
                    local v49 = string.gsub(v48, "=", "=0");
                    v47 = "$" .. string.gsub(v49, ":", "=2");
                else
                    v47 = tostring(v44);
                end;
                v41 = l_v43_0 .. v47;
                v42 = v42 + v21(v40, v23, v24, v41, v26);
            end;
            return v42;
        else
            local v50 = l_getIteratorFn_0(v22);
            if typeof(v50) == "function" then
                local v51 = v50(v22);
                local v52 = nil;
                local v53 = 1;
                v52 = v51.next();
                while not v52.done do
                    v40 = v52.value;
                    local l_v43_1 = v43;
                    local l_v40_1 = v40;
                    local l_v53_0 = v53;
                    local v57;
                    if typeof(l_v40_1) == "table" and l_v40_1 ~= nil and l_v40_1.key ~= nil then
                        local v58 = tostring(l_v40_1.key);
                        local v59 = string.gsub(v58, "=", "=0");
                        v57 = "$" .. string.gsub(v59, ":", "=2");
                    else
                        v57 = tostring(l_v53_0);
                    end;
                    v41 = l_v43_1 .. v57;
                    v53 = v53 + 1;
                    v42 = v42 + v21(v40, v23, v24, v41, v26);
                    v52 = v51.next();
                end;
            end;
            return v42;
        end;
    end;
end;
local function v67(v60, v61, _) --[[ Line: 253 ]] --[[ Name: mapChildren ]]
    -- upvalues: v21 (copy)
    if v60 == nil then
        return nil;
    else
        local v63 = {};
        local v64 = 1;
        v21(v60, v63, "", "", function(v65) --[[ Line: 263 ]]
            -- upvalues: v61 (copy), v64 (ref)
            local v66 = v61(v65, v64);
            v64 = v64 + 1;
            return v66;
        end);
        return v63;
    end;
end;
return {
    forEach = function(v68, v69, v70) --[[ Line: 305 ]] --[[ Name: forEachChildren ]]
        -- upvalues: v67 (copy)
        v67(v68, function(...) --[[ Line: 310 ]]
            -- upvalues: v69 (copy)
            v69(...);
        end, v70);
    end, 
    map = v67, 
    count = function(v71) --[[ Line: 281 ]] --[[ Name: countChildren ]]
        -- upvalues: v67 (copy)
        local v72 = 0;
        v67(v71, function() --[[ Line: 283 ]]
            -- upvalues: v72 (ref)
            v72 = v72 + 1;
        end);
        return v72;
    end, 
    only = function(v73) --[[ Line: 345 ]] --[[ Name: onlyChild ]]
        -- upvalues: l_invariant_0 (copy), l_isValidElement_0 (copy)
        l_invariant_0(l_isValidElement_0(v73), "React.Children.only expected to receive a single React element child.");
        return v73;
    end, 
    toArray = function(v74) --[[ Line: 324 ]] --[[ Name: toArray ]]
        -- upvalues: v67 (copy)
        return v67(v74, function(v75) --[[ Line: 325 ]]
            return v75;
        end) or {};
    end
};
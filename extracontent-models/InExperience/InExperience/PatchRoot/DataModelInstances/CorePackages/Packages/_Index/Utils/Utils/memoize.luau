local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v1.Boolean;
local l_WeakMap_0 = v1.WeakMap;
local v69 = {
    memoize1 = function(v4) --[[ Line: 13 ]] --[[ Name: memoize1 ]]
        -- upvalues: l_WeakMap_0 (copy)
        local v5 = l_WeakMap_0.new();
        return function(v6) --[[ Line: 18 ]]
            -- upvalues: v5 (copy), v4 (copy)
            local v7 = v5:get(v6);
            if v7 == nil then
                local v8 = v4(v6);
                v5:set(v6, v8);
                return v8;
            else
                return v7;
            end;
        end;
    end, 
    memoize2 = function(v9) --[[ Line: 37 ]] --[[ Name: memoize2 ]]
        -- upvalues: l_WeakMap_0 (copy), l_Boolean_0 (copy)
        local v10 = l_WeakMap_0.new();
        return function(v11, v12) --[[ Line: 42 ]]
            -- upvalues: v10 (copy), l_Boolean_0 (ref), l_WeakMap_0 (ref), v9 (copy)
            local v13 = v10:get(v11);
            if not l_Boolean_0.toJSBoolean(v13) then
                v13 = l_WeakMap_0.new();
                v10:set(v11, v13);
                local v14 = v9(v11, v12);
                v13:set(v12, v14);
                return v14;
            else
                local v15 = v13:get(v12);
                if v15 == nil then
                    local v16 = v9(v11, v12);
                    v13:set(v12, v16);
                    return v16;
                else
                    return v15;
                end;
            end;
        end;
    end, 
    memoize3 = function(v17) --[[ Line: 72 ]] --[[ Name: memoize3 ]]
        -- upvalues: l_WeakMap_0 (copy), l_Boolean_0 (copy)
        local v18 = l_WeakMap_0.new();
        return function(v19, v20, v21) --[[ Line: 77 ]]
            -- upvalues: v18 (copy), l_Boolean_0 (ref), l_WeakMap_0 (ref), v17 (copy)
            local v22 = v18:get(v19);
            if not l_Boolean_0.toJSBoolean(v22) then
                v22 = l_WeakMap_0.new();
                v18:set(v19, v22);
                local v23 = l_WeakMap_0.new();
                v22:set(v20, v23);
                local v24 = v17(v19, v20, v21);
                v23:set(v21, v24);
                return v24;
            else
                local v25 = v22:get(v20);
                if not l_Boolean_0.toJSBoolean(v25) then
                    v25 = l_WeakMap_0.new();
                    v22:set(v20, v25);
                    local v26 = v17(v19, v20, v21);
                    v25:set(v21, v26);
                    return v26;
                else
                    local v27 = v25:get(v21);
                    if v27 == nil then
                        local v28 = v17(v19, v20, v21);
                        v25:set(v21, v28);
                        return v28;
                    else
                        return v27;
                    end;
                end;
            end;
        end;
    end, 
    memoize4 = function(v29) --[[ Line: 120 ]] --[[ Name: memoize4 ]]
        -- upvalues: l_WeakMap_0 (copy), l_Boolean_0 (copy)
        local v30 = l_WeakMap_0.new();
        return function(v31, v32, v33, v34) --[[ Line: 125 ]]
            -- upvalues: v30 (copy), l_Boolean_0 (ref), l_WeakMap_0 (ref), v29 (copy)
            local v35 = v30:get(v31);
            if not l_Boolean_0.toJSBoolean(v35) then
                v35 = l_WeakMap_0.new();
                v30:set(v31, v35);
                local v36 = l_WeakMap_0.new();
                v35:set(v32, v36);
                local v37 = l_WeakMap_0.new();
                v36:set(v33, v37);
                local v38 = v29(v31, v32, v33, v34);
                v37:set(v34, v38);
                return v38;
            else
                local v39 = v35:get(v32);
                if not l_Boolean_0.toJSBoolean(v39) then
                    v39 = l_WeakMap_0.new();
                    v35:set(v32, v39);
                    local v40 = l_WeakMap_0.new();
                    v39:set(v33, v40);
                    local v41 = v29(v31, v32, v33, v34);
                    v40:set(v34, v41);
                    return v41;
                else
                    local v42 = v39:get(v33);
                    if not l_Boolean_0.toJSBoolean(v42) then
                        v42 = l_WeakMap_0.new();
                        v39:set(v33, v42);
                        local v43 = v29(v31, v32, v33, v34);
                        v42:set(v34, v43);
                        return v43;
                    else
                        local v44 = v42:get(v34);
                        if v44 == nil then
                            local v45 = v29(v31, v32, v33, v34);
                            v42:set(v34, v45);
                            return v45;
                        else
                            return v44;
                        end;
                    end;
                end;
            end;
        end;
    end, 
    memoize5 = function(v46) --[[ Line: 186 ]] --[[ Name: memoize5 ]]
        -- upvalues: l_WeakMap_0 (copy), l_Boolean_0 (copy)
        local v47 = l_WeakMap_0.new();
        return function(v48, v49, v50, v51, v52) --[[ Line: 191 ]]
            -- upvalues: v47 (copy), l_Boolean_0 (ref), l_WeakMap_0 (ref), v46 (copy)
            local v53 = v47:get(v48);
            if not l_Boolean_0.toJSBoolean(v53) then
                v53 = l_WeakMap_0.new();
                v47:set(v48, v53);
                local v54 = l_WeakMap_0.new();
                v53:set(v49, v54);
                local v55 = l_WeakMap_0.new();
                v54:set(v50, v55);
                local v56 = l_WeakMap_0.new();
                v55:set(v51, v56);
                local v57 = v46(v48, v49, v50, v51, v52);
                v56:set(v52, v57);
                return v57;
            else
                local v58 = v53:get(v49);
                if not l_Boolean_0.toJSBoolean(v58) then
                    v58 = l_WeakMap_0.new();
                    v53:set(v49, v58);
                    local v59 = l_WeakMap_0.new();
                    v58:set(v50, v59);
                    local v60 = l_WeakMap_0.new();
                    v59:set(v51, v60);
                    local v61 = v46(v48, v49, v50, v51, v52);
                    v60:set(v52, v61);
                    return v61;
                else
                    local v62 = v58:get(v50);
                    if not l_Boolean_0.toJSBoolean(v62) then
                        v62 = l_WeakMap_0.new();
                        v58:set(v50, v62);
                        local v63 = l_WeakMap_0.new();
                        v62:set(v51, v63);
                        local v64 = v46(v48, v49, v50, v51, v52);
                        v63:set(v52, v64);
                        return v64;
                    else
                        local v65 = v62:get(v51);
                        if not l_Boolean_0.toJSBoolean(v65) then
                            v65 = l_WeakMap_0.new();
                            v62:set(v51, v65);
                            local v66 = v46(v48, v49, v50, v51, v52);
                            v65:set(v52, v66);
                            return v66;
                        else
                            local v67 = v65:get(v52);
                            if v67 == nil then
                                local v68 = v46(v48, v49, v50, v51, v52);
                                v65:set(v52, v68);
                                return v68;
                            else
                                return v67;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end
};
local v70 = l_WeakMap_0.new();
v69.memoize2of4 = function(v71) --[[ Line: 267 ]] --[[ Name: memoize2of4 ]]
    -- upvalues: v70 (copy), l_Boolean_0 (copy), l_WeakMap_0 (copy)
    return function(v72, v73, v74, v75) --[[ Line: 271 ]]
        -- upvalues: v70 (ref), l_Boolean_0 (ref), l_WeakMap_0 (ref), v71 (copy)
        local v76 = v70:get(v72);
        if not l_Boolean_0.toJSBoolean(v76) then
            v76 = l_WeakMap_0.new();
            v70:set(v72, v76);
            local v77 = v71(v72, v73, v74, v75);
            v76:set(v73, v77);
            return v77;
        else
            local v78 = v76:get(v73);
            if v78 == nil then
                local v79 = v71(v72, v73, v74, v75);
                v76:set(v73, v79);
                return v79;
            else
                return v78;
            end;
        end;
    end;
end;
return v69;
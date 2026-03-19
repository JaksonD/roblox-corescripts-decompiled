local v0 = {};
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Boolean_0 = v3.Boolean;
local l_instanceof_0 = v3.instanceof;
local l_Object_0 = v3.Object;
local l_Set_0 = v3.Set;
local v9 = require(l_Parent_0.luaUtils.isCallable);
local v10 = require(l_Parent_0.luaUtils.objectKeysForEach);
local l_dep_0 = require(l_Parent_0.optimism).dep;
local l_invariant_0 = require(l_Parent_0.jsutils.invariant).invariant;
local v13 = require(l_Parent_0.jsutils.equal);
local l_Trie_0 = require(l_Parent_0.wry.trie).Trie;
local v15 = require(script.Parent.Parent.Parent.utilities);
local l_isReference_0 = v15.isReference;
local l_makeReference_0 = v15.makeReference;
local l_DeepMerger_0 = v15.DeepMerger;
local l_maybeDeepFreeze_0 = v15.maybeDeepFreeze;
local l_canUseWeakMap_0 = v15.canUseWeakMap;
local l_isNonNullObject_0 = v15.isNonNullObject;
local _ = require(script.Parent.types);
local v23 = require(script.Parent.helpers);
local l_hasOwn_0 = v23.hasOwn;
local l_fieldNameFromStoreName_0 = v23.fieldNameFromStoreName;
local _ = require(script.Parent.policies);
local _ = require(script.Parent.Parent.core.types.Cache);
local _ = require(script.Parent.Parent.core.types.common);
local v29 = {};
local v30 = nil;
v30 = function() --[[ Line: 80 ]] --[[ Name: delModifier ]]
    -- upvalues: v29 (copy)
    return v29;
end;
local v31 = {};
local v32 = nil;
local v33 = nil;
local v34 = nil;
local v35 = nil;
local v36 = nil;
local v37 = {};
v37.__index = v37;
v37.new = function(v38, v39) --[[ Line: 136 ]] --[[ Name: new ]]
    -- upvalues: v37 (copy), l_maybeDeepFreeze_0 (copy), l_isReference_0 (copy), l_makeReference_0 (copy)
    local v40 = setmetatable({}, v37);
    v40.policies = v38;
    v40.group = v39;
    v40.data = {};
    v40.rootIds = {};
    v40.refs = {};
    v40.getFieldValue = function(_, v42, v43) --[[ Line: 152 ]]
        -- upvalues: l_maybeDeepFreeze_0 (ref), l_isReference_0 (ref), v40 (copy)
        return (l_maybeDeepFreeze_0(if l_isReference_0(v42) then v40:get(v42.__ref, v43) else v42 and v42[v43]));
    end;
    v40.canRead = function(_, v45) --[[ Line: 169 ]]
        -- upvalues: l_isReference_0 (ref), v40 (copy)
        if l_isReference_0(v45) then
            return v40:has(v45.__ref);
        else
            return typeof(v45) == "table";
        end;
    end;
    v40.toReference = function(_, v47, v48) --[[ Line: 181 ]]
        -- upvalues: l_makeReference_0 (ref), l_isReference_0 (ref), v40 (copy)
        if type(v47) == "string" then
            return l_makeReference_0(v47);
        elseif l_isReference_0(v47) then
            return v47;
        else
            local v49 = table.unpack(v40.policies:identify(v47), 1, 1);
            if v49 then
                local v50 = l_makeReference_0(v49);
                if v48 then
                    v40:merge(v49, v47);
                end;
                return v50;
            else
                return;
            end;
        end;
    end;
    return v40;
end;
v37.addLayer = function(_, _, _) --[[ Line: 211 ]] --[[ Name: addLayer ]]
    error("not implemented abstract method");
end;
v37.removeLayer = function(_, _) --[[ Line: 215 ]] --[[ Name: removeLayer ]]
    error("not implemented abstract method");
end;
v37.toObject = function(v56) --[[ Line: 223 ]] --[[ Name: toObject ]]
    return table.clone(v56.data);
end;
v37.has = function(v57, v58) --[[ Line: 229 ]] --[[ Name: has ]]
    return v57:lookup(v58, true) ~= nil;
end;
v37.get = function(v59, v60, v61) --[[ Line: 233 ]] --[[ Name: get ]]
    -- upvalues: l_hasOwn_0 (copy), l_Boolean_0 (copy), l_instanceof_0 (copy), v32 (ref)
    v59.group:depend(v60, v61);
    if l_hasOwn_0(v59.data, v60) then
        local v62 = v59.data[v60];
        if l_Boolean_0.toJSBoolean(v62) and l_hasOwn_0(v62, v61) then
            return v62[v61];
        end;
    end;
    if v61 == "__typename" and l_hasOwn_0(v59.policies.rootTypenamesById, v60) then
        return v59.policies.rootTypenamesById[v60];
    elseif l_instanceof_0(v59, v32) then
        return v59.parent:get(v60, v61);
    else
        return nil;
    end;
end;
v37.lookup = function(v63, v64, v65) --[[ Line: 252 ]] --[[ Name: lookup ]]
    -- upvalues: l_hasOwn_0 (copy), l_instanceof_0 (copy), v32 (ref)
    if v65 then
        v63.group:depend(v64, "__exists");
    end;
    if l_hasOwn_0(v63.data, v64) then
        return v63.data[v64];
    elseif l_instanceof_0(v63, v32) then
        return v63.parent:lookup(v64, v65);
    elseif v63.policies.rootTypenamesById[v64] then
        return {};
    else
        return nil;
    end;
end;
v37.merge = function(v66, v67, v68) --[[ Line: 281 ]] --[[ Name: merge ]]
    -- upvalues: l_isReference_0 (copy), l_invariant_0 (copy), l_DeepMerger_0 (copy), v35 (ref), v10 (copy), l_fieldNameFromStoreName_0 (copy), l_instanceof_0 (copy), v32 (ref)
    local v69 = nil;
    if l_isReference_0(v67) then
        v67 = v67.__ref;
    end;
    if l_isReference_0(v68) then
        v68 = v68.__ref;
    end;
    local v70 = nil;
    if type(v67) == "string" then
        v69 = v67;
        v70 = v66:lookup(v69);
    else
        v70 = v67;
    end;
    local v71 = nil;
    if type(v68) == "string" then
        v69 = v68;
        v71 = v66:lookup(v69);
    else
        v71 = v68;
    end;
    if not v71 then
        return;
    else
        l_invariant_0(typeof(v69) == "string", "store.merge expects a string ID");
        local v72 = l_DeepMerger_0.new(v35):merge(v70, v71);
        v66.data[v69] = v72;
        if v72 ~= v70 then
            v66.refs[v69] = nil;
            if v66.group.caching then
                local v73 = {};
                if not v70 then
                    v73.__exists = 1;
                end;
                v10(v71, function(v74) --[[ Line: 350 ]]
                    -- upvalues: v70 (ref), v72 (copy), v73 (copy), l_fieldNameFromStoreName_0 (ref), v66 (copy), l_instanceof_0 (ref), v32 (ref)
                    if not v70 or v70[v74] ~= v72[v74] then
                        v73[v74] = 1;
                        local v75 = l_fieldNameFromStoreName_0(v74);
                        if v75 ~= v74 and not v66.policies:hasKeyArgs(v72.__typename, v75) then
                            v73[v75] = 1;
                        end;
                        if v72[v74] == nil and not l_instanceof_0(v66, v32) then
                            v72[v74] = nil;
                        end;
                    end;
                end);
                if v73.__typename and (not v70 or not v70.__typename) and v66.policies.rootTypenamesById[v69] == v72.__typename then
                    v73.__typename = nil;
                end;
                v10(v73, function(v76) --[[ Line: 397 ]]
                    -- upvalues: v66 (copy), v69 (ref)
                    return v66.group:dirty(v69, v76);
                end);
            end;
        end;
        return;
    end;
end;
v37.modify = function(v77, v78, v79) --[[ Line: 405 ]] --[[ Name: modify ]]
    -- upvalues: v29 (copy), v31 (copy), l_isReference_0 (copy), l_makeReference_0 (copy), v10 (copy), l_fieldNameFromStoreName_0 (copy), v9 (copy), v30 (ref), l_maybeDeepFreeze_0 (copy), l_Object_0 (copy), l_DeepMerger_0 (copy), l_instanceof_0 (copy), v32 (ref)
    local v80 = v77:lookup(v78);
    if v80 then
        local v81 = {};
        local v82 = false;
        local v83 = true;
        local v88 = {
            DELETE = v29, 
            INVALIDATE = v31, 
            isReference = function(_, ...) --[[ Line: 418 ]] --[[ Name: isReference ]]
                -- upvalues: l_isReference_0 (ref)
                return l_isReference_0(...);
            end, 
            toReference = v77.toReference, 
            canRead = v77.canRead, 
            readField = function(_, v86, v87) --[[ Line: 423 ]] --[[ Name: readField ]]
                -- upvalues: v77 (copy), l_makeReference_0 (ref), v78 (copy)
                return v77.policies:readField(typeof(v86) == "string" and {
                    fieldName = v86, 
                    from = v87 or l_makeReference_0(v78)
                } or v86, {
                    store = v77
                });
            end
        };
        v10(v80, function(v89) --[[ Line: 440 ]]
            -- upvalues: l_fieldNameFromStoreName_0 (ref), v80 (copy), v9 (ref), v79 (copy), v30 (ref), v29 (ref), l_maybeDeepFreeze_0 (ref), l_Object_0 (ref), v88 (copy), v77 (copy), v78 (copy), v31 (ref), l_DeepMerger_0 (ref), v81 (copy), v82 (ref), v83 (ref)
            local v90 = l_fieldNameFromStoreName_0(v89);
            local v91 = v80[v89];
            if v91 == nil then
                return;
            else
                local v92 = nil;
                if v9(v79) then
                    v92 = v79;
                else
                    local l_v79_0 = v79;
                    v92 = l_v79_0[v89] or l_v79_0[v90];
                end;
                if v92 then
                    local v94 = nil;
                    v94 = if v92 == v30 then v29 else v92(not v9(v79) and v79 or nil, l_maybeDeepFreeze_0(v91), l_Object_0.assign(table.clone(v88), {
                        fieldName = v90, 
                        storeFieldName = v89, 
                        storage = v77:getStorage(v78, v89)
                    }));
                    if v94 == v31 then
                        v77.group:dirty(v78, v89);
                    else
                        if v94 == v29 then
                            v94 = l_DeepMerger_0.None;
                        end;
                        if v94 ~= v91 then
                            v81[v89] = v94;
                            v82 = true;
                            v91 = v94;
                        end;
                    end;
                end;
                if v91 ~= nil and v91 ~= l_DeepMerger_0.None then
                    v83 = false;
                end;
                return;
            end;
        end);
        if v82 then
            v77:merge(v78, v81);
            if v83 then
                if l_instanceof_0(v77, v32) then
                    v77.data[v78] = nil;
                else
                    v77.data[v78] = nil;
                end;
                v77.group:dirty(v78, "__exists");
            end;
            return true;
        else
            --[[ close >= 5 ]]
        end;
    end;
    return false;
end;
v37.delete = function(v95, v96, v97, v98) --[[ Line: 520 ]] --[[ Name: delete ]]
    -- upvalues: v30 (ref)
    local v99 = v95:lookup(v96);
    if v99 then
        local v100 = v95:getFieldValue(v99, "__typename");
        local v101 = nil;
        v101 = if v97 and v98 then v95.policies:getStoreFieldName({
            typename = v100, 
            fieldName = v97, 
            args = v98
        }) else v97;
        return v95:modify(v96, if v101 then {
            [v101] = v30
        } else v30);
    else
        return false;
    end;
end;
v37.evict = function(v102, v103) --[[ Line: 547 ]] --[[ Name: evict ]]
    -- upvalues: l_hasOwn_0 (copy), l_instanceof_0 (copy), v32 (ref)
    local v104 = false;
    if v103.id then
        if l_hasOwn_0(v102.data, v103.id) then
            v104 = v102:delete(v103.id, v103.fieldName, v103.args);
        end;
        if l_instanceof_0(v102, v32) then
            v104 = v102.parent:evict(v103) or v104;
        end;
        if v103.fieldName or v104 then
            v102.group:dirty(v103.id, v103.fieldName or "__exists");
        end;
    end;
    return v104;
end;
v37.clear = function(v105) --[[ Line: 575 ]] --[[ Name: clear ]]
    v105:replace(nil);
end;
v37.extract = function(v106) --[[ Line: 579 ]] --[[ Name: extract ]]
    -- upvalues: l_hasOwn_0 (copy), l_Array_0 (copy)
    local v107 = v106:toObject();
    local v108 = {};
    v106:getRootIdSet():forEach(function(v109) --[[ Line: 582 ]]
        -- upvalues: l_hasOwn_0 (ref), v106 (copy), v108 (copy)
        if not l_hasOwn_0(v106.policies.rootTypenamesById, v109) then
            table.insert(v108, v109);
        end;
    end);
    if #v108 > 0 then
        v107.__META = {
            extraRootIds = l_Array_0.sort(v108)
        };
    end;
    return v107;
end;
v37.replace = function(v110, v111) --[[ Line: 595 ]] --[[ Name: replace ]]
    -- upvalues: v10 (copy), l_hasOwn_0 (copy), l_Object_0 (copy), l_Array_0 (copy)
    v10(v110.data, function(v112) --[[ Line: 597 ]]
        -- upvalues: v111 (copy), l_hasOwn_0 (ref), v110 (copy)
        if not v111 or not l_hasOwn_0(v111, v112) then
            v110:delete(v112);
        end;
    end);
    if v111 ~= nil then
        local l___META_0 = v111.__META;
        local v114 = l_Object_0.assign(table.clone(v111), {
            __META = l_Object_0.None
        });
        v10(v114, function(v115) --[[ Line: 613 ]]
            -- upvalues: v110 (copy), v114 (copy)
            v110:merge(v115, v114[v115]);
        end);
        if l___META_0 ~= nil then
            l_Array_0.forEach(l___META_0.extraRootIds, v110.retain, v110);
        end;
    end;
end;
v37.getStorage = function(_, _, ...) --[[ Line: 626 ]] --[[ Name: getStorage ]]
    error("not implemented abstract method");
end;
v37.retain = function(v118, v119) --[[ Line: 630 ]] --[[ Name: retain ]]
    -- upvalues: l_Boolean_0 (copy)
    v118.rootIds[v119] = (if l_Boolean_0.toJSBoolean(v118.rootIds[v119]) then v118.rootIds[v119] else 0) + 1;
    return v118.rootIds[v119];
end;
v37.release = function(v120, v121) --[[ Line: 637 ]] --[[ Name: release ]]
    -- upvalues: l_Boolean_0 (copy)
    if v120.rootIds[v121] > 0 then
        local l_rootIds_0 = v120.rootIds;
        l_rootIds_0[v121] = l_rootIds_0[v121] - 1;
        l_rootIds_0 = v120.rootIds[v121];
        if not l_Boolean_0.toJSBoolean(l_rootIds_0) then
            v120.rootIds[v121] = nil;
        end;
        return l_rootIds_0;
    else
        return 0;
    end;
end;
v37.getRootIdSet = function(v123, v124) --[[ Line: 654 ]] --[[ Name: getRootIdSet ]]
    -- upvalues: l_Set_0 (copy), l_Array_0 (copy), l_Object_0 (copy), l_instanceof_0 (copy), v32 (ref)
    local l_v124_0 = v124;
    if v124 == nil then
        l_v124_0 = l_Set_0.new();
    end;
    l_Array_0.forEach(l_Object_0.keys(v123.rootIds), l_v124_0.add, l_v124_0);
    if l_instanceof_0(v123, v32) then
        v123.parent:getRootIdSet(l_v124_0);
        return l_v124_0;
    else
        l_Array_0.forEach(l_Object_0.keys(v123.policies.rootTypenamesById), l_v124_0.add, l_v124_0);
        return l_v124_0;
    end;
end;
v37.gc = function(v126) --[[ Line: 675 ]] --[[ Name: gc ]]
    -- upvalues: l_hasOwn_0 (copy), l_Array_0 (copy), l_Object_0 (copy), l_Boolean_0 (copy), l_instanceof_0 (copy), v32 (ref)
    local v127 = v126:getRootIdSet();
    local v128 = v126:toObject();
    for _, v130 in v127 do
        if l_hasOwn_0(v128, v130) then
            l_Array_0.forEach(l_Object_0.keys(v126:findChildRefIds(v130)), v127.add, v127);
            v128[v130] = nil;
        end;
    end;
    local v131 = l_Object_0.keys(v128);
    if l_Boolean_0.toJSBoolean(#v131) then
        local l_v126_0 = v126;
        while l_instanceof_0(l_v126_0, v32) do
            l_v126_0 = l_v126_0.parent;
        end;
        do
            local l_l_v126_0_0 = l_v126_0;
            l_Array_0.forEach(v131, function(v134) --[[ Line: 700 ]]
                -- upvalues: l_l_v126_0_0 (ref)
                return l_l_v126_0_0:delete(v134);
            end);
        end;
    end;
    return v131;
end;
v37.findChildRefIds = function(v135, v136) --[[ Line: 707 ]] --[[ Name: findChildRefIds ]]
    -- upvalues: l_hasOwn_0 (copy), l_Set_0 (copy), l_isReference_0 (copy), l_isNonNullObject_0 (copy), v10 (copy)
    if not l_hasOwn_0(v135.refs, v136) then
        v135.refs[v136] = {};
        local v137 = v135.refs[v136];
        local v138 = v135.data[v136];
        if not v138 then
            return v137;
        else
            local v139 = l_Set_0.new({
                v138
            });
            for _, v141 in v139 do
                if l_isReference_0(v141) then
                    v137[v141.__ref] = true;
                end;
                if l_isNonNullObject_0(v141) then
                    v10(v141, function(v142) --[[ Line: 736 ]]
                        -- upvalues: v141 (copy), l_isNonNullObject_0 (ref), v139 (copy)
                        local v143 = v141[v142];
                        if l_isNonNullObject_0(v143) then
                            v139:add(v143);
                        end;
                    end);
                end;
            end;
        end;
    end;
    return v135.refs[v136];
end;
v37.makeCacheKey = function(v144, ...) --[[ Line: 753 ]] --[[ Name: makeCacheKey ]]
    return v144.group.keyMaker:lookupArray({
        ...
    });
end;
v0.EntityStore = v37;
local v145 = {};
v145.__index = v145;
v145.new = function(v146, v147) --[[ Line: 784 ]] --[[ Name: new ]]
    -- upvalues: v145 (copy)
    local v148 = setmetatable({}, v145);
    v148.caching = v146;
    v148.parent = v147;
    v148.d = nil;
    v148:resetCaching();
    return v148;
end;
v145.resetCaching = function(v149) --[[ Line: 793 ]] --[[ Name: resetCaching ]]
    -- upvalues: l_dep_0 (copy), l_Trie_0 (copy), l_canUseWeakMap_0 (copy)
    v149.d = if v149.caching then l_dep_0() else nil;
    v149.keyMaker = l_Trie_0.new(l_canUseWeakMap_0);
end;
v145.depend = function(v150, v151, v152) --[[ Line: 800 ]] --[[ Name: depend ]]
    -- upvalues: v34 (ref), l_fieldNameFromStoreName_0 (copy)
    if v150.d then
        v150.d(v34(v151, v152));
        local v153 = l_fieldNameFromStoreName_0(v152);
        if v153 ~= v152 then
            v150.d(v34(v151, v153));
        end;
        if v150.parent then
            v150.parent:depend(v151, v152);
        end;
    end;
end;
v145.dirty = function(v154, v155, v156) --[[ Line: 822 ]] --[[ Name: dirty ]]
    -- upvalues: v34 (ref)
    if v154.d then
        v154.d:dirty(v34(v155, v156), v156 == "__exists" and "forget" or "setDirty");
    end;
end;
v34 = function(v157, v158) --[[ Line: 840 ]] --[[ Name: makeDepKey ]]
    return v158 .. "#" .. v157;
end;
v0.maybeDependOnExistenceOfEntity = function(v159, v160) --[[ Line: 847 ]] --[[ Name: maybeDependOnExistenceOfEntity ]]
    -- upvalues: v36 (ref)
    if v36(v159) then
        v159.group:depend(v160, "__exists");
    end;
end;
local v161 = setmetatable({}, {
    __index = v37
});
v161.__index = v161;
v161.new = function(v162) --[[ Line: 872 ]] --[[ Name: new ]]
    -- upvalues: v37 (copy), v145 (copy), v161 (copy), v33 (ref), l_Trie_0 (copy), l_canUseWeakMap_0 (copy)
    local l_policies_0 = v162.policies;
    local l_resultCaching_0 = v162.resultCaching;
    local l_seed_0 = v162.seed;
    if v162.resultCaching == nil then
        l_resultCaching_0 = true;
    end;
    local v166 = setmetatable(v37.new(l_policies_0, v145.new(l_resultCaching_0)), v161);
    v166.stump = v33.new(v166);
    v166.storageTrie = l_Trie_0.new(l_canUseWeakMap_0);
    if l_seed_0 then
        v166:replace(l_seed_0);
    end;
    return v166;
end;
v161.addLayer = function(v167, v168, v169) --[[ Line: 896 ]] --[[ Name: addLayer ]]
    return v167.stump:addLayer(v168, v169);
end;
v161.removeLayer = function(v170) --[[ Line: 903 ]] --[[ Name: removeLayer ]]
    return v170;
end;
v161.getStorage = function(v171, ...) --[[ Line: 908 ]] --[[ Name: getStorage ]]
    return v171.storageTrie:lookupArray({
        ...
    });
end;
v0.EntityStore_Root = v161;
v32 = setmetatable({}, {
    __index = v37
});
v32.__index = v32;
v32.new = function(v172, v173, v174, v175) --[[ Line: 930 ]] --[[ Name: new ]]
    -- upvalues: v37 (copy), v32 (ref)
    local v176 = setmetatable(v37.new(v173.policies, v175), v32);
    v176.id = v172;
    v176.parent = v173;
    v176.replay = v174;
    v176.group = v175;
    v174(v176, v176);
    return v176;
end;
v32.addLayer = function(v177, v178, v179) --[[ Line: 945 ]] --[[ Name: addLayer ]]
    -- upvalues: v32 (ref)
    return v32.new(v178, v177, v179, v177.group);
end;
v32.removeLayer = function(v180, v181) --[[ Line: 949 ]] --[[ Name: removeLayer ]]
    -- upvalues: v10 (copy), v13 (copy)
    local v182 = v180.parent:removeLayer(v181);
    if v181 == v180.id then
        if v180.group.caching then
            v10(v180.data, function(v183) --[[ Line: 960 ]]
                -- upvalues: v180 (copy), v182 (copy), v10 (ref), v13 (ref)
                local v184 = v180.data[v183];
                local v185 = v182.lookup(v182, v183);
                if not v185 then
                    v180:delete(v183);
                    return;
                elseif not v184 then
                    v180.group:dirty(v183, "__exists");
                    v10(v185, function(v186) --[[ Line: 982 ]]
                        -- upvalues: v180 (ref), v183 (copy)
                        v180.group:dirty(v183, v186);
                    end);
                    return;
                else
                    if v184 ~= v185 then
                        v10(v184, function(v187) --[[ Line: 991 ]]
                            -- upvalues: v13 (ref), v184 (copy), v185 (copy), v180 (ref), v183 (copy)
                            if not v13(v184[v187], v185[v187]) then
                                v180.group:dirty(v183, v187);
                            end;
                        end);
                    end;
                    return;
                end;
            end);
        end;
        return v182;
    elseif v182 == v180.parent then
        return v180;
    else
        return v182:addLayer(v180.id, v180.replay);
    end;
end;
v32.toObject = function(v188) --[[ Line: 1012 ]] --[[ Name: toObject ]]
    -- upvalues: l_Object_0 (copy)
    return l_Object_0.assign({}, v188.parent:toObject(), v188.data);
end;
v32.findChildRefIds = function(v189, v190) --[[ Line: 1016 ]] --[[ Name: findChildRefIds ]]
    -- upvalues: l_hasOwn_0 (copy), l_Object_0 (copy)
    local v191 = v189.parent:findChildRefIds(v190);
    local l___index_0 = getmetatable((getmetatable(v189))).__index;
    return l_hasOwn_0(v189.data, v190) and l_Object_0.assign({}, v191, l___index_0.findChildRefIds(v189, v190)) or v191;
end;
v32.getStorage = function(v193, ...) --[[ Line: 1025 ]] --[[ Name: getStorage ]]
    local l_parent_0 = v193.parent;
    while l_parent_0.parent do
        l_parent_0 = l_parent_0.parent;
    end;
    return l_parent_0:getStorage(...);
end;
v33 = setmetatable({}, {
    __index = v32
});
v33.__index = v33;
v33.new = function(v195) --[[ Line: 1041 ]] --[[ Name: new ]]
    -- upvalues: v32 (ref), v145 (copy), v33 (ref)
    return (setmetatable(v32.new("EntityStore.Stump", v195, function() --[[ Line: 1042 ]]

    end, v145.new(v195.group.caching, v195.group)), v33));
end;
v33.removeLayer = function(v196) --[[ Line: 1047 ]] --[[ Name: removeLayer ]]
    return v196;
end;
v33.merge = function(v197, ...) --[[ Line: 1052 ]] --[[ Name: merge ]]
    return v197.parent:merge(...);
end;
v35 = function(_, v199, v200, v201) --[[ Line: 1061 ]] --[[ Name: storeObjectReconciler ]]
    -- upvalues: v13 (copy)
    local v202 = v199[v201];
    local v203 = v200[v201];
    if v13(v202, v203) then
        return v202;
    else
        return v203;
    end;
end;
v36 = function(v204) --[[ Line: 1081 ]] --[[ Name: supportsResultCaching ]]
    local v205 = false;
    if type(v204) == "table" then
        v205 = false;
        if type(v204.group) == "table" then
            v205 = v204.group.caching == true;
        end;
    end;
    return v205;
end;
v0.supportsResultCaching = v36;
return v0;
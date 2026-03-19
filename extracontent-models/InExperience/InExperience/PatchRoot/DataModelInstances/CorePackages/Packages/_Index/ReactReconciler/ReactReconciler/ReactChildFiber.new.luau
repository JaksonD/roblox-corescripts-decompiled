local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Error_0 = v2.Error;
local l_console_0 = require(l_Parent_0.Shared).console;
local l_describeError_0 = require(l_Parent_0.Shared).describeError;
local l___DEV___0 = v1.__DEV__;
local v8 = require(l_Parent_0.SafeFlags).createGetFFlag("ReactPreventAssigningKeyToChildren")();
local _ = require(l_Parent_0.Shared);
local _ = require(l_Parent_0.React);
local _ = require(script.Parent.ReactInternalTypes);
local _ = require(script.Parent.ReactFiberLane);
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local v14 = require(script.Parent.ReactFiberFlags);
local l_Placement_0 = v14.Placement;
local l_Deletion_0 = v14.Deletion;
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local l_getIteratorFn_0 = l_ReactSymbols_0.getIteratorFn;
local l_REACT_ELEMENT_TYPE_0 = l_ReactSymbols_0.REACT_ELEMENT_TYPE;
local l_REACT_FRAGMENT_TYPE_0 = l_ReactSymbols_0.REACT_FRAGMENT_TYPE;
local l_REACT_PORTAL_TYPE_0 = l_ReactSymbols_0.REACT_PORTAL_TYPE;
local l_REACT_LAZY_TYPE_0 = l_ReactSymbols_0.REACT_LAZY_TYPE;
local l_REACT_BLOCK_TYPE_0 = l_ReactSymbols_0.REACT_BLOCK_TYPE;
local v24 = require(script.Parent.ReactWorkTags);
local _ = v24.FunctionComponent;
local _ = v24.ClassComponent;
local l_HostText_0 = v24.HostText;
local l_HostPortal_0 = v24.HostPortal;
local _ = v24.ForwardRef;
local l_Fragment_0 = v24.Fragment;
local _ = v24.SimpleMemoComponent;
local l_Block_0 = v24.Block;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_enableLazyElements_0 = l_ReactFeatureFlags_0.enableLazyElements;
local l_enableBlocksAPI_0 = l_ReactFeatureFlags_0.enableBlocksAPI;
local v37 = require(script.Parent["ReactFiber.new"]);
local l_createWorkInProgress_0 = v37.createWorkInProgress;
local l_resetWorkInProgress_0 = v37.resetWorkInProgress;
local l_createFiberFromElement_0 = v37.createFiberFromElement;
local l_createFiberFromFragment_0 = v37.createFiberFromFragment;
local l_createFiberFromText_0 = v37.createFiberFromText;
local l_createFiberFromPortal_0 = v37.createFiberFromPortal;
local l_isCompatibleFamilyForHotReloading_0 = require(script.Parent["ReactFiberHotReloading.new"]).isCompatibleFamilyForHotReloading;
local v45 = {};
local v46 = nil;
local v47 = nil;
local v48 = nil;
local function v51(_, _) --[[ Line: 97 ]]

end;
if l___DEV___0 then
    v46 = false;
    v47 = {};
    v48 = {};
    v51 = function(v52, v53) --[[ Line: 119 ]]
        -- upvalues: l_invariant_0 (copy), l_getComponentName_0 (copy), v47 (ref), l_console_0 (copy)
        if v52 == nil or type(v52) ~= "table" then
            return;
        elseif not v52._store or v52._store.validated or v52.key ~= nil then
            return;
        else
            local l_l_invariant_0_0 = l_invariant_0;
            local v55 = false;
            if v52._store ~= nil then
                v55 = type(v52._store) == "table";
            end;
            l_l_invariant_0_0(v55, "React Component in warnForMissingKey should have a _store. This error is likely caused by a bug in React. Please file an issue.");
            v52._store.validated = true;
            l_l_invariant_0_0 = l_getComponentName_0(v53.type) or "Component";
            if v47[l_l_invariant_0_0] then
                return;
            else
                v47[l_l_invariant_0_0] = true;
                l_console_0.error("Each child in a list should have a unique \"key\" prop. See https://reactjs.org/link/warning-keys for more information.");
                return;
            end;
        end;
    end;
end;
local l_isArray_0 = l_Array_0.isArray;
coerceRef = function(v57, _, v59) --[[ Line: 150 ]] --[[ Name: coerceRef ]]
    -- upvalues: l___DEV___0 (copy), l_getComponentName_0 (copy), l_Error_0 (copy)
    local l_ref_0 = v59.ref;
    if l_ref_0 ~= nil and type(l_ref_0) == "string" then
        if not v59._owner or not v59._self or v59._owner.stateNode == v59._self then
            local v61 = nil;
            v61 = if l___DEV___0 then l_getComponentName_0(v57.type) or "Component" else "<enable __DEV__ mode for component names>";
            error(l_Error_0.new(string.format("Component \"%s\" contains the string ref \"%s\". Support for string refs has been removed. We recommend using useRef() or createRef() instead. Learn more about using refs safely here: https://reactjs.org/link/strict-mode-string-ref", v61, (tostring(l_ref_0)))));
        end;
        if not v59._owner then
            error("Expected ref to be a function or an object returned by React.createRef(), or nil.");
        end;
    end;
    return l_ref_0;
end;
local function _(v62) --[[ Line: 323 ]] --[[ Name: warnOnFunctionType ]]
    -- upvalues: l___DEV___0 (copy), l_getComponentName_0 (copy), v48 (ref), l_console_0 (copy)
    if l___DEV___0 then
        local v63 = l_getComponentName_0(v62.type) or "Component";
        if v48[v63] then
            return;
        else
            v48[v63] = true;
            l_console_0.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.");
        end;
    end;
end;
resolveLazyType = function(v65) --[[ Line: 342 ]] --[[ Name: resolveLazyType ]]
    -- upvalues: l_describeError_0 (copy)
    local l__payload_0 = v65._payload;
    local l__init_0 = v65._init;
    local v68, v69 = xpcall(l__init_0, l_describeError_0, l__payload_0);
    if not v68 then
        return v65;
    else
        return v69;
    end;
end;
local function v387(v70) --[[ Line: 360 ]] --[[ Name: ChildReconciler ]]
    -- upvalues: l_Deletion_0 (copy), l_createWorkInProgress_0 (copy), l_Placement_0 (copy), l_HostText_0 (copy), l_createFiberFromText_0 (copy), l___DEV___0 (copy), l_isCompatibleFamilyForHotReloading_0 (copy), l_enableBlocksAPI_0 (copy), l_Block_0 (copy), l_REACT_LAZY_TYPE_0 (copy), l_REACT_BLOCK_TYPE_0 (copy), l_createFiberFromElement_0 (copy), l_HostPortal_0 (copy), l_createFiberFromPortal_0 (copy), l_Fragment_0 (copy), l_createFiberFromFragment_0 (copy), l_REACT_ELEMENT_TYPE_0 (copy), l_REACT_PORTAL_TYPE_0 (copy), l_enableLazyElements_0 (copy), l_getComponentName_0 (copy), v48 (ref), l_console_0 (copy), l_REACT_FRAGMENT_TYPE_0 (copy), v51 (ref), v8 (copy), v46 (ref), l_isArray_0 (copy), l_getIteratorFn_0 (copy)
    local function _(v71, v72) --[[ Line: 361 ]] --[[ Name: deleteChild ]]
        -- upvalues: v70 (copy), l_Deletion_0 (ref)
        if not v70 then
            return;
        else
            local l_deletions_0 = v71.deletions;
            if l_deletions_0 == nil then
                v71.deletions = {
                    v72
                };
                v71.flags = bit32.bor(v71.flags, l_Deletion_0);
                return;
            else
                table.insert(l_deletions_0, v72);
                return;
            end;
        end;
    end;
    local function _(v75, v76) --[[ Line: 375 ]] --[[ Name: deleteRemainingChildren ]]
        -- upvalues: v70 (copy), l_Deletion_0 (ref)
        if not v70 then
            return nil;
        else
            local l_v76_0 = v76;
            while l_v76_0 ~= nil do
                local l_l_v76_0_0 = l_v76_0;
                if v70 then
                    local l_deletions_1 = v75.deletions;
                    if l_deletions_1 == nil then
                        v75.deletions = {
                            l_l_v76_0_0
                        };
                        v75.flags = bit32.bor(v75.flags, l_Deletion_0);
                    else
                        table.insert(l_deletions_1, l_l_v76_0_0);
                    end;
                end;
                l_v76_0 = l_v76_0.sibling;
            end;
            return nil;
        end;
    end;
    local function v85(_, v82) --[[ Line: 394 ]] --[[ Name: mapRemainingChildren ]]
        local v83 = {};
        local l_v82_0 = v82;
        while l_v82_0 ~= nil do
            if l_v82_0.key ~= nil then
                v83[l_v82_0.key] = l_v82_0;
            else
                v83[l_v82_0.index] = l_v82_0;
            end;
            l_v82_0 = l_v82_0.sibling;
        end;
        return v83;
    end;
    local function _(v86, v87) --[[ Line: 416 ]] --[[ Name: useFiber ]]
        -- upvalues: l_createWorkInProgress_0 (ref)
        local v88 = l_createWorkInProgress_0(v86, v87);
        v88.index = 1;
        v88.sibling = nil;
        return v88;
    end;
    local function _(v90, v91, v92) --[[ Line: 426 ]] --[[ Name: placeChild ]]
        -- upvalues: v70 (copy), l_Placement_0 (ref)
        v90.index = v92;
        if not v70 then
            return v91;
        else
            local l_alternate_0 = v90.alternate;
            if l_alternate_0 ~= nil then
                local l_index_0 = l_alternate_0.index;
                if l_index_0 < v91 then
                    v90.flags = bit32.bor(v90.flags, l_Placement_0);
                    return v91;
                else
                    return l_index_0;
                end;
            else
                v90.flags = bit32.bor(v90.flags, l_Placement_0);
                return v91;
            end;
        end;
    end;
    local function _(v96) --[[ Line: 454 ]] --[[ Name: placeSingleChild ]]
        -- upvalues: v70 (copy), l_Placement_0 (ref)
        if v70 and v96.alternate == nil then
            v96.flags = bit32.bor(v96.flags, l_Placement_0);
        end;
        return v96;
    end;
    local function _(v98, v99, v100, v101) --[[ Line: 463 ]] --[[ Name: updateTextNode ]]
        -- upvalues: l_HostText_0 (ref), l_createFiberFromText_0 (ref), l_createWorkInProgress_0 (ref)
        if v99 == nil or v99.tag ~= l_HostText_0 then
            local v102 = l_createFiberFromText_0(v100, v98.mode, v101);
            v102.return_ = v98;
            return v102;
        else
            local v103 = l_createWorkInProgress_0(v99, v100);
            v103.index = 1;
            v103.sibling = nil;
            local l_v103_0 = v103;
            l_v103_0.return_ = v98;
            return l_v103_0;
        end;
    end;
    local function v118(v106, v107, v108, v109) --[[ Line: 483 ]] --[[ Name: updateElement ]]
        -- upvalues: l___DEV___0 (ref), l_isCompatibleFamilyForHotReloading_0 (ref), l_createWorkInProgress_0 (ref), l_enableBlocksAPI_0 (ref), l_Block_0 (ref), l_REACT_LAZY_TYPE_0 (ref), l_REACT_BLOCK_TYPE_0 (ref), l_createFiberFromElement_0 (ref)
        if v107 ~= nil then
            if v107.elementType == v108.type or l___DEV___0 and l_isCompatibleFamilyForHotReloading_0(v107, v108) then
                local l_props_0 = v108.props;
                local v111 = l_createWorkInProgress_0(v107, l_props_0);
                v111.index = 1;
                v111.sibling = nil;
                local l_v111_0 = v111;
                l_v111_0.ref = coerceRef(v106, v107, v108);
                l_v111_0.return_ = v106;
                if l___DEV___0 then
                    l_v111_0._debugSource = v108._source;
                    l_v111_0._debugOwner = v108._owner;
                end;
                return l_v111_0;
            elseif l_enableBlocksAPI_0 and v107.tag == l_Block_0 then
                local l_type_0 = v108.type;
                if type(l_type_0) == "table" and l_type_0["$$typeof"] == l_REACT_LAZY_TYPE_0 then
                    l_type_0 = resolveLazyType(l_type_0);
                end;
                if l_type_0["$$typeof"] == l_REACT_BLOCK_TYPE_0 and l_type_0._render == v107.type._render then
                    local l_props_1 = v108.props;
                    local v115 = l_createWorkInProgress_0(v107, l_props_1);
                    v115.index = 1;
                    v115.sibling = nil;
                    local l_v115_0 = v115;
                    l_v115_0.return_ = v106;
                    l_v115_0.type = l_type_0;
                    if l___DEV___0 then
                        l_v115_0._debugSource = v108._source;
                        l_v115_0._debugOwner = v108._owner;
                    end;
                    return l_v115_0;
                end;
            end;
        end;
        local v117 = l_createFiberFromElement_0(v108, v106.mode, v109);
        v117.ref = coerceRef(v106, v107, v108);
        v117.return_ = v106;
        return v117;
    end;
    local function v127(v119, v120, v121, v122) --[[ Line: 534 ]] --[[ Name: updatePortal ]]
        -- upvalues: l_HostPortal_0 (ref), l_createFiberFromPortal_0 (ref), l_createWorkInProgress_0 (ref)
        if v120 == nil or v120.tag ~= l_HostPortal_0 or v120.stateNode.containerInfo ~= v121.containerInfo or v120.stateNode.implementation ~= v121.implementation then
            local v123 = l_createFiberFromPortal_0(v121, v119.mode, v122);
            v123.return_ = v119;
            return v123;
        else
            local v124 = v121.children or {};
            local v125 = l_createWorkInProgress_0(v120, v124);
            v125.index = 1;
            v125.sibling = nil;
            local l_v125_0 = v125;
            l_v125_0.return_ = v119;
            return l_v125_0;
        end;
    end;
    local function _(v128, v129, v130, v131, v132) --[[ Line: 559 ]] --[[ Name: updateFragment ]]
        -- upvalues: l_Fragment_0 (ref), l_createFiberFromFragment_0 (ref), l_createWorkInProgress_0 (ref)
        if v129 == nil or v129.tag ~= l_Fragment_0 then
            local v133 = l_createFiberFromFragment_0(v130, v128.mode, v131, v132);
            v133.return_ = v128;
            return v133;
        else
            local v134 = l_createWorkInProgress_0(v129, v130);
            v134.index = 1;
            v134.sibling = nil;
            local l_v134_0 = v134;
            l_v134_0.return_ = v128;
            return l_v134_0;
        end;
    end;
    local function _(v137, v138) --[[ Line: 586 ]] --[[ Name: assignStableKey ]]
        if v138.key == nil then
            local v139 = type(v137);
            if v139 == "string" or v139 == "number" then
                v138.key = v137;
                return;
            elseif v139 == "table" then
                v138.key = tostring(v137);
            end;
        end;
    end;
    local function v141(v142, v143, v144, v145) --[[ Line: 605 ]] --[[ Name: createChild ]]
        -- upvalues: l_REACT_ELEMENT_TYPE_0 (ref), l_createFiberFromElement_0 (ref), l_REACT_PORTAL_TYPE_0 (ref), l_createFiberFromPortal_0 (ref), l_REACT_LAZY_TYPE_0 (ref), l_enableLazyElements_0 (ref), v141 (copy), l_createFiberFromFragment_0 (ref), l_createFiberFromText_0 (ref), l___DEV___0 (ref), l_getComponentName_0 (ref), v48 (ref), l_console_0 (ref)
        if v143 == nil then
            return nil;
        else
            local v146 = type(v143);
            if v146 == "table" then
                if v143.key == nil then
                    local v147 = type(v145);
                    if v147 == "string" or v147 == "number" then
                        v143.key = v145;
                    elseif v147 == "table" then
                        v143.key = tostring(v145);
                    end;
                end;
                local v148 = v143["$$typeof"];
                if v148 == l_REACT_ELEMENT_TYPE_0 then
                    local v149 = l_createFiberFromElement_0(v143, v142.mode, v144);
                    v149.ref = coerceRef(v142, nil, v143);
                    v149.return_ = v142;
                    return v149;
                elseif v148 == l_REACT_PORTAL_TYPE_0 then
                    local v150 = l_createFiberFromPortal_0(v143, v142.mode, v144);
                    v150.return_ = v142;
                    return v150;
                elseif v148 == l_REACT_LAZY_TYPE_0 and l_enableLazyElements_0 then
                    local l__payload_1 = v143._payload;
                    local l__init_1 = v143._init;
                    return v141(v142, l__init_1(l__payload_1), v144);
                else
                    local v153 = l_createFiberFromFragment_0(v143, v142.mode, v144, nil);
                    v153.return_ = v142;
                    return v153;
                end;
            elseif v146 == "string" or v146 == "number" then
                local v154 = l_createFiberFromText_0(tostring(v143), v142.mode, v144);
                v154.return_ = v142;
                return v154;
            else
                if l___DEV___0 and v146 == "function" and l___DEV___0 then
                    local v155 = l_getComponentName_0(v142.type) or "Component";
                    if not v48[v155] then
                        v48[v155] = true;
                        l_console_0.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.");
                    end;
                end;
                return nil;
            end;
        end;
    end;
    local function v156(v157, v158, v159, v160, v161) --[[ Line: 676 ]] --[[ Name: updateSlot ]]
        -- upvalues: l_REACT_ELEMENT_TYPE_0 (ref), l_REACT_FRAGMENT_TYPE_0 (ref), l_Fragment_0 (ref), l_createFiberFromFragment_0 (ref), l_createWorkInProgress_0 (ref), v118 (copy), l_REACT_PORTAL_TYPE_0 (ref), v127 (copy), l_REACT_LAZY_TYPE_0 (ref), l_enableLazyElements_0 (ref), v156 (copy), l_HostText_0 (ref), l_createFiberFromText_0 (ref), l___DEV___0 (ref), l_getComponentName_0 (ref), v48 (ref), l_console_0 (ref)
        if v159 == nil then
            return nil;
        else
            local v162 = if v158 ~= nil then v158.key else nil;
            local v163 = type(v159);
            if v163 == "table" then
                if v159.key == nil then
                    local v164 = type(v161);
                    if v164 == "string" or v164 == "number" then
                        v159.key = v161;
                    elseif v164 == "table" then
                        v159.key = tostring(v161);
                    end;
                end;
                local v165 = v159["$$typeof"];
                if v165 == l_REACT_ELEMENT_TYPE_0 then
                    if v159.key == v162 then
                        if v159.type == l_REACT_FRAGMENT_TYPE_0 then
                            local l_children_0 = v159.props.children;
                            if v158 == nil or v158.tag ~= l_Fragment_0 then
                                local v167 = l_createFiberFromFragment_0(l_children_0, v157.mode, v160, v162);
                                v167.return_ = v157;
                                return v167;
                            else
                                local v168 = l_createWorkInProgress_0(v158, l_children_0);
                                v168.index = 1;
                                v168.sibling = nil;
                                local l_v168_0 = v168;
                                l_v168_0.return_ = v157;
                                return l_v168_0;
                            end;
                        else
                            return (v118(v157, v158, v159, v160));
                        end;
                    else
                        return nil;
                    end;
                elseif v165 == l_REACT_PORTAL_TYPE_0 then
                    if v159.key == v162 then
                        return (v127(v157, v158, v159, v160));
                    else
                        return nil;
                    end;
                elseif v165 == l_REACT_LAZY_TYPE_0 and l_enableLazyElements_0 then
                    local l__payload_2 = v159._payload;
                    local l__init_2 = v159._init;
                    return v156(v157, v158, l__init_2(l__payload_2), v160);
                elseif v162 ~= nil then
                    return nil;
                elseif v158 == nil or v158.tag ~= l_Fragment_0 then
                    local v172 = l_createFiberFromFragment_0(v159, v157.mode, v160, nil);
                    v172.return_ = v157;
                    return v172;
                else
                    local v173 = l_createWorkInProgress_0(v158, v159);
                    v173.index = 1;
                    v173.sibling = nil;
                    local l_v173_0 = v173;
                    l_v173_0.return_ = v157;
                    return l_v173_0;
                end;
            elseif v163 == "string" or v163 == "number" then
                if v162 ~= nil then
                    return nil;
                else
                    local v175 = tostring(v159);
                    if v158 == nil or v158.tag ~= l_HostText_0 then
                        local v176 = l_createFiberFromText_0(v175, v157.mode, v160);
                        v176.return_ = v157;
                        return v176;
                    else
                        local v177 = l_createWorkInProgress_0(v158, v175);
                        v177.index = 1;
                        v177.sibling = nil;
                        local l_v177_0 = v177;
                        l_v177_0.return_ = v157;
                        return l_v177_0;
                    end;
                end;
            else
                if l___DEV___0 and v163 == "function" and l___DEV___0 then
                    local v179 = l_getComponentName_0(v157.type) or "Component";
                    if not v48[v179] then
                        v48[v179] = true;
                        l_console_0.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.");
                    end;
                end;
                return nil;
            end;
        end;
    end;
    local function v180(v181, v182, v183, v184, v185, v186) --[[ Line: 764 ]] --[[ Name: updateFromMap ]]
        -- upvalues: l_REACT_ELEMENT_TYPE_0 (ref), l_REACT_FRAGMENT_TYPE_0 (ref), l_Fragment_0 (ref), l_createFiberFromFragment_0 (ref), l_createWorkInProgress_0 (ref), v118 (copy), l_REACT_PORTAL_TYPE_0 (ref), v127 (copy), l_REACT_LAZY_TYPE_0 (ref), l_enableLazyElements_0 (ref), v180 (copy), l_HostText_0 (ref), l_createFiberFromText_0 (ref), l___DEV___0 (ref), l_getComponentName_0 (ref), v48 (ref), l_console_0 (ref)
        if v184 == nil then
            return nil;
        else
            local v187 = type(v184);
            if v187 == "table" then
                if v184.key == nil then
                    local v188 = type(v186);
                    if v188 == "string" or v188 == "number" then
                        v184.key = v186;
                    elseif v188 == "table" then
                        v184.key = tostring(v186);
                    end;
                end;
                local _ = nil;
                local v190 = v184["$$typeof"];
                if v190 == l_REACT_ELEMENT_TYPE_0 then
                    local v191 = v181[if v184.key == nil then v183 else v184.key];
                    if v184.type == l_REACT_FRAGMENT_TYPE_0 then
                        local l_children_1 = v184.props.children;
                        local l_key_0 = v184.key;
                        if v191 == nil or v191.tag ~= l_Fragment_0 then
                            local v194 = l_createFiberFromFragment_0(l_children_1, v182.mode, v185, l_key_0);
                            v194.return_ = v182;
                            return v194;
                        else
                            local v195 = l_createWorkInProgress_0(v191, l_children_1);
                            v195.index = 1;
                            v195.sibling = nil;
                            local l_v195_0 = v195;
                            l_v195_0.return_ = v182;
                            return l_v195_0;
                        end;
                    else
                        return (v118(v182, v191, v184, v185));
                    end;
                elseif v190 == l_REACT_PORTAL_TYPE_0 then
                    local v197 = v181[if v184.key == nil then v183 else v184.key];
                    return (v127(v182, v197, v184, v185));
                elseif v190 == l_REACT_LAZY_TYPE_0 and l_enableLazyElements_0 then
                    local l__payload_3 = v184._payload;
                    local l__init_3 = v184._init;
                    return v180(v181, v182, v183, l__init_3(l__payload_3), v185);
                else
                    local v200 = v181[v183];
                    if v200 == nil or v200.tag ~= l_Fragment_0 then
                        local v201 = l_createFiberFromFragment_0(v184, v182.mode, v185, nil);
                        v201.return_ = v182;
                        return v201;
                    else
                        local v202 = l_createWorkInProgress_0(v200, v184);
                        v202.index = 1;
                        v202.sibling = nil;
                        local l_v202_0 = v202;
                        l_v202_0.return_ = v182;
                        return l_v202_0;
                    end;
                end;
            elseif v187 == "string" or v187 == "number" then
                local v204 = v181[v183] or nil;
                local v205 = tostring(v184);
                if v204 == nil or v204.tag ~= l_HostText_0 then
                    local v206 = l_createFiberFromText_0(v205, v182.mode, v185);
                    v206.return_ = v182;
                    return v206;
                else
                    local v207 = l_createWorkInProgress_0(v204, v205);
                    v207.index = 1;
                    v207.sibling = nil;
                    local l_v207_0 = v207;
                    l_v207_0.return_ = v182;
                    return l_v207_0;
                end;
            else
                if l___DEV___0 and v187 == "function" and l___DEV___0 then
                    local v209 = l_getComponentName_0(v182.type) or "Component";
                    if not v48[v209] then
                        v48[v209] = true;
                        l_console_0.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.");
                    end;
                end;
                return nil;
            end;
        end;
    end;
    local function v210(v211, v212, v213) --[[ Line: 858 ]] --[[ Name: warnOnInvalidKey ]]
        -- upvalues: l___DEV___0 (ref), l_REACT_ELEMENT_TYPE_0 (ref), l_REACT_PORTAL_TYPE_0 (ref), v51 (ref), l_console_0 (ref), l_REACT_LAZY_TYPE_0 (ref), l_enableLazyElements_0 (ref), v210 (copy)
        if l___DEV___0 then
            if v211 == nil or type(v211) ~= "table" then
                return v212;
            else
                local v214 = v211["$$typeof"];
                if v214 == l_REACT_ELEMENT_TYPE_0 or v214 == l_REACT_PORTAL_TYPE_0 then
                    v51(v211, v213);
                    local l_key_1 = v211.key;
                    if type(l_key_1) ~= "string" then
                        return v212;
                    elseif v212 == nil then
                        return {
                            [l_key_1] = true
                        };
                    elseif not v212[l_key_1] then
                        v212[l_key_1] = true;
                        return v212;
                    else
                        l_console_0.error("Encountered two children with the same key, `%s`. Keys should be unique so that components maintain their identity across updates. Non-unique keys may cause children to be duplicated and/or omitted \226\128\148 the behavior is unsupported and could change in a future version.", l_key_1);
                        return v212;
                    end;
                elseif v214 == l_REACT_LAZY_TYPE_0 and l_enableLazyElements_0 then
                    local l__payload_4 = v211._payload;
                    local l__init_4 = v211._init;
                    v210(l__init_4(l__payload_4), v212, v213);
                end;
            end;
        end;
        return v212;
    end;
    local function v260(v218, v219, v220, v221) --[[ Line: 900 ]] --[[ Name: reconcileChildrenArray ]]
        -- upvalues: l___DEV___0 (ref), v210 (copy), v156 (copy), v70 (copy), l_Deletion_0 (ref), l_Placement_0 (ref), v141 (copy), v85 (copy), v8 (ref), v180 (copy)
        if l___DEV___0 then
            local v222 = nil;
            for _, v224 in v220 do
                v222 = v210(v224, v222, v218);
            end;
        end;
        local v225 = nil;
        local v226 = nil;
        local l_v219_0 = v219;
        local v228 = 1;
        local v229 = 1;
        local v230 = nil;
        local v231 = #v220;
        while l_v219_0 ~= nil and v229 <= v231 do
            if v229 < l_v219_0.index then
                v230 = l_v219_0;
                l_v219_0 = nil;
            else
                v230 = l_v219_0.sibling;
            end;
            local v232 = nil;
            local v233 = v220[v229];
            v232 = if v233 ~= nil and type(v233) == "table" and v233["$$typeof"] ~= nil then v156(v218, l_v219_0, v233, v221, v229) else v156(v218, l_v219_0, v233, v221);
            if v232 == nil then
                if l_v219_0 == nil then
                    l_v219_0 = v230;
                    break;
                else
                    break;
                end;
            else
                if v70 and l_v219_0 and v232.alternate == nil then
                    local l_l_v219_0_0 = l_v219_0;
                    if v70 then
                        local l_deletions_2 = v218.deletions;
                        if l_deletions_2 == nil then
                            v218.deletions = {
                                l_l_v219_0_0
                            };
                            v218.flags = bit32.bor(v218.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_2, l_l_v219_0_0);
                        end;
                    end;
                end;
                local l_v232_0 = v232;
                local l_v228_0 = v228;
                l_v232_0.index = v229;
                if not v70 then
                    v228 = l_v228_0;
                else
                    local l_alternate_1 = l_v232_0.alternate;
                    if l_alternate_1 ~= nil then
                        local l_index_1 = l_alternate_1.index;
                        if l_index_1 < l_v228_0 then
                            l_v232_0.flags = bit32.bor(l_v232_0.flags, l_Placement_0);
                            v228 = l_v228_0;
                        else
                            v228 = l_index_1;
                        end;
                    else
                        l_v232_0.flags = bit32.bor(l_v232_0.flags, l_Placement_0);
                        v228 = l_v228_0;
                    end;
                end;
                if v226 == nil then
                    v225 = v232;
                else
                    v226.sibling = v232;
                end;
                v226 = v232;
                l_v219_0 = v230;
                v229 = v229 + 1;
            end;
        end;
        if v231 < v229 then
            local l_l_v219_0_1 = l_v219_0;
            if not v70 then
                return v225;
            else
                local l_l_l_v219_0_1_0 = l_l_v219_0_1;
                while l_l_l_v219_0_1_0 ~= nil do
                    local l_l_l_l_v219_0_1_0_0 = l_l_l_v219_0_1_0;
                    if v70 then
                        local l_deletions_3 = v218.deletions;
                        if l_deletions_3 == nil then
                            v218.deletions = {
                                l_l_l_l_v219_0_1_0_0
                            };
                            v218.flags = bit32.bor(v218.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_3, l_l_l_l_v219_0_1_0_0);
                        end;
                    end;
                    l_l_l_v219_0_1_0 = l_l_l_v219_0_1_0.sibling;
                end;
                return v225;
            end;
        elseif l_v219_0 == nil then
            while v229 <= v231 do
                local v244 = nil;
                local v245 = v220[v229];
                v244 = if v245 ~= nil and type(v245) == "table" and v245["$$typeof"] ~= nil then v141(v218, v245, v221, v229) else v141(v218, v245, v221);
                if v244 == nil then
                    v229 = v229 + 1;
                else
                    local l_v244_0 = v244;
                    local l_v228_1 = v228;
                    l_v244_0.index = v229;
                    if not v70 then
                        v228 = l_v228_1;
                    else
                        local l_alternate_2 = l_v244_0.alternate;
                        if l_alternate_2 ~= nil then
                            local l_index_2 = l_alternate_2.index;
                            if l_index_2 < l_v228_1 then
                                l_v244_0.flags = bit32.bor(l_v244_0.flags, l_Placement_0);
                                v228 = l_v228_1;
                            else
                                v228 = l_index_2;
                            end;
                        else
                            l_v244_0.flags = bit32.bor(l_v244_0.flags, l_Placement_0);
                            v228 = l_v228_1;
                        end;
                    end;
                    if v226 == nil then
                        v225 = v244;
                    else
                        v226.sibling = v244;
                    end;
                    v226 = v244;
                    v229 = v229 + 1;
                end;
            end;
            return v225;
        else
            local v250 = v85(v218, l_v219_0);
            while v229 <= v231 do
                local v251 = nil;
                local v252 = v220[v229];
                v251 = if not v8 or v252 ~= nil and type(v252) == "table" and v252["$$typeof"] ~= nil then v180(v250, v218, v229, v252, v221, v229) else v180(v250, v218, v229, v252, v221);
                if v251 ~= nil then
                    if v70 and v251.alternate ~= nil then
                        v250[if v251.key == nil then v229 else v251.key] = nil;
                    end;
                    local l_v251_0 = v251;
                    local l_v228_2 = v228;
                    l_v251_0.index = v229;
                    if not v70 then
                        v228 = l_v228_2;
                    else
                        local l_alternate_3 = l_v251_0.alternate;
                        if l_alternate_3 ~= nil then
                            local l_index_3 = l_alternate_3.index;
                            if l_index_3 < l_v228_2 then
                                l_v251_0.flags = bit32.bor(l_v251_0.flags, l_Placement_0);
                                v228 = l_v228_2;
                            else
                                v228 = l_index_3;
                            end;
                        else
                            l_v251_0.flags = bit32.bor(l_v251_0.flags, l_Placement_0);
                            v228 = l_v228_2;
                        end;
                    end;
                    if v226 == nil then
                        v225 = v251;
                    else
                        v226.sibling = v251;
                    end;
                    v226 = v251;
                end;
                v229 = v229 + 1;
            end;
            if v70 then
                for _, v258 in v250 do
                    if v70 then
                        local l_deletions_4 = v218.deletions;
                        if l_deletions_4 == nil then
                            v218.deletions = {
                                v258
                            };
                            v218.flags = bit32.bor(v218.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_4, v258);
                        end;
                    end;
                end;
            end;
            return v225;
        end;
    end;
    local function v300(v261, v262, v263, v264, v265) --[[ Line: 1127 ]] --[[ Name: reconcileChildrenIterator ]]
        -- upvalues: l___DEV___0 (ref), v46 (ref), l_console_0 (ref), v210 (copy), v156 (copy), v70 (copy), l_Deletion_0 (ref), l_Placement_0 (ref), v141 (copy), v85 (copy), v180 (copy)
        if l___DEV___0 then
            if v263.entries == v265 then
                if not v46 then
                    l_console_0.error("Using Maps as children is not supported. Use an array of keyed ReactElements instead.");
                end;
                v46 = true;
            end;
            local v266 = v265(v263);
            if v266 then
                local v267 = nil;
                local v268 = v266.next();
                while not v268.done do
                    v268 = v266.next();
                    local l_value_0 = v268.value;
                    v267 = v210(l_value_0, v267, v261);
                end;
            end;
        end;
        local v270 = v265(v263);
        local v271 = nil;
        local v272 = nil;
        local l_v262_0 = v262;
        local v274 = 1;
        local v275 = 1;
        local v276 = nil;
        local v277 = v270.next();
        while l_v262_0 ~= nil and not v277.done do
            if v275 < l_v262_0.index then
                v276 = l_v262_0;
                l_v262_0 = nil;
            else
                v276 = l_v262_0.sibling;
            end;
            local v278 = v156(v261, l_v262_0, v277.value, v264, v277.key);
            if v278 == nil then
                if l_v262_0 == nil then
                    l_v262_0 = v276;
                    break;
                else
                    break;
                end;
            else
                if v70 and l_v262_0 and v278.alternate == nil then
                    local l_l_v262_0_0 = l_v262_0;
                    if v70 then
                        local l_deletions_5 = v261.deletions;
                        if l_deletions_5 == nil then
                            v261.deletions = {
                                l_l_v262_0_0
                            };
                            v261.flags = bit32.bor(v261.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_5, l_l_v262_0_0);
                        end;
                    end;
                end;
                local l_v274_0 = v274;
                v278.index = v275;
                if not v70 then
                    v274 = l_v274_0;
                else
                    local l_alternate_4 = v278.alternate;
                    if l_alternate_4 ~= nil then
                        local l_index_4 = l_alternate_4.index;
                        if l_index_4 < l_v274_0 then
                            v278.flags = bit32.bor(v278.flags, l_Placement_0);
                            v274 = l_v274_0;
                        else
                            v274 = l_index_4;
                        end;
                    else
                        v278.flags = bit32.bor(v278.flags, l_Placement_0);
                        v274 = l_v274_0;
                    end;
                end;
                if v272 == nil then
                    v271 = v278;
                else
                    v272.sibling = v278;
                end;
                v272 = v278;
                l_v262_0 = v276;
                v275 = v275 + 1;
                v277 = v270.next();
            end;
        end;
        if v277.done then
            local l_l_v262_0_1 = l_v262_0;
            if not v70 then
                return v271;
            else
                local l_l_l_v262_0_1_0 = l_l_v262_0_1;
                while l_l_l_v262_0_1_0 ~= nil do
                    local l_l_l_l_v262_0_1_0_0 = l_l_l_v262_0_1_0;
                    if v70 then
                        local l_deletions_6 = v261.deletions;
                        if l_deletions_6 == nil then
                            v261.deletions = {
                                l_l_l_l_v262_0_1_0_0
                            };
                            v261.flags = bit32.bor(v261.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_6, l_l_l_l_v262_0_1_0_0);
                        end;
                    end;
                    l_l_l_v262_0_1_0 = l_l_l_v262_0_1_0.sibling;
                end;
                return v271;
            end;
        elseif l_v262_0 == nil then
            while not v277.done do
                local v288 = v141(v261, v277.value, v264, v277.key);
                if v288 == nil then
                    v275 = v275 + 1;
                    v277 = v270.next();
                else
                    local l_v274_1 = v274;
                    v288.index = v275;
                    if not v70 then
                        v274 = l_v274_1;
                    else
                        local l_alternate_5 = v288.alternate;
                        if l_alternate_5 ~= nil then
                            local l_index_5 = l_alternate_5.index;
                            if l_index_5 < l_v274_1 then
                                v288.flags = bit32.bor(v288.flags, l_Placement_0);
                                v274 = l_v274_1;
                            else
                                v274 = l_index_5;
                            end;
                        else
                            v288.flags = bit32.bor(v288.flags, l_Placement_0);
                            v274 = l_v274_1;
                        end;
                    end;
                    if v272 == nil then
                        v271 = v288;
                    else
                        v272.sibling = v288;
                    end;
                    v272 = v288;
                    v275 = v275 + 1;
                    v277 = v270.next();
                end;
            end;
            return v271;
        else
            local v292 = nil;
            while not v277.done do
                if not v292 then
                    v292 = v85(v261, l_v262_0);
                end;
                local v293 = v180(v292, v261, v275, v277.value, v264, v277.key);
                if v293 ~= nil then
                    if v70 and v293.alternate ~= nil then
                        if v293.key == nil then
                            v292[v275] = nil;
                        else
                            v292[v293.key] = nil;
                        end;
                    end;
                    local l_v274_2 = v274;
                    v293.index = v275;
                    if not v70 then
                        v274 = l_v274_2;
                    else
                        local l_alternate_6 = v293.alternate;
                        if l_alternate_6 ~= nil then
                            local l_index_6 = l_alternate_6.index;
                            if l_index_6 < l_v274_2 then
                                v293.flags = bit32.bor(v293.flags, l_Placement_0);
                                v274 = l_v274_2;
                            else
                                v274 = l_index_6;
                            end;
                        else
                            v293.flags = bit32.bor(v293.flags, l_Placement_0);
                            v274 = l_v274_2;
                        end;
                    end;
                    if v272 == nil then
                        v271 = v293;
                    else
                        v272.sibling = v293;
                    end;
                    v272 = v293;
                end;
                v275 = v275 + 1;
                v277 = v270.next();
            end;
            if v70 then
                for _, v298 in v292 do
                    if v70 then
                        local l_deletions_7 = v261.deletions;
                        if l_deletions_7 == nil then
                            v261.deletions = {
                                v298
                            };
                            v261.flags = bit32.bor(v261.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_7, v298);
                        end;
                    end;
                end;
            end;
            return v271;
        end;
    end;
    local function v314(v301, v302, v303, v304) --[[ Line: 1340 ]] --[[ Name: reconcileSingleTextNode ]]
        -- upvalues: l_HostText_0 (ref), v70 (copy), l_Deletion_0 (ref), l_createWorkInProgress_0 (ref), l_createFiberFromText_0 (ref)
        if v302 ~= nil and v302.tag == l_HostText_0 then
            local l_sibling_0 = v302.sibling;
            if v70 then
                local l_l_sibling_0_0 = l_sibling_0;
                while l_l_sibling_0_0 ~= nil do
                    local l_l_l_sibling_0_0_0 = l_l_sibling_0_0;
                    if v70 then
                        local l_deletions_8 = v301.deletions;
                        if l_deletions_8 == nil then
                            v301.deletions = {
                                l_l_l_sibling_0_0_0
                            };
                            v301.flags = bit32.bor(v301.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_8, l_l_l_sibling_0_0_0);
                        end;
                    end;
                    l_l_sibling_0_0 = l_l_sibling_0_0.sibling;
                end;
            end;
            local v309 = l_createWorkInProgress_0(v302, v303);
            v309.index = 1;
            v309.sibling = nil;
            l_sibling_0 = v309;
            l_sibling_0.return_ = v301;
            return l_sibling_0;
        else
            if v70 then
                local l_v302_0 = v302;
                while l_v302_0 ~= nil do
                    local l_l_v302_0_0 = l_v302_0;
                    if v70 then
                        local l_deletions_9 = v301.deletions;
                        if l_deletions_9 == nil then
                            v301.deletions = {
                                l_l_v302_0_0
                            };
                            v301.flags = bit32.bor(v301.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_9, l_l_v302_0_0);
                        end;
                    end;
                    l_v302_0 = l_v302_0.sibling;
                end;
            end;
            local v313 = l_createFiberFromText_0(v303, v301.mode, v304);
            v313.return_ = v301;
            return v313;
        end;
    end;
    local function v344(v315, v316, v317, v318) --[[ Line: 1365 ]] --[[ Name: reconcileSingleElement ]]
        -- upvalues: l_Fragment_0 (ref), l_REACT_FRAGMENT_TYPE_0 (ref), v70 (copy), l_Deletion_0 (ref), l_createWorkInProgress_0 (ref), l___DEV___0 (ref), l_isCompatibleFamilyForHotReloading_0 (ref), l_createFiberFromFragment_0 (ref), l_createFiberFromElement_0 (ref)
        local v319 = false;
        local l_key_2 = v317.key;
        local l_v316_0 = v316;
        while l_v316_0 ~= nil do
            if l_v316_0.key == l_key_2 then
                if l_v316_0.tag == l_Fragment_0 then
                    if v317.type == l_REACT_FRAGMENT_TYPE_0 then
                        local l_sibling_1 = l_v316_0.sibling;
                        if v70 then
                            local l_l_sibling_1_0 = l_sibling_1;
                            while l_l_sibling_1_0 ~= nil do
                                local l_l_l_sibling_1_0_0 = l_l_sibling_1_0;
                                if v70 then
                                    local l_deletions_10 = v315.deletions;
                                    if l_deletions_10 == nil then
                                        v315.deletions = {
                                            l_l_l_sibling_1_0_0
                                        };
                                        v315.flags = bit32.bor(v315.flags, l_Deletion_0);
                                    else
                                        table.insert(l_deletions_10, l_l_l_sibling_1_0_0);
                                    end;
                                end;
                                l_l_sibling_1_0 = l_l_sibling_1_0.sibling;
                            end;
                        end;
                        local l_l_v316_0_0 = l_v316_0;
                        local l_children_2 = v317.props.children;
                        local v328 = l_createWorkInProgress_0(l_l_v316_0_0, l_children_2);
                        v328.index = 1;
                        v328.sibling = nil;
                        l_sibling_1 = v328;
                        l_sibling_1.return_ = v315;
                        if l___DEV___0 then
                            l_sibling_1._debugSource = v317._source;
                            l_sibling_1._debugOwner = v317._owner;
                        end;
                        return l_sibling_1;
                    end;
                elseif l_v316_0.elementType == v317.type or l___DEV___0 and l_isCompatibleFamilyForHotReloading_0(l_v316_0, v317) then
                    local l_sibling_2 = l_v316_0.sibling;
                    if v70 then
                        local l_l_sibling_2_0 = l_sibling_2;
                        while l_l_sibling_2_0 ~= nil do
                            local l_l_l_sibling_2_0_0 = l_l_sibling_2_0;
                            if v70 then
                                local l_deletions_11 = v315.deletions;
                                if l_deletions_11 == nil then
                                    v315.deletions = {
                                        l_l_l_sibling_2_0_0
                                    };
                                    v315.flags = bit32.bor(v315.flags, l_Deletion_0);
                                else
                                    table.insert(l_deletions_11, l_l_l_sibling_2_0_0);
                                end;
                            end;
                            l_l_sibling_2_0 = l_l_sibling_2_0.sibling;
                        end;
                    end;
                    local l_l_v316_0_1 = l_v316_0;
                    local l_props_2 = v317.props;
                    local v335 = l_createWorkInProgress_0(l_l_v316_0_1, l_props_2);
                    v335.index = 1;
                    v335.sibling = nil;
                    l_sibling_2 = v335;
                    l_sibling_2.ref = coerceRef(v315, l_v316_0, v317);
                    l_sibling_2.return_ = v315;
                    if l___DEV___0 then
                        l_sibling_2._debugSource = v317._source;
                        l_sibling_2._debugOwner = v317._owner;
                    end;
                    return l_sibling_2;
                end;
                local l_l_v316_0_2 = l_v316_0;
                if v70 then
                    local l_l_l_v316_0_2_0 = l_l_v316_0_2;
                    repeat
                        if l_l_l_v316_0_2_0 ~= nil then
                            local l_l_l_l_v316_0_2_0_0 = l_l_l_v316_0_2_0;
                            if v70 then
                                local l_deletions_12 = v315.deletions;
                                if l_deletions_12 == nil then
                                    v315.deletions = {
                                        l_l_l_l_v316_0_2_0_0
                                    };
                                    v315.flags = bit32.bor(v315.flags, l_Deletion_0);
                                else
                                    table.insert(l_deletions_12, l_l_l_l_v316_0_2_0_0);
                                end;
                            end;
                            l_l_l_v316_0_2_0 = l_l_l_v316_0_2_0.sibling;
                        else
                            v319 = true;
                        end;
                    until v319;
                else
                    break;
                end;
            else
                local l_l_v316_0_3 = l_v316_0;
                if v70 then
                    local l_deletions_13 = v315.deletions;
                    if l_deletions_13 == nil then
                        v315.deletions = {
                            l_l_v316_0_3
                        };
                        v315.flags = bit32.bor(v315.flags, l_Deletion_0);
                    else
                        table.insert(l_deletions_13, l_l_v316_0_3);
                    end;
                end;
                l_v316_0 = l_v316_0.sibling;
            end;
            if v319 then
                break;
            end;
        end;
        v319 = false;
        if v317.type == l_REACT_FRAGMENT_TYPE_0 then
            local v342 = l_createFiberFromFragment_0(v317.props.children, v315.mode, v318, v317.key);
            v342.return_ = v315;
            return v342;
        else
            local v343 = l_createFiberFromElement_0(v317, v315.mode, v318);
            v343.ref = coerceRef(v315, v316, v317);
            v343.return_ = v315;
            return v343;
        end;
    end;
    local function v366(v345, v346, v347, v348) --[[ Line: 1460 ]] --[[ Name: reconcileSinglePortal ]]
        -- upvalues: l_HostPortal_0 (ref), v70 (copy), l_Deletion_0 (ref), l_createWorkInProgress_0 (ref), l_createFiberFromPortal_0 (ref)
        local v349 = false;
        local l_key_3 = v347.key;
        local l_v346_0 = v346;
        while l_v346_0 ~= nil do
            if l_v346_0.key == l_key_3 then
                if l_v346_0.tag == l_HostPortal_0 and l_v346_0.stateNode.containerInfo == v347.containerInfo and l_v346_0.stateNode.implementation == v347.implementation then
                    local l_sibling_3 = l_v346_0.sibling;
                    if v70 then
                        local l_l_sibling_3_0 = l_sibling_3;
                        while l_l_sibling_3_0 ~= nil do
                            local l_l_l_sibling_3_0_0 = l_l_sibling_3_0;
                            if v70 then
                                local l_deletions_14 = v345.deletions;
                                if l_deletions_14 == nil then
                                    v345.deletions = {
                                        l_l_l_sibling_3_0_0
                                    };
                                    v345.flags = bit32.bor(v345.flags, l_Deletion_0);
                                else
                                    table.insert(l_deletions_14, l_l_l_sibling_3_0_0);
                                end;
                            end;
                            l_l_sibling_3_0 = l_l_sibling_3_0.sibling;
                        end;
                    end;
                    local l_l_v346_0_0 = l_v346_0;
                    local v357 = v347.children or {};
                    local v358 = l_createWorkInProgress_0(l_l_v346_0_0, v357);
                    v358.index = 1;
                    v358.sibling = nil;
                    l_sibling_3 = v358;
                    l_sibling_3.return_ = v345;
                    return l_sibling_3;
                else
                    local l_l_v346_0_1 = l_v346_0;
                    if v70 then
                        local l_l_l_v346_0_1_0 = l_l_v346_0_1;
                        repeat
                            if l_l_l_v346_0_1_0 ~= nil then
                                local l_l_l_l_v346_0_1_0_0 = l_l_l_v346_0_1_0;
                                if v70 then
                                    local l_deletions_15 = v345.deletions;
                                    if l_deletions_15 == nil then
                                        v345.deletions = {
                                            l_l_l_l_v346_0_1_0_0
                                        };
                                        v345.flags = bit32.bor(v345.flags, l_Deletion_0);
                                    else
                                        table.insert(l_deletions_15, l_l_l_l_v346_0_1_0_0);
                                    end;
                                end;
                                l_l_l_v346_0_1_0 = l_l_l_v346_0_1_0.sibling;
                            else
                                v349 = true;
                            end;
                        until v349;
                    else
                        break;
                    end;
                end;
            else
                local l_l_v346_0_2 = l_v346_0;
                if v70 then
                    local l_deletions_16 = v345.deletions;
                    if l_deletions_16 == nil then
                        v345.deletions = {
                            l_l_v346_0_2
                        };
                        v345.flags = bit32.bor(v345.flags, l_Deletion_0);
                    else
                        table.insert(l_deletions_16, l_l_v346_0_2);
                    end;
                end;
                l_v346_0 = l_v346_0.sibling;
            end;
            if v349 then
                break;
            end;
        end;
        v349 = false;
        local v365 = l_createFiberFromPortal_0(v347, v345.mode, v348);
        v365.return_ = v345;
        return v365;
    end;
    local function v367(v368, v369, v370, v371) --[[ Line: 1499 ]] --[[ Name: reconcileChildFibers ]]
        -- upvalues: l_REACT_FRAGMENT_TYPE_0 (ref), l_isArray_0 (ref), l_REACT_ELEMENT_TYPE_0 (ref), v344 (copy), v70 (copy), l_Placement_0 (ref), l_REACT_PORTAL_TYPE_0 (ref), v366 (copy), l_REACT_LAZY_TYPE_0 (ref), l_enableLazyElements_0 (ref), v367 (copy), v260 (copy), v314 (copy), l_getIteratorFn_0 (ref), v300 (copy), l___DEV___0 (ref), l_getComponentName_0 (ref), v48 (ref), l_console_0 (ref), l_Deletion_0 (ref)
        local v372 = type(v370);
        local v373 = false;
        if v370 ~= nil then
            v373 = false;
            if v372 == "table" then
                v373 = false;
                if v370.type == l_REACT_FRAGMENT_TYPE_0 then
                    v373 = v370.key == nil;
                end;
            end;
        end;
        if v373 then
            v370 = v370.props.children;
            v372 = type(v370);
        end;
        local v374 = l_isArray_0(v370);
        local v375 = false;
        if v370 ~= nil then
            v375 = false;
            if v372 == "table" then
                v375 = not v374;
            end;
        end;
        if v375 then
            local v376 = v370["$$typeof"];
            if v376 == l_REACT_ELEMENT_TYPE_0 then
                local v377 = v344(v368, v369, v370, v371);
                if v70 and v377.alternate == nil then
                    v377.flags = bit32.bor(v377.flags, l_Placement_0);
                end;
                return v377;
            elseif v376 == l_REACT_PORTAL_TYPE_0 then
                local v378 = v366(v368, v369, v370, v371);
                if v70 and v378.alternate == nil then
                    v378.flags = bit32.bor(v378.flags, l_Placement_0);
                end;
                return v378;
            elseif v376 == l_REACT_LAZY_TYPE_0 and l_enableLazyElements_0 then
                local l__payload_5 = v370._payload;
                local l__init_5 = v370._init;
                return v367(v368, v369, l__init_5(l__payload_5), v371);
            end;
        elseif v374 then
            return (v260(v368, v369, v370, v371));
        elseif v372 == "string" or v372 == "number" then
            local v381 = v314(v368, v369, tostring(v370), v371);
            if v70 and v381.alternate == nil then
                v381.flags = bit32.bor(v381.flags, l_Placement_0);
            end;
            return v381;
        end;
        local v382 = l_getIteratorFn_0(v370);
        if v382 then
            return (v300(v368, v369, v370, v371, v382));
        else
            if l___DEV___0 and v372 == "function" and l___DEV___0 then
                local v383 = l_getComponentName_0(v368.type) or "Component";
                if not v48[v383] then
                    v48[v383] = true;
                    l_console_0.error("Functions are not valid as a React child. This may happen if you return a Component instead of <Component /> from render. Or maybe you meant to call this function rather than return it.");
                end;
            end;
            if v370 ~= nil or not v373 then

            end;
            if not v70 then
                return nil;
            else
                local l_v369_0 = v369;
                while l_v369_0 ~= nil do
                    local l_l_v369_0_0 = l_v369_0;
                    if v70 then
                        local l_deletions_17 = v368.deletions;
                        if l_deletions_17 == nil then
                            v368.deletions = {
                                l_l_v369_0_0
                            };
                            v368.flags = bit32.bor(v368.flags, l_Deletion_0);
                        else
                            table.insert(l_deletions_17, l_l_v369_0_0);
                        end;
                    end;
                    l_v369_0 = l_v369_0.sibling;
                end;
                return nil;
            end;
        end;
    end;
    return v367;
end;
v45.reconcileChildFibers = v387(true);
v45.mountChildFibers = v387(false);
v45.cloneChildFibers = function(_, v389) --[[ Line: 1647 ]]
    -- upvalues: l_createWorkInProgress_0 (copy)
    if v389.child == nil then
        return;
    else
        local l_child_0 = v389.child;
        local v391 = l_createWorkInProgress_0(l_child_0, l_child_0.pendingProps);
        v389.child = v391;
        v391.return_ = v389;
        while l_child_0.sibling ~= nil do
            l_child_0 = l_child_0.sibling;
            v391.sibling = l_createWorkInProgress_0(l_child_0, l_child_0.pendingProps);
            v391 = v391.sibling;
            v391.return_ = v389;
        end;
        v391.sibling = nil;
        return;
    end;
end;
v45.resetChildFibers = function(v392, v393) --[[ Line: 1674 ]]
    -- upvalues: l_resetWorkInProgress_0 (copy)
    local l_child_1 = v392.child;
    while l_child_1 ~= nil do
        l_resetWorkInProgress_0(l_child_1, v393);
        l_child_1 = l_child_1.sibling;
    end;
end;
return v45;
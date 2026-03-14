local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Error_0 = v2.Error;
local l_Set_0 = v2.Set;
local _ = require(l_Parent_0.Shared);
local _ = require(script.Parent.ReactInternalTypes);
local _ = require(script.Parent.ReactFiberHostConfig);
local v9 = require(script.Parent.ReactFiberLane);
local l_SyncLane_0 = v9.SyncLane;
local l_NoTimestamp_0 = v9.NoTimestamp;
local v12 = require(script.Parent.ReactWorkTags);
local l_ClassComponent_0 = v12.ClassComponent;
local l_FunctionComponent_0 = v12.FunctionComponent;
local l_ForwardRef_0 = v12.ForwardRef;
local l_HostComponent_0 = v12.HostComponent;
local l_HostPortal_0 = v12.HostPortal;
local l_HostRoot_0 = v12.HostRoot;
local l_MemoComponent_0 = v12.MemoComponent;
local l_SimpleMemoComponent_0 = v12.SimpleMemoComponent;
local l_ReactSymbols_0 = require(l_Parent_0.Shared).ReactSymbols;
local l_REACT_FORWARD_REF_TYPE_0 = l_ReactSymbols_0.REACT_FORWARD_REF_TYPE;
local l_REACT_MEMO_TYPE_0 = l_ReactSymbols_0.REACT_MEMO_TYPE;
local l_REACT_LAZY_TYPE_0 = l_ReactSymbols_0.REACT_LAZY_TYPE;
local l___DEV___0 = v1.__DEV__;
local v26 = nil;
local v27 = nil;
local v28 = {};
local v29 = nil;
local v30 = nil;
local v31 = nil;
local v32 = nil;
v28.setRefreshHandler = function(v33) --[[ Line: 92 ]] --[[ Name: setRefreshHandler ]]
    -- upvalues: l___DEV___0 (copy), v26 (ref)
    if l___DEV___0 then
        v26 = v33;
    end;
end;
v28.resolveFunctionForHotReloading = function(v34) --[[ Line: 99 ]] --[[ Name: resolveFunctionForHotReloading ]]
    -- upvalues: l___DEV___0 (copy), v26 (ref)
    if l___DEV___0 then
        if v26 == nil then
            return v34;
        else
            local v35 = v26(v34);
            if v35 == nil then
                return v34;
            else
                return v35.current;
            end;
        end;
    else
        return v34;
    end;
end;
v28.resolveClassForHotReloading = function(v36) --[[ Line: 117 ]] --[[ Name: resolveClassForHotReloading ]]
    -- upvalues: l___DEV___0 (copy), v26 (ref)
    if l___DEV___0 then
        if v26 == nil then
            return v36;
        else
            local v37 = v26(v36);
            if v37 == nil then
                return v36;
            else
                return v37.current;
            end;
        end;
    else
        return v36;
    end;
end;
v28.resolveForwardRefForHotReloading = function(v38) --[[ Line: 123 ]] --[[ Name: resolveForwardRefForHotReloading ]]
    -- upvalues: l___DEV___0 (copy), v26 (ref), l_REACT_FORWARD_REF_TYPE_0 (copy)
    if l___DEV___0 then
        if v26 == nil then
            return v38;
        else
            local v39 = v26(v38);
            if v39 == nil then
                if v38 ~= nil and typeof(v38.render) == "function" then
                    local l_render_0 = v38.render;
                    local v41;
                    if l___DEV___0 then
                        if v26 == nil then
                            v41 = l_render_0;
                        else
                            local v42 = v26(l_render_0);
                            v41 = if v42 == nil then l_render_0 else v42.current;
                        end;
                    else
                        v41 = l_render_0;
                    end;
                    if v38.render ~= v41 then
                        l_render_0 = {
                            ["$$typeof"] = l_REACT_FORWARD_REF_TYPE_0, 
                            render = v41, 
                            displayName = nil
                        };
                        if v38.displayName ~= nil then
                            l_render_0.displayName = v38.displayName;
                        end;
                        return l_render_0;
                    end;
                end;
                return v38;
            else
                return v39.current;
            end;
        end;
    else
        return v38;
    end;
end;
v28.isCompatibleFamilyForHotReloading = function(v43, v44) --[[ Line: 160 ]] --[[ Name: isCompatibleFamilyForHotReloading ]]
    -- upvalues: l___DEV___0 (copy), v26 (ref), l_ClassComponent_0 (copy), l_FunctionComponent_0 (copy), l_REACT_LAZY_TYPE_0 (copy), l_ForwardRef_0 (copy), l_REACT_FORWARD_REF_TYPE_0 (copy), l_MemoComponent_0 (copy), l_SimpleMemoComponent_0 (copy), l_REACT_MEMO_TYPE_0 (copy)
    if l___DEV___0 then
        if v26 == nil then
            return false;
        else
            local l_elementType_0 = v43.elementType;
            local l_type_0 = v44.type;
            local v47 = false;
            local v48 = if typeof(l_type_0) == "table" and l_type_0 ~= nil then l_type_0["$$typeof"] else nil;
            local l_tag_0 = v43.tag;
            if l_tag_0 == l_ClassComponent_0 then
                if typeof(l_type_0) == "function" then
                    v47 = true;
                end;
            elseif l_tag_0 == l_FunctionComponent_0 then
                if typeof(l_type_0) == "function" then
                    v47 = true;
                elseif v48 == l_REACT_LAZY_TYPE_0 then
                    v47 = true;
                end;
            elseif l_tag_0 == l_ForwardRef_0 then
                if v48 == l_REACT_FORWARD_REF_TYPE_0 then
                    v47 = true;
                elseif v48 == l_REACT_LAZY_TYPE_0 then
                    v47 = true;
                end;
            elseif l_tag_0 == l_MemoComponent_0 or l_tag_0 == l_SimpleMemoComponent_0 then
                if v48 == l_REACT_MEMO_TYPE_0 then
                    v47 = true;
                elseif v48 == l_REACT_LAZY_TYPE_0 then
                    v47 = true;
                end;
            else
                return false;
            end;
            if v47 then
                l_tag_0 = v26(l_elementType_0);
                if l_tag_0 ~= nil and l_tag_0 == v26(l_type_0) then
                    return true;
                end;
            end;
            return false;
        end;
    else
        return false;
    end;
end;
v28.markFailedErrorBoundaryForHotReloading = function(v50) --[[ Line: 247 ]] --[[ Name: markFailedErrorBoundaryForHotReloading ]]
    -- upvalues: l___DEV___0 (copy), v26 (ref), v27 (ref), l_Set_0 (copy)
    if l___DEV___0 then
        if v26 == nil then
            return;
        else
            if v27 == nil then
                v27 = l_Set_0.new();
            end;
            v27:add(v50);
        end;
    end;
end;
local _ = nil;
v28.scheduleRefresh = function(v52, v53) --[[ Line: 267 ]] --[[ Name: scheduleRefresh ]]
    -- upvalues: l___DEV___0 (copy), v26 (ref), v32 (ref)
    if l___DEV___0 then
        if v26 == nil then
            return;
        else
            local l_staleFamilies_0 = v53.staleFamilies;
            local l_updatedFamilies_0 = v53.updatedFamilies;
            local v56 = require(script.Parent["ReactFiberWorkLoop.new"]);
            local l_flushPassiveEffects_0 = v56.flushPassiveEffects;
            local l_flushSync_0 = v56.flushSync;
            l_flushPassiveEffects_0();
            l_flushSync_0(function() --[[ Line: 279 ]]
                -- upvalues: v32 (ref), v52 (copy), l_updatedFamilies_0 (copy), l_staleFamilies_0 (copy)
                v32(v52.current, l_updatedFamilies_0, l_staleFamilies_0);
            end);
        end;
    end;
end;
local _ = nil;
v28.scheduleRoot = function(v60, v61) --[[ Line: 291 ]] --[[ Name: scheduleRoot ]]
    -- upvalues: l___DEV___0 (copy)
    if l___DEV___0 then
        if require(script.Parent["ReactFiberContext.new"]).emptyContextObject ~= v60.context then
            return;
        else
            local v62 = require(script.Parent["ReactFiberWorkLoop.new"]);
            local l_flushPassiveEffects_1 = v62.flushPassiveEffects;
            local l_flushSync_1 = v62.flushSync;
            l_flushPassiveEffects_1();
            l_flushSync_1(function() --[[ Line: 306 ]]
                -- upvalues: v61 (copy), v60 (copy)
                require(script.Parent["ReactFiberReconciler.new"]).updateContainer(v61, v60, nil, nil);
            end);
        end;
    end;
end;
v32 = function(v65, v66, v67) --[[ Line: 316 ]] --[[ Name: scheduleFibersWithFamiliesRecursively ]]
    -- upvalues: l___DEV___0 (copy), l_FunctionComponent_0 (copy), l_SimpleMemoComponent_0 (copy), l_ClassComponent_0 (copy), l_ForwardRef_0 (copy), v26 (ref), l_Error_0 (copy), v27 (ref), l_SyncLane_0 (copy), l_NoTimestamp_0 (copy), v32 (ref)
    if l___DEV___0 then
        local l_alternate_0 = v65.alternate;
        local l_child_0 = v65.child;
        local l_sibling_0 = v65.sibling;
        local l_tag_1 = v65.tag;
        local l_type_1 = v65.type;
        local v73 = nil;
        if l_tag_1 == l_FunctionComponent_0 or l_tag_1 == l_SimpleMemoComponent_0 or l_tag_1 == l_ClassComponent_0 then
            v73 = l_type_1;
        elseif l_tag_1 == l_ForwardRef_0 then
            v73 = l_type_1.render;
        end;
        if v26 == nil then
            error(l_Error_0.new("Expected resolveFamily to be set during hot reload."));
        end;
        local v74 = false;
        local v75 = false;
        if v73 ~= nil then
            local v76 = v26(v73);
            if v76 ~= nil then
                if v67:has(v76) then
                    v75 = true;
                elseif v66:has(v76) then
                    if l_tag_1 == l_ClassComponent_0 then
                        v75 = true;
                    else
                        v74 = true;
                    end;
                end;
            end;
        end;
        if v27 ~= nil and (v27:has(v65) or l_alternate_0 ~= nil and v27:has(l_alternate_0)) then
            v75 = true;
        end;
        if v75 then
            v65._debugNeedsRemount = true;
        end;
        if v75 or v74 then
            require(script.Parent["ReactFiberWorkLoop.new"]).scheduleUpdateOnFiber(v65, l_SyncLane_0, l_NoTimestamp_0);
        end;
        if l_child_0 ~= nil and not v75 then
            v32(l_child_0, v66, v67);
        end;
        if l_sibling_0 ~= nil then
            v32(l_sibling_0, v66, v67);
        end;
    end;
end;
local _ = nil;
v28.findHostInstancesForRefresh = function(v78, v79) --[[ Line: 383 ]] --[[ Name: findHostInstancesForRefresh ]]
    -- upvalues: l___DEV___0 (copy), l_Set_0 (copy), l_Array_0 (copy), v31 (ref), l_Error_0 (copy)
    if l___DEV___0 then
        local v80 = l_Set_0.new();
        local v82 = l_Set_0.new(l_Array_0.map(v79, function(v81) --[[ Line: 389 ]]
            return v81.current;
        end));
        v31(v78.current, v82, v80);
        return v80;
    else
        error(l_Error_0.new("Did not expect findHostInstancesForRefresh to be called in production."));
        return;
    end;
end;
v31 = function(v83, v84, v85) --[[ Line: 404 ]] --[[ Name: findHostInstancesForMatchingFibersRecursively ]]
    -- upvalues: l___DEV___0 (copy), l_FunctionComponent_0 (copy), l_SimpleMemoComponent_0 (copy), l_ClassComponent_0 (copy), l_ForwardRef_0 (copy), v30 (ref), v31 (ref)
    if l___DEV___0 then
        local l_child_1 = v83.child;
        local l_sibling_1 = v83.sibling;
        local l_tag_2 = v83.tag;
        local l_type_2 = v83.type;
        local v90 = nil;
        if l_tag_2 == l_FunctionComponent_0 or l_tag_2 == l_SimpleMemoComponent_0 or l_tag_2 == l_ClassComponent_0 then
            v90 = l_type_2;
        elseif l_tag_2 == l_ForwardRef_0 then
            v90 = l_type_2.render;
        end;
        local v91 = false;
        if v90 ~= nil and v84:has(v90) then
            v91 = true;
        end;
        if v91 then
            v30(v83, v85);
        elseif l_child_1 ~= nil then
            v31(l_child_1, v84, v85);
        end;
        if l_sibling_1 ~= nil then
            v31(l_sibling_1, v84, v85);
        end;
    end;
end;
v30 = function(v92, v93) --[[ Line: 448 ]] --[[ Name: findHostInstancesForFiberShallowly ]]
    -- upvalues: l___DEV___0 (copy), v29 (ref), l_HostComponent_0 (copy), l_HostPortal_0 (copy), l_HostRoot_0 (copy), l_Error_0 (copy)
    if l___DEV___0 then
        if v29(v92, v93) then
            return;
        else
            local l_v92_0 = v92;
            while true do
                local l_tag_3 = l_v92_0.tag;
                if l_tag_3 == l_HostComponent_0 then
                    v93:add(l_v92_0.stateNode);
                    return;
                elseif l_tag_3 == l_HostPortal_0 then
                    v93:add(l_v92_0.stateNode.containerInfo);
                    return;
                elseif l_tag_3 == l_HostRoot_0 then
                    v93:add(l_v92_0.stateNode.containerInfo);
                    return;
                else
                    if l_v92_0.return_ == nil then
                        error(l_Error_0.new("Expected to reach root first."));
                    end;
                    l_v92_0 = l_v92_0.return_;
                end;
            end;
        end;
    else
        return;
    end;
end;
v29 = function(v96, v97) --[[ Line: 480 ]] --[[ Name: findChildHostInstancesForFiberShallowly ]]
    -- upvalues: l___DEV___0 (copy), l_HostComponent_0 (copy)
    if l___DEV___0 then
        local l_v96_0 = v96;
        local v99 = false;
        while true do
            if l_v96_0.tag == l_HostComponent_0 then
                v99 = true;
                v97:add(l_v96_0.stateNode);
            elseif l_v96_0.child ~= nil then
                l_v96_0.child.return_ = l_v96_0;
                l_v96_0 = l_v96_0.child;
                continue;
            end;
            if l_v96_0 == v96 then
                return v99;
            else
                while true do
                    if l_v96_0.sibling == nil then
                        if l_v96_0.return_ == nil or l_v96_0.return_ == v96 then
                            return v99;
                        else
                            l_v96_0 = l_v96_0.return_;
                        end;
                    else
                        assert(l_v96_0.sibling ~= nil, "should be non-nil");
                        l_v96_0.sibling.return_ = l_v96_0.return_;
                        l_v96_0 = l_v96_0.sibling;
                        break;
                    end;
                end;
            end;
        end;
    else
        return false;
    end;
end;
return v28;
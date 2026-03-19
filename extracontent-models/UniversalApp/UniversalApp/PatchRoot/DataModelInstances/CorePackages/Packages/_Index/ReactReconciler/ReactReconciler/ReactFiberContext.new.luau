local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ReactGlobals);
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Object_0 = v2.Object;
local l_Error_0 = v2.Error;
local l___DEV___0 = v1.__DEV__;
local l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0 = v1.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(script.Parent.ReactInternalTypes);
local v9 = require(script.Parent["ReactFiberStack.new"]);
local l_isFiberMounted_0 = require(script.Parent.ReactFiberTreeReflection).isFiberMounted;
local l_disableLegacyContext_0 = require(l_Parent_0.Shared).ReactFeatureFlags.disableLegacyContext;
local v12 = require(script.Parent.ReactWorkTags);
local l_ClassComponent_0 = v12.ClassComponent;
local l_HostRoot_0 = v12.HostRoot;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_checkPropTypes_0 = require(l_Parent_0.Shared).checkPropTypes;
local l_createCursor_0 = v9.createCursor;
local l_push_0 = v9.push;
local l_pop_0 = v9.pop;
local v20 = nil;
if l___DEV___0 then
    v20 = {};
end;
local v21 = {};
if l___DEV___0 then
    l_Object_0.freeze(v21);
end;
local v22 = l_createCursor_0(v21);
local v23 = l_createCursor_0(false);
local l_v21_0 = v21;
local v25 = nil;
local function v29(_, v27, v28) --[[ Line: 70 ]] --[[ Name: getUnmaskedContext ]]
    -- upvalues: v25 (ref), l_v21_0 (ref), v22 (copy)
    if v28 and v25(v27) then
        return l_v21_0;
    else
        return v22.current;
    end;
end;
local function v34(v30, v31, v32) --[[ Line: 90 ]] --[[ Name: cacheContext ]]
    local l_stateNode_0 = v30.stateNode;
    l_stateNode_0.__reactInternalMemoizedUnmaskedChildContext = v31;
    l_stateNode_0.__reactInternalMemoizedMaskedChildContext = v32;
end;
local function v45(v35, v36) --[[ Line: 105 ]] --[[ Name: getMaskedContext ]]
    -- upvalues: v21 (copy), l___DEV___0 (copy), l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0 (copy), l_getComponentName_0 (copy), l_checkPropTypes_0 (copy)
    local l_type_0 = v35.type;
    if type(l_type_0) == "function" then
        return v36;
    else
        local l_contextTypes_0 = l_type_0.contextTypes;
        if not l_contextTypes_0 then
            return v21;
        else
            local l_stateNode_1 = v35.stateNode;
            if l_stateNode_1 and l_stateNode_1.__reactInternalMemoizedUnmaskedChildContext == v36 then
                return l_stateNode_1.__reactInternalMemoizedMaskedChildContext;
            else
                local v40 = {};
                for v41, _ in l_contextTypes_0 do
                    v40[v41] = v36[v41];
                end;
                if l___DEV___0 or l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0 then
                    local v43 = l_getComponentName_0(l_type_0) or "Unknown";
                    l_checkPropTypes_0(l_contextTypes_0, nil, v40, "context", v43);
                end;
                if l_stateNode_1 then
                    local l_stateNode_2 = v35.stateNode;
                    l_stateNode_2.__reactInternalMemoizedUnmaskedChildContext = v36;
                    l_stateNode_2.__reactInternalMemoizedMaskedChildContext = v40;
                end;
                return v40;
            end;
        end;
    end;
end;
local function v46() --[[ Line: 154 ]] --[[ Name: hasContextChanged ]]
    -- upvalues: l_disableLegacyContext_0 (copy), v23 (copy)
    if l_disableLegacyContext_0 then
        return false;
    else
        return v23.current;
    end;
end;
v25 = function(v47) --[[ Line: 163 ]] --[[ Name: isContextProvider ]]
    if type(v47) == "function" then
        return false;
    else
        return v47.childContextTypes ~= nil;
    end;
end;
local function v49(v48) --[[ Line: 178 ]] --[[ Name: popContext ]]
    -- upvalues: l_pop_0 (copy), v23 (copy), v22 (copy)
    l_pop_0(v23, v48);
    l_pop_0(v22, v48);
end;
local function v51(v50) --[[ Line: 188 ]] --[[ Name: popTopLevelContextObject ]]
    -- upvalues: l_pop_0 (copy), v23 (copy), v22 (copy)
    l_pop_0(v23, v50);
    l_pop_0(v22, v50);
end;
local function v55(v52, v53, v54) --[[ Line: 198 ]] --[[ Name: pushTopLevelContextObject ]]
    -- upvalues: v22 (copy), v21 (copy), l_Error_0 (copy), l_push_0 (copy), v23 (copy)
    if v22.current ~= v21 then
        error(l_Error_0.new("Unexpected context found on stack. This error is likely caused by a bug in React. Please file an issue."));
    end;
    l_push_0(v22, v53, v52);
    l_push_0(v23, v54, v52);
end;
local function v67(v56, v57, v58) --[[ Line: 221 ]] --[[ Name: processChildContext ]]
    -- upvalues: l___DEV___0 (copy), l_getComponentName_0 (copy), v20 (ref), l_console_0 (copy), l_Error_0 (copy), l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0 (copy), l_checkPropTypes_0 (copy), l_Object_0 (copy)
    local l_stateNode_3 = v56.stateNode;
    local l_childContextTypes_0 = v57.childContextTypes;
    if l_stateNode_3.getChildContext == nil or type(l_stateNode_3.getChildContext) ~= "function" then
        if l___DEV___0 then
            local v61 = l_getComponentName_0(v57) or "Unknown";
            if not v20[v61] then
                v20[v61] = true;
                l_console_0.error("%s.childContextTypes is specified but there is no getChildContext() method on the instance. You can either define getChildContext() on %s or remove childContextTypes from it.", v61, v61);
            end;
        end;
        return v58;
    else
        local v62 = l_stateNode_3:getChildContext();
        for v63, _ in v62 do
            if l_childContextTypes_0[v63] == nil then
                local v65 = l_getComponentName_0(v57) or "Unknown";
                error(l_Error_0.new(string.format("%s.getChildContext(): key \"%s\" is not defined in childContextTypes.", v65, v63)));
            end;
        end;
        if l___DEV___0 or l___DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION___0 then
            local v66 = l_getComponentName_0(v57) or "Unknown";
            l_checkPropTypes_0(l_childContextTypes_0, nil, v62, "child context", v66);
        end;
        return l_Object_0.assign({}, v58, v62);
    end;
end;
local function v71(v68) --[[ Line: 281 ]] --[[ Name: pushContextProvider ]]
    -- upvalues: v21 (copy), l_v21_0 (ref), v22 (copy), l_push_0 (copy), v23 (copy)
    local l_stateNode_4 = v68.stateNode;
    local v70 = l_stateNode_4 and l_stateNode_4.__reactInternalMemoizedMergedChildContext or v21;
    l_v21_0 = v22.current;
    l_push_0(v22, v70, v68);
    l_push_0(v23, v23.current, v68);
    return true;
end;
local function v77(v72, v73, v74) --[[ Line: 304 ]] --[[ Name: invalidateContextProvider ]]
    -- upvalues: l_Error_0 (copy), v67 (copy), l_v21_0 (ref), l_pop_0 (copy), v23 (copy), v22 (copy), l_push_0 (copy)
    local l_stateNode_5 = v72.stateNode;
    if not l_stateNode_5 then
        error(l_Error_0.new("Expected to have an instance by this point. This error is likely caused by a bug in React. Please file an issue."));
    end;
    if v74 then
        local v76 = v67(v72, v73, l_v21_0);
        l_stateNode_5.__reactInternalMemoizedMergedChildContext = v76;
        l_pop_0(v23, v72);
        l_pop_0(v22, v72);
        l_push_0(v22, v76, v72);
        l_push_0(v23, v74, v72);
        return;
    else
        l_pop_0(v23, v72);
        l_push_0(v23, v74, v72);
        return;
    end;
end;
return {
    emptyContextObject = v21, 
    getUnmaskedContext = v29, 
    cacheContext = v34, 
    getMaskedContext = v45, 
    hasContextChanged = v46, 
    popContext = v49, 
    popTopLevelContextObject = v51, 
    pushTopLevelContextObject = v55, 
    processChildContext = v67, 
    isContextProvider = v25, 
    pushContextProvider = v71, 
    invalidateContextProvider = v77, 
    findCurrentUnmaskedContext = function(v78) --[[ Line: 345 ]] --[[ Name: findCurrentUnmaskedContext ]]
        -- upvalues: l_ClassComponent_0 (copy), l_isFiberMounted_0 (copy), l_Error_0 (copy), l_HostRoot_0 (copy)
        if v78.tag ~= l_ClassComponent_0 or not l_isFiberMounted_0(v78) then
            error(l_Error_0.new("Expected subtree parent to be a mounted class component. This error is likely caused by a bug in React. Please file an issue."));
        end;
        local l_v78_0 = v78;
        while true do
            if l_v78_0.tag == l_HostRoot_0 then
                return l_v78_0.stateNode.context;
            elseif l_v78_0.tag == l_ClassComponent_0 and l_v78_0.type.childContextTypes ~= nil then
                return l_v78_0.stateNode.__reactInternalMemoizedMergedChildContext;
            else
                l_v78_0 = l_v78_0.return_;
                if l_v78_0 == nil then
                    error(l_Error_0.new("Found unexpected detached subtree parent. This error is likely caused by a bug in React. Please file an issue."));
                    return;
                end;
            end;
        end;
    end
};
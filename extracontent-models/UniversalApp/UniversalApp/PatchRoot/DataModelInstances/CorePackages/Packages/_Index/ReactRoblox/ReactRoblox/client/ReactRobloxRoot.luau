local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(script.Parent["ReactRobloxHostTypes.roblox"]);
local v2 = require(l_Parent_0.ReactGlobals);
local _ = require(l_Parent_0.ReactReconciler);
local _ = require(l_Parent_0.Shared);
local _ = require(l_Parent_0.ReactReconciler);
local v6 = require(script.Parent.ReactRobloxComponentTree);
local l_markContainerAsRoot_0 = v6.markContainerAsRoot;
local l_unmarkContainerAsRoot_0 = v6.unmarkContainerAsRoot;
local v9 = require(script.Parent.Parent["ReactReconciler.roblox"]);
local l_createContainer_0 = v9.createContainer;
local l_updateContainer_0 = v9.updateContainer;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_enableEagerRootListeners_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableEagerRootListeners;
local l_flushSync_0 = v9.flushSync;
local l_flushPassiveEffects_0 = v9.flushPassiveEffects;
local l_BlockingRoot_0 = v9.ReactRootTags.BlockingRoot;
local l_ConcurrentRoot_0 = v9.ReactRootTags.ConcurrentRoot;
local l_LegacyRoot_0 = v9.ReactRootTags.LegacyRoot;
local v19 = nil;
local v20 = {};
v20.__index = v20;
v20.new = function(v21, v22) --[[ Line: 66 ]] --[[ Name: new ]]
    -- upvalues: v20 (copy), v19 (ref), l_ConcurrentRoot_0 (copy)
    local v23 = setmetatable({}, v20);
    v23._internalRoot = v19(v21, l_ConcurrentRoot_0, v22);
    return v23;
end;
local function _(v24, v25, v26) --[[ Line: 73 ]] --[[ Name: createBlockingRoot ]]
    -- upvalues: v20 (copy), v19 (ref)
    local v27 = setmetatable({}, v20);
    v27._internalRoot = v19(v24, v25, v26);
    return v27;
end;
v20.render = function(v29, v30) --[[ Line: 85 ]] --[[ Name: render ]]
    -- upvalues: l_updateContainer_0 (copy)
    local l__internalRoot_0 = v29._internalRoot;
    l_updateContainer_0(v30, l__internalRoot_0, nil);
end;
v20.unmount = function(v32) --[[ Line: 113 ]] --[[ Name: unmount ]]
    -- upvalues: l_flushSync_0 (copy), l_updateContainer_0 (copy), l_unmarkContainerAsRoot_0 (copy), l_flushPassiveEffects_0 (copy)
    local l__internalRoot_1 = v32._internalRoot;
    local l_containerInfo_0 = l__internalRoot_1.containerInfo;
    l_flushSync_0(function() --[[ Line: 126 ]]
        -- upvalues: l_updateContainer_0 (ref), l__internalRoot_1 (copy), l_unmarkContainerAsRoot_0 (ref), l_containerInfo_0 (copy)
        l_updateContainer_0(nil, l__internalRoot_1, nil, function() --[[ Line: 127 ]]
            -- upvalues: l_unmarkContainerAsRoot_0 (ref), l_containerInfo_0 (ref)
            l_unmarkContainerAsRoot_0(l_containerInfo_0);
        end);
    end);
    l_flushPassiveEffects_0();
end;
v19 = function(v35, v36, v37) --[[ Line: 141 ]]
    -- upvalues: l_createContainer_0 (copy), l_markContainerAsRoot_0 (copy), l_enableEagerRootListeners_0 (copy)
    local v38 = false;
    if v37 ~= nil then
        v38 = v37.hydrate == true;
    end;
    local v39 = if v37 ~= nil then v37.hydrationOptions else nil;
    local v40 = v37 ~= nil and v37.hydrationOptions ~= nil and v37.hydrationOptions.mutableSources or nil;
    local v41 = l_createContainer_0(v35, v36, v38, v39);
    l_markContainerAsRoot_0(v41.current, v35);
    if l_enableEagerRootListeners_0 then

    end;
    if v40 then

    end;
    return v41;
end;
local v53 = {
    isValidContainer = function(v42) --[[ Line: 189 ]] --[[ Name: isValidContainer ]]
        return typeof(v42) == "Instance";
    end, 
    createRoot = function(v43, v44) --[[ Line: 212 ]]
        -- upvalues: l_invariant_0 (copy), v20 (copy)
        l_invariant_0(typeof(v43) == "Instance", "createRoot(...): Target container is not a Roblox Instance.");
        warnIfReactDOMContainerInDEV(v43);
        return v20.new(v43, v44);
    end, 
    createBlockingRoot = function(v45, v46) --[[ Line: 222 ]]
        -- upvalues: l_invariant_0 (copy), l_BlockingRoot_0 (copy), v20 (copy), v19 (ref)
        l_invariant_0(typeof(v45) == "Instance", "createRoot(...): Target container is not a Roblox Instance.");
        warnIfReactDOMContainerInDEV(v45);
        local l_l_BlockingRoot_0_0 = l_BlockingRoot_0;
        local v48 = setmetatable({}, v20);
        v48._internalRoot = v19(v45, l_l_BlockingRoot_0_0, v46);
        return v48;
    end, 
    createLegacyRoot = function(v49, v50) --[[ Line: 235 ]]
        -- upvalues: l_LegacyRoot_0 (copy), v20 (copy), v19 (ref)
        local l_l_LegacyRoot_0_0 = l_LegacyRoot_0;
        local v52 = setmetatable({}, v20);
        v52._internalRoot = v19(v49, l_l_LegacyRoot_0_0, v50);
        return v52;
    end
};
warnIfReactDOMContainerInDEV = function(_) --[[ Line: 239 ]] --[[ Name: warnIfReactDOMContainerInDEV ]]
    -- upvalues: v2 (copy)
    if v2.__DEV__ then

    end;
end;
return v53;
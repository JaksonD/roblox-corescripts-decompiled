local l_Parent_0 = script:FindFirstAncestor("GameCollections").Parent;
local v1 = require(l_Parent_0.React);
local l_usePrevious_0 = require(l_Parent_0.RoactUtils).Hooks.usePrevious;
local v3 = require(l_Parent_0.ArgCheck);
local v4 = game:DefineFastFlag("LuaAppEnableWaitForPropWrapperAssert", false);
return function(v5) --[[ Line: 15 ]] --[[ Name: WaitForPropWrapper ]]
    -- upvalues: l_usePrevious_0 (copy), v1 (copy), v4 (copy), v3 (copy)
    local l_waitForProp_0 = v5.waitForProp;
    local l_maxUpdatesToDelay_0 = v5.maxUpdatesToDelay;
    local l_wrappedComponent_0 = v5.wrappedComponent;
    local v9 = l_usePrevious_0(l_waitForProp_0);
    local v10, v11 = v1.useState(l_maxUpdatesToDelay_0);
    local v12 = false;
    if v9 ~= nil then
        v12 = false;
        if l_waitForProp_0 == nil then
            v12 = false;
            if l_maxUpdatesToDelay_0 ~= nil then
                v12 = v10 < l_maxUpdatesToDelay_0;
            end;
        end;
    end;
    v1.useEffect(function() --[[ Line: 27 ]]
        -- upvalues: l_maxUpdatesToDelay_0 (copy), l_waitForProp_0 (copy), v12 (copy), v11 (copy), v10 (copy)
        if not l_maxUpdatesToDelay_0 then
            return;
        elseif l_waitForProp_0 ~= nil then
            return;
        elseif v12 then
            task.delay(0, function() --[[ Line: 38 ]]
                -- upvalues: v11 (ref), l_maxUpdatesToDelay_0 (ref)
                v11(l_maxUpdatesToDelay_0);
            end);
            return;
        else
            if v10 and v10 > 0 then
                task.delay(0, function() --[[ Line: 43 ]]
                    -- upvalues: v11 (ref), v10 (ref)
                    v11(v10 - 1);
                end);
            end;
            return;
        end;
    end, {
        l_waitForProp_0, 
        l_maxUpdatesToDelay_0, 
        v10, 
        v12
    });
    local v13 = true;
    if l_waitForProp_0 == nil and l_maxUpdatesToDelay_0 ~= nil then
        if v12 then
            v13 = false;
        elseif v10 and v10 > 0 then
            v13 = false;
        elseif v4 then
            v3.assert(l_waitForProp_0, (("Missing data for prop for this game collection, after waiting %* updates"):format(l_maxUpdatesToDelay_0)));
        end;
    end;
    if v13 then
        return l_wrappedComponent_0;
    else
        return nil;
    end;
end;
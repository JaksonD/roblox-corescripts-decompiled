local l_script_FirstAncestor_0 = script:FindFirstAncestor("Motion");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.AnimatePresence.PresenceContext);
local l_useIdFallback_0 = require(l_script_FirstAncestor_0.AnimatePresence.utils).useIdFallback;
return function(v5) --[[ Line: 30 ]] --[[ Name: PresenceProvider ]]
    -- upvalues: l_useIdFallback_0 (copy), v2 (copy), v3 (copy)
    if v5 == nil then
        error("PresenceProvider: props cannot be nil");
    end;
    local l_children_0 = v5.children;
    local l_isPresent_0 = v5.isPresent;
    if l_isPresent_0 == nil then
        l_isPresent_0 = true;
    end;
    local l_passThroughData_0 = v5.passThroughData;
    local v9 = nil;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 53 ]]
        -- upvalues: v9 (ref), l_useIdFallback_0 (ref)
        v9 = l_useIdFallback_0();
    end);
    if not l_status_0 then
        warn("PresenceProvider: Error generating ID:", l_result_0);
        v9 = "presence-" .. l_useIdFallback_0();
    end;
    local v12 = nil;
    local l_status_1, l_result_1 = pcall(function() --[[ Line: 64 ]]
        -- upvalues: v12 (ref), v2 (ref)
        v12 = v2.useRef({});
    end);
    l_status_0 = l_status_1;
    l_result_0 = l_result_1;
    if not l_status_0 then
        warn("PresenceProvider: Error creating childrenPresence ref:", l_result_0);
        v12 = {
            current = {}
        };
    end;
    l_status_1 = function(v15) --[[ Line: 74 ]] --[[ Name: onExitComplete ]]
        -- upvalues: v12 (ref), v5 (copy)
        if v12.current then
            v12.current[v15] = true;
        end;
        local v16 = true;
        for _, v18 in pairs(v12.current) do
            if not v18 then
                v16 = false;
                break;
            end;
        end;
        if v16 and v5.onExitComplete then
            v5.onExitComplete();
        end;
    end;
    l_result_1 = function(v19) --[[ Line: 95 ]] --[[ Name: register ]]
        -- upvalues: v12 (ref)
        v12.current[v19] = false;
        return function() --[[ Line: 99 ]]
            -- upvalues: v12 (ref), v19 (copy)
            v12.current[v19] = nil;
        end;
    end;
    local v20 = {
        id = v9, 
        isPresent = l_isPresent_0, 
        register = l_result_1, 
        onExitComplete = l_status_1, 
        passThroughData = l_passThroughData_0
    };
    local v21 = nil;
    local l_status_2, l_result_2 = pcall(function() --[[ Line: 114 ]]
        -- upvalues: v21 (ref), v2 (ref), v3 (ref), v20 (copy), l_children_0 (copy)
        v21 = v2.createElement(v3.Provider, {
            value = v20
        }, l_children_0);
    end);
    l_status_0 = l_status_2;
    l_result_0 = l_result_2;
    if not l_status_0 then
        warn("PresenceProvider: Error creating PresenceContext.Provider:", l_result_0);
    end;
    return v21 or v2.createElement(v2.Fragment, {}, l_children_0);
end;
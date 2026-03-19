local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppShortcutBar");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local _ = require(l_Parent_0.FocusNavigationUtils);
local v4 = require(l_script_FirstAncestor_0.Stores.GetButtonHoldStore)(false);
local v5 = {
    ButtonHoldStarted = "ButtonHoldStarted", 
    ButtonHoldEnded = "ButtonHoldEnded"
};
local v12 = {
    [v5.ButtonHoldStarted] = function(v6, v7) --[[ Line: 38 ]]
        local v8 = table.clone(v6);
        v8.heldProgress[v7.eventName] = v7.progress;
        return v8;
    end, 
    [v5.ButtonHoldEnded] = function(v9, v10) --[[ Line: 43 ]]
        local v11 = table.clone(v9);
        v11.heldProgress[v10.eventName] = nil;
        return v11;
    end
};
local function v16(v13, v14) --[[ Line: 50 ]] --[[ Name: registryReducer ]]
    -- upvalues: v12 (copy)
    local v15 = v12[v14.type];
    if v15 then
        return v15(v13, v14.payload);
    else
        error("Unknown action: " .. v14.type);
        return;
    end;
end;
local v17 = v2.createContext(nil);
return {
    Context = v17, 
    Provider = function(v18) --[[ Line: 60 ]] --[[ Name: AppShortcutBarStateProvider ]]
        -- upvalues: v2 (copy), v16 (copy), v17 (copy)
        local v19, v20 = v2.useReducer(v16, {
            heldProgress = {}
        });
        return v2.createElement(v17.Provider, {
            value = {
                state = v19, 
                dispatch = v20
            }
        }, v18.children);
    end, 
    useDispatchButtonHoldStarted = v4.useDispatchButtonHoldStarted, 
    useDispatchButtonHoldEnded = v4.useDispatchButtonHoldEnded, 
    useHeldProgressByEvent = v4.useHeldProgressByEvent, 
    AppShortcutBarStateActionEnum = v5
};
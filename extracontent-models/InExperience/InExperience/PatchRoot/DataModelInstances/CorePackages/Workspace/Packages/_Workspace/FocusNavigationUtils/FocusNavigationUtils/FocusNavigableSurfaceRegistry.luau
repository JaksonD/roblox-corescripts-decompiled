local l_Parent_0 = script:FindFirstAncestor("FocusNavigationUtils").Parent;
local v1 = require(l_Parent_0.React);
local l_useFocusGuiObject_0 = require(l_Parent_0.ReactFocusNavigation).useFocusGuiObject;
local v17 = {
    registered = function(v3, v4) --[[ Line: 31 ]] --[[ Name: registered ]]
        local v5 = v3[v4.name] or {};
        for _, v7 in v5 do
            if v7 == v4.guiObject then
                return v3;
            end;
        end;
        local v8 = table.clone(v3);
        local v9 = table.clone(v5);
        table.insert(v9, v4.guiObject);
        v8[v4.name] = v9;
        return v8;
    end, 
    deRegistered = function(v10, v11) --[[ Line: 46 ]] --[[ Name: deRegistered ]]
        local v12 = v10[v11.name];
        if not v12 or #v12 == 0 then
            return v10;
        else
            local v13 = {};
            for _, v15 in v12 do
                if v15 ~= v11.guiObject then
                    table.insert(v13, v15);
                end;
            end;
            local v16 = table.clone(v10);
            if #v13 == 0 then
                v16[v11.name] = nil;
                return v16;
            else
                v16[v11.name] = v13;
                return v16;
            end;
        end;
    end
};
local function v21(v18, v19) --[[ Line: 70 ]] --[[ Name: registryReducer ]]
    -- upvalues: v17 (copy)
    local v20 = v17[v19.type];
    if v20 then
        return v20(v18, v19.payload);
    else
        error("Unknown action: " .. v19.type);
        return;
    end;
end;
local v22 = v1.createContext(nil);
return {
    Provider = function(v23) --[[ Line: 80 ]] --[[ Name: FocusNavigableSurfaceRegistryProvider ]]
        -- upvalues: v1 (copy), v21 (copy), v22 (copy)
        local v24, v25 = v1.useReducer(v21, {});
        return v1.createElement(v22.Provider, {
            value = {
                state = v24, 
                dispatch = v25
            }
        }, v23.children);
    end, 
    registryContext = v22, 
    useRegisterFocusNavigableSurface = function() --[[ Line: 105 ]] --[[ Name: useRegisterFocusNavigableSurface ]]
        -- upvalues: v1 (copy), v22 (copy)
        local v26 = v1.useContext(v22);
        local v27 = if v26 then v26.dispatch else nil;
        return v1.useCallback(function(v28, v29) --[[ Line: 108 ]]
            -- upvalues: v27 (copy)
            if v27 then
                v27({
                    type = "registered", 
                    payload = {
                        name = v28, 
                        guiObject = v29
                    }
                });
            end;
        end, {
            v27
        });
    end, 
    useDeRegisterFocusNavigableSurface = function() --[[ Line: 121 ]] --[[ Name: useDeRegisterFocusNavigableSurface ]]
        -- upvalues: v1 (copy), v22 (copy)
        local v30 = v1.useContext(v22);
        local v31 = if v30 then v30.dispatch else nil;
        return v1.useCallback(function(v32, v33) --[[ Line: 124 ]]
            -- upvalues: v31 (copy)
            if v31 then
                v31({
                    type = "deRegistered", 
                    payload = {
                        name = v32, 
                        guiObject = v33
                    }
                });
            end;
        end, {
            v31
        });
    end, 
    useRegistryEntry = function(v34) --[[ Line: 87 ]] --[[ Name: useRegistryEntry ]]
        -- upvalues: v1 (copy), v22 (copy)
        local v35 = v1.useContext(v22);
        if v35 == nil then
            return nil;
        else
            local _ = nil;
            local v37 = v35.state[v34];
            if v37 == nil or #v37 == 0 then
                return nil;
            else
                return v37[#v37];
            end;
        end;
    end, 
    useFocusRegistryEntry = function(v38) --[[ Line: 137 ]] --[[ Name: useFocusRegistryEntry ]]
        -- upvalues: l_useFocusGuiObject_0 (copy), v1 (copy), v22 (copy)
        local v39 = l_useFocusGuiObject_0();
        local v40 = v1.useContext(v22);
        local v41;
        if v40 == nil then
            v41 = nil;
        else
            local _ = nil;
            local v43 = v40.state[v38];
            v41 = if not (v43 ~= nil) or #v43 == 0 then nil else v43[#v43];
        end;
        return v1.useCallback(function() --[[ Line: 140 ]]
            -- upvalues: v41 (copy), v39 (copy)
            if v41 then
                v39(v41);
            end;
        end, {
            v39, 
            v41
        });
    end
};
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local _ = require(l_script_FirstAncestor_0.SduiActionType);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local function v11() --[[ Line: 30 ]] --[[ Name: createSduiActionHandlerRegistry ]]
    local v3 = {};
    return {
        getActionHandlerConfig = function(v4) --[[ Line: 33 ]] --[[ Name: getActionHandlerConfig ]]
            -- upvalues: v3 (copy)
            local v5 = v3[v4];
            if v5 and not v5.handler and v5.lazyHandler then
                v5.handler = v5.lazyHandler();
            end;
            return v5;
        end, 
        registerActionHandlerConfig = function(v6, v7) --[[ Line: 43 ]] --[[ Name: registerActionHandlerConfig ]]
            -- upvalues: v3 (copy)
            v3[v6] = v7;
        end, 
        registerActionHandlerConfigs = function(v8) --[[ Line: 50 ]] --[[ Name: registerActionHandlerConfigs ]]
            -- upvalues: v3 (copy)
            for v9, v10 in v8 do
                v3[v9] = v10;
            end;
        end, 
        debug_clear = function() --[[ Line: 58 ]] --[[ Name: debug_clear ]]
            -- upvalues: v3 (copy)
            table.clear(v3);
        end, 
        debug_getRegisteredActionHandlerConfigs = function() --[[ Line: 62 ]] --[[ Name: debug_getRegisteredActionHandlerConfigs ]]
            -- upvalues: v3 (copy)
            return v3;
        end
    };
end;
local v12 = nil;
return function() --[[ Line: 80 ]] --[[ Name: getSduiActionHandlerRegistry ]]
    -- upvalues: v12 (ref), v11 (copy)
    if v12 == nil then
        v12 = v11();
    end;
    return v12;
end;
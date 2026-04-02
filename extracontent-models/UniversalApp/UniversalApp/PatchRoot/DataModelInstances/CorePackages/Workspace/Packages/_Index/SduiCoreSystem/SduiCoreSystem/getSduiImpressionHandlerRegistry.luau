local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local _ = require(l_script_FirstAncestor_0.SduiImpressionEventType);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local function v11() --[[ Line: 32 ]] --[[ Name: createSduiImpressionHandlerRegistry ]]
    local v3 = {};
    return {
        getImpressionHandlerConfig = function(v4) --[[ Line: 36 ]] --[[ Name: getImpressionHandlerConfig ]]
            -- upvalues: v3 (copy)
            local v5 = v3[v4];
            if v5 and not v5.handler and v5.lazyHandler then
                v5.handler = v5.lazyHandler();
            end;
            return v5;
        end, 
        registerImpressionHandlerConfig = function(v6, v7) --[[ Line: 48 ]] --[[ Name: registerImpressionHandlerConfig ]]
            -- upvalues: v3 (copy)
            v3[v6] = v7;
        end, 
        registerImpressionHandlerConfigs = function(v8) --[[ Line: 55 ]] --[[ Name: registerImpressionHandlerConfigs ]]
            -- upvalues: v3 (copy)
            for v9, v10 in v8 do
                v3[v9] = v10;
            end;
        end, 
        debug_clear = function() --[[ Line: 63 ]] --[[ Name: debug_clear ]]
            -- upvalues: v3 (copy)
            table.clear(v3);
        end, 
        debug_getRegisteredImpressionHandlerConfigs = function() --[[ Line: 67 ]] --[[ Name: debug_getRegisteredImpressionHandlerConfigs ]]
            -- upvalues: v3 (copy)
            return v3;
        end
    };
end;
local v12 = nil;
return function() --[[ Line: 85 ]] --[[ Name: getSduiImpressionHandlerRegistry ]]
    -- upvalues: v12 (ref), v11 (copy)
    if v12 == nil then
        v12 = v11();
    end;
    return v12;
end;
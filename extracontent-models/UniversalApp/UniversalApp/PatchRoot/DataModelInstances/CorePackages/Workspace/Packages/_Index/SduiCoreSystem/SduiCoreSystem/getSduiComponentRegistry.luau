local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.React);
local _ = require(l_script_FirstAncestor_0.SduiComponentType);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local function v16() --[[ Line: 27 ]] --[[ Name: createSduiComponentRegistry ]]
    local v5 = {};
    return {
        getComponent = function(v6) --[[ Line: 42 ]] --[[ Name: getComponent ]]
            -- upvalues: v5 (copy)
            local v7 = v5[v6];
            local v8;
            if not v7 then
                v8 = nil;
            else
                if not v7.component and v7.getLazyComponent then
                    v7.component = v7.getLazyComponent();
                end;
                v8 = v7;
            end;
            if not v8 then
                return nil;
            else
                return v8.component;
            end;
        end, 
        getComponentDefinition = function(v9) --[[ Line: 30 ]] --[[ Name: getComponentDefinition ]]
            -- upvalues: v5 (copy)
            local v10 = v5[v9];
            if not v10 then
                return nil;
            else
                if not v10.component and v10.getLazyComponent then
                    v10.component = v10.getLazyComponent();
                end;
                return v10;
            end;
        end, 
        registerComponentDefinition = function(v11, v12) --[[ Line: 52 ]] --[[ Name: registerComponentDefinition ]]
            -- upvalues: v5 (copy)
            v5[v11] = v12;
        end, 
        registerComponentDefinitions = function(v13) --[[ Line: 59 ]] --[[ Name: registerComponentDefinitions ]]
            -- upvalues: v5 (copy)
            for v14, v15 in v13 do
                v5[v14] = v15;
            end;
        end
    };
end;
local v17 = nil;
return function() --[[ Line: 76 ]] --[[ Name: getSduiComponentRegistry ]]
    -- upvalues: v17 (ref), v16 (copy)
    if v17 == nil then
        v17 = v16();
    end;
    return v17;
end;
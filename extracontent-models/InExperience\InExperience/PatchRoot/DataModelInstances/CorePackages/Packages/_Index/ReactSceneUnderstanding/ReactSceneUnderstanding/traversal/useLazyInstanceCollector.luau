local l_script_FirstAncestor_0 = script:FindFirstAncestor("ReactSceneUnderstanding");
local v1 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local v3 = require(l_script_FirstAncestor_0.Parent.ReactUtils);
local v4 = require(l_script_FirstAncestor_0.Parent.SceneUnderstanding);
local l_DataModelTraversalOptions_0 = v4.DataModelTraversalOptions;
local l_useEffect_0 = v2.useEffect;
local l_useMemo_0 = v2.useMemo;
local l_useState_0 = v2.useState;
local l_usePrevious_0 = v3.usePrevious;
return function(v10, v11, v12) --[[ Line: 17 ]] --[[ Name: useLazyInstanceCollector ]]
    -- upvalues: l_DataModelTraversalOptions_0 (copy), l_usePrevious_0 (copy), l_useMemo_0 (copy), v4 (copy), v1 (copy), l_useState_0 (copy), l_useEffect_0 (copy)
    local v13 = l_DataModelTraversalOptions_0.new(v12);
    local v14 = l_usePrevious_0(v12);
    local v15 = l_useMemo_0(function() --[[ Line: 26 ]]
        -- upvalues: v4 (ref), v10 (copy), v11 (copy), v12 (copy)
        return v4.createLazyInstanceCollector(v10, v11, v12);
    end, v1.List.join(v10, {
        v11
    }));
    local v16, v17 = l_useState_0({});
    if v12 and v14 and v12.instanceProcessingLimit ~= v14.instanceProcessingLimit then
        v15.setInstancesProcessedPerFrame(v13.instanceProcessingLimit);
    end;
    l_useEffect_0(function() --[[ Line: 38 ]]
        -- upvalues: v15 (copy), v17 (copy)
        v15.onStepped(function(v18) --[[ Line: 39 ]]
            -- upvalues: v17 (ref)
            v17(table.clone(v18));
        end);
        v15.listen();
        return function() --[[ Line: 47 ]]
            -- upvalues: v15 (ref)
            v15.destroy();
        end;
    end, {
        v15
    });
    return v16;
end;
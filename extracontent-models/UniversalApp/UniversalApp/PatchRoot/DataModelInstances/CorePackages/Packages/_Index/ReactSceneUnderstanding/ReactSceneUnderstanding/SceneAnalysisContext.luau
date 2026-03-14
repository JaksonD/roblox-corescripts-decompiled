local l_script_FirstAncestor_0 = script:FindFirstAncestor("ReactSceneUnderstanding");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.Parent.SceneUnderstanding);
local l_useState_0 = v1.useState;
local v4 = v1.createContext(nil);
return {
    Provider = function(v5) --[[ Line: 102 ]] --[[ Name: SceneAnalysisProvider ]]
        -- upvalues: l_useState_0 (copy), v1 (copy), v4 (copy)
        local v6, v7 = l_useState_0({});
        local v8, v9 = l_useState_0({});
        local v10, v11 = l_useState_0({});
        local v12, v13 = l_useState_0({});
        return v1.createElement(v4.Provider, {
            value = {
                rangeQueryOptions = v5.rangeQueryOptions, 
                viewportQueryOptions = v5.viewportQueryOptions, 
                dataModelTraversalOptions = v5.dataModelTraversalOptions, 
                sourceAssets = v6, 
                setSourceAssets = v7, 
                assetsInView = v8, 
                setAssetsInView = v9, 
                assetsInRange = v10, 
                setAssetsInRange = v11, 
                audibleSounds = v12, 
                setAudibleSounds = v13
            }
        }, v5.children);
    end, 
    use = function() --[[ Line: 129 ]] --[[ Name: use ]]
        -- upvalues: v1 (copy), v4 (copy)
        local v14 = v1.useContext(v4);
        if v14 then
            return v14;
        else
            error("attempt to use SceneAnalysisContext with no provider. Add `ReactSceneUnderstanding.SceneAnalysisProvider` to the React tree and try again");
            return;
        end;
    end
};
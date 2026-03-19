local l_script_FirstAncestor_0 = script:FindFirstAncestor("ReactSceneUnderstanding");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Parent.SceneUnderstanding);
local v3 = require(l_script_FirstAncestor_0.SceneAnalysisContext);
local v4 = require(l_script_FirstAncestor_0.useCurrentCamera);
local v5 = require(l_script_FirstAncestor_0.useCameraState);
local v6 = require(l_script_FirstAncestor_0.enums);
local l_getSourceAssetsInView_0 = v2.getSourceAssetsInView;
local l_getSourceAssetsInRange_0 = v2.getSourceAssetsInRange;
local l_useCallback_0 = v1.useCallback;
local l_useEffect_0 = v1.useEffect;
return function(v11) --[[ Line: 18 ]] --[[ Name: useSourceAssets ]]
    -- upvalues: v4 (copy), v3 (copy), v5 (copy), l_useCallback_0 (copy), l_getSourceAssetsInView_0 (copy), l_getSourceAssetsInRange_0 (copy), l_useEffect_0 (copy), v2 (copy), v6 (copy)
    local v12 = v4();
    local v13 = v3.use();
    local v14 = v5(v12);
    local v19 = l_useCallback_0(function(v15, v16) --[[ Line: 27 ]]
        if #v16 == #v15 then
            for _, v18 in v15 do
                if not table.find(v16, v18) then
                    return true;
                end;
            end;
            return false;
        else
            return true;
        end;
    end, {});
    local v24 = l_useCallback_0(function() --[[ Line: 41 ]]
        -- upvalues: l_getSourceAssetsInView_0 (ref), v12 (copy), v11 (copy), v13 (copy), v19 (copy), l_getSourceAssetsInRange_0 (ref)
        local v20 = l_getSourceAssetsInView_0(v12, if v11 then v11.viewportQueryOptions else nil);
        v13.setAssetsInView(function(v21) --[[ Line: 43 ]]
            -- upvalues: v19 (ref), v20 (copy)
            if v19(v21, v20) then
                return v20;
            else
                return v21;
            end;
        end);
        local v22 = l_getSourceAssetsInRange_0(v12.CFrame.Position, if v11 then v11.rangeQueryOptions else nil);
        v13.setAssetsInRange(function(v23) --[[ Line: 49 ]]
            -- upvalues: v19 (ref), v22 (copy)
            if v19(v23, v22) then
                return v22;
            else
                return v23;
            end;
        end);
    end, {
        v12, 
        v11, 
        v13
    });
    l_useEffect_0(function() --[[ Line: 54 ]]
        -- upvalues: v2 (ref), v24 (copy)
        local v26 = workspace.DescendantAdded:Connect(function(v25) --[[ Line: 55 ]]
            -- upvalues: v2 (ref), v24 (ref)
            if v2.isSourceAsset(v25) then
                v24();
            end;
        end);
        v24();
        return function() --[[ Line: 63 ]]
            -- upvalues: v26 (copy)
            v26:Disconnect();
        end;
    end, {
        v24
    });
    l_useEffect_0(function() --[[ Line: 68 ]]
        -- upvalues: v14 (copy), v6 (ref), v24 (copy)
        if v14 == v6.CameraState.Idle then
            v24();
        end;
    end, {
        v14
    });
    return {
        assetsInRange = v13.assetsInRange, 
        assetsInView = v13.assetsInView
    };
end;
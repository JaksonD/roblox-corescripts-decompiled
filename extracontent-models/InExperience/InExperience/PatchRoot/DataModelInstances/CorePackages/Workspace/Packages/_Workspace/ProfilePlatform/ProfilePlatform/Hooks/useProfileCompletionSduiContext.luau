local l_Parent_0 = script:FindFirstAncestor("ProfilePlatform").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Signals);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.SduiCoreSystem);
local l_calculateItemWidth_0 = require(l_Parent_0.CollectionViews).calculateItemWidth;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_useTokens_0 = v3.Hooks.useTokens;
local l_getSduiServiceDependenciesStore_0 = v4.getSduiServiceDependenciesStore;
local function _(v9, v10, v11, v12, v13) --[[ Line: 24 ]] --[[ Name: computePeekFraction ]]
    local v14 = v13 - v12;
    if v14 <= 0 then
        return 0;
    else
        local v15 = v9 - v10 - (v11 - 1) * v12 - v13;
        if v15 <= 0 then
            return 0;
        else
            return (math.clamp(v11 * v14 / v15, 0, 0.5));
        end;
    end;
end;
return function(v17) --[[ Line: 50 ]] --[[ Name: useProfileCompletionSduiContext ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_calculateItemWidth_0 (copy), v2 (copy), l_AppPage_0 (copy), l_getSduiServiceDependenciesStore_0 (copy)
    local v18 = l_useTokens_0();
    local l_Medium_0 = v18.Gap.Medium;
    local l_Size_1500_0 = v18.Size.Size_1500;
    local v27 = v1.useMemo(function() --[[ Line: 55 ]]
        -- upvalues: v17 (copy), l_Medium_0 (copy), l_Size_1500_0 (copy)
        local l_containerWidth_0 = v17.containerWidth;
        local l_sideMargin_0 = v17.sideMargin;
        local l_l_Medium_0_0 = l_Medium_0;
        local l_l_Size_1500_0_0 = l_Size_1500_0;
        local v25 = l_l_Size_1500_0_0 - l_l_Medium_0_0;
        if v25 <= 0 then
            return 0;
        else
            local v26 = l_containerWidth_0 - l_sideMargin_0 - l_l_Medium_0_0 * 0 - l_l_Size_1500_0_0;
            if v26 <= 0 then
                return 0;
            else
                return (math.clamp(v25 * 1 / v26, 0, 0.5));
            end;
        end;
    end, {
        v17.containerWidth, 
        v17.sideMargin, 
        l_Medium_0, 
        l_Size_1500_0
    });
    local v28 = v1.useMemo(function() --[[ Line: 59 ]]
        -- upvalues: l_calculateItemWidth_0 (ref), l_Medium_0 (copy), v17 (copy), v27 (copy)
        return l_calculateItemWidth_0(1, l_Medium_0, v17.sideMargin, v17.containerWidth, v27);
    end, {
        l_Medium_0, 
        v17.sideMargin, 
        v17.containerWidth, 
        v27
    });
    local v29, v30 = v1.useMemo(function() --[[ Line: 63 ]]
        -- upvalues: v2 (ref), v27 (copy), l_Medium_0 (copy), v17 (copy), v28 (copy)
        return v2.createSignal({
            numColumns = 1, 
            fractionalItemAmount = v27, 
            columnGap = l_Medium_0, 
            sideMargin = v17.sideMargin, 
            verticalPadding = 0, 
            itemWidth = v28
        });
    end, {});
    v1.useEffect(function() --[[ Line: 74 ]]
        -- upvalues: v30 (copy), v27 (copy), l_Medium_0 (copy), v17 (copy), v28 (copy)
        v30({
            numColumns = 1, 
            fractionalItemAmount = v27, 
            columnGap = l_Medium_0, 
            sideMargin = v17.sideMargin, 
            verticalPadding = 0, 
            itemWidth = v28
        });
    end, {
        v27, 
        l_Medium_0, 
        v17.sideMargin, 
        v28, 
        v30
    });
    local v33 = v1.useCallback(function(_) --[[ Line: 85 ]]
        -- upvalues: v2 (ref), v29 (copy)
        return v2.createComputed(function(v32) --[[ Line: 86 ]]
            -- upvalues: v29 (ref)
            return v29(v32);
        end);
    end, {
        v29
    });
    local l_ProfilePlatform_0 = l_AppPage_0.ProfilePlatform;
    return (v1.useMemo(function() --[[ Line: 92 ]]
        -- upvalues: l_getSduiServiceDependenciesStore_0 (ref), l_ProfilePlatform_0 (copy), v33 (copy)
        return {
            dependencies = l_getSduiServiceDependenciesStore_0().getDependencies(l_ProfilePlatform_0), 
            appPage = l_ProfilePlatform_0, 
            getPageLayoutConfig = v33
        };
    end, {
        l_ProfilePlatform_0, 
        v33
    }));
end;
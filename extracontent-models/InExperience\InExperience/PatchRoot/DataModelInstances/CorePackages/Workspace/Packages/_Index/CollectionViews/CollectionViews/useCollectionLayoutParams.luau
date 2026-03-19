local l_script_FirstAncestor_0 = script:FindFirstAncestor("CollectionViews");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local l_usePreferredInput_0 = require(l_Parent_0.Responsive).usePreferredInput;
local v6 = require(l_Parent_0.Display);
local l_useStore_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useStore;
local v8 = require(l_script_FirstAncestor_0.CollectionLayoutCalculators);
local v9 = require(l_script_FirstAncestor_0.calculateItemWidth);
local _ = require(l_script_FirstAncestor_0.CollectionViewTypes);
local l_FFlagLuaAppLayoutParamsInContext_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppLayoutParamsInContext;
local v12 = game:DefineFastFlag("LuaAppUseDisplayStoreForCollectionLayoutParams", false);
return function(v13, v14, v15, v16, v17, v18) --[[ Line: 35 ]] --[[ Name: useCollectionLayoutParams ]]
    -- upvalues: l_useStore_0 (copy), v12 (copy), v6 (copy), v8 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_useTokens_0 (copy), l_useDesignTokens_0 (copy), l_usePreferredInput_0 (copy), v2 (copy), v9 (copy)
    local v19 = l_useStore_0();
    local v20 = if v12 then v6.GetDisplayStore(false).getViewportSize(false) or Vector2.new(0, 0) else v19:getState().ScreenSize or Vector2.new(0, 0);
    local v21 = v17 or v8;
    local v22 = v16 and v16.sideMargin or nil;
    local v23 = v16 and v16.columnGap or nil;
    local v24 = v16 and v16.numColumns or nil;
    local v25 = v16 and v16.fractionalItemAmount or nil;
    local v26 = v16 and v16.loadMoreThreshold or nil;
    local v27 = v16 and v16.verticalPadding or nil;
    local v28 = if l_FFlagLuaAppLayoutParamsInContext_0 then l_useTokens_0() else l_useDesignTokens_0();
    local v29 = l_usePreferredInput_0();
    local v30 = v27 or v21.calculateVerticalPadding(v28, v13);
    local v31 = v21.calculateMaxTilesToShow(v29);
    local v32 = v2.useRef(nil);
    if v32.current == nil then
        v32.current = v18 or v20;
    end;
    local l_X_0 = v32.current.X;
    local v34, v35 = v2.useState(function() --[[ Line: 80 ]]
        -- upvalues: v22 (copy), v21 (copy), l_X_0 (copy), v28 (copy), v20 (copy)
        return v22 or v21.calculateSideMargin(l_X_0, v28, v20.X);
    end);
    local v36, v37 = v2.useState(function() --[[ Line: 83 ]]
        -- upvalues: v23 (copy), v21 (copy), l_X_0 (copy), v28 (copy), v20 (copy)
        return v23 or v21.calculateColumnGap(l_X_0, v28, v20.X);
    end);
    local v38, v39 = v2.useState(function() --[[ Line: 86 ]]
        -- upvalues: v25 (copy), v21 (copy), v13 (copy), v29 (copy)
        return v25 or v21.calculateFractionalItemAmount(v13, v29);
    end);
    local v40, v41 = v2.useState(function() --[[ Line: 90 ]]
        -- upvalues: v24 (copy), v21 (copy), l_X_0 (copy), v34 (copy), v36 (copy), v13 (copy), v28 (copy)
        return v24 or v21.calculateNumColumns(l_X_0, v34, v36, v13, v28);
    end);
    local v42, v43 = v2.useState(function() --[[ Line: 94 ]]
        -- upvalues: v26 (copy), v21 (copy), l_X_0 (copy)
        return v26 or v21.calculateLoadMoreThreshold(l_X_0);
    end);
    local v44, v45 = v2.useState(function() --[[ Line: 99 ]]
        -- upvalues: v15 (copy), v9 (ref), v40 (copy), v36 (copy), v34 (copy), l_X_0 (copy), v38 (copy)
        if v15 then
            return v9(v40, v36, v34, l_X_0, v38);
        else
            return 1;
        end;
    end);
    local v55 = v2.useCallback(function(v46) --[[ Line: 108 ]]
        -- upvalues: v12 (ref), v6 (ref), v19 (copy), v22 (copy), v21 (copy), v28 (copy), v35 (copy), v23 (copy), v37 (copy), v24 (copy), v13 (copy), v41 (copy), v25 (copy), v29 (copy), v39 (copy), v26 (copy), v43 (copy), v32 (copy), v15 (copy), v9 (ref), v45 (copy)
        local l_X_1 = v46.X;
        local v48 = if v12 then v6.GetDisplayStore(false).getViewportSize(false) and v6.GetDisplayStore(false).getViewportSize(false).X or 0 else v19:getState().ScreenSize and v19:getState().ScreenSize.X or 0;
        local v49 = v22 or v21.calculateSideMargin(l_X_1, v28, v48);
        v35(v49);
        local v50 = v23 or v21.calculateColumnGap(l_X_1, v28, v48);
        v37(v50);
        local v51 = v24 or v21.calculateNumColumns(l_X_1, v49, v50, v13, v28);
        v41(v51);
        local v52 = v25 or v21.calculateFractionalItemAmount(v13, v29);
        v39(v52);
        local v53 = v26 or v21.calculateLoadMoreThreshold(l_X_1);
        v43(v53);
        v32.current = v46;
        if v15 then
            local v54 = v9(v51, v50, v49, l_X_1, v52);
            v45(v54);
        end;
    end, {
        v13, 
        v15, 
        v23, 
        v22, 
        v24, 
        v25, 
        v26, 
        v28, 
        v19
    });
    v2.useEffect(function() --[[ Line: 168 ]]
        -- upvalues: v14 (copy), v55 (copy)
        local v56 = nil;
        if v14 then
            v55(v14.AbsoluteSize);
            v56 = v14:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 172 ]]
                -- upvalues: v55 (ref), v14 (ref)
                v55(v14.AbsoluteSize);
            end);
        end;
        return function() --[[ Line: 176 ]]
            -- upvalues: v56 (ref)
            if v56 then
                v56:Disconnect();
            end;
        end;
    end, {
        v55, 
        v14
    });
    return {
        numColumns = v40, 
        fractionalItemAmount = v38, 
        columnGap = v36, 
        sideMargin = v34, 
        verticalPadding = v30, 
        maxTilesToShow = v31, 
        itemWidth = v44, 
        loadMoreThreshold = v42
    };
end;
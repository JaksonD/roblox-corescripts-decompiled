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
local l_FFlagLuaAppSearchGridTiles_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppSearchGridTiles;
local v13 = game:DefineFastFlag("LuaAppUseDisplayStoreForCollectionLayoutParams", false);
return function(v14, v15, v16, v17, v18, v19) --[[ Line: 36 ]] --[[ Name: useCollectionLayoutParams ]]
    -- upvalues: l_useStore_0 (copy), v13 (copy), v6 (copy), v8 (copy), l_FFlagLuaAppSearchGridTiles_0 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_useTokens_0 (copy), l_useDesignTokens_0 (copy), l_usePreferredInput_0 (copy), v2 (copy), v9 (copy)
    local v20 = l_useStore_0();
    local v21 = if v13 then v6.GetDisplayStore(false).getViewportSize(false) or Vector2.new(0, 0) else v20:getState().ScreenSize or Vector2.new(0, 0);
    local v22 = v18 or v8;
    local v23 = v17 and v17.sideMargin or nil;
    local v24 = v17 and v17.columnGap or nil;
    local v25 = v17 and v17.numColumns or nil;
    local v26 = v17 and v17.fractionalItemAmount or nil;
    local v27 = v17 and v17.loadMoreThreshold or nil;
    local v28 = if l_FFlagLuaAppSearchGridTiles_0 then v17 and v17.verticalPadding or nil else nil;
    local v29 = if l_FFlagLuaAppLayoutParamsInContext_0 then l_useTokens_0() else l_useDesignTokens_0();
    local v30 = l_usePreferredInput_0();
    local v31 = if l_FFlagLuaAppSearchGridTiles_0 then v28 or v22.calculateVerticalPadding(v29, v14) else v22.calculateVerticalPadding(v29, v14);
    local v32 = v22.calculateMaxTilesToShow(v30);
    local v33 = v2.useRef(nil);
    if v33.current == nil then
        v33.current = v19 or v21;
    end;
    local l_X_0 = v33.current.X;
    local v35, v36 = v2.useState(function() --[[ Line: 84 ]]
        -- upvalues: v23 (copy), v22 (copy), l_X_0 (copy), v29 (copy), v21 (copy)
        return v23 or v22.calculateSideMargin(l_X_0, v29, v21.X);
    end);
    local v37, v38 = v2.useState(function() --[[ Line: 87 ]]
        -- upvalues: v24 (copy), v22 (copy), l_X_0 (copy), v29 (copy), v21 (copy)
        return v24 or v22.calculateColumnGap(l_X_0, v29, v21.X);
    end);
    local v39, v40 = v2.useState(function() --[[ Line: 90 ]]
        -- upvalues: v26 (copy), v22 (copy), v14 (copy), v30 (copy)
        return v26 or v22.calculateFractionalItemAmount(v14, v30);
    end);
    local v41, v42 = v2.useState(function() --[[ Line: 94 ]]
        -- upvalues: v25 (copy), v22 (copy), l_X_0 (copy), v35 (copy), v37 (copy), v14 (copy), v29 (copy)
        return v25 or v22.calculateNumColumns(l_X_0, v35, v37, v14, v29);
    end);
    local v43, v44 = v2.useState(function() --[[ Line: 98 ]]
        -- upvalues: v27 (copy), v22 (copy), l_X_0 (copy)
        return v27 or v22.calculateLoadMoreThreshold(l_X_0);
    end);
    local v45, v46 = v2.useState(function() --[[ Line: 103 ]]
        -- upvalues: v16 (copy), v9 (ref), v41 (copy), v37 (copy), v35 (copy), l_X_0 (copy), v39 (copy)
        if v16 then
            return v9(v41, v37, v35, l_X_0, v39);
        else
            return 1;
        end;
    end);
    local v56 = v2.useCallback(function(v47) --[[ Line: 112 ]]
        -- upvalues: v13 (ref), v6 (ref), v20 (copy), v23 (copy), v22 (copy), v29 (copy), v36 (copy), v24 (copy), v38 (copy), v25 (copy), v14 (copy), v42 (copy), v26 (copy), v30 (copy), v40 (copy), v27 (copy), v44 (copy), v33 (copy), v16 (copy), v9 (ref), v46 (copy)
        local l_X_1 = v47.X;
        local v49 = if v13 then v6.GetDisplayStore(false).getViewportSize(false) and v6.GetDisplayStore(false).getViewportSize(false).X or 0 else v20:getState().ScreenSize and v20:getState().ScreenSize.X or 0;
        local v50 = v23 or v22.calculateSideMargin(l_X_1, v29, v49);
        v36(v50);
        local v51 = v24 or v22.calculateColumnGap(l_X_1, v29, v49);
        v38(v51);
        local v52 = v25 or v22.calculateNumColumns(l_X_1, v50, v51, v14, v29);
        v42(v52);
        local v53 = v26 or v22.calculateFractionalItemAmount(v14, v30);
        v40(v53);
        local v54 = v27 or v22.calculateLoadMoreThreshold(l_X_1);
        v44(v54);
        v33.current = v47;
        if v16 then
            local v55 = v9(v52, v51, v50, l_X_1, v53);
            v46(v55);
        end;
    end, {
        v14, 
        v16, 
        v24, 
        v23, 
        v25, 
        v26, 
        v27, 
        v29, 
        v20
    });
    v2.useEffect(function() --[[ Line: 172 ]]
        -- upvalues: v15 (copy), v56 (copy)
        local v57 = nil;
        if v15 then
            v56(v15.AbsoluteSize);
            v57 = v15:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 176 ]]
                -- upvalues: v56 (ref), v15 (ref)
                v56(v15.AbsoluteSize);
            end);
        end;
        return function() --[[ Line: 180 ]]
            -- upvalues: v57 (ref)
            if v57 then
                v57:Disconnect();
            end;
        end;
    end, {
        v56, 
        v15
    });
    return {
        numColumns = v41, 
        fractionalItemAmount = v39, 
        columnGap = v37, 
        sideMargin = v35, 
        verticalPadding = v31, 
        maxTilesToShow = v32, 
        itemWidth = v45, 
        loadMoreThreshold = v43
    };
end;
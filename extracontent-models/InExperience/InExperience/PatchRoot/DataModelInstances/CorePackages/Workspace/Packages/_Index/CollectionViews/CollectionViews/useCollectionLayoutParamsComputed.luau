local l_script_FirstAncestor_0 = script:FindFirstAncestor("CollectionViews");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v4 = require(l_Parent_0.Responsive);
local l_usePreferredInput_0 = v4.usePreferredInput;
local l_useBreakpointXOrSmaller_0 = v4.useBreakpointXOrSmaller;
local l_useAppPolicy_0 = require(l_Parent_0.UniversalAppPolicy).useAppPolicy;
local v8 = require(l_Parent_0.Signals);
local v9 = require(l_Parent_0.Display);
local v10 = require(l_Parent_0.DiscoveryTypes);
local v11 = game:DefineFastFlag("LuaAppFixComputedSideMarginResponsiveBreakpoint", false);
local v12 = require(l_script_FirstAncestor_0.CollectionLayoutCalculators);
local _ = require(l_script_FirstAncestor_0.CollectionViewTypes);
local l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 = v10.Constants.GAME_CAROUSEL_SIDE_COMPACT_PADDING;
local l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 = v10.Constants.GAME_CAROUSEL_SIDE_WIDE_PADDING;
return function(v16, v17) --[[ Line: 28 ]] --[[ Name: useCollectionLayoutParamsComputed ]]
    -- upvalues: v12 (copy), l_useTokens_0 (copy), l_usePreferredInput_0 (copy), l_useAppPolicy_0 (copy), v2 (copy), v8 (copy), l_useBreakpointXOrSmaller_0 (copy), v11 (copy), v4 (copy), v9 (copy), l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 (copy), l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 (copy)
    local l_v12_0 = v12;
    local v19 = l_useTokens_0();
    local v20 = l_usePreferredInput_0();
    local v22 = l_useAppPolicy_0(function(v21) --[[ Line: 35 ]]
        return v21.useGridPageLayout();
    end);
    local v23, v24 = v2.useMemo(function() --[[ Line: 39 ]]
        -- upvalues: v8 (ref)
        return v8.createSignal(false);
    end, {});
    v24((l_useBreakpointXOrSmaller_0(if v11 then v4.Keys.Small else v4.Keys.Medium)));
    local v27 = v2.useMemo(function() --[[ Line: 47 ]]
        -- upvalues: v8 (ref), v9 (ref)
        return v8.createComputed(function(v25) --[[ Line: 48 ]]
            -- upvalues: v9 (ref)
            local v26 = v9.GetDisplayStore(v25).getViewportSize(v25);
            return v26 and v26.X or 0;
        end);
    end, {});
    local v29, v30 = v2.useMemo(function() --[[ Line: 56 ]]
        -- upvalues: v27 (copy), v8 (ref)
        local v28 = v27(false);
        return v8.createSignal(v28);
    end, {});
    local v34 = v2.useMemo(function() --[[ Line: 62 ]]
        -- upvalues: v8 (ref), v17 (copy), v22 (copy), v23 (copy), l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 (ref), l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 (ref), v27 (copy), v29 (copy), l_v12_0 (copy), v19 (copy)
        return v8.createComputed(function(v31) --[[ Line: 63 ]]
            -- upvalues: v17 (ref), v22 (ref), v23 (ref), l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0 (ref), l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0 (ref), v27 (ref), v29 (ref), l_v12_0 (ref), v19 (ref)
            if v17 then
                return v17;
            elseif not v22 then
                if v23(v31) then
                    return l_GAME_CAROUSEL_SIDE_COMPACT_PADDING_0;
                else
                    return l_GAME_CAROUSEL_SIDE_WIDE_PADDING_0;
                end;
            else
                local v32 = v27(v31);
                local v33 = v29(v31);
                return l_v12_0.calculateSideMargin(v33, v19, v32);
            end;
        end);
    end, {
        v27, 
        v29, 
        v23, 
        v17, 
        l_v12_0, 
        v19, 
        v22
    });
    local v38 = v2.useMemo(function() --[[ Line: 87 ]]
        -- upvalues: v8 (ref), v27 (copy), v29 (copy), l_v12_0 (copy), v19 (copy)
        return v8.createComputed(function(v35) --[[ Line: 88 ]]
            -- upvalues: v27 (ref), v29 (ref), l_v12_0 (ref), v19 (ref)
            local v36 = v27(v35);
            local v37 = v29(v35);
            return l_v12_0.calculateColumnGap(v37, v19, v36);
        end);
    end, {
        v27, 
        v29, 
        l_v12_0, 
        v19
    });
    local v44 = v2.useCallback(function(v39) --[[ Line: 95 ]]
        -- upvalues: v8 (ref), v29 (copy), v34 (copy), v38 (copy), l_v12_0 (copy), v19 (copy)
        return v8.createComputed(function(v40) --[[ Line: 96 ]]
            -- upvalues: v29 (ref), v34 (ref), v38 (ref), l_v12_0 (ref), v39 (copy), v19 (ref)
            local v41 = v29(v40);
            local v42 = v34(v40);
            local v43 = v38(v40);
            return l_v12_0.calculateNumColumns(v41, v42, v43, v39, v19);
        end);
    end, {
        v29, 
        v34, 
        v38, 
        l_v12_0, 
        v19
    });
    local v47 = v2.useCallback(function(v45) --[[ Line: 105 ]]
        -- upvalues: v30 (copy)
        local l_X_0 = v45.X;
        v30(l_X_0);
    end, {
        v30
    });
    v2.useEffect(function() --[[ Line: 113 ]]
        -- upvalues: v16 (copy), v47 (copy)
        local v48 = nil;
        if v16 then
            v47(v16.AbsoluteSize);
            v48 = v16:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 117 ]]
                -- upvalues: v47 (ref), v16 (ref)
                v47(v16.AbsoluteSize);
            end);
        end;
        return function() --[[ Line: 121 ]]
            -- upvalues: v48 (ref)
            if v48 then
                v48:Disconnect();
            end;
        end;
    end, {
        v47, 
        v16
    });
    return (v2.useCallback(function(v49) --[[ Line: 129 ]]
        -- upvalues: v8 (ref), v44 (copy), v38 (copy), v34 (copy), l_v12_0 (copy), v20 (copy), v19 (copy)
        return v8.createComputed(function(v50) --[[ Line: 130 ]]
            -- upvalues: v44 (ref), v49 (copy), v38 (ref), v34 (ref), l_v12_0 (ref), v20 (ref), v19 (ref)
            local v51 = v44(v49)(v50);
            local v52 = v38(v50);
            local v53 = v34(v50);
            local v54 = l_v12_0.calculateFractionalItemAmount(v49, v20);
            local v55 = l_v12_0.calculateVerticalPadding(v19, v49);
            local v56 = l_v12_0.calculateMaxTilesToShow(v20);
            return {
                numColumns = v51, 
                fractionalItemAmount = v54, 
                columnGap = v52, 
                sideMargin = v53, 
                verticalPadding = v55, 
                maxTilesToShow = v56
            };
        end);
    end, {
        v44, 
        v38, 
        v34, 
        v20, 
        v19, 
        l_v12_0
    }));
end;
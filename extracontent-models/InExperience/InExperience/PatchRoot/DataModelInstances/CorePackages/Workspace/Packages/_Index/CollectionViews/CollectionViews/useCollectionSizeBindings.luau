local l_script_FirstAncestor_0 = script:FindFirstAncestor("CollectionViews");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.calculateItemWidth);
local l_useStore_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useStore;
local function v13(v5, v6, v7, v8, v9, v10) --[[ Line: 10 ]] --[[ Name: getItemSize ]]
    -- upvalues: v3 (copy)
    local v11 = v3(v5, v6, v7, v8, v9);
    local v12 = v10(v11);
    return Vector2.new(v11, v12);
end;
return function(v14, v15, v16, v17, v18, v19) --[[ Line: 27 ]] --[[ Name: useCollectionSizeBindings ]]
    -- upvalues: l_useStore_0 (copy), v2 (copy), v13 (copy), v3 (copy)
    local v20 = l_useStore_0();
    local v21, v22 = v2.useBinding(Vector2.zero);
    if v21:getValue() == Vector2.zero then
        v22(v20:getState().ScreenSize);
    end;
    local v23, v24 = v2.useBinding(v13(v14, v15, v16, v21:getValue() and v21:getValue().X or 0, v17, v18));
    local v25, v26 = v2.useState(nil);
    local v38 = v2.useCallback(function(v27) --[[ Line: 53 ]]
        -- upvalues: v19 (copy), v22 (copy), v14 (copy), v15 (copy), v16 (copy), v17 (copy), v18 (copy), v3 (ref), v24 (copy)
        local l_AbsoluteSize_0 = v27.AbsoluteSize;
        if v19 then
            v19(l_AbsoluteSize_0);
        end;
        v22(l_AbsoluteSize_0);
        local l_v14_0 = v14;
        local l_v15_0 = v15;
        local l_v16_0 = v16;
        local v32 = l_AbsoluteSize_0 and l_AbsoluteSize_0.X or 0;
        local l_v17_0 = v17;
        local l_v18_0 = v18;
        local v35 = v3(l_v14_0, l_v15_0, l_v16_0, v32, l_v17_0);
        local v36 = l_v18_0(v35);
        local v37 = Vector2.new(v35, v36);
        v24(v37);
    end, {
        v14, 
        v15, 
        v16, 
        v17, 
        v18, 
        v19
    });
    v2.useEffect(function() --[[ Line: 71 ]]
        -- upvalues: v25 (copy), v38 (copy)
        if v25 then
            v38(v25);
        end;
    end, {
        v38, 
        v25
    });
    return v23, v21, v38, v26;
end;
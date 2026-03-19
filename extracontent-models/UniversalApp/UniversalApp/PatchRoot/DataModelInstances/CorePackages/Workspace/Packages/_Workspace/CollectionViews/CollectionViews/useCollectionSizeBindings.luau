local l_script_FirstAncestor_0 = script:FindFirstAncestor("CollectionViews");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.calculateItemWidth);
local l_useStore_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useStore;
local l_FFlagLuaAppCompositionSupport_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppCompositionSupport;
local function v15(v6, v7, v8, v9, v10, v11, v12) --[[ Line: 12 ]] --[[ Name: getItemSize ]]
    -- upvalues: v3 (copy), l_FFlagLuaAppCompositionSupport_0 (copy)
    local v13 = v3(v6, v7, v8, v9, v10, if l_FFlagLuaAppCompositionSupport_0 then v12 else nil);
    local v14 = v11(v13);
    return Vector2.new(v13, v14);
end;
return function(v16, v17, v18, v19, v20, v21, v22) --[[ Line: 37 ]] --[[ Name: useCollectionSizeBindings ]]
    -- upvalues: l_useStore_0 (copy), v2 (copy), v15 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), v3 (copy)
    local v23 = l_useStore_0();
    local v24, v25 = v2.useBinding(Vector2.zero);
    if v24:getValue() == Vector2.zero then
        v25(v23:getState().ScreenSize);
    end;
    local v26, v27 = v2.useBinding(v15(v16, v17, v18, v24:getValue() and v24:getValue().X or 0, v19, v20, if l_FFlagLuaAppCompositionSupport_0 then v22 else nil));
    local v28, v29 = v2.useState(nil);
    local v42 = v2.useCallback(function(v30) --[[ Line: 66 ]]
        -- upvalues: v21 (copy), v25 (copy), v16 (copy), v17 (copy), v18 (copy), v19 (copy), v20 (copy), l_FFlagLuaAppCompositionSupport_0 (ref), v22 (copy), v3 (ref), v27 (copy)
        local l_AbsoluteSize_0 = v30.AbsoluteSize;
        if v21 then
            v21(l_AbsoluteSize_0);
        end;
        v25(l_AbsoluteSize_0);
        local l_v16_0 = v16;
        local l_v17_0 = v17;
        local l_v18_0 = v18;
        local v35 = l_AbsoluteSize_0 and l_AbsoluteSize_0.X or 0;
        local l_v19_0 = v19;
        local l_v20_0 = v20;
        local v38 = if l_FFlagLuaAppCompositionSupport_0 then v22 else nil;
        local v39 = v3(l_v16_0, l_v17_0, l_v18_0, v35, l_v19_0, if l_FFlagLuaAppCompositionSupport_0 then v38 else nil);
        local v40 = l_v20_0(v39);
        local v41 = Vector2.new(v39, v40);
        v27(v41);
    end, {
        v16, 
        v17, 
        v18, 
        v19, 
        v20, 
        v21, 
        if l_FFlagLuaAppCompositionSupport_0 then v22 else nil
    });
    v2.useEffect(function() --[[ Line: 95 ]]
        -- upvalues: v28 (copy), v42 (copy)
        if v28 then
            v42(v28);
        end;
    end, {
        v42, 
        v28
    });
    return v26, v24, v42, v29;
end;
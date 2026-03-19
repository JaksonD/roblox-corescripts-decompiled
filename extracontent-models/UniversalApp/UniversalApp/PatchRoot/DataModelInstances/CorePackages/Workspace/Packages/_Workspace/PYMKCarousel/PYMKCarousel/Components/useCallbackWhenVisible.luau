local l_Parent_0 = script:FindFirstAncestor("PYMKCarousel").Parent;
local v1 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useNavigationFocus_0 = require(l_Parent_0.Navigation).useNavigationFocus;
local v4 = game:DefineFastInt("HomePagePYMKPercentageOfViewPortToStartFetch", 25);
local function v11() --[[ Line: 22 ]]
    -- upvalues: l_useSelector_0 (copy), v1 (copy)
    local v6 = l_useSelector_0(function(v5) --[[ Line: 23 ]]
        return v5.ScreenSize;
    end);
    local v8 = l_useSelector_0(function(v7) --[[ Line: 26 ]]
        return v7.TopBar.topBarHeight;
    end);
    local v10 = l_useSelector_0(function(v9) --[[ Line: 29 ]]
        return v9.GlobalGuiInset;
    end);
    return (v1.useMemo(function() --[[ Line: 32 ]]
        -- upvalues: v8 (copy), v6 (copy), v10 (copy)
        return {
            min = Vector2.new(0, v8), 
            max = Vector2.new(v6.X, v6.Y - v10.bottom)
        };
    end, {
        v8, 
        v6, 
        v10
    }));
end;
local function _(v12, v13) --[[ Line: 42 ]]
    -- upvalues: v4 (copy)
    local v14 = v13 and v13.current;
    if not v14 then
        return false;
    else
        local l_Y_0 = v14.AbsolutePosition.Y;
        local v16 = v14.AbsolutePosition.Y + v14.AbsoluteSize.Y;
        local l_Y_1 = v12.min.Y;
        local l_Y_2 = v12.max.Y;
        local v19 = (l_Y_2 - l_Y_1) / 100 * v4;
        local v20 = false;
        if l_Y_1 - v19 < l_Y_0 then
            v20 = v16 < l_Y_2 + v19;
        end;
        return v20;
    end;
end;
return function(v22) --[[ Line: 67 ]]
    -- upvalues: l_useNavigationFocus_0 (copy), v11 (copy), v1 (copy), v4 (copy)
    local l_elementRef_0 = v22.elementRef;
    local l_scrollViewPositionChangedSignal_0 = v22.scrollViewPositionChangedSignal;
    local l_callback_0 = v22.callback;
    local v26 = l_useNavigationFocus_0();
    local v27 = v11();
    v1.useEffect(function() --[[ Line: 76 ]]
        -- upvalues: v27 (copy), l_elementRef_0 (copy), v4 (ref), v26 (copy), l_callback_0 (copy), l_scrollViewPositionChangedSignal_0 (copy)
        local l_v27_0 = v27;
        local l_l_elementRef_0_0 = l_elementRef_0;
        local v30 = l_l_elementRef_0_0 and l_l_elementRef_0_0.current;
        local v31;
        if not v30 then
            v31 = false;
        else
            local l_Y_3 = v30.AbsolutePosition.Y;
            local v33 = v30.AbsolutePosition.Y + v30.AbsoluteSize.Y;
            local l_Y_4 = l_v27_0.min.Y;
            local l_Y_5 = l_v27_0.max.Y;
            local v36 = (l_Y_5 - l_Y_4) / 100 * v4;
            local v37 = false;
            if l_Y_4 - v36 < l_Y_3 then
                v37 = v33 < l_Y_5 + v36;
            end;
            v31 = v37;
        end;
        if v31 and v26 then
            l_callback_0();
        end;
        if l_scrollViewPositionChangedSignal_0 then
            l_scrollViewPositionChangedSignal_0:connect(function() --[[ Line: 82 ]]
                -- upvalues: v27 (ref), l_elementRef_0 (ref), v4 (ref), v26 (ref), l_callback_0 (ref)
                local l_v27_1 = v27;
                local l_l_elementRef_0_1 = l_elementRef_0;
                local v40 = l_l_elementRef_0_1 and l_l_elementRef_0_1.current;
                local v41;
                if not v40 then
                    v41 = false;
                else
                    local l_Y_6 = v40.AbsolutePosition.Y;
                    local v43 = v40.AbsolutePosition.Y + v40.AbsoluteSize.Y;
                    local l_Y_7 = l_v27_1.min.Y;
                    local l_Y_8 = l_v27_1.max.Y;
                    local v46 = (l_Y_8 - l_Y_7) / 100 * v4;
                    local v47 = false;
                    if l_Y_7 - v46 < l_Y_6 then
                        v47 = v43 < l_Y_8 + v46;
                    end;
                    v41 = v47;
                end;
                if v41 and v26 then
                    l_callback_0();
                end;
            end);
        end;
    end, {
        l_elementRef_0, 
        l_scrollViewPositionChangedSignal_0, 
        v26, 
        v27
    });
end;
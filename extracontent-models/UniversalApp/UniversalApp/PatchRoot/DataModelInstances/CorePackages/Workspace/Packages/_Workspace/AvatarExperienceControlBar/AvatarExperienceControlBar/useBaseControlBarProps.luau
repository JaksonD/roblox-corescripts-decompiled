local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceControlBar");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.RoactGamepad);
local v5 = require(l_Parent_0.AvatarExperienceCommon);
local l_useTokens_0 = v3.Hooks.useTokens;
local l_debounce_0 = v5.Utils.debounce;
local _ = require(l_script_FirstAncestor_0.ControlBarTypes);
local v9 = {
    [Enum.KeyCode.Up] = true, 
    [Enum.KeyCode.Down] = true, 
    [Enum.KeyCode.Left] = true, 
    [Enum.KeyCode.Right] = true, 
    [Enum.KeyCode.DPadDown] = true, 
    [Enum.KeyCode.DPadUp] = true, 
    [Enum.KeyCode.DPadLeft] = true, 
    [Enum.KeyCode.DPadRight] = true, 
    [Enum.KeyCode.Thumbstick1] = true
};
return function(v10) --[[ Line: 37 ]] --[[ Name: useBaseControlBarProps ]]
    -- upvalues: l_useTokens_0 (copy), v2 (copy), v4 (copy), l_debounce_0 (copy), v9 (copy)
    local v11 = l_useTokens_0();
    local v12 = v2.useRef(false);
    local v13 = v2.useRef(nil);
    local v14 = v2.useRef(nil);
    local v15 = v4.useRefCache();
    local v20 = v2.useCallback(function() --[[ Line: 50 ]]
        -- upvalues: v10 (copy), v15 (copy)
        local v16 = {};
        local v17 = {};
        if v10.config then
            for _, v19 in v10.config do
                if v19.children then
                    v17[v19.id] = v19.children;
                end;
                v19.ref = v15[v19.id];
                table.insert(v16, v19);
            end;
        end;
        return v16, v17;
    end, {
        v10.config
    });
    local v21, v22 = v20();
    local v23, v24 = v2.useState(v21);
    local v25, v26 = v2.useState(v22);
    local v27, v28 = v2.useState("");
    v2.useEffect(function() --[[ Line: 77 ]]
        -- upvalues: v20 (copy), v24 (copy), v26 (copy)
        local v29, v30 = v20();
        v24(v29);
        v26(v30);
    end, {
        v20
    });
    v2.useEffect(function() --[[ Line: 83 ]]
        -- upvalues: v10 (copy), v27 (copy), v25 (copy)
        if v10.onActiveMenuItemChanged then
            v10.onActiveMenuItemChanged(v27, v25[v27] ~= nil);
        end;
    end, {
        v27, 
        v25
    });
    local v31 = v2.useMemo(function() --[[ Line: 89 ]]
        -- upvalues: v25 (copy), v27 (copy)
        return v25[v27];
    end, {
        v27, 
        v25
    });
    local v37 = v2.useMemo(function() --[[ Line: 93 ]]
        -- upvalues: v15 (copy), v27 (copy), v13 (copy), v14 (copy), v11 (copy)
        local v32 = v15[v27];
        if v32 and v32.current and v13.current and v14.current then
            local l_AbsolutePosition_0 = v32.current.AbsolutePosition;
            local l_AbsolutePosition_1 = v13.current.AbsolutePosition;
            local l_AbsoluteSize_0 = v14.current.AbsoluteSize;
            local v36 = l_AbsolutePosition_0 - l_AbsolutePosition_1 + Vector2.new(l_AbsoluteSize_0.X + v11.Size.Size_50, 0);
            return UDim2.new(0, v36.X, 0, v36.Y);
        else
            return nil;
        end;
    end, {
        v27
    });
    local v38 = v2.useCallback(l_debounce_0(function() --[[ Line: 110 ]]
        -- upvalues: v12 (copy)
        v12.current = false;
    end, 0.1), {});
    local v40 = v2.useCallback(function(v39) --[[ Line: 116 ]]
        -- upvalues: v28 (copy), v27 (copy), v12 (copy), v38 (copy)
        v28(v39 == v27 and "" or v39);
        v12.current = true;
        v38();
    end, {
        v27
    });
    local v42 = v2.useCallback(function(_) --[[ Line: 122 ]]
        -- upvalues: v28 (copy), v12 (copy), v38 (copy)
        v28("");
        v12.current = true;
        v38();
    end, {});
    local v44 = v2.useCallback(function(v43) --[[ Line: 132 ]]
        -- upvalues: v27 (copy), v12 (copy), v9 (ref), v28 (copy)
        if v27 ~= "" and not v12.current and not v9[v43.KeyCode] then
            v28("");
        end;
        v12.current = false;
    end, {
        v27
    });
    return {
        activeMenuItemId = v27, 
        menus = v23, 
        submenus = v25, 
        submenuItems = v31, 
        submenuPosition = v37, 
        onMenuItemActivated = v40, 
        onSubmenuItemActivated = v42, 
        onInputEnded = v44, 
        containerRef = v13, 
        iconMenuRef = v14, 
        menuItemsRefCache = v15, 
        LayoutOrder = v10.LayoutOrder
    };
end;
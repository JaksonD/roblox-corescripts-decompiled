local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Enums.PopoverAlign);
local _ = require(l_script_FirstAncestor_0.Enums.PopoverSide);
local v4 = require(l_Parent_0.React);
local v5 = require(script.Parent.positioning);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local function v16(v7, v8, v9) --[[ Line: 26 ]] --[[ Name: useConnectSignals ]]
    -- upvalues: v4 (copy)
    local v10 = v4.useRef({});
    v4.useLayoutEffect(function() --[[ Line: 33 ]]
        -- upvalues: v7 (copy), v8 (copy), v10 (copy), v9 (copy)
        if v7 ~= nil then
            for _, v12 in v8 do
                local v13 = if typeof(v7) == "Instance" then v7:GetPropertyChangedSignal(v12) else v7:GetPropertyChangedSignal(v12);
                v10.current[v12] = v13:Connect(type(v9) == "table" and function() --[[ Line: 42 ]]
                    -- upvalues: v9 (ref)
                    v9.current();
                end or v9);
            end;
        end;
        return function() --[[ Line: 50 ]]
            -- upvalues: v10 (ref)
            for _, v15 in v10.current do
                v15:Disconnect();
            end;
        end;
    end, {
        v7, 
        v9
    });
end;
return function(v17, v18, v19, v20, v21, v22, v23) --[[ Line: 58 ]] --[[ Name: useFloating ]]
    -- upvalues: v4 (copy), v5 (copy), v16 (copy)
    local v24, v25 = v4.useBinding(Vector2.new());
    local v26, v27 = v4.useBinding(true);
    local v28, v29 = v4.useBinding(UDim2.new());
    local v30, v31 = v4.useBinding(Vector2.new());
    local v32, v33 = v4.useBinding(Vector2.new());
    local v34, v35 = v4.useBinding(Vector2.new(0, 0));
    local v36 = v4.useRef(function() --[[ Line: 73 ]]

    end);
    local v54 = v4.useCallback(function() --[[ Line: 75 ]]
        -- upvalues: v17 (copy), v18 (copy), v19 (copy), v20 (copy), v27 (copy), v5 (ref), v21 (copy), v22 (copy), v23 (copy), v29 (copy), v31 (copy), v33 (copy), v25 (copy), v35 (copy)
        if not v17 or not v18 or not v19 or not v20 then
            v27(false);
            return;
        else
            local l_AbsolutePosition_0 = v18.AbsolutePosition;
            local l_AbsoluteSize_0 = v18.AbsoluteSize;
            local l_AbsoluteSize_1 = v19.AbsoluteSize;
            local l_AbsoluteSize_2 = v20.AbsoluteSize;
            local l_AbsolutePosition_1 = v20.AbsolutePosition;
            local v42 = Rect.new(l_AbsolutePosition_0, l_AbsolutePosition_0 + l_AbsoluteSize_0);
            local v43 = Rect.new(l_AbsolutePosition_1, l_AbsolutePosition_1 + l_AbsoluteSize_2);
            if not v5.isOnScreen(v42, v43) then
                v27(false);
                return;
            else
                local v44 = if type(v21) == "table" then v21.position else v21;
                local v45 = if type(v21) == "table" then v21.offset else 0;
                local l_v22_0 = v22;
                local v47 = 0;
                if type(v22) == "table" then
                    l_v22_0 = v22.position;
                    v47 = v22.offset;
                end;
                local v48 = v23 or 0;
                local v49 = v5.calculatePopoverBounds(v44, v45, v47, v48, l_AbsoluteSize_1);
                v44 = v5.calculateSide(v44, v42, v43, v49);
                local v50, v51, v52 = v5.calculatePositions(v44, v45, l_v22_0, v47, v42, v43, v48, l_AbsoluteSize_1);
                v29(UDim2.fromOffset(l_AbsoluteSize_1.X, l_AbsoluteSize_1.Y));
                v31(l_AbsoluteSize_2);
                v33(v51 + v50);
                v25(v50);
                v35(v52);
                v27(true);
                local _ = v19.AbsolutePosition;
                return;
            end;
        end;
    end, {
        v17, 
        v18, 
        v19, 
        v20, 
        v21, 
        v22, 
        v23
    });
    v36.current = v54;
    v16(v18, {
        "AbsolutePosition", 
        "AbsoluteSize"
    }, v36);
    v16(v19, {
        "AbsoluteSize"
    }, v36);
    v16(v20, {
        "AbsoluteSize"
    }, v36);
    v4.useLayoutEffect(function() --[[ Line: 146 ]]
        -- upvalues: v54 (copy)
        v54();
    end, {
        v54
    });
    return v24, v26, v28, v32, v30, v34;
end;
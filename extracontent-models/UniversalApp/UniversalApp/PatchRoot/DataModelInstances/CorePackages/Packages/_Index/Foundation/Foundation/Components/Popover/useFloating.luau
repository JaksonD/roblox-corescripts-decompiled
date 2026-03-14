local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_script_FirstAncestor_0.Enums.PopoverAlign);
local _ = require(l_script_FirstAncestor_0.Enums.PopoverSide);
local v4 = require(l_Parent_0.React);
local v5 = require(script.Parent.positioning);
local l_Services_0 = require(l_script_FirstAncestor_0.Utility.Wrappers).Services;
local l_UserInputService_0 = l_Services_0.UserInputService;
local l_GuiService_0 = l_Services_0.GuiService;
local v9 = require(l_script_FirstAncestor_0.Utility.Flags);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local function v20(v11, v12, v13) --[[ Line: 30 ]] --[[ Name: useConnectSignals ]]
    -- upvalues: v4 (copy)
    local v14 = v4.useRef({});
    v4.useLayoutEffect(function() --[[ Line: 37 ]]
        -- upvalues: v11 (copy), v12 (copy), v14 (copy), v13 (copy)
        if v11 ~= nil then
            for _, v16 in v12 do
                local v17 = if typeof(v11) == "Instance" then v11:GetPropertyChangedSignal(v16) else v11:GetPropertyChangedSignal(v16);
                v14.current[v16] = v17:Connect(type(v13) == "table" and function() --[[ Line: 46 ]]
                    -- upvalues: v13 (ref)
                    v13.current();
                end or v13);
            end;
        end;
        return function() --[[ Line: 54 ]]
            -- upvalues: v14 (ref)
            for _, v19 in v14.current do
                v19:Disconnect();
            end;
        end;
    end, {
        v11, 
        v13
    });
end;
return function(v21, v22, v23, v24, v25, v26, v27) --[[ Line: 62 ]] --[[ Name: useFloating ]]
    -- upvalues: v4 (copy), v9 (copy), l_UserInputService_0 (copy), v5 (copy), l_GuiService_0 (copy), v20 (copy)
    local v28, v29 = v4.useBinding(Vector2.new());
    local v30, v31 = v4.useBinding(true);
    local v32, v33 = v4.useBinding(UDim2.new());
    local v34, v35 = v4.useBinding(Vector2.new());
    local v36, v37 = v4.useBinding(Vector2.new());
    local v38, v39 = v4.useBinding(Vector2.new(0, 0));
    local v40 = v4.useRef(function() --[[ Line: 77 ]]

    end);
    local v58 = v4.useCallback(function() --[[ Line: 79 ]]
        -- upvalues: v21 (copy), v22 (copy), v23 (copy), v24 (copy), v31 (copy), v9 (ref), l_UserInputService_0 (ref), v5 (ref), l_GuiService_0 (ref), v25 (copy), v26 (copy), v27 (copy), v33 (copy), v35 (copy), v37 (copy), v29 (copy), v39 (copy)
        if not v21 or not v22 or not v23 or not v24 then
            v31(false);
            return;
        else
            local l_AbsolutePosition_0 = v22.AbsolutePosition;
            local l_AbsoluteSize_0 = v22.AbsoluteSize;
            local l_AbsoluteSize_1 = v23.AbsoluteSize;
            local l_AbsoluteSize_2 = v24.AbsoluteSize;
            local l_AbsolutePosition_1 = v24.AbsolutePosition;
            local v46 = Rect.new(l_AbsolutePosition_0, l_AbsolutePosition_0 + l_AbsoluteSize_0);
            local v47 = Rect.new(l_AbsolutePosition_1, l_AbsolutePosition_1 + l_AbsoluteSize_2);
            if v9.FoundationPopoverOnScreenKeyboard and l_UserInputService_0.OnScreenKeyboardVisible then
                v47 = v5.adjustForOnScreenKeyboard(v47, l_UserInputService_0.OnScreenKeyboardPosition, l_GuiService_0:GetGuiInset());
            end;
            if not v5.isOnScreen(v46, v47) then
                v31(false);
                return;
            else
                local v48 = if type(v25) == "table" then v25.position else v25;
                local v49 = if type(v25) == "table" then v25.offset else 0;
                local l_v26_0 = v26;
                local v51 = 0;
                if type(v26) == "table" then
                    l_v26_0 = v26.position;
                    v51 = v26.offset;
                end;
                local v52 = v27 or 0;
                local v53 = v5.calculatePopoverBounds(v48, v49, v51, v52, l_AbsoluteSize_1);
                v48 = v5.calculateSide(v48, v46, v47, v53);
                local v54, v55, v56 = v5.calculatePositions(v48, v49, l_v26_0, v51, v46, v47, v52, l_AbsoluteSize_1);
                v33(UDim2.fromOffset(l_AbsoluteSize_1.X, l_AbsoluteSize_1.Y));
                v35(l_AbsoluteSize_2);
                v37(v55 + v54);
                v29(v54);
                v39(v56);
                v31(true);
                local _ = v23.AbsolutePosition;
                return;
            end;
        end;
    end, {
        v21, 
        v22, 
        v23, 
        v24, 
        v25, 
        v26, 
        v27
    });
    v40.current = v58;
    v20(v22, {
        "AbsolutePosition", 
        "AbsoluteSize"
    }, v40);
    v20(v23, {
        "AbsoluteSize"
    }, v40);
    v20(v24, {
        "AbsoluteSize"
    }, v40);
    if v9.FoundationPopoverOnScreenKeyboard then
        v20(l_UserInputService_0, {
            "OnScreenKeyboardVisible", 
            "OnScreenKeyboardPosition"
        }, v40);
    end;
    v4.useLayoutEffect(function() --[[ Line: 165 ]]
        -- upvalues: v58 (copy)
        v58();
    end, {
        v58
    });
    return v28, v30, v32, v36, v34, v38;
end;
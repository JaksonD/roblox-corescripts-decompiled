local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useForwardRef_0 = require(l_Parent_0.ReactUtils).useForwardRef;
local v4 = require(l_script_FirstAncestor_0.Enums.ControlState);
local _ = require(l_script_FirstAncestor_0.Enums.ControlStateEvent);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v7 = {
    [Enum.GuiState.Idle] = v4.Default, 
    [Enum.GuiState.Hover] = v4.Hover, 
    [Enum.GuiState.Press] = v4.Pressed, 
    [Enum.GuiState.NonInteractable] = v4.Disabled
};
return function(v8, v9) --[[ Line: 22 ]] --[[ Name: useGuiControlState ]]
    -- upvalues: v2 (copy), v4 (copy), v7 (copy), l_useForwardRef_0 (copy)
    local v10 = v2.useRef(false);
    local v11 = v2.useRef(v4.Initialize);
    local v14 = v2.useCallback(function(v12) --[[ Line: 26 ]]
        -- upvalues: v11 (copy), v10 (copy), v4 (ref), v9 (copy)
        local l_current_0 = v11.current;
        if v10.current then
            if v12 == v4.Default or v12 == v4.Hover then
                v12 = v4.Selected;
            elseif v12 == v4.Pressed then
                v12 = v4.SelectedPressed;
            end;
        end;
        if l_current_0 == v12 then
            return;
        else
            v11.current = v12;
            if v9 ~= nil then
                v9(v12);
            end;
            return;
        end;
    end, {
        v9
    });
    local v20 = v2.useCallback(function(v15) --[[ Line: 48 ]]
        -- upvalues: v14 (copy), v7 (ref), v10 (copy), v11 (copy)
        local v16 = {};
        if v15 then
            v14(v7[v15.GuiState]);
            table.insert(v16, v15:GetPropertyChangedSignal("GuiState"):Connect(function() --[[ Line: 55 ]]
                -- upvalues: v7 (ref), v15 (copy), v14 (ref)
                local v17 = v7[v15.GuiState];
                v14(v17);
            end));
            table.insert(v16, v15.SelectionGained:Connect(function() --[[ Line: 64 ]]
                -- upvalues: v10 (ref), v14 (ref), v11 (ref)
                v10.current = true;
                v14(v11.current);
            end));
            table.insert(v16, v15.SelectionLost:Connect(function() --[[ Line: 71 ]]
                -- upvalues: v10 (ref), v14 (ref), v11 (ref)
                v10.current = false;
                v14(v11.current);
            end));
        end;
        return function() --[[ Line: 78 ]]
            -- upvalues: v16 (copy)
            for _, v19 in v16 do
                v19:Disconnect();
            end;
        end;
    end, {
        v14
    });
    return l_useForwardRef_0(v8, v20);
end;
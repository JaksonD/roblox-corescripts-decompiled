local l_Parent_0 = script:FindFirstAncestor("SduiCoreSystem").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Responsive);
local l_GetInputModeStore_0 = v2.GetInputModeStore;
return v1.memo(function(v4) --[[ Line: 8 ]] --[[ Name: SduiHoverDetector ]]
    -- upvalues: v1 (copy), l_GetInputModeStore_0 (copy), v2 (copy)
    local l_guiObject_0 = v4.guiObject;
    v1.useEffect(function() --[[ Line: 14 ]]
        -- upvalues: l_guiObject_0 (copy), l_GetInputModeStore_0 (ref), v2 (ref), v4 (copy)
        local v6 = {};
        if l_guiObject_0 then
            table.insert(v6, l_guiObject_0.MouseEnter:Connect(function() --[[ Line: 19 ]]
                -- upvalues: l_GetInputModeStore_0 (ref), v2 (ref), v4 (ref)
                if l_GetInputModeStore_0(false).getLastInputType(false) == v2.Input.Pointer then
                    v4.setHovered(true);
                end;
            end));
            table.insert(v6, l_guiObject_0.MouseLeave:Connect(function() --[[ Line: 29 ]]
                -- upvalues: v4 (ref)
                v4.setHovered(false);
            end));
        end;
        return function() --[[ Line: 34 ]]
            -- upvalues: v6 (copy)
            for _, v8 in v6 do
                if v8 then
                    v8:Disconnect();
                end;
            end;
        end;
    end, {
        l_guiObject_0
    });
end);
local l_Parent_0 = script:FindFirstAncestor("SduiCoreSystem").Parent;
local v1 = require(l_Parent_0.React);
return v1.memo(function(v2) --[[ Line: 6 ]] --[[ Name: SduiSelectionDetector ]]
    -- upvalues: v1 (copy)
    local l_guiObject_0 = v2.guiObject;
    local l_setSelected_0 = v2.setSelected;
    v1.useEffect(function() --[[ Line: 10 ]]
        -- upvalues: l_guiObject_0 (copy), l_setSelected_0 (copy)
        local v5 = {};
        if l_guiObject_0 then
            table.insert(v5, l_guiObject_0.SelectionGained:Connect(function() --[[ Line: 15 ]]
                -- upvalues: l_setSelected_0 (ref)
                l_setSelected_0(true);
            end));
            table.insert(v5, l_guiObject_0.SelectionLost:Connect(function() --[[ Line: 21 ]]
                -- upvalues: l_setSelected_0 (ref)
                l_setSelected_0(false);
            end));
        end;
        return function() --[[ Line: 26 ]]
            -- upvalues: v5 (copy)
            for _, v7 in v5 do
                if v7 then
                    v7:Disconnect();
                end;
            end;
        end;
    end, {
        l_guiObject_0, 
        l_setSelected_0
    });
end);
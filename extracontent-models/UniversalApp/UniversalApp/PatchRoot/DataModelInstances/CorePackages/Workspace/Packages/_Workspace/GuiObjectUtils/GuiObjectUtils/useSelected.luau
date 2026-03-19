local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script:FindFirstAncestor("GuiObjectUtils").Parent;
local v2 = require(l_Parent_0.React);
local function _(v3) --[[ Line: 12 ]] --[[ Name: isGuiObjectSelected ]]
    -- upvalues: l_GuiService_0 (copy)
    if v3.current == nil then
        return false;
    else
        local v4 = true;
        if l_GuiService_0.SelectedCoreObject ~= v3.current then
            v4 = l_GuiService_0.SelectedObject == v3.current;
        end;
        return v4;
    end;
end;
return function(v6) --[[ Line: 19 ]] --[[ Name: useSelected ]]
    -- upvalues: v2 (copy), l_GuiService_0 (copy)
    local v9, v10 = v2.useState(function() --[[ Line: 20 ]]
        -- upvalues: v6 (copy), l_GuiService_0 (ref)
        local l_v6_0 = v6;
        if l_v6_0.current == nil then
            return false;
        else
            local v8 = true;
            if l_GuiService_0.SelectedCoreObject ~= l_v6_0.current then
                v8 = l_GuiService_0.SelectedObject == l_v6_0.current;
            end;
            return v8;
        end;
    end);
    v2.useEffect(function() --[[ Line: 25 ]]
        -- upvalues: v10 (copy), v6 (copy), l_GuiService_0 (ref)
        local l_v10_0 = v10;
        local l_v6_1 = v6;
        l_v10_0(l_v6_1.current ~= nil and (l_GuiService_0.SelectedCoreObject == l_v6_1.current or l_GuiService_0.SelectedObject == l_v6_1.current));
    end, {
        v6
    });
    v2.useEffect(function() --[[ Line: 33 ]]
        -- upvalues: v6 (copy), v10 (copy)
        local v13 = {};
        local l_current_0 = v6.current;
        if l_current_0 then
            table.insert(v13, l_current_0.SelectionGained:Connect(function() --[[ Line: 39 ]]
                -- upvalues: v10 (ref)
                v10(true);
            end));
            table.insert(v13, l_current_0.SelectionLost:Connect(function() --[[ Line: 45 ]]
                -- upvalues: v10 (ref)
                v10(false);
            end));
        end;
        return function() --[[ Line: 51 ]]
            -- upvalues: v13 (copy)
            for _, v16 in ipairs(v13) do
                v16:Disconnect();
            end;
        end;
    end, {
        v6
    });
    return v9;
end;
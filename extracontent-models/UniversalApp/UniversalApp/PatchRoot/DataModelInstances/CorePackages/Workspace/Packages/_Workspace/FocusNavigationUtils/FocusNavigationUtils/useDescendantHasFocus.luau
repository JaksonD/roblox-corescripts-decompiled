local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script:FindFirstAncestor("FocusNavigationUtils").Parent;
local v2 = require(l_Parent_0.React);
local function _(v3) --[[ Line: 6 ]] --[[ Name: hasFocus ]]
    -- upvalues: l_GuiService_0 (copy)
    local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
    if v3 and l_SelectedCoreObject_0 then
        local v5 = true;
        if l_SelectedCoreObject_0 ~= v3 then
            v5 = l_SelectedCoreObject_0:IsDescendantOf(v3);
        end;
        return v5 and l_SelectedCoreObject_0:FindFirstAncestorOfClass("CoreGui") ~= nil;
    else
        return false;
    end;
end;
return function(v7) --[[ Line: 18 ]] --[[ Name: useDescendantHasFocus ]]
    -- upvalues: l_GuiService_0 (copy), v2 (copy)
    local l_SelectedCoreObject_1 = l_GuiService_0.SelectedCoreObject;
    local v9;
    if v7 and l_SelectedCoreObject_1 then
        local v10 = true;
        if l_SelectedCoreObject_1 ~= v7 then
            v10 = l_SelectedCoreObject_1:IsDescendantOf(v7);
        end;
        v9 = v10 and l_SelectedCoreObject_1:FindFirstAncestorOfClass("CoreGui") ~= nil;
    else
        v9 = false;
    end;
    local v11;
    l_SelectedCoreObject_1, v11 = v2.useState(v9);
    v2.useEffect(function() --[[ Line: 22 ]]
        -- upvalues: v7 (copy), v11 (copy), l_GuiService_0 (ref)
        local v12 = nil;
        local v13 = nil;
        if v7 then
            local l_v11_0 = v11;
            local l_v7_0 = v7;
            local l_SelectedCoreObject_2 = l_GuiService_0.SelectedCoreObject;
            local v17;
            if l_v7_0 and l_SelectedCoreObject_2 then
                local v18 = true;
                if l_SelectedCoreObject_2 ~= l_v7_0 then
                    v18 = l_SelectedCoreObject_2:IsDescendantOf(l_v7_0);
                end;
                v17 = v18 and l_SelectedCoreObject_2:FindFirstAncestorOfClass("CoreGui") ~= nil;
            else
                v17 = false;
            end;
            l_v11_0(v17);
            v12 = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function() --[[ Line: 28 ]]
                -- upvalues: v13 (ref), v7 (ref), l_GuiService_0 (ref), v11 (ref)
                if v13 then
                    v13:Disconnect();
                end;
                local l_v7_1 = v7;
                local l_SelectedCoreObject_3 = l_GuiService_0.SelectedCoreObject;
                local v21;
                if l_v7_1 and l_SelectedCoreObject_3 then
                    local v22 = true;
                    if l_SelectedCoreObject_3 ~= l_v7_1 then
                        v22 = l_SelectedCoreObject_3:IsDescendantOf(l_v7_1);
                    end;
                    v21 = v22 and l_SelectedCoreObject_3:FindFirstAncestorOfClass("CoreGui") ~= nil;
                else
                    v21 = false;
                end;
                l_v7_1 = l_GuiService_0.SelectedCoreObject;
                if v21 and l_v7_1 then
                    v13 = l_v7_1.AncestryChanged:Connect(function() --[[ Line: 36 ]]
                        -- upvalues: l_v7_1 (copy), v13 (ref), v11 (ref), v7 (ref), l_GuiService_0 (ref)
                        if l_v7_1:FindFirstAncestorOfClass("CoreGui") == nil then
                            v13:Disconnect();
                            local l_v11_1 = v11;
                            local l_v7_2 = v7;
                            local l_SelectedCoreObject_4 = l_GuiService_0.SelectedCoreObject;
                            local v26;
                            if l_v7_2 and l_SelectedCoreObject_4 then
                                local v27 = true;
                                if l_SelectedCoreObject_4 ~= l_v7_2 then
                                    v27 = l_SelectedCoreObject_4:IsDescendantOf(l_v7_2);
                                end;
                                v26 = v27 and l_SelectedCoreObject_4:FindFirstAncestorOfClass("CoreGui") ~= nil;
                            else
                                v26 = false;
                            end;
                            l_v11_1(v26);
                        end;
                    end);
                end;
                v11(v21);
            end);
        else
            v11(false);
        end;
        return function() --[[ Line: 50 ]]
            -- upvalues: v12 (ref), v13 (ref)
            if v12 then
                v12:Disconnect();
            end;
            if v13 then
                v13:Disconnect();
            end;
        end;
    end, {
        v7
    });
    return l_SelectedCoreObject_1;
end;
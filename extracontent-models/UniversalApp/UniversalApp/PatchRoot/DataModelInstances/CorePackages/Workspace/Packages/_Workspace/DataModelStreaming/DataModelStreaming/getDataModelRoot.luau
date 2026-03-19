local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local v2 = require(script.Parent.getInstanceProperties);
local function v3(v4) --[[ Line: 10 ]] --[[ Name: hasGuiBase2dChildren ]]
    -- upvalues: v3 (copy)
    if v4 == nil then
        return false;
    else
        for _, v6 in v4:GetChildren() do
            if v6:IsA("GuiBase2d") then
                return true;
            elseif v3(v6) then
                return true;
            end;
        end;
        return false;
    end;
end;
local function v7(v8, v9) --[[ Line: 28 ]] --[[ Name: getDataModelNode ]]
    -- upvalues: v3 (copy), v7 (copy), v2 (copy)
    if v8 == nil then
        return nil;
    else
        local v10 = v8:IsA("Folder");
        local v11 = v8:IsA("GuiBase2d");
        if not v10 and not v11 then
            return nil;
        elseif v10 and not v3(v8) then
            return nil;
        else
            local v12 = {};
            for _, v14 in v8:GetChildren() do
                local v15 = v7(v14, v9);
                if v15 ~= nil then
                    table.insert(v12, v15);
                end;
            end;
            return {
                Children = v12, 
                Properties = v2(v8, v9)
            };
        end;
    end;
end;
return function(v16) --[[ Line: 58 ]] --[[ Name: getDataModelRoot ]]
    -- upvalues: l_CoreGui_0 (copy), v7 (copy), l_GuiService_0 (copy)
    local v17 = {
        0, 
        0
    };
    local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
    if l_CurrentCamera_0 then
        v17 = {
            l_CurrentCamera_0.ViewportSize.X, 
            l_CurrentCamera_0.ViewportSize.Y
        };
    end;
    local v19 = {};
    for _, v21 in l_CoreGui_0:GetChildren() do
        local v22 = v7(v21, v16);
        if v22 ~= nil then
            table.insert(v19, v22);
        end;
    end;
    local l_l_GuiService_0_GuiInset_0, v24 = l_GuiService_0:GetGuiInset();
    local v25 = {
        l_l_GuiService_0_GuiInset_0.X, 
        l_l_GuiService_0_GuiInset_0.Y, 
        v24.X, 
        v24.Y
    };
    return {
        Children = v19, 
        Properties = {
            Viewport = v17, 
            Name = "CoreGui", 
            GuiInset = v25
        }
    };
end;
local l_Parent_0 = script.Parent.Parent;
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_Parent_0.Constants);
local v3 = game:DefineFastFlag("CapturesRecursiveCoreUIRemoval", false);
return function() --[[ Line: 8 ]]
    -- upvalues: v2 (copy), v3 (copy), l_CoreGui_0 (copy)
    local v4 = {};
    local function _(v5) --[[ Line: 11 ]] --[[ Name: shouldRemoveUI ]]
        -- upvalues: v2 (ref)
        if not v5:IsA("LayerCollector") then
            return false;
        elseif v5:IsA("BillboardGui") then
            return false;
        elseif not v5.Enabled then
            return false;
        elseif v5.Name == v2.OverlayName then
            return false;
        else
            return true;
        end;
    end;
    if v3 then
        local function v7(v8) --[[ Line: 34 ]] --[[ Name: searchInstance ]]
            -- upvalues: v2 (ref), v4 (copy), v7 (copy)
            if not v8:IsA("Folder") and not v8:IsA("CoreGui") then
                if not not v8:IsA("LayerCollector") and not v8:IsA("BillboardGui") and if v8.Enabled then v8.Name ~= v2.OverlayName else false then
                    v8.Enabled = false;
                    table.insert(v4, v8);
                end;
                return;
            else
                for _, v10 in v8:GetChildren() do
                    v7(v10);
                end;
                return;
            end;
        end;
        v7(l_CoreGui_0);
    else
        for _, v12 in l_CoreGui_0:GetChildren() do
            if v12:IsA("Folder") then
                for _, v14 in v12:GetChildren() do
                    if not not v14:IsA("LayerCollector") and not v14:IsA("BillboardGui") and if v14.Enabled then v14.Name ~= v2.OverlayName else false then
                        v14.Enabled = false;
                        table.insert(v4, v14);
                    end;
                end;
            end;
            if not not v12:IsA("LayerCollector") and not v12:IsA("BillboardGui") and if v12.Enabled then v12.Name ~= v2.OverlayName else false then
                v12.Enabled = false;
                table.insert(v4, v12);
            end;
        end;
    end;
    return function() --[[ Line: 70 ]] --[[ Name: restoreCoreUI ]]
        -- upvalues: v4 (copy)
        for _, v16 in v4 do
            v16.Enabled = true;
        end;
    end;
end;
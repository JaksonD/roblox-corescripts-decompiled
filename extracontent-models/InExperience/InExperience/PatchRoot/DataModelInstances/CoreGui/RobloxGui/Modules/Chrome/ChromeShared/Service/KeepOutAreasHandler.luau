local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_dependencyArray_0 = v3.Hooks.dependencyArray;
local function v22(v6, v7, v8) --[[ Line: 28 ]]
    local v9 = {};
    local l_X_0 = v6.X;
    local l_Y_0 = v6.Y;
    local l_X_1 = v7.X;
    local v13 = v7.Y - l_Y_0;
    local l_l_X_0_0 = l_X_0;
    local v15 = 0;
    for _, v17 in ipairs(v8) do
        local v18 = l_l_X_0_0 + v15;
        local v19 = v17.position.X - v18;
        table.insert(v9, {
            Position = {
                X = v18, 
                Y = l_Y_0
            }, 
            Size = {
                X = v19, 
                Y = v13
            }
        });
        l_l_X_0_0 = v17.position.X;
        v15 = v17.size.X;
    end;
    local v20 = l_l_X_0_0 + v15;
    local v21 = l_X_1 - v20;
    table.insert(v9, {
        Position = {
            X = v20, 
            Y = l_Y_0
        }, 
        Size = {
            X = v21, 
            Y = v13
        }
    });
    return v9;
end;
local function v39(v23, v24) --[[ Line: 80 ]]
    -- upvalues: l_GuiService_0 (copy), v22 (copy)
    local v25 = {};
    local v26 = {};
    for _, v28 in pairs(v24) do
        table.insert(v26, {
            id = v28.id, 
            size = v28.size, 
            position = v28.position
        });
    end;
    table.sort(v26, function(v29, v30) --[[ Line: 95 ]]
        local v31 = false;
        if v29.position.X < v30.position.X then
            v31 = v29.position.X + v29.size.X < v30.size.X + v30.position.X;
        end;
        return v31;
    end);
    local l_l_GuiService_0_GuiInset_0, _ = l_GuiService_0:GetGuiInset();
    local v34 = Vector2.new(0, 0);
    local v35 = Vector2.new(v23.X, l_l_GuiService_0_GuiInset_0.Y);
    v25 = v22(v34, v35, v26);
    local v36 = nil;
    for _, v38 in ipairs(v25) do
        if not v36 or v38.Size.X > v36.Width then
            v36 = Rect.new(v38.Position.X, v38.Position.Y, v38.Position.X + v38.Size.X, v38.Position.Y + v38.Size.Y);
        end;
    end;
    return v36;
end;
local function _(v40, v41) --[[ Line: 118 ]]
    -- upvalues: v39 (copy), l_GuiService_0 (copy)
    local v42 = v39(v40, v41);
    if v42 then
        l_GuiService_0:SetTopbarInset(v42);
    end;
end;
KeepOutAreasHandler = function(_) --[[ Line: 125 ]] --[[ Name: KeepOutAreasHandler ]]
    -- upvalues: l_useSelector_0 (copy), v2 (copy), v39 (copy), l_GuiService_0 (copy), l_dependencyArray_0 (copy)
    local v46 = l_useSelector_0(function(v45) --[[ Line: 126 ]]
        return v45.displayOptions.screenSize;
    end);
    local v48 = l_useSelector_0(function(v47) --[[ Line: 130 ]]
        return v47.displayOptions.keepOutAreas;
    end);
    v2.useEffect(function() --[[ Line: 134 ]]
        -- upvalues: v46 (copy), v48 (copy), v39 (ref), l_GuiService_0 (ref)
        local v49 = v39(v46, v48);
        if v49 then
            l_GuiService_0:SetTopbarInset(v49);
        end;
    end, l_dependencyArray_0(v46, v48));
end;
return KeepOutAreasHandler;
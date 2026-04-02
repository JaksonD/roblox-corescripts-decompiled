local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_FFlagRemoveDependencyArrayAntipattern_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagRemoveDependencyArrayAntipattern;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_dependencyArray_0 = v3.Hooks.dependencyArray;
local function v23(v7, v8, v9) --[[ Line: 31 ]]
    local v10 = {};
    local l_X_0 = v7.X;
    local l_Y_0 = v7.Y;
    local l_X_1 = v8.X;
    local v14 = v8.Y - l_Y_0;
    local l_l_X_0_0 = l_X_0;
    local v16 = 0;
    for _, v18 in ipairs(v9) do
        local v19 = l_l_X_0_0 + v16;
        local v20 = v18.position.X - v19;
        table.insert(v10, {
            Position = {
                X = v19, 
                Y = l_Y_0
            }, 
            Size = {
                X = v20, 
                Y = v14
            }
        });
        l_l_X_0_0 = v18.position.X;
        v16 = v18.size.X;
    end;
    local v21 = l_l_X_0_0 + v16;
    local v22 = l_X_1 - v21;
    table.insert(v10, {
        Position = {
            X = v21, 
            Y = l_Y_0
        }, 
        Size = {
            X = v22, 
            Y = v14
        }
    });
    return v10;
end;
local function v40(v24, v25) --[[ Line: 83 ]]
    -- upvalues: l_GuiService_0 (copy), v23 (copy)
    local v26 = {};
    local v27 = {};
    for _, v29 in pairs(v25) do
        table.insert(v27, {
            id = v29.id, 
            size = v29.size, 
            position = v29.position
        });
    end;
    table.sort(v27, function(v30, v31) --[[ Line: 98 ]]
        local v32 = false;
        if v30.position.X < v31.position.X then
            v32 = v30.position.X + v30.size.X < v31.size.X + v31.position.X;
        end;
        return v32;
    end);
    local l_l_GuiService_0_GuiInset_0, _ = l_GuiService_0:GetGuiInset();
    local v35 = Vector2.new(0, 0);
    local v36 = Vector2.new(v24.X, l_l_GuiService_0_GuiInset_0.Y);
    v26 = v23(v35, v36, v27);
    local v37 = nil;
    for _, v39 in ipairs(v26) do
        if not v37 or v39.Size.X > v37.Width then
            v37 = Rect.new(v39.Position.X, v39.Position.Y, v39.Position.X + v39.Size.X, v39.Position.Y + v39.Size.Y);
        end;
    end;
    return v37;
end;
local function _(v41, v42) --[[ Line: 121 ]]
    -- upvalues: v40 (copy), l_GuiService_0 (copy)
    local v43 = v40(v41, v42);
    if v43 then
        l_GuiService_0:SetTopbarInset(v43);
    end;
end;
KeepOutAreasHandler = function(_) --[[ Line: 128 ]] --[[ Name: KeepOutAreasHandler ]]
    -- upvalues: l_useSelector_0 (copy), v2 (copy), v40 (copy), l_GuiService_0 (copy), l_FFlagRemoveDependencyArrayAntipattern_0 (copy), l_dependencyArray_0 (copy)
    local v47 = l_useSelector_0(function(v46) --[[ Line: 129 ]]
        return v46.displayOptions.screenSize;
    end);
    local v49 = l_useSelector_0(function(v48) --[[ Line: 133 ]]
        return v48.displayOptions.keepOutAreas;
    end);
    v2.useEffect(function() --[[ Line: 138 ]]
        -- upvalues: v47 (copy), v49 (copy), v40 (ref), l_GuiService_0 (ref)
        local v50 = v40(v47, v49);
        if v50 then
            l_GuiService_0:SetTopbarInset(v50);
        end;
    end, if l_FFlagRemoveDependencyArrayAntipattern_0 then {
        v47, 
        v49
    } else l_dependencyArray_0(v47, v49));
end;
return KeepOutAreasHandler;
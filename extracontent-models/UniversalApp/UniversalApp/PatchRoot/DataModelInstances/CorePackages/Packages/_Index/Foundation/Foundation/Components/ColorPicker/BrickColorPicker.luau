local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_script_FirstAncestor_0.Components.Image);
local v4 = require(l_script_FirstAncestor_0.Enums.StateLayerAffordance);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v6 = require(l_script_FirstAncestor_0.Components.View);
local v7 = require(l_script_FirstAncestor_0.Components.ColorPicker.BrickColorConstants);
local v8 = require(l_script_FirstAncestor_0.Providers.Style.useTokens);
local v9 = require(l_script_FirstAncestor_0.Utility.withCommonProps);
local function _(v10) --[[ Line: 42 ]] --[[ Name: getHexagonDimensions ]]
    return v10 * 1.7320508075688772, v10 * 2;
end;
local function v14(v12) --[[ Line: 46 ]] --[[ Name: calculateGridRadius ]]
    for v13 = 3, 20, 2 do
        if v12 < v13 * v13 - math.floor(v13 / 2) * (math.floor(v13 / 2) + 1) then
            return v13 - 2;
        end;
    end;
    return 7;
end;
return function(v15) --[[ Line: 56 ]] --[[ Name: BrickColorPicker ]]
    -- upvalues: v8 (copy), v2 (copy), v7 (copy), v14 (copy), v3 (copy), v6 (copy), v9 (copy), v4 (copy)
    local v16 = v8();
    local l_Size_350_0 = v16.Size.Size_350;
    local l_Size_50_0 = v16.Size.Size_50;
    local l_Size_100_0 = v16.Size.Size_100;
    local l_Size_200_0 = v16.Size.Size_200;
    local v21 = v2.useMemo(function() --[[ Line: 65 ]]
        -- upvalues: v7 (ref)
        return v7.MAIN;
    end, {});
    local v22 = v2.useMemo(function() --[[ Line: 69 ]]
        -- upvalues: v7 (ref)
        return v7.BOTTOM;
    end, {});
    local v23 = l_Size_350_0 * 1.7320508075688772;
    local v24 = l_Size_350_0 * 2;
    local v26 = v2.useMemo(function() --[[ Line: 74 ]]
        -- upvalues: v14 (ref), v21 (copy)
        local v25 = v14(#v21);
        if v25 < 3 then
            warn("BrickColorPicker: Calculated grid radius is too small, falling back to minimum");
            return 3;
        else
            return v25;
        end;
    end, {});
    local v46, v47 = v2.useMemo(function() --[[ Line: 83 ]]
        -- upvalues: v26 (copy), l_Size_350_0 (copy), l_Size_50_0 (copy), v21 (copy), v22 (copy), l_Size_100_0 (copy), v23 (copy), v24 (copy)
        local v27 = {};
        local v28 = 1;
        local l_v26_0 = v26;
        local v30 = l_Size_350_0 + l_Size_50_0;
        local l_l_Size_350_0_0 = l_Size_350_0;
        for v32 = 0, l_v26_0 - 1 do
            for v33 = 0, 2 * l_v26_0 - 1 - 1 do
                if math.abs(math.floor(l_v26_0 / 2) - v32) + math.abs(math.floor((2 * l_v26_0 - 1) / 2) - v33) < l_v26_0 and v32 % 2 == v33 % 2 and v28 <= #v21 then
                    local v34 = l_l_Size_350_0_0 * v33;
                    local v35 = math.round(v30 * 1.5 * v32);
                    table.insert(v27, {
                        brickColor = v21[v28], 
                        x = v34, 
                        y = v35
                    });
                    v28 = v28 + 1;
                end;
            end;
        end;
        if #v22 > 0 then
            local v36 = math.round(v30 * 1.5 * l_v26_0 + l_Size_100_0);
            for v37, v38 in ipairs(v22) do
                local v39 = l_l_Size_350_0_0 * (1 + (v37 - 1) * 2);
                table.insert(v27, {
                    brickColor = v38, 
                    x = v39, 
                    y = v36
                });
            end;
        end;
        local v40 = 1e999;
        local v41 = -1e999;
        local v42 = 1e999;
        local v43 = -1e999;
        for _, v45 in v27 do
            v40 = math.min(v40, v45.x - v23 / 2);
            v41 = math.max(v41, v45.x + v23 / 2);
            v42 = math.min(v42, v45.y - v24 / 2);
            v43 = math.max(v43, v45.y + v24 / 2);
        end;
        return v27, {
            width = v41 - v40, 
            height = v43 - v42, 
            offset = Vector2.new(v40, v42)
        };
    end, {
        v26
    });
    local v59 = v2.useCallback(function(v48, v49) --[[ Line: 153 ]]
        -- upvalues: v47 (copy), v46 (copy), l_Size_350_0 (copy), v15 (copy)
        if v49.UserInputType == Enum.UserInputType.MouseButton1 then
            local v50 = nil;
            local v51 = 1e999;
            local v52 = v49.Position.X - v48.AbsolutePosition.X;
            local v53 = v49.Position.Y - v48.AbsolutePosition.Y;
            local v54 = v52 + v47.offset.X;
            local v55 = v53 + v47.offset.Y;
            for _, v57 in v46 do
                local v58 = (v54 - v57.x) ^ 2 + (v55 - v57.y) ^ 2;
                if v58 < v51 then
                    v51 = v58;
                    v50 = v57;
                end;
            end;
            if v50 and v51 < l_Size_350_0 * l_Size_350_0 then
                v15.onBrickColorChanged(v50.brickColor);
                if v15.onColorChanged then
                    v15.onColorChanged(v50.brickColor.Color);
                end;
            end;
        end;
    end, {
        v46, 
        v47
    });
    local v64 = v2.useCallback(function(v60, v61) --[[ Line: 180 ]]
        -- upvalues: v47 (copy), v2 (ref), v3 (ref), v23 (copy), l_Size_200_0 (copy), v24 (copy), v16 (copy)
        local v62 = UDim2.fromOffset(v60.x - v47.offset.X, v60.y - v47.offset.Y);
        local v63 = {};
        if v61 then
            v63.outline = v2.createElement(v3, {
                Size = UDim2.fromOffset(v23 + l_Size_200_0, v24 + l_Size_200_0), 
                Position = v62, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = "component_assets/hexagon_24", 
                imageStyle = v16.Color.ActionEmphasis.Background, 
                ZIndex = 1
            });
        end;
        v63.hexagon = v2.createElement(v3, {
            Size = UDim2.fromOffset(v23, v24), 
            Position = v62, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Image = "component_assets/hexagon_24", 
            imageStyle = {
                Color3 = v60.brickColor.Color
            }, 
            ZIndex = 2
        });
        return v63;
    end, {
        v47.offset.X, 
        v47.offset.Y, 
        v23, 
        v24
    });
    local v72 = v2.useCallback(function() --[[ Line: 213 ]]
        -- upvalues: v15 (copy), v46 (copy), v64 (copy)
        local v65 = {};
        local v66 = v15.selectedColor and v15.selectedColor:getValue() or nil;
        for v67, v68 in v46 do
            local v69 = false;
            if v66 ~= nil then
                v69 = v66 == v68.brickColor.Color;
            end;
            for v70, v71 in (v64(v68, v69)) do
                v65[("%*_%*"):format(v70, v67)] = v71;
            end;
        end;
        return v65;
    end, {
        v15.selectedColor
    });
    return v2.createElement(v6, v9(v15, {
        Size = UDim2.fromOffset(v47.width, v47.height)
    }), {
        ColorGrid = v2.createElement(v6, {
            tag = "size-full position-top-left anchor-top-left", 
            onActivated = v59, 
            stateLayer = {
                affordance = v4.None
            }
        }, (v72()))
    });
end;
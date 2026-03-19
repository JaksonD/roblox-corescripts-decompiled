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
local v10 = require(l_script_FirstAncestor_0.Utility.Flags);
local v11 = require(l_script_FirstAncestor_0.Utility.Wrappers);
local l_Connection_0 = v11.Connection;
local l_Signal_0 = v11.Signal;
local function _(v14) --[[ Line: 50 ]] --[[ Name: getHexagonDimensions ]]
    return v14 * 1.7320508075688772, v14 * 2;
end;
local function v18(v16) --[[ Line: 54 ]] --[[ Name: calculateGridRadius ]]
    for v17 = 3, 20, 2 do
        if v16 < v17 * v17 - math.floor(v17 / 2) * (math.floor(v17 / 2) + 1) then
            return v17 - 2;
        end;
    end;
    return 7;
end;
local function v35(v19) --[[ Line: 76 ]] --[[ Name: BottomRowSwatches ]]
    -- upvalues: v2 (copy), l_Signal_0 (copy), l_Connection_0 (copy), v3 (copy), v6 (copy)
    local v20, v21 = v2.useState(0);
    local v22 = v2.useRef(nil);
    v2.useEffect(function() --[[ Line: 80 ]]
        -- upvalues: v22 (copy), v20 (copy), v21 (copy), l_Signal_0 (ref), l_Connection_0 (ref)
        local l_current_0 = v22.current;
        if not l_current_0 then
            return;
        else
            local v24 = math.round(l_current_0.AbsoluteSize.X);
            if v24 ~= v20 then
                v21(v24);
            end;
            local v25 = l_Signal_0.Connect(l_current_0:GetPropertyChangedSignal("AbsoluteSize"), function() --[[ Line: 89 ]]
                -- upvalues: v21 (ref), l_current_0 (copy)
                v21((math.round(l_current_0.AbsoluteSize.X)));
            end);
            return function() --[[ Line: 92 ]]
                -- upvalues: l_Connection_0 (ref), v25 (copy)
                l_Connection_0.Disconnect(v25);
            end;
        end;
    end, {
        v20
    });
    local v26 = {};
    if v20 > 0 then
        local v27 = #v19.colors;
        local v28 = v20 - v19.paddingHorizontal * 2;
        local v29 = math.floor(v28 / v27);
        local v30 = v29 * (v27 - 1);
        local v31 = v19.paddingHorizontal + math.floor((v28 - v30) / 2);
        for v32, v33 in ipairs(v19.colors) do
            local v34 = v31 + v29 * (v32 - 1);
            v26[("Swatch_%*"):format(v32)] = v2.createElement(v3, {
                Size = UDim2.fromOffset(v19.swatchWidth, v19.swatchHeight), 
                Position = UDim2.fromOffset(v34, v19.swatchCenterY), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = "component_assets/hexagon_24", 
                imageStyle = {
                    Color3 = v33.Color
                }
            });
        end;
    end;
    return v2.createElement(v6, {
        tag = "size-full", 
        ref = v22
    }, v26);
end;
return function(v36) --[[ Line: 127 ]] --[[ Name: BrickColorPicker ]]
    -- upvalues: v8 (copy), v10 (copy), v2 (copy), v7 (copy), v18 (copy), v3 (copy), v6 (copy), v9 (copy), v4 (copy), v35 (copy)
    local v37 = v8();
    local v38 = if v10.FoundationColorPickerDesignUpdate then v37.Size.Size_200 else v37.Size.Size_350;
    local v39 = nil;
    local v40 = nil;
    if v10.FoundationColorPickerDesignUpdate then
        v39 = v37.Size.Size_350;
        v40 = v37.Size.Size_400;
    else
        local v41 = v38 * 1.7320508075688772;
        local v42 = v38 * 2;
        v39 = v41;
        v40 = v42;
    end;
    local l_Size_100_0 = v37.Size.Size_100;
    local l_Size_350_0 = v37.Size.Size_350;
    local l_Size_400_0 = v37.Size.Size_400;
    local l_Size_200_0 = v37.Size.Size_200;
    local v47 = v2.useMemo(function() --[[ Line: 144 ]]
        -- upvalues: v7 (ref)
        return v7.MAIN;
    end, {});
    local v48 = v2.useMemo(function() --[[ Line: 148 ]]
        -- upvalues: v7 (ref)
        return v7.BOTTOM;
    end, {});
    local v50 = v2.useMemo(function() --[[ Line: 152 ]]
        -- upvalues: v18 (ref), v47 (copy)
        local v49 = v18(#v47);
        if v49 < 3 then
            warn("BrickColorPicker: Calculated grid radius is too small, falling back to minimum");
            return 3;
        else
            return v49;
        end;
    end, {});
    local v72, v73 = v2.useMemo(function() --[[ Line: 163 ]]
        -- upvalues: v50 (copy), v38 (copy), v10 (ref), v37 (copy), v47 (copy), v48 (copy), v39 (ref), v40 (ref)
        local v51 = {};
        local v52 = 1;
        local l_v50_0 = v50;
        local v54 = v38 + (v10.FoundationColorPickerDesignUpdate and 1 or v37.Size.Size_50);
        local l_v38_0 = v38;
        local v56 = if v10.FoundationColorPickerDesignUpdate then math.round(v54 * 1.5) else nil;
        for v57 = 0, l_v50_0 - 1 do
            for v58 = 0, 2 * l_v50_0 - 1 - 1 do
                if math.abs(math.floor(l_v50_0 / 2) - v57) + math.abs(math.floor((2 * l_v50_0 - 1) / 2) - v58) < l_v50_0 and v57 % 2 == v58 % 2 and v52 <= #v47 then
                    local v59 = l_v38_0 * v58;
                    local v60 = if v56 then v56 * v57 else math.round(v54 * 1.5 * v57);
                    table.insert(v51, {
                        brickColor = v47[v52], 
                        x = v59, 
                        y = v60
                    });
                    v52 = v52 + 1;
                end;
            end;
        end;
        if not v10.FoundationColorPickerDesignUpdate and #v48 > 0 then
            local l_Size_100_1 = v37.Size.Size_100;
            local v62 = math.round(v54 * 1.5 * l_v50_0 + l_Size_100_1);
            for v63, v64 in ipairs(v48) do
                local v65 = l_v38_0 * (1 + (v63 - 1) * 2);
                table.insert(v51, {
                    brickColor = v64, 
                    x = v65, 
                    y = v62
                });
            end;
        end;
        local v66 = 1e999;
        local v67 = -1e999;
        local v68 = 1e999;
        local v69 = -1e999;
        for _, v71 in v51 do
            v66 = math.min(v66, v71.x - v39 / 2);
            v67 = math.max(v67, v71.x + v39 / 2);
            v68 = math.min(v68, v71.y - v40 / 2);
            v69 = math.max(v69, v71.y + v40 / 2);
        end;
        return v51, {
            width = v67 - v66, 
            height = v69 - v68, 
            offset = Vector2.new(v66, v68)
        };
    end, {
        v50, 
        v38, 
        v47, 
        v48, 
        v37.Size.Size_100, 
        v37.Size.Size_50
    });
    local v85 = v2.useCallback(function(v74, v75) --[[ Line: 237 ]]
        -- upvalues: v73 (copy), v72 (copy), v38 (copy), v36 (copy)
        if v75.UserInputType == Enum.UserInputType.MouseButton1 then
            local v76 = nil;
            local v77 = 1e999;
            local v78 = v75.Position.X - v74.AbsolutePosition.X;
            local v79 = v75.Position.Y - v74.AbsolutePosition.Y;
            local v80 = v78 + v73.offset.X;
            local v81 = v79 + v73.offset.Y;
            for _, v83 in v72 do
                local v84 = (v80 - v83.x) ^ 2 + (v81 - v83.y) ^ 2;
                if v84 < v77 then
                    v77 = v84;
                    v76 = v83;
                end;
            end;
            if v76 and v77 < v38 * v38 then
                v36.onBrickColorChanged(v76.brickColor);
                if v36.onColorChanged then
                    v36.onColorChanged(v76.brickColor.Color);
                end;
            end;
        end;
    end, {
        v72, 
        v73, 
        v38, 
        v36.onBrickColorChanged, 
        v36.onColorChanged
    });
    local v92 = v2.useCallback(function(v86, v87) --[[ Line: 263 ]]
        -- upvalues: l_Size_100_0 (copy), v48 (copy), v36 (copy)
        if v87.UserInputType == Enum.UserInputType.MouseButton1 then
            local v88 = v87.Position.X - v86.AbsolutePosition.X;
            local v89 = v86.AbsoluteSize.X - 2 * l_Size_100_0;
            local v90 = v88 - l_Size_100_0;
            if v90 >= 0 and v90 <= v89 then
                local v91 = v48[math.clamp(math.floor(v90 / v89 * #v48) + 1, 1, #v48)];
                v36.onBrickColorChanged(v91);
                if v36.onColorChanged then
                    v36.onColorChanged(v91.Color);
                end;
            end;
        end;
    end, {
        v48, 
        v36.onBrickColorChanged, 
        v36.onColorChanged
    });
    local v97 = v2.useCallback(function(v93, v94) --[[ Line: 282 ]]
        -- upvalues: v73 (copy), v2 (ref), v3 (ref), v39 (ref), l_Size_200_0 (copy), v40 (ref), v37 (copy)
        local v95 = UDim2.fromOffset(v93.x - v73.offset.X, v93.y - v73.offset.Y);
        local v96 = {};
        if v94 then
            v96.outline = v2.createElement(v3, {
                Size = UDim2.fromOffset(v39 + l_Size_200_0, v40 + l_Size_200_0), 
                Position = v95, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = "component_assets/hexagon_24", 
                imageStyle = v37.Color.ActionEmphasis.Background, 
                ZIndex = 1
            });
        end;
        v96.hexagon = v2.createElement(v3, {
            Size = UDim2.fromOffset(v39, v40), 
            Position = v95, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Image = "component_assets/hexagon_24", 
            imageStyle = {
                Color3 = v93.brickColor.Color
            }, 
            ZIndex = 2
        });
        return v96;
    end, {
        v73.offset.X, 
        v73.offset.Y, 
        v39, 
        v40
    });
    local v105 = v2.useCallback(function() --[[ Line: 315 ]]
        -- upvalues: v36 (copy), v72 (copy), v97 (copy)
        local v98 = {};
        local v99 = v36.selectedColor and v36.selectedColor:getValue() or nil;
        for v100, v101 in v72 do
            local v102 = false;
            if v99 ~= nil then
                v102 = v99 == v101.brickColor.Color;
            end;
            for v103, v104 in (v97(v101, v102)) do
                v98[("%*_%*"):format(v103, v100)] = v104;
            end;
        end;
        return v98;
    end, {
        v36.selectedColor
    });
    if not v10.FoundationColorPickerDesignUpdate then
        return v2.createElement(v6, v9(v36, {
            Size = UDim2.fromOffset(v73.width, v73.height)
        }), {
            ColorGrid = v2.createElement(v6, {
                tag = "size-full position-top-left anchor-top-left", 
                onActivated = v85, 
                stateLayer = {
                    affordance = v4.None
                }
            }, (v105()))
        });
    else
        return v2.createElement(v6, v9(v36, {
            tag = "col align-x-center gap-small auto-y size-full-0"
        }), {
            ColorGrid = v2.createElement(v6, {
                Size = UDim2.fromOffset(v73.width, v73.height), 
                LayoutOrder = 1, 
                onActivated = v85, 
                stateLayer = {
                    affordance = v4.None
                }
            }, (v105())), 
            BottomRow = v2.createElement(v6, {
                Size = UDim2.new(1, -v37.Size.Size_400, 0, v37.Size.Size_500), 
                tag = "stroke-standard stroke-muted radius-circle bg-surface-100", 
                LayoutOrder = 2, 
                onActivated = v92, 
                stateLayer = {
                    affordance = v4.None
                }
            }, {
                Swatches = v2.createElement(v35, {
                    colors = v48, 
                    paddingHorizontal = l_Size_100_0, 
                    swatchWidth = l_Size_350_0, 
                    swatchHeight = l_Size_400_0, 
                    swatchCenterY = v37.Size.Size_250
                })
            })
        });
    end;
end;
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Core_0 = l_Parent_0.Core;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.React);
local v4 = require(l_Core_0.Control.Interactable);
local v5 = require(l_Core_0.Control.useControlState);
local v6 = require(l_Core_0.Style.useStyle);
local v7 = require(l_Core_0.Control.Enum.ControlState);
local v8 = require(l_Parent_0.Utility.setDefault);
local v9 = UDim.new(0, 8);
return function(v10) --[[ Line: 33 ]] --[[ Name: TileOverlay ]]
    -- upvalues: v8 (copy), v5 (copy), v6 (copy), v7 (copy), v3 (copy), v9 (copy), v4 (copy)
    local l_onActivated_0 = v10.onActivated;
    local v12 = v8(v10.isVisible, true);
    local v13 = v8(v10.isActive, true);
    local v14 = v10.reservedBottomHeight or 0;
    local v15 = v14 > 0;
    if not v12 and not v13 then
        return nil;
    else
        local v16, v17 = v5();
        local l_Theme_0 = v6().Theme;
        local v19 = nil;
        local v20 = 1;
        if v12 and v13 then
            if v16 == v7.Pressed then
                v19 = l_Theme_0.BackgroundOnPress.Color;
                v20 = l_Theme_0.BackgroundOnPress.Transparency;
            elseif v16 == v7.Hover then
                v19 = l_Theme_0.BackgroundOnHover.Color;
                v20 = l_Theme_0.BackgroundOnHover.Transparency;
            end;
        end;
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            ZIndex = v10.zIndex
        }, {
            UICorner = v3.createElement("UICorner", {
                CornerRadius = v9
            }), 
            ClippingFrame = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, if v15 then -v14 else 0), 
                BackgroundTransparency = 1, 
                ClipsDescendants = true
            }, {
                Interactable = v3.createElement(v4, {
                    Size = UDim2.new(1, 0, 1, if v15 then v9.Offset else 0), 
                    BackgroundColor3 = v19, 
                    BackgroundTransparency = v20, 
                    AutoButtonColor = false, 
                    onStateChanged = v17, 
                    [v3.Event.Activated] = if v13 then l_onActivated_0 else nil, 
                    ZIndex = 3
                }, {
                    UICorner = v3.createElement("UICorner", {
                        CornerRadius = v9
                    })
                })
            })
        });
    end;
end;
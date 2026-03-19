local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(script.Parent.ReactionMap);
local v5 = require(script.Parent.ReactionList);
local l_ArialBold_0 = Enum.Font.ArialBold;
local v7 = Color3.new(1, 1, 1);
local v8 = Color3.fromRGB(100, 102, 104);
return function(v9) --[[ Line: 20 ]] --[[ Name: ReactionCounter ]]
    -- upvalues: v2 (copy), v5 (copy), v3 (copy), v1 (copy), v4 (copy), v8 (copy), v7 (copy), l_ArialBold_0 (copy)
    local v10 = 0;
    local v11 = false;
    local v12 = 0;
    for _, v14 in v9.reactionData do
        if #v14 >= 2 then
            v11 = true;
        end;
        v10 = v10 + #v14;
        v12 = v12 + 1;
    end;
    if v12 > 3 then
        v11 = true;
    end;
    local v15 = v10 >= 10 and 15 or 10;
    local v21 = v2.useMemo(function() --[[ Line: 36 ]]
        -- upvalues: v5 (ref), v9 (copy), v3 (ref), v1 (ref), v4 (ref)
        local v16 = 1;
        local v17 = {};
        for v18 in v5 do
            if v16 < 4 then
                if v9.reactionData[v5[v18]] ~= nil then
                    v17[v16] = v5[v18];
                    v16 = v16 + 1;
                end;
            else
                break;
            end;
        end;
        return v3.List.map(v17, function(v19, v20) --[[ Line: 49 ]]
            -- upvalues: v1 (ref), v4 (ref)
            return v1.createElement("ImageLabel", {
                Image = v4[v19], 
                Size = UDim2.new(0, 20, 0, 20), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                ScaleType = Enum.ScaleType.Fit, 
                Name = "ShowReaction" .. v20
            });
        end);
    end, {});
    return {
        reactionCounter = v1.createElement("TextButton", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BorderSizePixel = 0, 
            Text = "", 
            [v1.Event.Activated] = v9.onPressed, 
            BackgroundColor3 = v8
        }, {
            corner = v1.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), 
            padding = v1.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 5), 
                PaddingTop = UDim.new(0, 5), 
                PaddingRight = UDim.new(0, 7), 
                PaddingLeft = UDim.new(0, 7)
            }), 
            layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 4)
            })
        }, v21, {
            reactionCount = v11 and v1.createElement("TextLabel", {
                Size = UDim2.new(0, v15, 0, 20), 
                Text = v10, 
                TextSize = 17, 
                TextColor3 = v7, 
                Font = l_ArialBold_0, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            })
        })
    };
end;
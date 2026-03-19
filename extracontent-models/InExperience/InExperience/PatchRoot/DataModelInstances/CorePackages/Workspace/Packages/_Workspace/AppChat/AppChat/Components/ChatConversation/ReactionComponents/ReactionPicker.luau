local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(script.Parent.ReactionMap);
local v5 = require(script.Parent.ReactionList);
local v6 = Color3.fromRGB(57, 59, 61);
local v7 = Color3.fromRGB(100, 102, 104);
return function(v8) --[[ Line: 15 ]] --[[ Name: ReactionPicker ]]
    -- upvalues: v2 (copy), v5 (copy), v3 (copy), v1 (copy), v4 (copy), v6 (copy), v7 (copy)
    if v8.numReactionsToShow == nil then
        v8.numReactionsToShow = 6;
    end;
    if v8.numReactionsToShow > 6 or v8.numReactionsToShow < 0 then
        error("Invalid number of reactions");
    end;
    local v14 = v2.useMemo(function() --[[ Line: 23 ]]
        -- upvalues: v5 (ref), v8 (copy), v3 (ref), v1 (ref), v4 (ref), v2 (ref), v6 (ref)
        local v9 = {};
        for v10 in v5 do
            if v8.numReactionsToShow >= v10 then
                v9[v10] = v5[v10];
            else
                break;
            end;
        end;
        return v3.List.map(v9, function(v11, _) --[[ Line: 31 ]]
            -- upvalues: v8 (ref), v1 (ref), v4 (ref), v2 (ref), v6 (ref)
            local v13 = v11 == v8.selectedReactionType and 0 or 1;
            return v1.createElement("Frame", {
                Size = UDim2.new(0, 40, 0, 40), 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1
            }, {
                imageButton = v1.createElement("ImageButton", {
                    Image = v4[v11], 
                    Name = v11 .. "_Button", 
                    Size = UDim2.new(0, 40, 0, 40), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1, 
                    ScaleType = Enum.ScaleType.Fit, 
                    [v2.Event.Activated] = function() --[[ Line: 45 ]]
                        -- upvalues: v8 (ref), v11 (copy)
                        v8.onReactionSelected(v11);
                    end
                }), 
                indicator = v1.createElement("Frame", {
                    Size = UDim2.new(0, 6, 0, 6), 
                    Position = UDim2.new(0.5, -3, 1, 2), 
                    BackgroundColor3 = v6, 
                    BackgroundTransparency = v13, 
                    Name = v11 .. "_Indicator"
                }, {
                    corner = v1.createElement("UICorner", {
                        CornerRadius = UDim.new(1, 0)
                    })
                })
            });
        end);
    end, {
        v4, 
        v8.selectedReactionType
    });
    return {
        ReactionPicker = v1.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BorderSizePixel = 0, 
            BackgroundColor3 = v7
        }, {
            corner = v1.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), 
            padding = v1.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 10), 
                PaddingTop = UDim.new(0, 10), 
                PaddingRight = UDim.new(0, 19.5), 
                PaddingLeft = UDim.new(0, 19.5)
            }), 
            layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 11)
            })
        }, v14)
    };
end;
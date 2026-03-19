local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = {
    [Enum.HorizontalAlignment.Center] = {
        [Enum.VerticalAlignment.Center] = {
            anchor = Vector2.new(0.5, 0.5), 
            position = UDim2.fromScale(0.5, 0.5)
        }, 
        [Enum.VerticalAlignment.Top] = {
            anchor = Vector2.new(0.5, 0), 
            position = UDim2.fromScale(0.5, 0)
        }, 
        [Enum.VerticalAlignment.Bottom] = {
            anchor = Vector2.new(0.5, 1), 
            position = UDim2.fromScale(0.5, 1)
        }
    }, 
    [Enum.HorizontalAlignment.Left] = {
        [Enum.VerticalAlignment.Center] = {
            anchor = Vector2.new(0, 0.5), 
            position = UDim2.fromScale(0, 0.5)
        }, 
        [Enum.VerticalAlignment.Top] = {
            anchor = Vector2.new(0, 0), 
            position = UDim2.fromScale(0, 0)
        }, 
        [Enum.VerticalAlignment.Bottom] = {
            anchor = Vector2.new(0, 1), 
            position = UDim2.fromScale(0, 1)
        }
    }, 
    [Enum.HorizontalAlignment.Right] = {
        [Enum.VerticalAlignment.Center] = {
            anchor = Vector2.new(1, 0.5), 
            position = UDim2.fromScale(1, 0.5)
        }, 
        [Enum.VerticalAlignment.Top] = {
            anchor = Vector2.new(1, 0), 
            position = UDim2.fromScale(1, 0)
        }, 
        [Enum.VerticalAlignment.Bottom] = {
            anchor = Vector2.new(1, 1), 
            position = UDim2.fromScale(1, 1)
        }
    }
};
return function(v3) --[[ Line: 36 ]] --[[ Name: Frame ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v4, v5 = v1.useMemo(function() --[[ Line: 37 ]]
        -- upvalues: v3 (copy), v2 (ref)
        if v3.horizontalAlignment and v3.verticalAlignment then
            return v2[v3.horizontalAlignment][v3.verticalAlignment].anchor, v2[v3.horizontalAlignment][v3.verticalAlignment].position;
        else
            return nil, nil;
        end;
    end, {
        v3.horizontalAlignment, 
        v3.verticalAlignment
    });
    return v1.createElement("Frame", {
        AnchorPoint = v3.AnchorPoint or v4, 
        BackgroundColor3 = v3.BackgroundColor3, 
        BackgroundTransparency = v3.BackgroundTransparency or 1, 
        BorderSizePixel = 0, 
        ClipsDescendants = v3.ClipsDescendants, 
        LayoutOrder = v3.LayoutOrder, 
        Position = v3.Position or v5, 
        Size = v3.Size or UDim2.fromScale(1, 1), 
        ZIndex = v3.ZIndex, 
        children = v3.children
    });
end;
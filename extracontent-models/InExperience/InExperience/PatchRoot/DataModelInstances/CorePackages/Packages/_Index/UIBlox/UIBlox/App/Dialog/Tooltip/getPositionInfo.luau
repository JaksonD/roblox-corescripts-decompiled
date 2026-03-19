local v0 = require(script.Parent.Enum.TooltipOrientation);
return function(v1, v2, v3, v4, v5, v6, v7) --[[ Line: 22 ]]
    -- upvalues: v0 (copy)
    local v8 = {};
    local v9 = v4 + v5 * 0.5;
    local v10 = v4 + v5;
    local v11 = nil;
    local v12 = nil;
    local v13 = nil;
    local v14 = nil;
    local v15 = 0;
    local v16 = 0;
    if v3 == v0.Bottom or v3 == v0.Top then
        if not v7 and v2 + 8 + 12 > v6.Y - v10.Y then
            v3 = v0.Top;
        end;
        local v17 = v6.X - 12 - v1;
        v11 = math.clamp(v9.X - v1 * 0.5, 12, v17);
        v13 = v11 - v4.X;
        local v18 = nil;
        local v19 = v1 - 12 - 16;
        if v1 < 40 then
            v8.caretPosition = UDim2.fromScale(0.5, 0);
        elseif v7 then
            v18 = math.clamp(v5.X * 0.5 + math.abs(v5.X * v7.X.Scale + v7.X.Offset), 12, v19);
            v8.caretPosition = UDim2.fromOffset(v18, 0);
        elseif v9.X - v1 * 0.5 >= 12 and v9.X + v1 * 0.5 <= v6.X - 12 then
            v8.caretPosition = UDim2.fromScale(0.5, 0);
        else
            v18 = math.clamp(v9.X - v11, 12, v19);
            v8.caretPosition = UDim2.fromOffset(v18, 0);
        end;
        v8.caretFrameSize = UDim2.fromOffset(v1, 8);
        v8.caretImageSize = UDim2.fromOffset(16, 8);
        v8.caretAnchorPoint = Vector2.new(0.5, 0);
        v8.fillDirection = Enum.FillDirection.Vertical;
        if v3 == v0.Bottom then
            v12 = v4.Y + v5.Y;
            v14 = v5.Y;
            v8.caretLayoutOrder = 1;
            v8.contentLayoutOrder = 2;
            v16 = 4;
        else
            v12 = v4.Y - v2 - 8;
            v14 = -(v2 + 8);
            v8.caretLayoutOrder = 2;
            v8.contentLayoutOrder = 1;
            v16 = -4;
        end;
    else
        local v20 = v6.Y - 12 - v2;
        v12 = math.clamp(v9.Y - v2 * 0.5, 12, v20);
        v14 = v12 - v4.Y;
        local v21 = nil;
        local v22 = v2 - 12 - 16;
        if v7 then
            v21 = math.clamp(v5.Y * 0.5 + math.abs(v5.Y * v7.Y.Scale + v7.Y.Offset), 12, v22);
            v8.caretPosition = UDim2.fromOffset(0, v21);
        elseif v9.Y - v2 * 0.5 >= 12 and v9.Y + v2 * 0.5 <= v6.Y - 12 or v2 <= 40 then
            v8.caretPosition = UDim2.fromScale(0, 0.5);
        else
            local v23 = v2 - 12 - 16;
            v21 = math.clamp(v9.Y - v12, 12, v23);
            v8.caretPosition = UDim2.fromOffset(0, v21);
        end;
        v8.caretFrameSize = UDim2.fromOffset(8, v2);
        v8.caretImageSize = UDim2.fromOffset(8, 16);
        v8.caretAnchorPoint = Vector2.new(0, 0.5);
        v8.fillDirection = Enum.FillDirection.Horizontal;
        if v3 == v0.Right then
            v11 = v10.X;
            v13 = v5.X;
            v8.caretLayoutOrder = 1;
            v8.contentLayoutOrder = 2;
            v15 = 4;
        else
            v11 = v4.X - v1 - 8;
            v13 = -(v1 - 8);
            v8.caretLayoutOrder = 2;
            v8.contentLayoutOrder = 1;
            v15 = -4;
        end;
    end;
    v8.absolutePosition = UDim2.fromOffset(v11, v12);
    v8.position = UDim2.fromOffset(v13, v14);
    v8.animatedDistance = UDim2.fromOffset(v15, v16);
    v8.updatedOrientation = v3;
    return v8;
end;
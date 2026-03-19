local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Enums.PopoverAlign);
local v2 = require(l_script_FirstAncestor_0.Enums.PopoverSide);
return {
    adjustForOnScreenKeyboard = function(v3, v4, v5) --[[ Line: 93 ]] --[[ Name: adjustForOnScreenKeyboard ]]
        local v6 = v4 - v5;
        local v7 = math.min(v3.Max.Y, v6.Y);
        return Rect.new(v3.Min, Vector2.new(v3.Max.X, v7));
    end, 
    isOnScreen = function(v8, v9) --[[ Line: 25 ]] --[[ Name: isOnScreen ]]
        if v8.Min.X > v9.Max.X or v8.Max.X < v9.Min.X or v8.Min.Y > v9.Max.Y or v8.Max.Y < v9.Min.Y then
            return false;
        else
            return true;
        end;
    end, 
    calculateSide = function(v10, v11, v12, v13) --[[ Line: 38 ]] --[[ Name: calculateSide ]]
        -- upvalues: v2 (copy)
        if v10 == v2.Top then
            if v11.Min.Y - v13.Y < v12.Min.Y and v11.Max.Y + v13.Y < v12.Max.Y then
                return v2.Bottom;
            end;
        elseif v10 == v2.Bottom then
            if v11.Max.Y + v13.Y > v12.Max.Y and v11.Min.Y - v13.Y > v12.Min.Y then
                return v2.Top;
            end;
        elseif v10 == v2.Left then
            if v11.Min.X - v13.X < v12.Min.X and v11.Max.X + v13.X < v12.Max.X then
                return v2.Right;
            end;
        elseif v10 == v2.Right and v11.Max.X + v13.X > v12.Max.X and v11.Min.X - v13.X > v12.Min.X then
            return v2.Left;
        end;
        return v10;
    end, 
    calculatePositions = function(v14, v15, v16, v17, v18, v19, v20, v21) --[[ Line: 102 ]] --[[ Name: calculatePositions ]]
        -- upvalues: v2 (copy), v1 (copy)
        local v22 = {
            X = 0, 
            Y = 0
        };
        local v23 = {
            X = 0, 
            Y = 0
        };
        local v24 = {
            X = 0, 
            Y = 0
        };
        local v25 = true;
        if v14 ~= v2.Top then
            v25 = v14 == v2.Bottom;
        end;
        local v26 = true;
        if v14 ~= v2.Top then
            v26 = v14 == v2.Left;
        end;
        local v27 = "X";
        local v28 = "Y";
        local l_Height_0 = v18.Height;
        local l_X_0 = v18.Min.X;
        local l_Y_0 = v18.Min.Y;
        local l_Y_1 = v21.Y;
        local l_X_1 = v21.X;
        local l_X_2 = v18.Max.X;
        local l_Y_2 = v18.Max.Y;
        local l_Y_3 = v19.Min.Y;
        local l_Y_4 = v19.Max.Y;
        local l_X_3 = v19.Min.X;
        local l_X_4 = v19.Max.X;
        if v25 then
            v27 = "Y";
            v28 = "X";
            l_Height_0 = v18.Width;
            l_X_0 = v18.Min.Y;
            l_Y_0 = v18.Min.X;
            l_Y_1 = v21.X;
            l_X_1 = v21.Y;
            l_X_2 = v18.Max.Y;
            l_Y_2 = v18.Max.X;
            l_Y_3 = v19.Min.X;
            l_Y_4 = v19.Max.X;
            l_X_3 = v19.Min.Y;
            l_X_4 = v19.Max.Y;
        end;
        local v40 = v15 + v20;
        if v26 then
            v22[v27] = l_X_0 - v40 - l_X_1;
            v23[v27] = l_X_1;
        else
            v22[v27] = l_X_2 + v40;
            v23[v27] = 0;
        end;
        if v16 == v1.Start then
            v22[v28] = l_Y_0 + v17;
        elseif v16 == v1.Center then
            v22[v28] = l_Y_0 + l_Height_0 / 2 - l_Y_1 / 2 + v17;
        else
            v22[v28] = l_Y_2 + -v17;
            v24[v28] = 1;
        end;
        local v41 = v22[v28] - v24[v28] * l_Y_1;
        local v42 = v41 + l_Y_1;
        if v41 < l_Y_3 then
            v24[v28] = 0;
            v22[v28] = l_Y_3;
        elseif l_Y_4 < v42 then
            v24[v28] = 1;
            v22[v28] = l_Y_4;
        end;
        v41 = v22[v28] - v24[v28] * l_Y_1;
        v42 = v41 + l_Y_1;
        local v43 = math.max(l_Y_0, v41);
        local v44 = math.min(l_Y_2, v42);
        local _ = nil;
        v23[v28] = (if v43 <= v44 then (v43 + v44) / 2 else if v42 < l_Y_0 then v42 - v20 else v41 + v20) - v22[v28];
        v22[v27] = math.clamp(v22[v27], l_X_3, (math.max(l_X_4 - l_X_1 - v40, 0)));
        v22.X = v22.X - v19.Min.X;
        v22.Y = v22.Y - v19.Min.Y;
        return Vector2.new(v22.X, v22.Y), Vector2.new(v23.X, v23.Y), Vector2.new(v24.X, v24.Y);
    end, 
    calculatePopoverBounds = function(v46, v47, v48, v49, v50) --[[ Line: 9 ]] --[[ Name: calculatePopoverBounds ]]
        -- upvalues: v2 (copy)
        local l_v50_0 = v50;
        if v46 == v2.Top or v46 == v2.Bottom then
            return l_v50_0 + Vector2.new(v48, v47 + v49);
        else
            return l_v50_0 + Vector2.new(v47 + v49, v48);
        end;
    end, 
    calculateAlign = function(v52, v53, v54, v55, v56) --[[ Line: 59 ]] --[[ Name: calculateAlign ]]
        -- upvalues: v2 (copy), v1 (copy)
        local v57 = true;
        if v52 ~= v2.Top then
            v57 = v52 == v2.Bottom;
        end;
        if v57 then
            if v53 == v1.Start then
                if v54.Min.X + v56.X > v55.Max.X then
                    return v1.End;
                end;
            elseif v53 == v1.End and v54.Max.X - v56.X < v55.Min.X then
                return v1.Start;
            end;
        elseif v53 == v1.Start then
            if v54.Min.Y + v56.Y > v55.Max.Y then
                return v1.End;
            end;
        elseif v53 == v1.End and v54.Max.Y - v56.Y < v55.Min.Y then
            return v1.Start;
        end;
        return v53;
    end
};
local l_Parent_0 = script:FindFirstAncestor("InputUi").Parent;
local v1 = require(l_Parent_0.SharedFlags).FFlagAXMigrateAXFocusBehaviorRoot and game:DefineFastFlag("AXSetAngularVelocityIsOptional", false);
local v6 = {
    normalizeStickByDeadzone = function(v2, v3) --[[ Line: 23 ]] --[[ Name: normalizeStickByDeadzone ]]
        local l_Magnitude_0 = v2.Magnitude;
        local v5 = v3 or 0.2;
        if l_Magnitude_0 < v5 then
            return Vector2.new(0, 0);
        else
            return (l_Magnitude_0 - v5) / (1 - v5) * v2.Unit;
        end;
    end
};
v6.rotateAndZoom = function(v7, v8, v9, v10, v11) --[[ Line: 33 ]] --[[ Name: rotateAndZoom ]]
    -- upvalues: v6 (copy), v1 (copy)
    local v12 = v6.normalizeStickByDeadzone(Vector2.new(v7.Position.X, v7.Position.Y));
    if v12 == Vector2.new(0, 0) then
        return;
    else
        if v1 then
            if v9 then
                v9(0);
            end;
        else
            v9(0);
        end;
        if v10 and math.abs(v12.X) > 0.5 then
            v10(v8 * v12.X * 2.0943951023931953);
        end;
        if v11 and math.abs(v12.Y) > 0.5 then
            v11(v8 * -v12.Y * 10);
        end;
        return;
    end;
end;
v6.mapPositionToDirection = function(v13) --[[ Line: 61 ]] --[[ Name: mapPositionToDirection ]]
    -- upvalues: v6 (copy)
    local v14 = v6.normalizeStickByDeadzone(v13);
    local l_X_0 = v14.X;
    local l_Y_0 = v14.Y;
    if l_X_0 * l_X_0 + l_Y_0 * l_Y_0 > 0.25 then
        local v17 = math.atan2(l_Y_0, l_X_0);
        if v17 > -2.356194490192345 and v17 <= -0.7853981633974483 then
            return Enum.KeyCode.Down;
        elseif v17 > -0.7853981633974483 and v17 <= 0.7853981633974483 then
            return Enum.KeyCode.Right;
        elseif v17 > 0.7853981633974483 and v17 <= 2.356194490192345 then
            return Enum.KeyCode.Up;
        elseif v17 > 2.356194490192345 or v17 <= -2.356194490192345 then
            return Enum.KeyCode.Left;
        end;
    end;
    return nil;
end;
return v6;
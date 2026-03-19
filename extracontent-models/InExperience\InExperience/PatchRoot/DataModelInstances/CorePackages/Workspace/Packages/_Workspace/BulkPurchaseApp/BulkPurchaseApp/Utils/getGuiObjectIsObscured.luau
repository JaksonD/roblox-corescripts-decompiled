local l_CoreGui_0 = game:GetService("CoreGui");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local v2 = require(l_script_FirstAncestor_0.Flags.FFlagAXMakeBulkPurchaseBlue);
local v3 = require(l_script_FirstAncestor_0.Flags.FIntAXGuiObjectIsObscuredPadding);
local function v9(v4, v5, v6) --[[ Line: 6 ]] --[[ Name: getGuiObjectIsObscuredAtPosition ]]
    -- upvalues: l_CoreGui_0 (copy)
    for _, v8 in (l_CoreGui_0:GetGuiObjectsAtPosition(v5, v6)) do
        if (not v8:IsA("Frame") or v8.Active ~= false or v8.BackgroundTransparency ~= 1) and not v8:IsDescendantOf(v4) then
            if v8 == v4 then
                return false;
            else
                return true;
            end;
        end;
    end;
    return false;
end;
return function(v10) --[[ Line: 22 ]] --[[ Name: getGuiObjectIsObscured ]]
    -- upvalues: v2 (copy), v9 (copy), v3 (copy)
    local l_AbsolutePosition_0 = v10.AbsolutePosition;
    local l_AbsoluteSize_0 = v10.AbsoluteSize;
    local v13 = l_AbsolutePosition_0 + l_AbsoluteSize_0 * 0.5;
    local v14 = l_AbsolutePosition_0 + l_AbsoluteSize_0;
    local v15 = l_AbsolutePosition_0 + Vector2.new(l_AbsoluteSize_0.X, 0);
    local v16 = l_AbsolutePosition_0 + Vector2.new(0, l_AbsoluteSize_0.Y);
    local v17 = l_AbsolutePosition_0 + l_AbsoluteSize_0 * Vector2.new(math.random(1, 9) / 10, math.random(1, 9) / 10);
    if v2 then
        return v9(v10, v13.X, v13.Y) or v9(v10, l_AbsolutePosition_0.X + v3, l_AbsolutePosition_0.Y + v3) or v9(v10, v16.X + v3, v16.Y - v3) or v9(v10, v15.X - v3, v15.Y + v3) or v9(v10, v14.X - v3, v14.Y - v3) or v9(v10, math.floor(v17.X), (math.floor(v17.Y)));
    else
        return v9(v10, v13.X, v13.Y) or v9(v10, l_AbsolutePosition_0.X + 1, l_AbsolutePosition_0.Y + 1) or v9(v10, v16.X + 1, v16.Y - 1) or v9(v10, v15.X - 1, v15.Y + 1) or v9(v10, v14.X - 1, v14.Y - 1) or v9(v10, math.floor(v17.X), (math.floor(v17.Y)));
    end;
end;
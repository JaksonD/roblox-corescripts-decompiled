local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Cryo);
local v2 = require(l_Parent_0.flags.getFFlagUGCValidationEyebrowEyelashSupport);
local function _(v3, v4) --[[ Line: 7 ]] --[[ Name: round ]]
    local v5 = 10 ^ (v4 or 0);
    return math.floor(v3 * v5 + 0.5) / v5;
end;
local function v7(v8) --[[ Line: 12 ]] --[[ Name: valueToString ]]
    -- upvalues: v1 (copy), v2 (copy), v7 (copy)
    local v9 = typeof(v8);
    if v8 == v1.None then
        return "not defined";
    elseif v9 == "Vector3" then
        return string.format("%d, %d, %d", math.floor(v8.X * 100 + 0.5) / 100, math.floor(v8.Y * 100 + 0.5) / 100, math.floor(v8.Z * 100 + 0.5) / 100);
    elseif v9 == "Color3" then
        return string.format("%d, %d, %d", math.floor(v8.r * 255), math.floor(v8.g * 255), (math.floor(v8.b * 255)));
    elseif v2() and v9 == "table" and v8[1] ~= nil then
        local v10 = tostring(v8[1]);
        for v11 = 2, #v8 do
            v10 = v10 .. ", " .. v7(v8[v11]);
        end;
        return v10;
    else
        return (tostring(v8));
    end;
end;
return v7;
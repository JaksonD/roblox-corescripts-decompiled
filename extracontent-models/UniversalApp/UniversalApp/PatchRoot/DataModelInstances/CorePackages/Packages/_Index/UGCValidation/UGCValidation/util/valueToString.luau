local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Parent.Cryo);
local v2 = require(l_Parent_0.flags.getFFlagUGCValidationEyebrowEyelashSupport);
local v3 = game:DefineFastFlag("UGCValidationValueToStringVector3Precision", false);
local function _(v4, v5) --[[ Line: 9 ]] --[[ Name: round ]]
    local v6 = 10 ^ (v5 or 0);
    return math.floor(v4 * v6 + 0.5) / v6;
end;
local function v8(v9) --[[ Line: 14 ]] --[[ Name: valueToString ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy), v8 (copy)
    local v10 = typeof(v9);
    if v9 == v1.None then
        return "not defined";
    elseif v10 == "Vector3" then
        local v11 = v3 and "%g, %g, %g" or "%d, %d, %d";
        return string.format(v11, math.floor(v9.X * 100 + 0.5) / 100, math.floor(v9.Y * 100 + 0.5) / 100, math.floor(v9.Z * 100 + 0.5) / 100);
    elseif v10 == "Color3" then
        return string.format("%d, %d, %d", math.floor(v9.r * 255), math.floor(v9.g * 255), (math.floor(v9.b * 255)));
    elseif v2() and v10 == "table" and v9[1] ~= nil then
        local v12 = tostring(v9[1]);
        for v13 = 2, #v9 do
            v12 = v12 .. ", " .. v8(v9[v13]);
        end;
        return v12;
    else
        return (tostring(v9));
    end;
end;
return v8;
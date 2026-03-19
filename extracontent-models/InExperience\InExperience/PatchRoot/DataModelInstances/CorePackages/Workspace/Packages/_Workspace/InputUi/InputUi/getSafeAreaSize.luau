local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.ArgCheck);
local v2 = require(l_Parent_0.Display);
local l_FFlagExtendScrollingFramesBySafeInsets_0 = require(l_Parent_0.SharedFlags).FFlagExtendScrollingFramesBySafeInsets;
return function(v4, v5) --[[ Line: 8 ]] --[[ Name: getSafeAreaSize ]]
    -- upvalues: v1 (copy), l_FFlagExtendScrollingFramesBySafeInsets_0 (copy), v2 (copy)
    assert(typeof(v4) == "Vector2", "getSafeAreaSize expects screenSize to be a Vector2");
    assert(type(v5) == "table", "getSafeAreaSize expects guiInset to be a table");
    v1.isNonNegativeNumber(v5.left, "getSafeAreaSize: guiInset.left");
    v1.isNonNegativeNumber(v5.right, "getSafeAreaSize: guiInset.right");
    v1.isNonNegativeNumber(v5.top, "getSafeAreaSize: guiInset.top");
    v1.isNonNegativeNumber(v5.bottom, "getSafeAreaSize: guiInset.bottom");
    local v6 = v4.X - v5.left - v5.right;
    local v7 = v4.Y - v5.top - v5.bottom;
    if l_FFlagExtendScrollingFramesBySafeInsets_0 then
        local v8 = v2.GetDisplayStore().getDeviceSafePadding();
        v6 = v6 - (v8.left + v8.right);
        v7 = v7 - (v8.top + v8.bottom);
    end;
    v1.isNonNegativeNumber(v6, "getSafeAreaSize: safeAreaWidth");
    v1.isNonNegativeNumber(v7, "getSafeAreaSize: safeAreaHeight");
    return UDim2.new(0, v6, 0, v7);
end;
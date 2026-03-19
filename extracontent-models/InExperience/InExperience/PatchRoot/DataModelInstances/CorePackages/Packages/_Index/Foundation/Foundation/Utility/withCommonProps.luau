local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local _ = require(l_script_FirstAncestor_0.Components.Types);
return function(v2, v3) --[[ Line: 6 ]] --[[ Name: withCommonProps ]]
    if type(v3) == "table" then
        v3.AnchorPoint = v2.AnchorPoint;
        v3.LayoutOrder = v2.LayoutOrder;
        v3.Position = v2.Position;
        v3.Visible = v2.Visible;
        v3.ZIndex = v2.ZIndex;
        v3.onAbsoluteSizeChanged = v2.onAbsoluteSizeChanged;
        v3.onAbsolutePositionChanged = v2.onAbsolutePositionChanged;
        v3.testId = v2.testId;
    end;
    return v3;
end;
local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.React);
local l_AnimatedFrame_0 = require(l_Parent_0.UIBlox).Utility.SpringAnimatedItem.AnimatedFrame;
local v3 = require(l_Parent_0.Dash);
local v4 = {
    dampingRatio = 1, 
    frequency = 3.5
};
local function v7(v5) --[[ Line: 38 ]] --[[ Name: ExpandingFrame ]]
    -- upvalues: v1 (copy), l_AnimatedFrame_0 (copy), v4 (copy)
    return v1.createElement(l_AnimatedFrame_0, {
        regularProps = {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = v5.LayoutOrder, 
            ClipsDescendants = true, 
            ref = v5.frameRef, 
            NextSelectionUp = v5.NextSelectionUp, 
            NextSelectionDown = v5.NextSelectionDown, 
            NextSelectionLeft = v5.NextSelectionLeft, 
            NextSelectionRight = v5.NextSelectionRight, 
            [v1.Change.AbsoluteSize] = v5.onAbsoluteSizeChanged
        }, 
        animatedValues = {
            yOffset = if v5.isExpanded then v5.Size.Y.Offset else 0, 
            yScale = if v5.isExpanded then v5.Size.Y.Scale else 0
        }, 
        mapValuesToProps = function(v6) --[[ Line: 58 ]] --[[ Name: mapValuesToProps ]]
            -- upvalues: v5 (copy)
            return {
                Size = UDim2.new(v5.Size.X.Scale, v5.Size.X.Offset, v6.yScale, v6.yOffset)
            };
        end, 
        springOptions = v4
    }, v5.children);
end;
return v1.forwardRef(function(v8, v9) --[[ Line: 68 ]]
    -- upvalues: v1 (copy), v7 (copy), v3 (copy)
    return v1.createElement(v7, v3.join(v8, {
        frameRef = v9
    }));
end);
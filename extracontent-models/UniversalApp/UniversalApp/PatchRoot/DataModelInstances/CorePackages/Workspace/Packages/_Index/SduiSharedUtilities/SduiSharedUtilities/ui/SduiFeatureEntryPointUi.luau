local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiSharedUtilities");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_Loading_0 = require(l_Parent_0.Foundation).Loading;
local v4 = require(l_script_FirstAncestor_0.ui.SduiFeatureErrorUi);
return v2.forwardRef(function(v5, v6) --[[ Line: 26 ]] --[[ Name: SduiFeatureEntryPointUi ]]
    -- upvalues: v2 (copy), l_Loading_0 (copy), v4 (copy)
    return v2.createElement("Frame", {
        Size = if v5.Size then v5.Size else UDim2.new(1, 0, 0, 0), 
        AutomaticSize = if v5.AutomaticSize then v5.AutomaticSize else Enum.AutomaticSize.Y, 
        Position = v5.Position, 
        LayoutOrder = v5.LayoutOrder, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        ref = v6
    }, {
        Content = if v5.uiStatus == "Loading" and v5.shouldDisplayLoading then if v5.loadingSlot then v5.loadingSlot else v2.createElement(l_Loading_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            testId = "sdui-feature-entry-point-loading"
        }) else if v5.uiStatus == "Error" and v5.shouldDisplayError then if v5.errorSlot then v5.errorSlot else v2.createElement(v4, {
            onRetry = v5.onRetry
        }) else if v5.uiStatus == "Resolved" then v5.contentSlot else nil
    });
end);
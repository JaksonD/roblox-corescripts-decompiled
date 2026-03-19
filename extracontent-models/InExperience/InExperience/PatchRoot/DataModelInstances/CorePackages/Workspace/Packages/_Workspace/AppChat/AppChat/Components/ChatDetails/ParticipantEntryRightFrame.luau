local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local l_memo_0 = v3.memo;
local v5 = require(l_Parent_0.UIBlox);
local l_Images_0 = v5.App.ImageSet.Images;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = v5.Core.Style.useStyle;
local v9 = require(l_script_FirstAncestor_0.Components.Label.Label);
local v10 = {
    image = l_Images_0["icons/common/more"], 
    dotsSize = UDim2.new(0, 36, 0, 36), 
    shouldShowDots = false
};
ParticipantEntryRightFrame = function(v11) --[[ Line: 36 ]] --[[ Name: ParticipantEntryRightFrame ]]
    -- upvalues: v2 (copy), v10 (copy), l_useStyle_0 (copy), v3 (copy), v9 (copy), l_ImageSetLabel_0 (copy)
    local v12 = v2.Dictionary.join(v10, v11);
    local v13 = l_useStyle_0();
    local v14 = v12.style or v13;
    return v3.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.X, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, 0, 1, 0), 
        [v3.Change.AbsoluteSize] = v12[v3.Change.AbsoluteSize]
    }, {
        UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, 22), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        UIPadding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 22), 
            PaddingRight = UDim.new(0, 22)
        }), 
        label = if v12.labelText then v3.createElement(v9, {
            backgroundColor3 = v14.Theme.BackgroundContrast.Color, 
            backgroundTransparency = v14.Theme.BackgroundContrast.Transparency, 
            bodyText = v12.labelText, 
            layoutOrder = 1
        }) else nil, 
        dots = if v12.shouldShowDots then v3.createElement("Frame", {
            Size = UDim2.new(0, 20, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 2
        }, {
            Dots = v3.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Image = v12.image, 
                ImageColor3 = v12.imageColor3 or v14.Theme.IconEmphasis.Color, 
                ImageTransparency = v12.imageTransparency or v14.Theme.IconEmphasis.Transparency, 
                Position = UDim2.fromScale(0.5, 0.5), 
                ScaleType = Enum.ScaleType.Slice, 
                Size = UDim2.new(0, 36, 0, 36)
            })
        }) else nil
    });
end;
return l_memo_0(ParticipantEntryRightFrame);
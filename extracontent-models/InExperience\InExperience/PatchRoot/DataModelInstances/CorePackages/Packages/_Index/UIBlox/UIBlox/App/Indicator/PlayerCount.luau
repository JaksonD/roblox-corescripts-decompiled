local l_script_FirstAncestor_0 = script:FindFirstAncestor("App");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.React);
local _ = require(l_script_FirstAncestor_0.ImageSet.ImagesTypes);
local v5 = require(l_script_FirstAncestor_0.ImageSet.Enum.IconSize);
local v6 = require(l_script_FirstAncestor_0.ImageSet.getIconSize);
local v7 = require(l_script_FirstAncestor_0.Indicator.StatWidget);
local _ = require(l_script_FirstAncestor_0.Style.Fonts);
local v9 = require(l_Parent_0.Core.Style.useStyle);
local v10 = require(l_Parent_0.Core.Text.GetTextSize);
local v11 = require(l_Parent_0.UIBloxConfig);
local _ = require(l_Parent_0.App.Style.StyleTypes);
local v13 = v6(v5.Large);
local function _(v14, v15, v16) --[[ Line: 32 ]] --[[ Name: getTextWidth ]]
    -- upvalues: v10 (copy)
    local l_BaseSize_0 = v16.Font.BaseSize;
    local v18 = v15.RelativeSize * l_BaseSize_0;
    local v19 = Vector2.new(10000, 10000);
    return v10(v14, v18, v15.Font, v19).X;
end;
local function _(v21, v22) --[[ Line: 39 ]] --[[ Name: getMeasuredSectionWidth ]]
    -- upvalues: v11 (copy), v6 (copy), v5 (copy), v13 (copy), v10 (copy)
    local v23 = if v11.enableScalingForSomeEdpIcons then v6(v5.Large, v22) else v13;
    local l_countText_0 = v21.countText;
    local l_Title_0 = v22.Font.Title;
    local l_BaseSize_1 = v22.Font.BaseSize;
    local v27 = l_Title_0.RelativeSize * l_BaseSize_1;
    local v28 = Vector2.new(10000, 10000);
    local l_X_0 = v10(l_countText_0, v27, l_Title_0.Font, v28).X;
    l_Title_0 = v21.labelText;
    l_BaseSize_1 = v22.Font.CaptionHeader;
    v27 = v22.Font.BaseSize;
    v28 = l_BaseSize_1.RelativeSize * v27;
    local v30 = Vector2.new(10000, 10000);
    return math.max(l_X_0, v10(l_Title_0, v28, l_BaseSize_1.Font, v30).X) + v23 + 12;
end;
return function(v32) --[[ Line: 46 ]] --[[ Name: PlayerCount ]]
    -- upvalues: v9 (copy), v11 (copy), v6 (copy), v5 (copy), v13 (copy), v10 (copy), v3 (copy), v7 (copy)
    local v33 = v9();
    local l_countLeft_0 = v32.countLeft;
    local v35 = if v11.enableScalingForSomeEdpIcons then v6(v5.Large, v33) else v13;
    local l_countText_1 = l_countLeft_0.countText;
    local l_Title_1 = v33.Font.Title;
    local l_BaseSize_2 = v33.Font.BaseSize;
    local v39 = l_Title_1.RelativeSize * l_BaseSize_2;
    local v40 = Vector2.new(10000, 10000);
    local l_X_1 = v10(l_countText_1, v39, l_Title_1.Font, v40).X;
    l_Title_1 = l_countLeft_0.labelText;
    l_BaseSize_2 = v33.Font.CaptionHeader;
    v39 = v33.Font.BaseSize;
    v40 = l_BaseSize_2.RelativeSize * v39;
    local v42 = Vector2.new(10000, 10000);
    local v43 = math.max(l_X_1, v10(l_Title_1, v40, l_BaseSize_2.Font, v42).X) + v35 + 12;
    v35 = v32.countRight;
    l_X_1 = if v11.enableScalingForSomeEdpIcons then v6(v5.Large, v33) else v13;
    l_Title_1 = v35.countText;
    l_BaseSize_2 = v33.Font.Title;
    v39 = v33.Font.BaseSize;
    v40 = l_BaseSize_2.RelativeSize * v39;
    v42 = Vector2.new(10000, 10000);
    l_countText_1 = v10(l_Title_1, v40, l_BaseSize_2.Font, v42).X;
    l_BaseSize_2 = v35.labelText;
    v39 = v33.Font.CaptionHeader;
    v40 = v33.Font.BaseSize;
    v42 = v39.RelativeSize * v40;
    local v44 = Vector2.new(10000, 10000);
    v35 = v43 / (v43 + (math.max(l_countText_1, v10(l_BaseSize_2, v42, v39.Font, v44).X) + l_X_1 + 12));
    l_X_1 = 1 - v35;
    l_countText_1 = v32.countLeft;
    l_Title_1 = v32.countRight;
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = v32.layoutOrder, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        LeftSection = v3.createElement(v7, {
            countText = l_countText_1.countText, 
            labelText = l_countText_1.labelText, 
            icon = l_countText_1.icon, 
            layoutOrder = 1, 
            position = UDim2.new(0, 0, 0, 0), 
            anchorPoint = Vector2.new(0, 0), 
            size = UDim2.new(v35, 0, 1, 0), 
            horizontalAlignment = Enum.HorizontalAlignment.Left, 
            styleProps = if v11.enableScalingForSomeEdpIcons then {
                iconSize = math.floor((v6(v5.Large, v33)))
            } else nil
        }), 
        RightSection = v3.createElement(v7, {
            countText = l_Title_1.countText, 
            labelText = l_Title_1.labelText, 
            icon = l_Title_1.icon, 
            layoutOrder = 2, 
            position = UDim2.new(1, 0, 0, 0), 
            anchorPoint = Vector2.new(1, 0), 
            size = UDim2.new(l_X_1, 0, 1, 0), 
            horizontalAlignment = Enum.HorizontalAlignment.Right, 
            styleProps = if v11.enableScalingForSomeEdpIcons then {
                iconSize = math.floor((v6(v5.Large, v33)))
            } else nil
        })
    });
end;
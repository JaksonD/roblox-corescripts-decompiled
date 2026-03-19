local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.React);
local v3 = require(l_Parent_0.Button.Button);
local v4 = require(l_Parent_0.Button.Enum.ButtonType);
local v5 = require(l_Parent_0.Button.ComboButton);
local v6 = require(l_Parent_0.ImageSet.Images);
local function v7() --[[ Line: 21 ]]

end;
return function(v8) --[[ Line: 47 ]] --[[ Name: ExperienceActionRow ]]
    -- upvalues: v2 (copy), v5 (copy), v7 (copy), v6 (copy), v3 (copy), v4 (copy)
    local l_isActionable_0 = v8.isActionable;
    local v10 = v8.horizontalPadding or 6;
    local v11 = v8.verticalPadding or 6;
    local v12 = v8.height or 48;
    local l_text_0 = v8.text;
    local l_icon_0 = v8.icon;
    if v8.onOverflowPressed then
        return v2.createElement(v5, {
            position = UDim2.new(0, v10, 1, -v11 - 36), 
            size = UDim2.new(1, -2 * v10, 0, v12 - 2 * v11), 
            button = {
                text = l_text_0, 
                icon = l_icon_0, 
                onActivated = v8.onPlayPressed or v7, 
                isDisabled = not l_isActionable_0
            }, 
            overflow = {
                icon = v6["icons/actions/truncationCollapse"], 
                onActivated = v8.onOverflowPressed, 
                isDisabled = not l_isActionable_0
            }
        });
    else
        return v2.createElement(v3, {
            buttonType = if v8.buttonType then v8.buttonType else v4.PrimaryContextual, 
            text = l_text_0, 
            icon = l_icon_0, 
            size = UDim2.new(1, -2 * v10, 0, v12 - 2 * v11), 
            position = UDim2.new(0, v10, 1, -v11 - 36), 
            userInteractionEnabled = l_isActionable_0, 
            onActivated = v8.onPlayPressed or v7, 
            isDisabled = not l_isActionable_0, 
            feedbackType = v8.feedbackType
        });
    end;
end;
local l_Parent_0 = script:FindFirstAncestor("SduiSharedContent").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local _ = require(l_Parent_0.SduiCompat);
local l_Chip_0 = v2.Chip;
local l_FFlagSduiChipAccessoryProps_0 = require(l_Parent_0.SharedFlags).FFlagSduiChipAccessoryProps;
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
return v1.memo(function(v7) --[[ Line: 65 ]] --[[ Name: SduiChip ]]
    -- upvalues: l_FFlagSduiServerCompat_0 (copy), l_FFlagSduiChipAccessoryProps_0 (copy), v1 (copy), l_Chip_0 (copy)
    local v8 = nil;
    local v9 = nil;
    local v10 = nil;
    if l_FFlagSduiServerCompat_0 then
        v8 = v7.layoutOrder;
        v9 = v7.anchorPoint;
        v10 = v7.position;
    else
        v8 = v7.LayoutOrder;
        v9 = v7.AnchorPoint;
        v10 = v7.Position;
    end;
    local v11 = nil;
    if l_FFlagSduiChipAccessoryProps_0 and v7.leading then
        v11 = v7.leading;
    elseif v7.leadingIconName then
        v11 = if not not v7.leadingIconVariant or v7.leadingIsCircular or v7.leadingOnActivated then {
            iconName = v7.leadingIconName, 
            iconVariant = v7.leadingIconVariant, 
            isCircular = v7.leadingIsCircular, 
            onActivated = v7.leadingOnActivated
        } else v7.leadingIconName;
    end;
    local v12 = nil;
    if l_FFlagSduiChipAccessoryProps_0 and v7.trailing then
        v12 = v7.trailing;
    elseif v7.trailingIconName then
        v12 = if not not v7.trailingIconVariant or v7.trailingIsCircular or v7.trailingOnActivated then {
            iconName = v7.trailingIconName, 
            iconVariant = v7.trailingIconVariant, 
            isCircular = v7.trailingIsCircular, 
            onActivated = v7.trailingOnActivated
        } else v7.trailingIconName;
    end;
    return v1.createElement(l_Chip_0, {
        text = v7.text, 
        leading = v11, 
        trailing = v12, 
        onActivated = v7.onActivated, 
        isChecked = v7.isChecked, 
        size = v7.size, 
        LayoutOrder = v8, 
        AnchorPoint = v9, 
        Position = v10
    });
end);
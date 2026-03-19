local l_Parent_0 = script:FindFirstAncestor("SduiSharedContent").Parent;
local v1 = require(l_Parent_0.React);
local l_OverflowMenu_0 = require(l_Parent_0.AppBlox).OverflowMenu;
local l_useUidRefString_0 = require(l_Parent_0.SduiCoreSystem).useUidRefString;
local _ = require(l_Parent_0.SduiCompat);
local l_FFlagSduiServerCompat_0 = require(l_Parent_0.SharedFlags).FFlagSduiServerCompat;
return v1.memo(function(v6) --[[ Line: 41 ]] --[[ Name: SduiOverflowMenu ]]
    -- upvalues: l_useUidRefString_0 (copy), l_FFlagSduiServerCompat_0 (copy), v1 (copy), l_OverflowMenu_0 (copy)
    local v7 = ("sdui-overflow-menu-%*"):format(l_useUidRefString_0().current);
    local v8 = nil;
    local v9 = nil;
    if l_FFlagSduiServerCompat_0 then
        v8 = v6.anchorPoint or Vector2.new(0, 0);
        v9 = v6.position or UDim2.new(0, 0, 0, 0);
    else
        v8 = v6.AnchorPoint or Vector2.new(0, 0);
        v9 = v6.Position or UDim2.new(0, 0, 0, 0);
    end;
    return v1.createElement(l_OverflowMenu_0, {
        anchorPoint = v8, 
        anchorPosition = v9, 
        menuItems = v6.items, 
        menuKey = v7, 
        buttonVariant = v6.buttonVariant, 
        buttonIconSize = v6.buttonSize, 
        buttonIcon = v6.buttonIcon, 
        buttonIconBackgroundStyle = v6.buttonIconBackgroundStyle, 
        menuItemSize = v6.menuItemSize, 
        popoverAlign = v6.popoverAlign, 
        popoverSide = v6.popoverSide, 
        menuWidth = v6.menuWidth, 
        hasOverflowButton = true, 
        shouldShowAnchor = true
    });
end);
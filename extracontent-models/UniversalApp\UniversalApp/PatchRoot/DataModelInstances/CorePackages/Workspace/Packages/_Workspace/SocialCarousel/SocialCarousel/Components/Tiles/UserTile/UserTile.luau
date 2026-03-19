local l_Parent_0 = script:FindFirstAncestor("SocialCarousel").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.SocialCommon);
local l_UserTile_0 = require(l_Parent_0.UserTile).UserTile;
local l_LayoutMode_0 = require(l_Parent_0.UserTile).LayoutMode;
local v5 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v5.Hooks.useTokens;
local l_View_0 = v5.View;
local l_convertToFoundationPresenceEnum_0 = v2.Utils.convertToFoundationPresenceEnum;
return function(v9) --[[ Line: 31 ]] --[[ Name: UserTile ]]
    -- upvalues: l_useTokens_0 (copy), v5 (copy), l_convertToFoundationPresenceEnum_0 (copy), v1 (copy), l_View_0 (copy), l_UserTile_0 (copy), l_LayoutMode_0 (copy)
    local v10 = l_useTokens_0();
    local v11 = if v9.item.presence ~= nil then v5.Enums.UserPresence[l_convertToFoundationPresenceEnum_0(v9.item.presence.userPresenceType)] else v5.Enums.UserPresence.None;
    return v1.createElement(l_View_0, {
        tag = "auto-none", 
        Size = v9.itemSize, 
        LayoutOrder = v9.index, 
        ref = v9.tileRef, 
        selection = if v9.selectionOrder then {
            SelectionOrder = v9.selectionOrder, 
            Selectable = true
        } else nil
    }, {
        Content = v1.createElement(l_UserTile_0, {
            layoutMode = l_LayoutMode_0.compact, 
            userId = v9.item.id, 
            title = v9.name, 
            subtitle = v9.contextualText, 
            titleStyle = v10.Typography.TitleSmall, 
            subtitleStyle = v10.Typography.LabelSmall, 
            userPresenceType = v11, 
            onActivated = v9.onActivated, 
            titleIcon = v9.titleIcon
        })
    });
end;
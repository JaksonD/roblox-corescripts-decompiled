local l_Parent_0 = script:FindFirstAncestor("SocialCarousel").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.SocialCommon);
local l_UserTile_0 = require(l_Parent_0.UserTile).UserTile;
local l_LayoutMode_0 = require(l_Parent_0.UserTile).LayoutMode;
local v5 = require(l_Parent_0.Foundation);
local l_FFlagUserTilePassOnStateChanged_0 = require(l_Parent_0.SharedFlags).FFlagUserTilePassOnStateChanged;
local l_useTokens_0 = v5.Hooks.useTokens;
local l_View_0 = v5.View;
local l_convertToFoundationPresenceEnum_0 = v2.Utils.convertToFoundationPresenceEnum;
return function(v10) --[[ Line: 34 ]] --[[ Name: UserTile ]]
    -- upvalues: l_useTokens_0 (copy), v5 (copy), l_convertToFoundationPresenceEnum_0 (copy), v1 (copy), l_View_0 (copy), l_UserTile_0 (copy), l_LayoutMode_0 (copy), l_FFlagUserTilePassOnStateChanged_0 (copy)
    local v11 = l_useTokens_0();
    local v12 = if v10.item.presence ~= nil then v5.Enums.UserPresence[l_convertToFoundationPresenceEnum_0(v10.item.presence.userPresenceType)] else v5.Enums.UserPresence.None;
    return v1.createElement(l_View_0, {
        tag = "auto-none", 
        Size = v10.itemSize, 
        LayoutOrder = v10.index, 
        ref = v10.tileRef, 
        selection = if v10.selectionOrder then {
            SelectionOrder = v10.selectionOrder, 
            Selectable = true
        } else nil
    }, {
        Content = v1.createElement(l_UserTile_0, {
            layoutMode = l_LayoutMode_0.compact, 
            userId = v10.item.id, 
            title = v10.name, 
            subtitle = v10.contextualText, 
            titleStyle = v11.Typography.TitleSmall, 
            subtitleStyle = v11.Typography.LabelSmall, 
            userPresenceType = v12, 
            onActivated = v10.onActivated, 
            titleIcon = v10.titleIcon, 
            onStateChanged = if l_FFlagUserTilePassOnStateChanged_0 then v10.onStateChanged else nil
        })
    });
end;
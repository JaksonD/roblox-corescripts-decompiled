local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCarousel");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v4 = require(l_script_FirstAncestor_0.Common.Constants);
local v5 = require(l_script_FirstAncestor_0.BaseComponents.Tile);
return function(v6) --[[ Line: 19 ]] --[[ Name: ShareQRTile ]]
    -- upvalues: l_useLocalization_0 (copy), v4 (copy), v2 (copy), v5 (copy)
    local v7 = l_useLocalization_0({
        shareQRHeading = v4.LOCALIZATION.SHARE_QR_HEADING
    });
    return v2.createElement(v5, {
        index = v6.index, 
        itemSize = v6.itemSize, 
        onActivated = v6.onActivated, 
        title = v7.shareQRHeading, 
        icon = "icons/actions/friend_sort/qr_code", 
        selectionOrder = v6.selectionOrder
    });
end;
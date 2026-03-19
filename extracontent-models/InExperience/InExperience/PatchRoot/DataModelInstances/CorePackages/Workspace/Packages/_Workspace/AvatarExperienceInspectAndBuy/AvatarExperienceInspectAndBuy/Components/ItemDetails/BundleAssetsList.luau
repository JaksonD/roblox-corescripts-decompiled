local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceInspectAndBuy");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v3.Hooks.useTokens;
local v5 = require(l_Parent_0.AvatarExperienceUIKit);
local l_ItemCardThumbnail_0 = v5.ItemCardComponents.ItemCardThumbnail;
local l_ItemCardHeader_0 = v5.ItemCardComponents.ItemCardHeader;
local l_ItemCard_0 = v5.ItemCardComponents.ItemCard;
local v9 = require(l_script_FirstAncestor_0.Enums.ViewType);
local _ = require(l_script_FirstAncestor_0.Types);
local l_getItemWidth_0 = require(l_script_FirstAncestor_0.Utils.itemDetailsUtils).getItemWidth;
return function(v12) --[[ Line: 44 ]] --[[ Name: BundleAssetsList ]]
    -- upvalues: l_useTokens_0 (copy), v9 (copy), v2 (copy), l_ItemCard_0 (copy), l_getItemWidth_0 (copy), l_ItemCardHeader_0 (copy), l_ItemCardThumbnail_0 (copy), v3 (copy)
    local v13 = l_useTokens_0();
    local l_itemData_0 = v12.itemData;
    local v15 = v12.view == v9.WideLandscape;
    local v16 = v12.view == v9.Compact;
    local v17, v18 = v2.useBinding(Vector2.new(0, 0));
    local v19 = {};
    local v20 = (not not v15 or v16) and 4 or 6;
    if l_itemData_0.assetsInBundle then
        for v21, v22 in l_itemData_0.assetsInBundle do
            v19["AssetItemCard" .. v21] = v2.createElement(l_ItemCard_0, {
                Size = v17:map(function(v23) --[[ Line: 57 ]]
                    -- upvalues: l_getItemWidth_0 (ref), v20 (copy), v13 (copy)
                    local v24 = l_getItemWidth_0(v23.X, v20, v13.Gap.Medium);
                    return UDim2.new(0, v24, 1, 0);
                end), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                headerSlot = v2.createElement(l_ItemCardHeader_0, {
                    LayoutOrder = 1
                }, v2.createElement(l_ItemCardThumbnail_0, {
                    url = "rbxthumb://type=Asset&id=" .. v22.id .. "&w=420&h=420"
                })), 
                footerSlot = if v22.name then v2.createElement(v3.Text, {
                    tag = "auto-y text-body-small content-emphasis text-truncate-split text-align-x-left size-full-0 text-wrap", 
                    LayoutOrder = 2, 
                    Text = v22.name
                }) else nil
            });
        end;
    end;
    local v26 = v2.useCallback(function(v25) --[[ Line: 81 ]]
        -- upvalues: v18 (copy)
        v18(v25.AbsoluteSize);
    end, {});
    return v2.createElement(v3.View, {
        tag = "auto-y size-full-0 col align-x-left align-y-top gap-small", 
        LayoutOrder = v12.LayoutOrder or 5, 
        onAbsoluteSizeChanged = v26
    }, {
        IncludedPartsLabel = v2.createElement(v3.View, {
            tag = "auto-xy padding-top-xxlarge", 
            LayoutOrder = 1
        }, {
            Label = v2.createElement(v3.Text, {
                tag = "text-title-medium text-align-x-left content-emphasis", 
                Text = v12.headerLabel, 
                LayoutOrder = 1
            })
        }), 
        BundleAssets = v2.createElement(v3.View, {
            tag = "auto-y size-full-0 padding-y-small row align-x-left align-y-top gap-medium wrap", 
            LayoutOrder = 2
        }, v19)
    });
end;
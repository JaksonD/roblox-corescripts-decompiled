local l_script_FirstAncestor_0 = script:FindFirstAncestor("AddFriends");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Roact);
local l_Images_0 = require(l_Parent_0.UIBlox).App.ImageSet.Images;
local v5 = require(l_script_FirstAncestor_0.Components.AddFriendsGenericBanner);
local v6 = require(l_script_FirstAncestor_0.Analytics.useFireAnalyticsEvent);
local v7 = require(script.Parent.ConnectionChannelsCarousel);
local v8 = require(script.Parent.ConnectionChannelsTile);
local v9 = require(script.Parent.ContactImporterChannel);
local v10 = require(script.Parent.QRCodeChannel);
local l_FFlagAddFriendsBannersNewUI_IXP_0 = require(l_Parent_0.SharedFlags).FFlagAddFriendsBannersNewUI_IXP;
local _ = require(script.Parent.Types);
local v13 = {
    {
        component = v9
    }, 
    {
        component = v10
    }
};
return function(v14) --[[ Line: 43 ]] --[[ Name: ConnectionChannelsSection ]]
    -- upvalues: v6 (copy), l_FFlagAddFriendsBannersNewUI_IXP_0 (copy), v2 (copy), v8 (copy), v7 (copy), v13 (copy), v5 (copy), l_Images_0 (copy), v3 (copy), v9 (copy), v10 (copy)
    local v15 = v6();
    if l_FFlagAddFriendsBannersNewUI_IXP_0 then
        local l_layoutOrder_0 = v14.layoutOrder;
        local l_navigateToLuaAppPages_0 = v14.navigateToLuaAppPages;
        local v21 = v2.useCallback(function(v18, v19, v20) --[[ Line: 51 ]]
            -- upvalues: v2 (ref), v8 (ref), v15 (copy), v14 (copy)
            return v2.createElement(v18.component, {
                component = v8, 
                componentUIProps = {
                    layoutOrder = v19, 
                    itemSize = v20
                }, 
                fireAnalyticsEvent = v15, 
                navigateToLuaAppPages = v14.navigateToLuaAppPages
            }), "Item";
        end, {
            v15, 
            l_navigateToLuaAppPages_0
        });
        return v2.createElement(v7, {
            layoutOrder = l_layoutOrder_0, 
            items = v13, 
            contextualInfoHeight = 25, 
            renderItem = v21
        });
    else
        local v22 = v14.layoutOrder or 1;
        local v24 = v2.useCallback(function(v23) --[[ Line: 76 ]]
            -- upvalues: v2 (ref), v5 (ref), l_Images_0 (ref)
            return v2.createElement(v5, {
                maxWidth = 640, 
                bannerIcon = l_Images_0[v23.icon], 
                bannerTitle = v23.title, 
                bannerText = v23.text, 
                onActivated = v23.onActivated, 
                onBannerMounted = v23.onMounted, 
                layoutOrder = v23.componentUIProps.layoutOrder
            });
        end, {});
        return v3.createFragment({
            ContactImporterBanner = v2.createElement(v9, {
                component = v24, 
                componentUIProps = {
                    layoutOrder = v22
                }, 
                fireAnalyticsEvent = v15
            }), 
            QRCodeBanner = v2.createElement(v10, {
                component = v24, 
                componentUIProps = {
                    layoutOrder = v22 + 1
                }, 
                fireAnalyticsEvent = v15, 
                navigateToLuaAppPages = v14.navigateToLuaAppPages
            })
        });
    end;
end;
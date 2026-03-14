local l_Parent_0 = script:FindFirstAncestor("AvatarSwitcher").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local v3 = require(l_Parent_0.FoundationCloudAssets);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v5 = v3.Assets["pictograms/collaborators"];
EmptyState = function(v6) --[[ Line: 16 ]] --[[ Name: EmptyState ]]
    -- upvalues: l_useLocalization_0 (copy), v1 (copy), v2 (copy), v5 (copy)
    local v7 = l_useLocalization_0({
        noAvatars = "Feature.AvatarSwitcher.Message.NoAvatars", 
        addAvatars = "Feature.AvatarSwitcher.Message.AddAvatars"
    });
    return v1.createElement(v2.View, {
        tag = "size-full"
    }, {
        Header = v6.headerSlot, 
        Content = v1.createElement(v2.View, {
            tag = "auto-xy position-center-center anchor-center-center col align-x-center"
        }, {
            Image = v1.createElement(v2.Image, {
                Image = v5.assetId, 
                Size = UDim2.fromOffset(v5.size.X / 3, v5.size.Y / 3), 
                LayoutOrder = 1
            }), 
            Text = v1.createElement(v2.Text, {
                tag = "auto-xy text-title-large padding-bottom-small", 
                Text = v7.noAvatars, 
                LayoutOrder = 2
            }), 
            SubText = v1.createElement(v2.Text, {
                tag = "auto-xy text-body-medium", 
                Text = v7.addAvatars, 
                LayoutOrder = 3
            })
        })
    });
end;
return EmptyState;
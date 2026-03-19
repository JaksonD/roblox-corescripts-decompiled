local l_Parent_0 = script:FindFirstAncestor("AddFriends").Parent;
local v1 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v3 = require(l_Parent_0.Foundation);
local v4 = require(l_Parent_0.FoundationCloudAssets);
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local v6 = game:DefineFastFlag("AddFriendsFixText", false);
local l_Assets_0 = v4.Assets;
v4.preloadAsset("pictograms/collaborators");
local v8 = l_Assets_0["pictograms/collaborators"] or {};
return function(v9) --[[ Line: 25 ]] --[[ Name: AddFriendsEmptyState ]]
    -- upvalues: l_useLocalization_0 (copy), v6 (copy), l_useTokens_0 (copy), v1 (copy), v3 (copy), v8 (copy)
    local v10 = l_useLocalization_0({
        titleText = "Feature.AddFriends.Title.AddConnectionsToolTip", 
        emptyStatePromptText = if v6 then nil else "Feature.AddFriends.Label.EmptyState", 
        emptyStateBodyText = if v6 then {
            "Feature.AddFriends.Text.EmptyState"; 
            lineBreak = "\n"
        } else nil
    });
    local v11 = l_useTokens_0();
    local v12 = 180 * v11.Config.UI.Scale;
    local v13 = 320 * v11.Config.UI.Scale;
    return v1.createElement(v3.View, {
        tag = "size-full-0 auto-y col align-x-center", 
        LayoutOrder = v9.layoutOrder
    }, {
        Icon = v1.createElement(v3.Image, {
            LayoutOrder = 1, 
            Image = v8.assetId, 
            imageStyle = v11.Color.Content.Emphasis, 
            ScaleType = Enum.ScaleType.Fit, 
            Size = UDim2.new(0, v13, 0, v12), 
            tag = "position-top-center anchor-top-center"
        }), 
        TextTitle = v1.createElement(v3.Text, {
            LayoutOrder = 2, 
            tag = "auto-y size-full-0 padding-bottom-small text-heading-small content-emphasis", 
            Text = v10.titleText
        }), 
        TextBody = v1.createElement(v3.Text, {
            LayoutOrder = 3, 
            tag = "auto-y size-full-0 text-body-medium", 
            Text = if v6 then v10.emptyStateBodyText else v10.emptyStatePromptText
        })
    });
end;
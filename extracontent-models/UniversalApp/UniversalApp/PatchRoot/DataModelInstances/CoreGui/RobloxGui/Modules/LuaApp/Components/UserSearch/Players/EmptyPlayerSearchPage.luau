local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.UIBlox);
local v2 = require(l_CorePackages_0.Packages.React);
local l_EmptyState_0 = v1.App.Indicator.EmptyState;
local l_Images_0 = v1.App.ImageSet.Images;
local l_Colors_0 = v1.App.Style.Colors;
local l_useStyle_0 = v1.Core.Style.useStyle;
local v7 = require(l_CorePackages_0.Packages.Foundation);
local v8 = require(l_CorePackages_0.Packages.FoundationCloudAssets);
local l_useTokens_0 = v7.Hooks.useTokens;
local l_useDisplayNameText_0 = require(l_CorePackages_0.Workspace.Packages.EditProfile).useDisplayNameText;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_FFlagUserSearchEmptyPageNewIcons_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUserSearchEmptyPageNewIcons;
local v13 = l_Images_0["icons/status/oof_xlarge"];
local v14 = l_Images_0["icons/graphic/findfriends_xlarge"];
local v15 = nil;
local v16 = nil;
if l_FFlagUserSearchEmptyPageNewIcons_0 then
    local l_Assets_0 = v8.Assets;
    local l_preloadAsset_0 = v8.preloadAsset;
    l_preloadAsset_0("pictograms/find_people");
    l_preloadAsset_0("pictograms/collaborators");
    v15 = l_Assets_0["pictograms/find_people"] or {};
    v16 = l_Assets_0["pictograms/collaborators"] or {};
end;
return function(v19) --[[ Line: 49 ]] --[[ Name: EmptyPlayerSearchPage ]]
    -- upvalues: l_useLocalization_0 (copy), l_useDisplayNameText_0 (copy), l_useStyle_0 (copy), l_FFlagUserSearchEmptyPageNewIcons_0 (copy), v15 (ref), v14 (copy), l_Colors_0 (copy), v13 (copy), v16 (ref), l_useTokens_0 (copy), v2 (copy), v7 (copy), l_EmptyState_0 (copy)
    local v20 = l_useLocalization_0({
        keywordTooShortText = "Feature.PlayerSearchResults.Label.KeywordTooShort", 
        noResultsText = "Feature.PlayerSearchResults.Label.NoResultsFound", 
        findFriendsButton = "Feature.Friends.Action.FindFriends", 
        tryAnotherWayText = "Feature.PlayerSearchResults.Label.NoResultsTryAnotherWay"
    });
    local l_searchForFriendsPrompt_0 = l_useDisplayNameText_0().searchForFriendsPrompt;
    local v22 = l_useStyle_0();
    local v23 = nil;
    local v24 = nil;
    local v25 = nil;
    if v19.shouldShowUserSearchLandingPage then
        v23 = l_searchForFriendsPrompt_0;
        v24 = if l_FFlagUserSearchEmptyPageNewIcons_0 then v15 else v14;
        v25 = l_Colors_0.White;
    elseif v19.searchWordLengthNotSupported then
        v23 = v20.keywordTooShortText;
        v24 = v13;
        v24 = if l_FFlagUserSearchEmptyPageNewIcons_0 then v16 else v13;
    else
        v23 = v20.noResultsText;
        v24 = if l_FFlagUserSearchEmptyPageNewIcons_0 then v16 else v13;
    end;
    if l_FFlagUserSearchEmptyPageNewIcons_0 then
        local v26 = l_useTokens_0();
        local v27 = 180 * v26.Config.UI.Scale;
        local v28 = 320 * v26.Config.UI.Scale;
        return v2.createElement(v7.View, {
            tag = "size-full auto-y col align-x-center align-y-center"
        }, {
            Icon = v2.createElement(v7.Image, {
                LayoutOrder = 1, 
                Image = v24.assetId, 
                imageStyle = v26.Color.Content.Emphasis, 
                ScaleType = Enum.ScaleType.Fit, 
                Size = UDim2.new(0, v28, 0, v27), 
                tag = "position-top-center anchor-top-center"
            }), 
            TextBody = v2.createElement(v7.Text, {
                LayoutOrder = 3, 
                tag = "auto-y size-full-0 text-body-medium text-wrap padding-x-xlarge", 
                Text = v23
            })
        });
    else
        return (v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = if v19.backgroundTransparency then v19.backgroundTransparency else v22.Theme.BackgroundDefault.Transparency, 
            BackgroundColor3 = v22.Theme.BackgroundDefault.Color, 
            BorderSizePixel = 0
        }, {
            LandingText = v2.createElement(l_EmptyState_0, {
                text = v23, 
                icon = v24, 
                iconColor = v25, 
                maxSizeTextLabel = Vector2.new(v19.screenSize.X - 64, v19.screenSize.Y)
            })
        }));
    end;
end;
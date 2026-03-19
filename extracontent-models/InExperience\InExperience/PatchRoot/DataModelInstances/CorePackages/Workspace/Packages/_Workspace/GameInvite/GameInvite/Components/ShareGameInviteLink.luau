local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameInvite");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.RoactUtils);
local l_Throttle_0 = require(l_Parent_0.NotificationsCommon).Throttle;
local l_ReducerDependencies_0 = require(l_Parent_0.NotificationsCommon).ReducerDependencies;
local l_default_0 = require(l_Parent_0.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default;
local l_LocalizationHelper_0 = require(l_Parent_0.NotificationsCommon).LocalizationHelper;
local v9 = require(l_script_FirstAncestor_0.analytics.GameInviteAnalyticsManager);
local l_useSelector_0 = v4.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v4.Hooks.RoactRodux.useDispatch;
local l_RoduxNetworking_0 = l_ReducerDependencies_0.RoduxNetworking;
local l_ShareLinksNetworking_0 = l_ReducerDependencies_0.ShareLinksNetworking;
local l_ShareLinksRodux_0 = l_ReducerDependencies_0.ShareLinksRodux;
local l_NetworkStatus_0 = l_RoduxNetworking_0.Enum.NetworkStatus;
local l_getLocalizedStrings_0 = l_LocalizationHelper_0.getLocalizedStrings;
local l_LinkButton_0 = v3.App.Button.LinkButton;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_ImageSetButton_0 = v3.Core.ImageSet.ImageSetButton;
local l_Images_0 = v3.App.ImageSet.Images;
game:DefineFastFlag("generateGameInviteShareLinkOnClick", false);
local v21 = l_Images_0["icons/actions/share"];
local v22 = l_Images_0["icons/menu/link"];
local v23 = {
    copied = "Feature.SocialShare.Label.Copied", 
    copyLink = "Feature.SocialShare.Action.CopyLink"
};
return function(v24) --[[ Line: 46 ]]
    -- upvalues: v2 (copy), l_useSelector_0 (copy), l_useStyle_0 (copy), l_useDispatch_0 (copy), l_getLocalizedStrings_0 (copy), v23 (copy), l_ShareLinksNetworking_0 (copy), l_ShareLinksRodux_0 (copy), v9 (copy), l_default_0 (copy), l_Throttle_0 (copy), l_LinkButton_0 (copy), l_NetworkStatus_0 (copy), l_ImageSetButton_0 (copy), v22 (copy), v21 (copy)
    local v25, v26 = v2.useState(false);
    local v28 = l_useSelector_0(function(v27) --[[ Line: 49 ]]
        return v27;
    end);
    local v29 = l_useStyle_0();
    local v30 = l_useDispatch_0();
    local v31 = l_getLocalizedStrings_0(v23);
    local l_ShareInviteLink_0 = v28.ShareLinks.Invites.ShareInviteLink;
    local function v35() --[[ Line: 61 ]]
        -- upvalues: v30 (copy), l_ShareLinksNetworking_0 (ref), l_ShareLinksRodux_0 (ref), v9 (ref), l_default_0 (ref)
        v30(l_ShareLinksNetworking_0.GenerateLink.API({
            linkType = l_ShareLinksRodux_0.Enums.LinkType.ExperienceInvite.rawValue()
        })):andThen(function(v33) --[[ Line: 64 ]]
            -- upvalues: v9 (ref), l_ShareLinksRodux_0 (ref), l_default_0 (ref)
            local l_linkId_0 = v33.responseBody.linkId;
            v9:linkGenerated({
                linkType = l_ShareLinksRodux_0.Enums.LinkType.ExperienceInvite.rawValue(), 
                linkId = l_linkId_0
            });
            if game:GetFastFlag("generateGameInviteShareLinkOnClick") and v33 and v33.responseBody and v33.responseBody.shortUrl and l_default_0 then
                l_default_0:shareUrl({
                    url = v33.responseBody.shortUrl, 
                    context = "V1Menu"
                });
            end;
        end);
    end;
    v2.useEffect(function() --[[ Line: 86 ]]
        -- upvalues: l_ShareInviteLink_0 (copy), v35 (copy)
        if not game:GetFastFlag("generateGameInviteShareLinkOnClick") and not l_ShareInviteLink_0 then
            v35();
        end;
    end, {});
    local v36 = l_ShareLinksNetworking_0.GenerateLink.getStatus(v28, {
        linkType = l_ShareLinksRodux_0.Enums.LinkType.ExperienceInvite.rawValue()
    });
    local v38 = l_Throttle_0(function() --[[ Line: 100 ]]
        -- upvalues: l_ShareInviteLink_0 (copy), v9 (ref), l_default_0 (ref), v35 (copy), v24 (copy), v26 (copy)
        local v37 = if l_ShareInviteLink_0 then l_ShareInviteLink_0.linkId else nil;
        v9:onShareButtonClick(v37);
        if l_ShareInviteLink_0 then
            if l_default_0 then
                l_default_0:shareUrl({
                    url = l_ShareInviteLink_0.shortUrl, 
                    context = "V1Menu"
                });
            end;
        else
            v35();
        end;
        if v24.isDesktop then
            v26(true);
            task.delay(1, function() --[[ Line: 116 ]]
                -- upvalues: v26 (ref)
                v26(false);
            end);
        end;
    end);
    if v24.isDesktop then
        if v24.isFullSize then
            local l_createElement_0 = v2.createElement;
            local v40 = "Frame";
            local v41 = {
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                Size = v24.size, 
                LayoutOrder = v24.layoutOrder
            };
            local v42 = {};
            local l_createElement_1 = v2.createElement;
            local l_l_LinkButton_0_0 = l_LinkButton_0;
            local v45 = {};
            local v46 = true;
            if v36 ~= l_NetworkStatus_0.Fetching then
                v46 = v25;
            end;
            v45.isDisabled = v46;
            v45.isLoading = false;
            v45.onActivated = v38;
            v45.size = v24.size;
            v45.text = v25 and v31.copied or v31.copyLink;
            v42.LinkButton = l_createElement_1(l_l_LinkButton_0_0, v45);
            return l_createElement_0(v40, v41, v42);
        else
            return v2.createElement(l_ImageSetButton_0, {
                LayoutOrder = v24.layoutOrder, 
                BackgroundTransparency = 1, 
                Size = v24.size, 
                [v2.Event.Activated] = v38, 
                Image = v22, 
                ImageColor3 = v29.Theme.IconEmphasis.Color, 
                ImageTransparency = v29.Theme.IconEmphasis.Transparency, 
                BorderSizePixel = 0
            });
        end;
    else
        return v2.createElement(l_ImageSetButton_0, {
            LayoutOrder = v24.layoutOrder, 
            BackgroundTransparency = 1, 
            Size = v24.size, 
            [v2.Event.Activated] = v38, 
            Image = v21, 
            ImageColor3 = v29.Theme.IconEmphasis.Color, 
            ImageTransparency = v29.Theme.IconEmphasis.Transparency, 
            BorderSizePixel = 0
        });
    end;
end;
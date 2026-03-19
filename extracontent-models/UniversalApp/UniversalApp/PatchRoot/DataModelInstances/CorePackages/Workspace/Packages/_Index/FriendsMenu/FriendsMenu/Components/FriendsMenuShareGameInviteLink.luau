local l_Parent_0 = script:FindFirstAncestor("FriendsMenu").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_IconSize_0 = v2.Enums.IconSize;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_ReducerDependencies_0 = require(l_Parent_0.NotificationsCommon).ReducerDependencies;
local l_ShareLinksNetworking_0 = l_ReducerDependencies_0.ShareLinksNetworking;
local l_ShareLinksRodux_0 = l_ReducerDependencies_0.ShareLinksRodux;
local l_default_0 = require(l_Parent_0.ExternalContentSharingProtocol).ExternalContentSharingProtocol.default;
local l_DeviceInfo_0 = require(l_Parent_0.NotificationsCommon).DeviceInfo;
local l_Throttle_0 = require(l_Parent_0.NotificationsCommon).Throttle;
local l_Popover_0 = v2.Popover;
local l_PopoverAlign_0 = v2.Enums.PopoverAlign;
return function(v14) --[[ Line: 27 ]]
    -- upvalues: l_useDispatch_0 (copy), l_DeviceInfo_0 (copy), v1 (copy), l_ShareLinksNetworking_0 (copy), l_ShareLinksRodux_0 (copy), l_default_0 (copy), l_useLocalization_0 (copy), v2 (copy), l_Throttle_0 (copy), l_Popover_0 (copy), l_IconSize_0 (copy), l_PopoverAlign_0 (copy)
    local v15 = l_useDispatch_0();
    local v16 = l_DeviceInfo_0.isDesktopDevice();
    local v17, v18 = v1.useState(false);
    local function v21() --[[ Line: 31 ]]
        -- upvalues: v16 (copy), v17 (copy), v15 (copy), l_ShareLinksNetworking_0 (ref), l_ShareLinksRodux_0 (ref), l_default_0 (ref)
        if v16 and v17 then
            return;
        else
            v15(l_ShareLinksNetworking_0.GenerateLink.API({
                linkType = l_ShareLinksRodux_0.Enums.LinkType.ExperienceInvite.rawValue()
            })):andThen(function(v19) --[[ Line: 40 ]]
                -- upvalues: l_default_0 (ref)
                if v19 and v19.responseBody and v19.responseBody.shortUrl and l_default_0 then
                    l_default_0:shareUrl({
                        url = v19.responseBody.shortUrl, 
                        context = "V1Menu"
                    });
                end;
            end):catch(function(v20) --[[ Line: 53 ]]
                warn(v20);
            end);
            return;
        end;
    end;
    local v22 = l_useLocalization_0({
        copyLink = not v16 and "Feature.SocialShare.ShareWithPeopleYouKnow" or "Feature.SocialShare.Label.CopyLinkToShareWithPeople", 
        copied = "Feature.SocialShare.Label.Copied"
    });
    return v1.createElement(v2.View, {
        tag = "row size-full-1400 padding-x-xxlarge gap-medium align-y-center", 
        LayoutOrder = v14.layoutOrder, 
        onActivated = l_Throttle_0(function() --[[ Line: 66 ]]
            -- upvalues: v21 (copy), v16 (copy), v18 (copy)
            v21();
            if v16 then
                v18(true);
                task.delay(2, function() --[[ Line: 70 ]]
                    -- upvalues: v18 (ref)
                    v18(false);
                end);
            end;
        end)
    }, {
        PopoverRoot = v1.createElement(l_Popover_0.Root, {
            isOpen = v17
        }, {
            ShareIconContainer = v1.createElement(v2.View, {
                tag = "col radius-circle bg-surface-300 align-x-center align-y-center", 
                Size = UDim2.fromOffset(56, 56)
            }, {
                ShareIcon = v1.createElement(v2.Icon, {
                    name = not v16 and "icons/actions/share" or "icons/menu/link", 
                    size = l_IconSize_0.Medium
                })
            }), 
            PopoverAnchor = v1.createElement(l_Popover_0.Anchor, nil, {
                LabelText = v1.createElement(v2.Text, {
                    tag = "text-title-large size-full align-x-left text-align-x-left", 
                    Text = v22.copyLink
                })
            }), 
            Content = v1.createElement(l_Popover_0.Content, {
                tags = "size-full auto-y", 
                hasArrow = false, 
                align = l_PopoverAlign_0.End
            }, {
                CopiedPopoverText = v1.createElement(v2.Text, {
                    tag = "auto-xy text-title-small text-align-x-center padding-medium", 
                    Text = v22.copied
                })
            })
        })
    });
end;
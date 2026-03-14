local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarSwitcher");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v3.Hooks.useTokens;
local v5 = require(l_Parent_0.FoundationCloudAssets);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_sendAXCounterV2_0 = require(l_Parent_0.AvatarExperienceAnalytics).sendAXCounterV2;
local v8 = require(l_script_FirstAncestor_0.Components.OutfitViewport.OutfitViewport);
local v9 = require(l_script_FirstAncestor_0.Constants);
local v10 = game:DefineFastFlag("AvatarSwitcher3DPreview", false);
local l_FFlagAvatarSwitcherAccurateAvatarWarning_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAvatarSwitcherAccurateAvatarWarning;
local l_FFlagAvatarSwitcherWarningLayoutFix_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAvatarSwitcherWarningLayoutFix;
local l_FFlagAvatarSwitcherCounters_0 = require(l_Parent_0.AvatarExperienceFlags).FFlagAvatarSwitcherCounters;
local v14 = {
    AVATAR = v5.Assets["pictograms/avatar"], 
    AVATAR_ISSUE = v5.Assets["pictograms/avatar_issue"]
};
return function(v15) --[[ Line: 45 ]] --[[ Name: AvatarPreview ]]
    -- upvalues: v2 (copy), l_useLocalization_0 (copy), l_useTokens_0 (copy), v3 (copy), v14 (copy), v10 (copy), v8 (copy), l_FFlagAvatarSwitcherCounters_0 (copy), l_sendAXCounterV2_0 (copy), v9 (copy), l_FFlagAvatarSwitcherAccurateAvatarWarning_0 (copy), l_FFlagAvatarSwitcherWarningLayoutFix_0 (copy)
    local v16, v17 = v2.useState(false);
    v2.useEffect(function() --[[ Line: 47 ]]
        -- upvalues: v17 (copy)
        v17(false);
    end, {
        v15.outfitId
    });
    local v18 = l_useLocalization_0({
        selectAvatar = "Feature.AvatarSwitcher.Message.SelectAvatar", 
        unkownSupportHeader = "Feature.AvatarSwitcher.Heading.UnknownSupport", 
        unkownSupportContent = "Feature.AvatarSwitcher.Message.UnknownSupport", 
        partiallyUnsupported = "Feature.AvatarSwitcher.Message.PartiallyUnsupported"
    });
    local v19 = l_useTokens_0();
    if v15.outfitId == nil then
        return (v2.createElement(v3.View, {
            tag = "size-full col align-x-center align-y-center", 
            padding = {
                bottom = UDim.new(0, v15.messageBottomPadding or v19.Padding.Medium)
            }
        }, {
            Image = v2.createElement(v3.Image, {
                Image = v14.AVATAR.assetId, 
                Size = UDim2.fromOffset(v14.AVATAR.size.X / 3, v14.AVATAR.size.Y / 3), 
                LayoutOrder = 1
            }), 
            Text = v2.createElement(v3.Text, {
                tag = "auto-xy text-title-medium", 
                Text = v18.selectAvatar, 
                LayoutOrder = 2
            })
        }));
    elseif v15.showAvatarSupportWarning then
        return (v2.createElement(v3.View, {
            tag = "size-full", 
            padding = {
                bottom = UDim.new(0, v15.messageBottomPadding or v19.Padding.Medium)
            }
        }, {
            ScrollView = v2.createElement(v3.ScrollView, {
                tag = "size-full", 
                scroll = {
                    CanvasSize = UDim2.fromScale(0, 1), 
                    AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                    scrollBarVisibility = v3.Enums.ScrollBarVisibility.None
                }
            }, {
                ScrollingContent = v2.createElement(v3.View, {
                    tag = "size-full col align-x-center align-y-center"
                }, {
                    Image = v2.createElement(v3.Image, {
                        Image = v14.AVATAR_ISSUE.assetId, 
                        Size = UDim2.fromOffset(v14.AVATAR_ISSUE.size.X / 3, v14.AVATAR_ISSUE.size.Y / 3), 
                        LayoutOrder = 1
                    }), 
                    Header = v2.createElement(v3.Text, {
                        tag = "auto-y size-full-0 text-title-medium text-wrap padding-bottom-small", 
                        Text = v18.unkownSupportHeader, 
                        LayoutOrder = 2
                    }), 
                    Content = v2.createElement(v3.Text, {
                        tag = "auto-y size-full-0 text-body-small text-wrap", 
                        Text = v18.unkownSupportContent, 
                        LayoutOrder = 3
                    })
                })
            })
        }));
    elseif v10 and not v16 then
        return v2.createElement(v3.View, {
            tag = "size-full col"
        }, {
            OutfitViewportContainer = v2.createElement(v3.View, {
                tag = "size-full-0 grow", 
                LayoutOrder = 1
            }, {
                OutfitViewport = v2.createElement(v8, {
                    outfitId = v15.outfitId, 
                    rigType = v15.rigType, 
                    onLoadingFailed = function() --[[ Line: 130 ]] --[[ Name: onLoadingFailed ]]
                        -- upvalues: l_FFlagAvatarSwitcherCounters_0 (ref), l_sendAXCounterV2_0 (ref), v9 (ref), v17 (copy)
                        if l_FFlagAvatarSwitcherCounters_0 then
                            l_sendAXCounterV2_0(v9.Counters.AvatarPreviewLoadFailed);
                        end;
                        v17(true);
                    end, 
                    onLoaded = if l_FFlagAvatarSwitcherAccurateAvatarWarning_0 then v15.onAvatarPreviewLoaded else nil
                })
            }), 
            CompatibilityWarningContainer = not l_FFlagAvatarSwitcherWarningLayoutFix_0 and v15.showAvatarTypeCompatibilityWarning and v2.createElement(v3.View, {
                tag = "size-full-0 auto-y padding-y-medium", 
                LayoutOrder = 2
            }, {
                InfoIcon = v2.createElement(v3.Image, {
                    Image = "icons/actions/info", 
                    Size = UDim2.fromOffset(v19.Size.Size_500, v19.Size.Size_500), 
                    LayoutOrder = 1
                }), 
                CompatibilityWarning = v2.createElement(v3.Text, {
                    tag = "auto-y position-top-right anchor-top-right text-caption-small text-wrap text-align-x-left padding-top-xsmall", 
                    Size = UDim2.new(1, -v19.Size.Size_500 - v19.Gap.Small, 0, 0), 
                    Text = v18.partiallyUnsupported, 
                    LayoutOrder = 2
                })
            })
        });
    else
        return (v2.createElement(v3.Image, {
            tag = "size-full", 
            Image = ("rbxthumb://type=Outfit&id=%*&w=420&h=420"):format(v15.outfitId), 
            ScaleType = v15.imageScaleType
        }, {}));
    end;
end;
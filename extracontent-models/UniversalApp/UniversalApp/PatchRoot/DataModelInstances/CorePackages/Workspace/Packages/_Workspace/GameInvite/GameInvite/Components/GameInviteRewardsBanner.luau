local l_script_FirstAncestor_0 = script:FindFirstAncestor("GameInvite");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local v5 = require(l_Parent_0.Foundation);
local l_IconButton_0 = v5.IconButton;
local l_IconSize_0 = v5.Enums.IconSize;
local v8 = require(l_script_FirstAncestor_0.Components.GameInviteRewardsInfoModal);
local l_GroupService_0 = game:GetService("GroupService");
local l_Players_0 = game:GetService("Players");
local function v18(v11) --[[ Line: 29 ]]
    -- upvalues: l_GroupService_0 (copy), l_Players_0 (copy)
    local v12 = "";
    if v11 == nil or v11 == 0 then
        return "";
    else
        if game.CreatorType == Enum.CreatorType.Group then
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 35 ]]
                -- upvalues: l_GroupService_0 (ref), v11 (copy)
                return l_GroupService_0:GetGroupInfoAsync(v11);
            end);
            if not l_status_0 then
                v12 = "";
            end;
            if l_result_0 then
                return l_result_0.Name;
            end;
        elseif game.CreatorType == Enum.CreatorType.User then
            local v15 = nil;
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 46 ]]
                -- upvalues: l_Players_0 (ref), v11 (copy)
                return l_Players_0:GetNameFromUserIdAsync(v11);
            end);
            v15 = l_status_1;
            v12 = l_result_1;
            if not v15 then
                v12 = "";
            end;
        end;
        return v12;
    end;
end;
return function(v19) --[[ Line: 56 ]]
    -- upvalues: l_useLocalization_0 (copy), l_MarketplaceService_0 (copy), v18 (copy), v2 (copy), v8 (copy), v5 (copy), l_IconButton_0 (copy), l_IconSize_0 (copy)
    local v20 = l_useLocalization_0({
        rewardsModalTitle = "Roblox.ReferralRewards.RewardBannerModalTitle", 
        rewardsHeader = {
            "Roblox.ReferralRewards.RewardBannerHeader"; 
            rewardName = v19.rewardMetadata and v19.rewardMetadata.name or ""
        }, 
        rewardsBody = {
            "Roblox.ReferralRewards.RewardBannerBody"; 
            gameName = if game.PlaceId ~= nil and game.PlaceId ~= 0 then if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then l_MarketplaceService_0:GetProductInfoAsync(game.PlaceId).Name else l_MarketplaceService_0:GetProductInfo(game.PlaceId).Name else "", 
            rewardName = v19.rewardMetadata and v19.rewardMetadata.name or ""
        }, 
        rewardsDetailsTitle = "Roblox.ReferralRewards.RewardBannerModalRewardDetails", 
        rewardsLimitsTitle = "Roblox.ReferralRewards.AdditionalCreatorTerms", 
        rewardsCreatorSupportText = {
            "Roblox.ReferralRewards.RewardBannerModalCreatorSupport"; 
            creatorName = game.CreatorId ~= nil and game.CreatorId ~= 0 and v18(game.CreatorId) or ""
        }, 
        rewardsExpiresText = "Roblox.ReferralRewards.Expires", 
        rewardsTerms = "Roblox.ReferralRewards.ReferralProgramTerms"
    });
    local v21, v22 = v2.useState(false);
    return v2.createElement(v2.Fragment, nil, {
        RewardInfoModal = v21 and v19.rewardMetadata and v20 and v2.createElement(v8, {
            title = v20.rewardsModalTitle, 
            rewardDetailsTitle = v20.rewardsDetailsTitle, 
            rewardDetailsBody = v19.rewardMetadata.description or "", 
            rewardLimitsTitle = v20.rewardsLimitsTitle, 
            rewardLimitsBody = v19.rewardMetadata.limits or "", 
            rewardCreatorSupportText = v20.rewardsCreatorSupportText, 
            rewardsExpiresText = v20.rewardsExpiresText, 
            rewardsTerms = v20.rewardsTerms, 
            expiryUtc = v19.rewardMetadata.rewardTimeOffset.endUtc or "", 
            modalOpen = v21, 
            setModalOpen = v22
        }) or nil, 
        RewardBannerContainer = v2.createElement(v5.View, {
            tag = "row padding-x-xxlarge size-full-0 auto-y items-center", 
            layoutOrder = v19.layoutOrder
        }, {
            RewardBannerCard = v2.createElement(v5.View, {
                tag = "row size-full-0 auto-y wrap bg-surface-300 gap-medium padding-medium radius-medium align-y-top"
            }, {
                RewardIcon = v19.rewardMetadata and v19.rewardMetadata.iconAssetId ~= nil and v19.rewardMetadata.iconAssetId ~= "" and v2.createElement(v5.Image, {
                    Image = "rbxassetid://" .. v19.rewardMetadata.iconAssetId, 
                    tag = "col shrink size-1200-1200 radius-medium self-end", 
                    LayoutOrder = 0
                }) or nil, 
                RewardTextContainer = v2.createElement(v5.View, {
                    tag = "col fill auto-xy items-start", 
                    LayoutOrder = 1
                }, {
                    Text = v2.createElement(v5.Text, {
                        tag = "auto-xy text-title-medium text-wrap text-align-x-left", 
                        Text = v20.rewardsHeader, 
                        LayoutOrder = 0
                    }), 
                    Subtext = v2.createElement(v5.Text, {
                        tag = "auto-xy text-body-small text-wrap text-align-x-left", 
                        Text = v20.rewardsBody, 
                        LayoutOrder = 1
                    })
                }), 
                RewardInfoButtonView = v2.createElement(v5.View, {
                    tag = "col auto-xy items-end", 
                    LayoutOrder = 2
                }, {
                    RewardInfoButton = v2.createElement(l_IconButton_0, {
                        testId = "RewardInfoButton", 
                        icon = "icons/actions/info_small", 
                        size = l_IconSize_0.Small, 
                        onActivated = function() --[[ Line: 142 ]] --[[ Name: onActivated ]]
                            -- upvalues: v22 (copy)
                            v22(true);
                        end
                    })
                })
            })
        })
    });
end;
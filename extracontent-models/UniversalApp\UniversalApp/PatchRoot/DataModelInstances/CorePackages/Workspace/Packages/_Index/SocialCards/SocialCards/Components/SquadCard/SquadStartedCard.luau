local l_Parent_0 = script:FindFirstAncestor("SocialCards").Parent;
local v1 = require(l_Parent_0.Foundation);
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = require(l_Parent_0.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb;
local l_ImagePile_0 = require(l_Parent_0.AppBlox).ImagePile;
local v4 = require(l_Parent_0.React);
local v5 = require(l_Parent_0.Squads);
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_FFlagEnableAppChatFocusableFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableAppChatFocusableFixes;
local l_useTokens_0 = v1.Hooks.useTokens;
local l_SquadJoinButton_0 = v5.SquadJoinButton;
local l_SquadComponentAccessWrapper_0 = v5.SquadComponentAccessWrapper;
local l_SquadButtonSourceEnum_0 = v5.Enums.SquadButtonSourceEnum;
return function(v13) --[[ Line: 26 ]] --[[ Name: SquadStartedCard ]]
    -- upvalues: l_useNavigation_0 (copy), l_useTokens_0 (copy), l_useLocalization_0 (copy), v4 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_ImagePile_0 (copy), v1 (copy), l_FFlagEnableAppChatFocusableFixes_0 (copy), l_SquadComponentAccessWrapper_0 (copy), l_SquadJoinButton_0 (copy), l_SquadButtonSourceEnum_0 (copy)
    local v14 = l_useNavigation_0();
    local v15 = l_useTokens_0();
    local v16 = l_useLocalization_0({
        manyPeopleActive = {
            "Feature.Squads.Description.ManyPeopleActive"; 
            userCount = #v13.participantUserIds
        }, 
        onePersonActive = "Feature.Squads.Description.OnePersonActive", 
        partyStarted = "Feature.Squads.Label.PartyStartedText"
    });
    local v21 = v4.useCallback(function(v17) --[[ Line: 35 ]]
        -- upvalues: l_getStandardSizeAvatarHeadShotRbxthumb_0 (ref), v15 (copy), v4 (ref), l_ImagePile_0 (ref)
        local v18 = {};
        for _, v20 in ipairs(v17) do
            table.insert(v18, {
                Image = l_getStandardSizeAvatarHeadShotRbxthumb_0((tostring(v20))), 
                BackgroundColor3 = v15.Color.Surface.Surface_200.Color3:lerp(v15.Color.ActionStandard.Background.Color3, 1 - v15.Color.ActionStandard.Background.Transparency)
            });
        end;
        return v4.createElement(l_ImagePile_0, {
            images = v18, 
            imageBorderColor = if v15.Config.Theme.IsUIBlox == "true" then v15.Color.Shift.Shift_200.Color3 else v15.Color.Surface.Surface_200.Color3
        });
    end, {});
    return v4.createElement(v1.View, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        layout = {
            FillDirection = Enum.FillDirection.Vertical, 
            Padding = UDim.new(0, v15.Gap.Small), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }, 
        padding = {
            bottom = UDim.new(0, v15.Padding.Medium), 
            left = UDim.new(0, v15.Padding.Large), 
            right = UDim.new(0, v15.Padding.Large), 
            top = UDim.new(0, v15.Padding.Medium)
        }, 
        selection = if l_FFlagEnableAppChatFocusableFixes_0 then {
            Selectable = true
        } else nil, 
        tag = "bg-shift-200 radius-large"
    }, {
        InfoContainer = v4.createElement(v1.View, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            layout = {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, v15.Gap.Large), 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }, 
            LayoutOrder = 1
        }, {
            Thumbnail = if #v13.participantUserIds > 0 then v4.createElement(v1.View, {
                Size = UDim2.fromOffset(v15.Size.Size_1000, v15.Size.Size_1000), 
                LayoutOrder = 1
            }, {
                v21(v13.participantUserIds)
            }) else nil, 
            TextContainer = v4.createElement(v1.View, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = if #v13.participantUserIds > 0 then UDim2.new(1, -v15.Size.Size_1000 - v15.Padding.Large, 0, 0) else UDim2.fromScale(1, 0), 
                layout = {
                    FillDirection = Enum.FillDirection.Vertical, 
                    Padding = UDim.new(0, v15.Gap.XSmall), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }, 
                LayoutOrder = 2
            }, {
                Title = v4.createElement(v1.Text, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    backgroundStyle = v15.Color.None, 
                    fontStyle = v15.Typography.TitleMedium, 
                    LayoutOrder = 1, 
                    Text = v16.partyStarted, 
                    textStyle = v15.Color.Content.Emphasis, 
                    TextTruncate = Enum.TextTruncate.AtEnd
                }), 
                Status = v4.createElement(v1.Text, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    backgroundStyle = v15.Color.None, 
                    fontStyle = v15.Typography.LabelSmall, 
                    LayoutOrder = 2, 
                    Text = if #v13.participantUserIds == 1 then v16.onePersonActive else v16.manyPeopleActive, 
                    textStyle = v15.Color.Content.Muted, 
                    TextTruncate = Enum.TextTruncate.AtEnd
                })
            })
        }), 
        ActionButton = v4.createElement(l_SquadComponentAccessWrapper_0, {
            parentChannelId = v13.conversationId
        }, {
            v4.createElement(l_SquadJoinButton_0, {
                conversationId = v13.conversationId, 
                isFullWidth = true, 
                isInCard = true, 
                layoutOrder = 3, 
                onActivated = function() --[[ Line: 138 ]] --[[ Name: onActivated ]]
                    -- upvalues: v14 (copy), v13 (copy)
                    v14.navigate("SquadLobby", {
                        conversationId = v13.conversationId
                    });
                end, 
                shouldAnimate = false, 
                squadButtonSource = l_SquadButtonSourceEnum_0.PartyStartedCard, 
                squadLocation = v13.squadLocation
            })
        })
    });
end;
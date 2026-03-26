local l_Parent_0 = script:FindFirstAncestor("GameJoinCard").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v2.Hooks.useTokens;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_View_0 = v2.View;
local l_Text_0 = v2.Text;
local l_Image_0 = v2.Image;
local l_Button_0 = v2.Button;
local l_Skeleton_0 = v2.Skeleton;
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_InputSize_0 = v2.Enums.InputSize;
local l_Radius_0 = v2.Enums.Radius;
return function(v13) --[[ Line: 29 ]] --[[ Name: DesktopGameJoinCard ]]
    -- upvalues: l_useTokens_0 (copy), l_useLocalization_0 (copy), v1 (copy), l_View_0 (copy), l_Image_0 (copy), l_Skeleton_0 (copy), l_Radius_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy)
    local v14 = l_useTokens_0();
    local v15 = l_useLocalization_0({
        isPlaying = "Feature.Friends.Text.IsPlaying", 
        joinButton = "Feature.Profile.Action.JoinGame"
    });
    local l_layoutOrder_0 = v13.layoutOrder;
    local l_playerName_0 = v13.playerName;
    local l_experienceName_0 = v13.experienceName;
    local l_gameIconUrl_0 = v13.gameIconUrl;
    local l_isLoading_0 = v13.isLoading;
    return v1.createElement(l_View_0, {
        Size = UDim2.fromOffset(260, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = l_layoutOrder_0, 
        backgroundStyle = v14.Color.OverMedia.OverMedia_300, 
        tag = "col gap-medium padding-large radius-medium stroke-thin stroke-muted"
    }, {
        GameInfoRow = v1.createElement(l_View_0, {
            tag = "row gap-small items-center size-full-0 auto-y align-x-left"
        }, {
            GameIcon = if not l_isLoading_0 then v1.createElement(l_View_0, {
                Size = UDim2.fromOffset(v14.Size.Size_1000, v14.Size.Size_1000), 
                LayoutOrder = 1, 
                tag = "radius-small shrink", 
                ClipsDescendants = true
            }, {
                Thumbnail = v1.createElement(l_Image_0, {
                    Image = l_gameIconUrl_0, 
                    Size = UDim2.fromScale(1, 1), 
                    ScaleType = Enum.ScaleType.Crop
                })
            }) else v1.createElement(l_Skeleton_0, {
                LayoutOrder = 1, 
                Size = UDim2.fromOffset(v14.Size.Size_1000, v14.Size.Size_1000), 
                radius = l_Radius_0.Small
            }), 
            GameInfo = v1.createElement(l_View_0, {
                tag = "col gap-xxsmall fill shrink align-x-left items-start", 
                LayoutOrder = 2, 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                GameTitle = if not l_isLoading_0 then v1.createElement(l_View_0, {
                    tag = "row auto-y gap-xxsmall size-full-0 align-y-center text-body-medium content-default text-align-x-left", 
                    LayoutOrder = 1
                }, {
                    PlayerName = v1.createElement(l_Text_0, {
                        Text = l_playerName_0, 
                        tag = "shrink auto-xy text-body-medium content-default text-no-wrap text-truncate-end text-align-x-left", 
                        LayoutOrder = 1
                    }), 
                    IsPlaying = v1.createElement(l_Text_0, {
                        Text = v15.isPlaying, 
                        tag = "auto-xy text-body-medium content-default text-align-x-left", 
                        LayoutOrder = 2
                    })
                }) else v1.createElement(l_Skeleton_0, {
                    Size = UDim2.new(0.7, 0, 0, v14.Typography.BodyMedium.FontSize), 
                    radius = l_Radius_0.Small, 
                    LayoutOrder = 1
                }), 
                GameName = if not l_isLoading_0 then v1.createElement(l_Text_0, {
                    Text = l_experienceName_0, 
                    tag = "size-full-0 auto-y text-title-medium content-emphasis text-no-wrap text-truncate-end text-align-x-left", 
                    LayoutOrder = 2
                }) else v1.createElement(l_Skeleton_0, {
                    Size = UDim2.new(0.5, 0, 0, v14.Typography.TitleMedium.FontSize), 
                    radius = l_Radius_0.Small, 
                    LayoutOrder = 2
                })
            })
        }), 
        JoinButton = v1.createElement(l_Button_0, {
            text = v15.joinButton, 
            onActivated = function() --[[ Line: 110 ]] --[[ Name: onActivated ]]

            end, 
            isLoading = l_isLoading_0, 
            variant = l_ButtonVariant_0.Emphasis, 
            inputSize = l_InputSize_0.Medium, 
            tag = "size-full-0 fill align-x-center", 
            width = UDim.new(1, 0), 
            LayoutOrder = 2
        })
    });
end;
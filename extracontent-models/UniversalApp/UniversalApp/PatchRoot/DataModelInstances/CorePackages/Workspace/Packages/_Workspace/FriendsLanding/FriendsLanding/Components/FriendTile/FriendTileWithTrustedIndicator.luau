local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_React_0 = v2.React;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_llama_0 = require(l_Parent_0.LuaSocialLibrariesDeps).llama;
local v6 = require(l_Parent_0.VerifiedBadges);
local l_UIBlox_0 = v2.UIBlox;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_PlayerTile_0 = l_UIBlox_0.App.Tile.PlayerTile;
local l_OpenTypeSupport_0 = l_UIBlox_0.Utility.OpenTypeSupport;
local l_PlayerContext_0 = l_UIBlox_0.App.Indicator.PlayerContext;
local _ = v2.RoduxPresence.Enums.PresenceType;
local v13 = require(l_Parent_0.Foundation);
local l_useTokens_0 = v13.Hooks.useTokens;
local l_View_0 = v13.View;
local l_Text_0 = v13.Text;
local l_Skeleton_0 = v13.Skeleton;
local l_StateLayerAffordance_0 = v13.Enums.StateLayerAffordance;
local l_GetFFlagLuaAppEnableOpenTypeSupport_0 = require(l_Parent_0.SharedFlags).GetFFlagLuaAppEnableOpenTypeSupport;
local v20 = {
    userPresence = nil, 
    index = 1, 
    openPlayerProfile = nil, 
    buttons = nil, 
    trustedConnection = false, 
    isVerified = false
};
return function(v21) --[[ Line: 86 ]] --[[ Name: FriendTileWithTrustedIndicator ]]
    -- upvalues: l_llama_0 (copy), v20 (copy), l_useStyle_0 (copy), l_useTokens_0 (copy), l_useLocalization_0 (copy), l_React_0 (copy), l_View_0 (copy), l_StateLayerAffordance_0 (copy), l_PlayerTile_0 (copy), l_GetFFlagLuaAppEnableOpenTypeSupport_0 (copy), l_OpenTypeSupport_0 (copy), l_Skeleton_0 (copy), l_Text_0 (copy), v6 (copy), l_PlayerContext_0 (copy)
    v21 = l_llama_0.Dictionary.join(v20, v21 or {});
    local v22 = l_useStyle_0();
    local v23 = l_useTokens_0();
    local v24 = l_useLocalization_0({
        trustedText = "Feature.Friends.TrustedConnection.Label.Trusted"
    });
    local v25 = nil;
    local v26 = nil;
    local v27 = nil;
    local l_TextDefault_0 = v22.Theme.TextDefault;
    if v21.relevancyInfo then
        v26 = v21.relevancyInfo.iconColor;
        v25 = v21.relevancyInfo.icon;
        v27 = v21.relevancyInfo.iconTransparency;
    end;
    return l_React_0.createElement(l_View_0, {
        tag = "col auto-xy size-0-0 gap-small", 
        onActivated = v21.openPlayerProfile, 
        stateLayer = {
            affordance = l_StateLayerAffordance_0.None
        }
    }, {
        PlayerTile = l_React_0.createElement(l_View_0, {
            tag = "size-full-full aspect-1-1 bg-surface-100 clip", 
            LayoutOrder = 1
        }, {
            l_React_0.createElement(l_PlayerTile_0, {
                tileSize = UDim2.fromScale(1, 1), 
                thumbnail = v21.user.thumbnail, 
                title = "", 
                subtitle = "", 
                onActivated = v21.openPlayerProfile, 
                forwardedRef = v21.playerTileRef, 
                buttons = v21.buttons, 
                Selectable = true, 
                openTypeFeatures = if l_GetFFlagLuaAppEnableOpenTypeSupport_0() then l_OpenTypeSupport_0:getUserNameStylisticAlternative() else nil
            })
        }), 
        TextColumn = l_React_0.createElement(l_View_0, {
            tag = "col size-full-0 auto-y gap-xxsmall", 
            LayoutOrder = 2
        }, {
            Title = l_React_0.createElement(l_View_0, {
                tag = "auto-y size-full-0"
            }, {
                LoadingSkeleton = if not v21.title then l_React_0.createElement(l_Skeleton_0, {
                    Size = UDim2.new(1, 0, 0, v23.Semantic.Typography.Subheader.FontSize)
                }) else nil, 
                Title = v21.title and l_React_0.createElement(l_View_0, {
                    tag = "row auto-y size-full-0 align-y-center ", 
                    LayoutOrder = 1
                }, {
                    TitleText = l_React_0.createElement(l_Text_0, {
                        tag = "text-truncate-end text-align-x-left auto-xy shrink content-default", 
                        fontStyle = v23.Semantic.Typography.Subheader, 
                        Text = v21.title, 
                        LayoutOrder = 1, 
                        RichText = true
                    }), 
                    VerifiedBadge = v21.isVerified and l_React_0.createElement(l_Text_0, {
                        tag = "auto-xy content-default", 
                        fontStyle = v23.Semantic.Typography.Subheader, 
                        Text = v6.emoji.verified, 
                        LayoutOrder = 2, 
                        RichText = true
                    })
                })
            }), 
            Subtitle = l_React_0.createElement(l_View_0, {
                tag = "row auto-y size-full-0", 
                LayoutOrder = 2
            }, {
                LoadingSkeleton = if not v21.subtitle or v21.subtitle == "@" then l_React_0.createElement(l_Skeleton_0, {
                    Size = UDim2.new(0.4, 0, 0, v23.Semantic.Typography.CaptionBody.FontSize)
                }) else nil, 
                SubtitleText = v21.subtitle and v21.subtitle ~= "@" and l_React_0.createElement(l_Text_0, {
                    tag = "text-truncate-end auto-xy text-align-x-left shrink content-default", 
                    fontStyle = v23.Semantic.Typography.CaptionBody, 
                    Text = v21.subtitle, 
                    LayoutOrder = 1, 
                    RichText = true
                }), 
                TCTextLabel = v21.isTrustedConnection and v21.subtitle and v21.subtitle ~= "@" and l_React_0.createElement(l_Text_0, {
                    tag = "content-default auto-xy text-align-x-left", 
                    LayoutOrder = 2, 
                    fontStyle = v23.Semantic.Typography.CaptionBody, 
                    Text = " \226\128\162 " .. v24.trustedText
                })
            }), 
            RelevancyContainer = l_React_0.createElement(l_View_0, {
                tag = "size-full-0 row auto-y gap-xsmall align-x-left align-y-center", 
                LayoutOrder = 3
            }, {
                ContextualPresence = v21.relevancyInfo and v21.relevancyInfo.text and l_React_0.createElement(l_PlayerContext_0, {
                    fontStyle = v22.Font.CaptionBody, 
                    icon = v25, 
                    iconColor = v26, 
                    iconSize = UDim2.fromOffset(12, 12), 
                    iconTransparency = v27, 
                    layoutOrder = 2, 
                    text = if v21.relevancyInfo then v21.relevancyInfo.text else nil, 
                    textColorStyle = l_TextDefault_0, 
                    onActivated = v21.openPlayerProfile
                })
            })
        })
    });
end;
local l_Parent_0 = script:FindFirstAncestor("LandingPage").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_Enums_0 = v2.Enums;
local v4 = require(l_Parent_0.UserLib);
local l_getRbxthumbWithTypeSizeAndOptions_0 = v4.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_Constants_0 = v4.Utils.Constants;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local _ = require(script.Parent.AccountCarouselAvatar);
local l_GetFFlagEnableManageAccountsRedesign_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableManageAccountsRedesign;
return function(v10) --[[ Line: 20 ]]
    -- upvalues: l_useLocalization_0 (copy), l_GetFFlagEnableManageAccountsRedesign_0 (copy), v1 (copy), v2 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_Constants_0 (copy), l_Enums_0 (copy)
    local v11 = l_useLocalization_0({
        signedOut = "Authentication.AccountPicker.Label.SignedOut"
    });
    local v12 = l_GetFFlagEnableManageAccountsRedesign_0() and v10.enableSignedOutAccounts;
    local v13 = {};
    if #v10.accounts == 0 then
        v10.onClose();
    end;
    for v14, v15 in ipairs(v10.accounts) do
        local l_username_0 = v15.username;
        if l_username_0 == nil then
            l_username_0 = "";
        end;
        v13[v14] = v1.createElement(v2.View, {
            tag = {
                ["size-full-0 auto-y items-center padding-bottom-small"] = true, 
                col = v12, 
                ["row padding-x-small"] = not v12
            }, 
            LayoutOrder = v14
        }, {
            AccountCard = v1.createElement(v2.View, {
                tag = {
                    ["row size-full-0 auto-y wrap gap-medium radius-medium align-y-center"] = true, 
                    ["padding-small"] = v12, 
                    ["padding-medium"] = not v12
                }, 
                BackgroundTransparency = 1
            }, {
                Avatar = v1.createElement(v2.View, {
                    tag = "col shrink size-1200-1200 radius-full self-center", 
                    LayoutOrder = 0
                }, {
                    AvatarContainer = v1.createElement(v2.View, {
                        Size = UDim2.new(0, 48, 0, 48), 
                        tag = "radius-circle bg-surface-200"
                    }, {
                        AvatarImage = v1.createElement(v2.Image, {
                            Size = UDim2.new(1, 0, 1, 0), 
                            Image = l_getRbxthumbWithTypeSizeAndOptions_0(tostring(v15.user_id), l_Constants_0.RbxthumbTypes.AvatarHeadShot, 150), 
                            tag = "radius-circle"
                        })
                    })
                }), 
                AccountInfo = v1.createElement(v2.View, {
                    tag = "col fill auto-y items-start", 
                    LayoutOrder = 1
                }, {
                    DisplayName = v1.createElement(v2.Text, {
                        Text = v15.display_name or l_username_0, 
                        tag = "auto-y size-full-0 text-title-large text-align-x-left", 
                        LayoutOrder = 0, 
                        TextTruncate = Enum.TextTruncate.SplitWord
                    }), 
                    Username = v1.createElement(v2.Text, {
                        Text = "@" .. l_username_0, 
                        tag = "auto-y size-full-0 text-body-small text-align-x-left", 
                        LayoutOrder = 1, 
                        TextTruncate = Enum.TextTruncate.SplitWord
                    })
                }), 
                SignedOutPill = if not v12 or v15.has_valid_session then nil else v1.createElement(v2.View, {
                    tag = "col auto-xy padding-x-small padding-y-xsmall radius-small bg-action-alert", 
                    LayoutOrder = 2
                }, {
                    PillText = v1.createElement(v2.Text, {
                        Text = v11.signedOut, 
                        tag = "auto-xy text-caption-large text-align-x-center text-title-medium"
                    })
                }), 
                DeleteButton = v1.createElement(v2.View, {
                    tag = "col auto-xy size-full-0 items-end", 
                    onActivated = function() --[[ Line: 102 ]] --[[ Name: onActivated ]]
                        -- upvalues: v10 (copy), v15 (copy)
                        v10.setRemoveAccount(v15);
                    end, 
                    LayoutOrder = 3
                }, {
                    DeleteIcon = v1.createElement(v2.Icon, {
                        name = l_Enums_0.IconName.TrashCan, 
                        size = l_Enums_0.IconSize.Large, 
                        tag = "content-muted"
                    })
                })
            })
        });
    end;
    if v12 then
        return v1.createElement(v1.Fragment, nil, v13);
    else
        return v1.createElement(v2.View, {
            tag = "col auto-xy size-full-0 auto-y padding-small"
        }, {
            ScrollView = v1.createElement(v2.ScrollView, {
                scroll = {
                    AutomaticCanvasSize = Enum.AutomaticSize.XY, 
                    CanvasSize = UDim2.fromOffset(0, 0), 
                    ScrollingDirection = Enum.ScrollingDirection.Y, 
                    scrollBarVisibility = v2.Enums.ScrollBarVisibility.None
                }, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                AccountElements = v1.createElement(v2.View, {
                    tag = "col auto-x size-full-0", 
                    LayoutOrder = 2
                }, v13)
            })
        });
    end;
end;
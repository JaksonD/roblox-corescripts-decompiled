local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.Foundation);
local l_Image_0 = v2.Image;
local l_View_0 = v2.View;
local l_Text_0 = v2.Text;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = require(l_CorePackages_0.Workspace.Packages.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb;
return v1.memo(function(v8) --[[ Line: 22 ]] --[[ Name: ThirdPartyLinkedUserInfoWidget ]]
    -- upvalues: l_useTokens_0 (copy), v1 (copy), l_View_0 (copy), l_Image_0 (copy), l_getStandardSizeAvatarHeadShotRbxthumb_0 (copy), l_Text_0 (copy)
    local v9 = l_useTokens_0();
    return v1.createElement(l_View_0, {
        LayoutOrder = v8.layoutOrder, 
        tag = "size-full-0 gap-small auto-y align-x-left align-y-center row"
    }, {
        UserIcon = v1.createElement(l_Image_0, {
            Image = l_getStandardSizeAvatarHeadShotRbxthumb_0(v8.userId), 
            Size = UDim2.fromOffset(v9.Semantic.Icon.Size.Medium, v9.Semantic.Icon.Size.Medium), 
            tag = "radius-circle", 
            LayoutOrder = 0, 
            backgroundStyle = v9.Semantic.Color.Common.Placeholder
        }), 
        UserInfoView = v1.createElement(l_View_0, {
            LayoutOrder = 1, 
            tag = "size-full-0 gap-xsmall auto-y align-x-left align-y-center col"
        }, {
            UserNameAndBadge = v1.createElement(l_View_0, {
                tag = "size-full-0 gap-xsmall auto-y align-x-left align-y-center row"
            }, {
                UserNameText = v1.createElement(l_Text_0, {
                    tag = "auto-xy text-title-large text-align-y-center text-align-x-left", 
                    Text = v8.userName, 
                    LayoutOrder = 0
                }), 
                BadgeText = v1.createElement(l_Text_0, {
                    tag = "auto-xy text-align-y-center text-align-x-left", 
                    Text = v8.userBadgeEmoji, 
                    textStyle = v9.Semantic.Color.Icon.Emphasis, 
                    fontStyle = v9.Typography.TitleLarge, 
                    LayoutOrder = 1
                })
            }), 
            ThirdPartyUserInfo = if v8.thirdPartyUserName and v8.thirdPartyPlatformIcon then v1.createElement(l_View_0, {
                tag = "size-full-0 gap-xsmall auto-y align-x-left align-y-center row"
            }, {
                PlatformIcon = v1.createElement(l_Image_0, {
                    Image = v8.thirdPartyPlatformIcon, 
                    Size = UDim2.fromOffset(v9.Semantic.Icon.Size.Small, v9.Semantic.Icon.Size.Small), 
                    tag = "align-x-center align-x-left align-y-center", 
                    LayoutOrder = 0
                }), 
                ThirdPartyUserName = v1.createElement(l_Text_0, {
                    tag = "auto-xy text-body-small text-align-y-center text-align-x-left", 
                    Text = v8.thirdPartyUserName, 
                    LayoutOrder = 1
                })
            }) else nil
        })
    });
end);
local l_Parent_0 = script:FindFirstAncestor("AddFriends").Parent;
local v1 = require(l_Parent_0.React);
local l_ImageSetLabel_0 = require(l_Parent_0.UIBlox).Core.ImageSet.ImageSetLabel;
local v3 = require(l_Parent_0.Foundation);
local l_Skeleton_0 = v3.Skeleton;
local l_Button_0 = v3.Button;
local l_ButtonVariant_0 = v3.Enums.ButtonVariant;
local l_InputSize_0 = v3.Enums.InputSize;
local l_View_0 = v3.View;
local l_Text_0 = v3.Text;
local l_Icon_0 = v3.Icon;
local l_IconSize_0 = v3.Enums.IconSize;
return function(v12) --[[ Line: 44 ]] --[[ Name: AddFriendsGenericBanner ]]
    -- upvalues: v1 (copy), l_View_0 (copy), l_ImageSetLabel_0 (copy), l_Text_0 (copy), l_Skeleton_0 (copy), l_Icon_0 (copy), l_IconSize_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy)
    local l_layoutOrder_0 = v12.layoutOrder;
    local l_maxWidth_0 = v12.maxWidth;
    local l_onBannerMounted_0 = v12.onBannerMounted;
    local l_onActivated_0 = v12.onActivated;
    local v17 = v12.bannerIcon and true or false;
    local l_bannerIcon_0 = v12.bannerIcon;
    local l_bannerTitle_0 = v12.bannerTitle;
    local l_bannerText_0 = v12.bannerText;
    local l_titleFont_0 = v12.titleFont;
    local l_textFont_0 = v12.textFont;
    local l_rightCornerButtonIcon_0 = v12.rightCornerButtonIcon;
    local l_rightCornerButtonIcon_1 = v12.rightCornerButtonIcon;
    local l_rightCornerButtonActivated_0 = v12.rightCornerButtonActivated;
    local l_bigBottomButton_0 = v12.bigBottomButton;
    v1.useEffect(function() --[[ Line: 66 ]]
        -- upvalues: l_onBannerMounted_0 (copy)
        if l_onBannerMounted_0 then
            l_onBannerMounted_0();
        end;
    end, {});
    return v1.createElement(l_View_0, {
        tag = "col size-full-0 auto-y align-x-center radius-medium bg-surface-300 auto-y padding-medium gap-xlarge", 
        onActivated = l_onActivated_0, 
        LayoutOrder = l_layoutOrder_0
    }, {
        UISizeConstraint = v1.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(l_maxWidth_0, 1e999)
        }), 
        InfoContent = v1.createElement(l_View_0, {
            tag = "size-full-0 auto-y row flex-x-fill gap-medium"
        }, {
            BannerIconView = v17 and v1.createElement(l_View_0, {
                tag = "auto-xy padding-y-xsmall padding-x-xsmall", 
                LayoutOrder = 1
            }, {
                BannerIcon = v1.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, 48, 0, 48), 
                    Image = l_bannerIcon_0
                })
            }) or nil, 
            TextContent = v1.createElement(l_View_0, {
                tag = "auto-xy align-x-left", 
                LayoutOrder = 2
            }, {
                TextVertical = v1.createElement(l_View_0, {
                    tag = {
                        ["col size-full-0 auto-y gap-small"] = true, 
                        ["padding-small"] = v17
                    }
                }, {
                    BannerTitle = v1.createElement(l_Text_0, {
                        tag = {
                            ["auto-y size-full-0 text-align-x-left content-emphasis"] = true, 
                            [l_titleFont_0 or "text-label-large"] = true
                        }, 
                        Text = l_bannerTitle_0, 
                        LayoutOrder = 1
                    }), 
                    BannerText = if v12.isLoading then v1.createElement(l_Skeleton_0, {
                        Size = UDim2.new(1, 0, 0, 30), 
                        LayoutOrder = 2
                    }) else v1.createElement(l_Text_0, {
                        tag = {
                            ["auto-y size-full-0 text-align-x-left text-wrap"] = true, 
                            [l_textFont_0 or "text-body-small"] = true
                        }, 
                        Text = l_bannerText_0, 
                        LayoutOrder = 2
                    })
                })
            }), 
            RightCornerButton = l_rightCornerButtonIcon_0 and v1.createElement(l_View_0, {
                tag = "auto-xy radius-xsmall", 
                LayoutOrder = 3, 
                onActivated = l_rightCornerButtonActivated_0
            }, {
                RightCornerButtonIcon = v1.createElement(l_Icon_0, {
                    size = l_IconSize_0.Large, 
                    name = l_rightCornerButtonIcon_1
                })
            }) or nil
        }), 
        BannerButton = if l_bigBottomButton_0 then v1.createElement(l_Button_0, {
            width = UDim.new(1, 0), 
            variant = l_ButtonVariant_0.Standard, 
            size = l_InputSize_0.Medium, 
            text = l_bigBottomButton_0.text, 
            onActivated = l_bigBottomButton_0.onActivated
        }) else nil
    });
end;
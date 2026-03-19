local l_Parent_0 = script:FindFirstAncestor("SduiSharedContent").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Foundation);
local l_LoadableImage_0 = require(l_Parent_0.UIBlox).App.Loading.LoadableImage;
local v4 = require(l_Parent_0.TextSize);
local v5 = require(l_Parent_0.SignalsReact);
local _ = require(l_Parent_0.SduiCompat);
local l_View_0 = v2.View;
local l_Text_0 = v2.Text;
local l_Button_0 = v2.Button;
local l_useTokens_0 = v2.Hooks.useTokens;
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_InputSize_0 = v2.Enums.InputSize;
return v1.memo(function(v13) --[[ Line: 50 ]] --[[ Name: SduiCard ]]
    -- upvalues: l_useTokens_0 (copy), v5 (copy), v4 (copy), v1 (copy), l_View_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy), l_LoadableImage_0 (copy)
    local v14 = l_useTokens_0();
    local l_Size_2500_0 = v14.Size.Size_2500;
    local v17 = v5.useSignalState(function(v16) --[[ Line: 54 ]]
        -- upvalues: v4 (ref)
        return v4.getTextSizeStore(v16).getTextSizeOffset(v16);
    end);
    local v18 = nil;
    if v13.descriptionMaxLines and v13.descriptionMaxLines > 0 then
        local l_BodyMedium_0 = v14.Typography.BodyMedium;
        local v20 = l_BodyMedium_0.FontSize + v17;
        v18 = math.ceil(v13.descriptionMaxLines * v20 * l_BodyMedium_0.LineHeight);
    end;
    local v21, v22 = v1.useState(0);
    local v24 = v1.useCallback(function(v23) --[[ Line: 66 ]]
        -- upvalues: v22 (copy)
        v22(v23.AbsoluteSize.Y);
    end, {});
    return v1.createElement(l_View_0, {
        tag = "size-full-0 row auto-y stroke-default", 
        backgroundStyle = v13.backgroundStyle or v14.Color.Surface.Surface_100, 
        cornerRadius = v13.cornerRadius or UDim.new(0, v14.Radius.Medium), 
        AnchorPoint = v13.anchorPoint, 
        LayoutOrder = v13.layoutOrder, 
        Position = v13.position, 
        Size = v13.size, 
        ZIndex = v13.zIndex, 
        testId = v13.testId
    }, {
        ContentSection = v1.createElement(l_View_0, {
            tag = "flex-between size-full-0 auto-y col gap-xsmall padding-top-large padding-bottom-large padding-left-large padding-right-small", 
            Size = UDim2.new(UDim.new(1, -l_Size_2500_0), v13.size and v13.size.Height or UDim.new(0, 0)), 
            LayoutOrder = 1, 
            onAbsoluteSizeChanged = v24
        }, {
            TopContent = v1.createElement(l_View_0, {
                tag = "col size-full-0 auto-y gap-xsmall", 
                LayoutOrder = 1
            }, {
                Title = v1.createElement(l_Text_0, {
                    Text = v13.titleText, 
                    tag = "size-full-0 auto-y text-align-x-left text-wrap text-label-large content-emphasis", 
                    LayoutOrder = 1
                }), 
                Subtitle = v13.descriptionText and v1.createElement(l_Text_0, {
                    Text = v13.descriptionText, 
                    fontStyle = v14.Typography.BodyMedium, 
                    sizeConstraint = if v18 then {
                        MaxSize = Vector2.new(1e999, v18)
                    } else nil, 
                    tag = {
                        ["size-full-0 auto-y text-align-x-left text-wrap"] = true, 
                        ["text-truncate-split"] = v18 and true or false
                    }, 
                    LayoutOrder = 2
                }) or nil
            }), 
            CTAContainer = if v13.ctaText and v13.ctaOnActivated then v1.createElement(l_View_0, {
                tag = "auto-xy padding-top-medium", 
                LayoutOrder = 2
            }, {
                CTAButton = v1.createElement(l_Button_0, {
                    text = v13.ctaText, 
                    onActivated = v13.ctaOnActivated, 
                    variant = v13.ctaVariant or l_ButtonVariant_0.SoftEmphasis, 
                    size = v13.ctaSize or l_InputSize_0.Small
                })
            }) else nil
        }), 
        ImageSection = if v13.image then v1.createElement(l_LoadableImage_0, {
            Image = v13.image, 
            Size = UDim2.new(0, l_Size_2500_0, 0, v21), 
            LayoutOrder = 2, 
            BackgroundTransparency = 1, 
            ScaleType = Enum.ScaleType.Crop, 
            cornerRadius = v13.cornerRadius or UDim.new(0, v14.Radius.Medium), 
            showFailedStateWhenLoadingFailed = false, 
            useShimmerAnimationWhileLoading = true
        }) else nil
    });
end);
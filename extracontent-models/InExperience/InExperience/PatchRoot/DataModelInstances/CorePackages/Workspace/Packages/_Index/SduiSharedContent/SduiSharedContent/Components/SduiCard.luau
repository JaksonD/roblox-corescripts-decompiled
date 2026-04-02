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
local l_useCursor_0 = v2.Hooks.useCursor;
local l_ButtonVariant_0 = v2.Enums.ButtonVariant;
local l_InputSize_0 = v2.Enums.InputSize;
local l_CursorType_0 = v2.Enums.CursorType;
local l_StateLayerAffordance_0 = v2.Enums.StateLayerAffordance;
local l_FFlagFixSduiCardFocusNavScroll_0 = require(l_Parent_0.SharedFlags).FFlagFixSduiCardFocusNavScroll;
local function v17() --[[ Line: 33 ]]

end;
return v1.memo(function(v18) --[[ Line: 60 ]] --[[ Name: SduiCard ]]
    -- upvalues: l_useTokens_0 (copy), l_FFlagFixSduiCardFocusNavScroll_0 (copy), l_useCursor_0 (copy), l_CursorType_0 (copy), v5 (copy), v4 (copy), v1 (copy), l_View_0 (copy), v17 (copy), l_StateLayerAffordance_0 (copy), l_Text_0 (copy), l_Button_0 (copy), l_ButtonVariant_0 (copy), l_InputSize_0 (copy), l_LoadableImage_0 (copy)
    local v19 = l_useTokens_0();
    local v20 = if l_FFlagFixSduiCardFocusNavScroll_0 then l_useCursor_0(l_CursorType_0.RoundedRect) else nil;
    local l_Size_2500_0 = v19.Size.Size_2500;
    local v23 = v5.useSignalState(function(v22) --[[ Line: 65 ]]
        -- upvalues: v4 (ref)
        return v4.getTextSizeStore(v22).getTextSizeOffset(v22);
    end);
    local v24 = nil;
    if v18.descriptionMaxLines and v18.descriptionMaxLines > 0 then
        local l_BodyMedium_0 = v19.Typography.BodyMedium;
        local v26 = l_BodyMedium_0.FontSize + v23;
        v24 = math.ceil(v18.descriptionMaxLines * v26 * l_BodyMedium_0.LineHeight);
    end;
    local v27, v28 = v1.useState(0);
    local v30 = v1.useCallback(function(v29) --[[ Line: 77 ]]
        -- upvalues: v28 (copy)
        v28(v29.AbsoluteSize.Y);
    end, {});
    local v31 = if l_FFlagFixSduiCardFocusNavScroll_0 then v1.useMemo(function() --[[ Line: 82 ]]
        -- upvalues: v20 (copy), v18 (copy)
        return {
            Selectable = true, 
            SelectionImageObject = v20, 
            SelectionOrder = v18.selectionOrder
        };
    end, {
        v20, 
        v18.selectionOrder
    }) else nil;
    return v1.createElement(l_View_0, {
        tag = "size-full-0 row auto-y stroke-default", 
        backgroundStyle = v18.backgroundStyle or v19.Color.Surface.Surface_100, 
        cornerRadius = v18.cornerRadius or UDim.new(0, v19.Radius.Medium), 
        selection = v31, 
        onStateChanged = if l_FFlagFixSduiCardFocusNavScroll_0 then v17 else nil, 
        stateLayer = if l_FFlagFixSduiCardFocusNavScroll_0 then {
            affordance = l_StateLayerAffordance_0.None
        } else nil, 
        AnchorPoint = v18.anchorPoint, 
        LayoutOrder = v18.layoutOrder, 
        Position = v18.position, 
        Size = v18.size, 
        ZIndex = v18.zIndex, 
        testId = v18.testId
    }, {
        ContentSection = v1.createElement(l_View_0, {
            tag = "flex-between size-full-0 auto-y col gap-xsmall padding-top-large padding-bottom-large padding-left-large padding-right-small", 
            Size = UDim2.new(UDim.new(1, -l_Size_2500_0), v18.size and v18.size.Height or UDim.new(0, 0)), 
            LayoutOrder = 1, 
            onAbsoluteSizeChanged = v30
        }, {
            TopContent = v1.createElement(l_View_0, {
                tag = "col size-full-0 auto-y gap-xsmall", 
                LayoutOrder = 1
            }, {
                Title = v1.createElement(l_Text_0, {
                    Text = v18.titleText, 
                    tag = "size-full-0 auto-y text-align-x-left text-wrap text-label-large content-emphasis", 
                    LayoutOrder = 1
                }), 
                Subtitle = v18.descriptionText and v1.createElement(l_Text_0, {
                    Text = v18.descriptionText, 
                    fontStyle = v19.Typography.BodyMedium, 
                    sizeConstraint = if v24 then {
                        MaxSize = Vector2.new(1e999, v24)
                    } else nil, 
                    tag = {
                        ["size-full-0 auto-y text-align-x-left text-wrap"] = true, 
                        ["text-truncate-split"] = v24 and true or false
                    }, 
                    LayoutOrder = 2
                }) or nil
            }), 
            CTAContainer = if v18.ctaText and v18.ctaOnActivated then v1.createElement(l_View_0, {
                tag = "auto-xy padding-top-medium", 
                LayoutOrder = 2
            }, {
                CTAButton = v1.createElement(l_Button_0, {
                    text = v18.ctaText, 
                    onActivated = v18.ctaOnActivated, 
                    variant = v18.ctaVariant or l_ButtonVariant_0.SoftEmphasis, 
                    size = v18.ctaSize or l_InputSize_0.Small
                })
            }) else nil
        }), 
        ImageSection = if v18.image then v1.createElement(l_LoadableImage_0, {
            Image = v18.image, 
            Size = UDim2.new(0, l_Size_2500_0, 0, v27), 
            LayoutOrder = 2, 
            BackgroundTransparency = 1, 
            ImageColor3 = v18.imageStyle and v18.imageStyle.Color3 or v19.Color.Content.Emphasis.Color3, 
            ImageTransparency = v18.imageStyle and v18.imageStyle.Transparency or 0, 
            ScaleType = Enum.ScaleType.Crop, 
            cornerRadius = v18.cornerRadius or UDim.new(0, v19.Radius.Medium), 
            showFailedStateWhenLoadingFailed = false, 
            useShimmerAnimationWhileLoading = true
        }) else nil
    });
end);
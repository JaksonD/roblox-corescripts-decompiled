local l_Parent_0 = script.Parent.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.CapturesCommon);
local v3 = require(l_Parent_1.Localization);
local v4 = require(l_Parent_1.React);
local v5 = require(l_Parent_1.RoactUtils);
local v6 = require(l_Parent_1.UIBlox);
local v7 = require(l_Parent_0.Analytics.useAnalytics);
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_useLocalization_0 = v3.Hooks.useLocalization;
local l_useSelector_0 = v5.Hooks.RoactRodux.useSelector;
local l_useStyle_0 = v6.Core.Style.useStyle;
local v12 = require(l_Parent_0.Hooks.useSystemMenuDetection);
local l_CaptureGridView_0 = v2.Components.CaptureGridView;
local l_CaptureItem_0 = v2.Components.CaptureItem;
local v15 = require(l_Parent_0.Actions.CarouselOpened);
local v16 = require(l_Parent_0.Constants);
local v17 = require(l_Parent_0.Analytics.EventNames);
local v18 = require(l_Parent_0.Components.CapturesGallery.GalleryActionContainer);
local v19 = require(l_Parent_0.Components.CapturesGallery.GalleryGridView);
local v20 = require(l_Parent_0.Flags.FFlagUseCaptureCommonComponents);
local v21 = require(l_Parent_0.Flags.FFlagCapturesGalleryDespawnOnMenuClose);
return function(v22) --[[ Line: 38 ]]
    -- upvalues: v7 (copy), l_useDispatch_0 (copy), l_useStyle_0 (copy), v12 (copy), l_useSelector_0 (copy), v16 (copy), l_useLocalization_0 (copy), v4 (copy), v17 (copy), v15 (copy), v21 (copy), v20 (copy), l_CaptureGridView_0 (copy), v18 (copy), l_CaptureItem_0 (copy), v19 (copy)
    local v23 = v7();
    local v24 = l_useDispatch_0();
    local v25 = l_useStyle_0();
    local v26 = v12();
    local v28 = l_useSelector_0(function(v27) --[[ Line: 44 ]]
        -- upvalues: v16 (ref)
        return v27[v16.RoduxKey].Captures;
    end);
    local v29 = next(v28) == nil;
    local v30 = l_useLocalization_0({
        nothingHereYet = "Feature.Captures.Label.NothingHereYet", 
        title = "Feature.Captures.Title.Gallery"
    });
    local v32 = v4.useCallback(function(v31) --[[ Line: 55 ]]
        -- upvalues: v23 (copy), v17 (ref), v24 (copy), v15 (ref)
        return function() --[[ Line: 56 ]]
            -- upvalues: v23 (ref), v17 (ref), v24 (ref), v15 (ref), v31 (copy)
            v23.fireEvent(v17.CapturesCarouselOpened);
            v24(v15(v31));
        end;
    end, {});
    local v33 = v22.Size or UDim2.fromScale(1, 1);
    local l_Color_0 = v25.Theme.BackgroundDefault.Color;
    local l_Transparency_0 = v25.Theme.BackgroundDefault.Transparency;
    local l_Color_1 = v25.Theme.TextMuted.Color;
    local l_Font_0 = v25.Font.CaptionBody.Font;
    local v38 = v25.Font.BaseSize * v25.Font.CaptionBody.RelativeSize;
    local l_Transparency_1 = v25.Theme.TextMuted.Transparency;
    local v40 = if v21 then v26 and not v29 else not v29;
    return v4.createElement("Frame", {
        BackgroundColor3 = l_Color_0, 
        BackgroundTransparency = l_Transparency_0, 
        BorderSizePixel = 0, 
        LayoutOrder = v22.LayoutOrder, 
        Size = v33
    }, {
        UICorner = v4.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        Layout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, 12), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        NothingHereYet = v29 and v4.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = l_Font_0, 
            Size = UDim2.new(1, -12, 1, 12), 
            Text = v30.nothingHereYet, 
            TextColor3 = l_Color_1, 
            TextSize = v38, 
            TextTransparency = l_Transparency_1, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Center
        }, {
            MaxSize = v4.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(312, 1e999)
            })
        }), 
        GalleryGridView = if v40 then if v20 then v4.createElement(l_CaptureGridView_0, {
            captures = v28, 
            header = v4.createElement(v18, {
                isDisabled = false, 
                itemCount = #v28, 
                LayoutOrder = 1
            }), 
            renderItem = function(v41, v42) --[[ Line: 119 ]] --[[ Name: renderItem ]]
                -- upvalues: v4 (ref), l_CaptureItem_0 (ref), v32 (copy)
                return v4.createElement(l_CaptureItem_0, {
                    capture = v41, 
                    onActivated = v32(v42)
                });
            end, 
            shouldShowShowMoreButton = true
        }) else v4.createElement(v19, {
            captures = v28, 
            Size = UDim2.new(1, -12, 1, -12)
        }) else nil
    });
end;
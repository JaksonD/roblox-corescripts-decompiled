local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_useSelectionCursor_0 = v4.App.SelectionImage.useSelectionCursor;
local l_CursorKind_0 = v4.App.SelectionImage.CursorKind;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v9 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useSelectedTheme_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useSelectedTheme;
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v15 = require(l_Modules_0.AvatarExperience.Common.WidgetUtils);
local l_getUseSelectorDeepEquals_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals;
local l_WidgetConstants_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog).WidgetConstants;
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
return function(v20) --[[ Line: 49 ]] --[[ Name: EntryButtonWidget ]]
    -- upvalues: l_useNavigation_0 (copy), v9 (copy), v14 (copy), l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy), l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), l_useSelectedTheme_0 (copy), l_useStyle_0 (copy), l_WidgetConstants_0 (copy), v15 (copy), l_useLocalization_0 (copy), l_useSelectionCursor_0 (copy), l_CursorKind_0 (copy), v3 (copy), l_Focusable_0 (copy)
    local v21 = l_useNavigation_0();
    local v22 = v9(v14);
    local v24 = l_useSelector_0(function(v23) --[[ Line: 52 ]]
        return v23.AvatarExperience.Common.Widgets.WidgetInfo.RequestId;
    end, l_getUseSelectorDeepEquals_0());
    local v26 = l_useSelector_0(function(v25) --[[ Line: 55 ]]
        -- upvalues: l_FFlagUseNavigationSelectors_0 (ref), l_Selectors_0 (ref)
        if l_FFlagUseNavigationSelectors_0 then
            return (l_Selectors_0.selectLegacyHistory(v25));
        else
            return v25.Navigation.history;
        end;
    end, l_getUseSelectorDeepEquals_0());
    local v27 = l_useSelectedTheme_0() == "dark";
    local v28 = l_useStyle_0();
    local l_Theme_0 = v28.Theme;
    local l_Font_0 = v28.Font;
    local l_widgetInfo_0 = v20.widgetInfo;
    local l_type_0 = l_widgetInfo_0.type;
    local v33 = if l_type_0 then l_WidgetConstants_0.TypeToImageInfo[l_type_0] else nil;
    local function v34() --[[ Line: 68 ]]
        -- upvalues: v22 (copy), v24 (copy), l_WidgetConstants_0 (ref), v20 (copy), l_widgetInfo_0 (copy), v15 (ref), l_type_0 (copy), v21 (copy), v26 (copy)
        v22.widgetInteraction(v24, l_WidgetConstants_0.ActionType.WIDGET_CLICK, nil, v20.widgetRow, nil, nil, l_widgetInfo_0.id);
        v15.getEntryButtonWidgetActivationFunc(l_type_0, v21, v26)();
    end;
    local v35 = nil;
    local v36 = nil;
    local l_rowHeight_0 = v20.rowHeight;
    if v33 then
        l_rowHeight_0 = l_rowHeight_0 * v33.rowScale;
        v35 = if v27 then v33.backgroundImageDark else v33.backgroundImageLight;
        v36 = if v27 then v33.contentImageDark else v33.contentImageLight;
    end;
    local v38 = if v33 then v33.widthHeightRatio else 1.5;
    local v39 = l_useLocalization_0({
        titleText = if l_widgetInfo_0 and l_widgetInfo_0.template then l_widgetInfo_0.template.title else nil, 
        descText = if l_widgetInfo_0 and l_widgetInfo_0.template then l_widgetInfo_0.template.description else nil
    });
    local v40 = l_useSelectionCursor_0(l_CursorKind_0.RoundedRect);
    return v3.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_rowHeight_0), 
        BackgroundTransparency = 1, 
        LayoutOrder = v20.LayoutOrder
    }, {
        EntryButton = v3.createElement(l_Focusable_0.ImageButton, {
            Size = UDim2.new(1, -3, 1, 0), 
            Position = UDim2.fromOffset(1, 0), 
            BackgroundTransparency = 1, 
            Image = v35, 
            ScaleType = Enum.ScaleType.Crop, 
            [v3.Event.Activated] = v34, 
            ClipsDescendants = true, 
            SelectionImageObject = v40
        }, {
            UICorner = v3.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            UIStroke = v3.createElement("UIStroke", {
                Color = l_Theme_0.Divider.Color, 
                Transparency = l_Theme_0.Divider.Transparency, 
                Thickness = 1
            }), 
            TextFrame = v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.fromScale(1, 1)
            }, {
                UIListLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 8)
                }), 
                UIPadding = v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24)
                }), 
                Title = if v39.titleText then v3.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    Font = l_Font_0.Header1.Font, 
                    Text = v39.titleText, 
                    TextColor3 = Color3.fromRGB(255, 255, 255), 
                    TextSize = l_Font_0.BaseSize * l_Font_0.Header1.RelativeSize, 
                    TextWrapped = false, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    LayoutOrder = 1
                }) else nil, 
                Description = if v39.descText then v3.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    Font = l_Font_0.SubHeader1.Font, 
                    Text = v39.descText, 
                    TextColor3 = Color3.fromRGB(255, 255, 255), 
                    TextSize = l_Font_0.BaseSize * l_Font_0.SubHeader1.RelativeSize, 
                    TextWrapped = false, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    LayoutOrder = 2
                }) else nil
            }), 
            ContentImageLabel = v3.createElement("ImageLabel", {
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.fromScale(1, 0.5), 
                BackgroundTransparency = 1, 
                Image = v36, 
                Size = UDim2.fromOffset(l_rowHeight_0 * v38, l_rowHeight_0)
            })
        })
    });
end;
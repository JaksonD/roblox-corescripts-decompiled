local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.React);
local v4 = require(l_Parent_1.UIBlox);
local v5 = require(l_Parent_1.Cryo);
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_HeaderBar_0 = v4.App.Bar.HeaderBar;
local l_UtilityActionIcon_0 = v4.App.Button.UtilityActionIcon;
local _ = require(l_Parent_0.Types);
local v10 = {
    automaticHeight = false, 
    hasDivider = false, 
    onMedia = false, 
    isTitleCentered = false, 
    utilitiesGap = UDim.new(0, 0)
};
local function v19(v11) --[[ Line: 33 ]] --[[ Name: BarTitle ]]
    -- upvalues: l_useStyle_0 (copy), v3 (copy), l_TextService_0 (copy), v5 (copy)
    local l_Tokens_0 = l_useStyle_0().Tokens;
    local l_layoutOrder_0 = v11.layoutOrder;
    local l_title_0 = v11.title;
    local v15 = v11.titleFont or l_Tokens_0.Semantic.Typography.Title;
    local v16 = if v11.onMedia then l_Tokens_0.Global.Color.White else l_Tokens_0.Semantic.Color.Text.Emphasis;
    local v18 = v3.useMemo(function() --[[ Line: 43 ]]
        -- upvalues: l_TextService_0 (ref), l_title_0 (copy), v15 (copy), l_Tokens_0 (copy)
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(l_title_0, v15.FontSize, v15.Font, Vector2.new(1e999, 1e999));
        return UDim2.fromOffset(l_l_TextService_0_TextSize_0.X + 2, l_l_TextService_0_TextSize_0.Y + l_Tokens_0.Global.Space_25 * 2);
    end, {
        l_title_0, 
        v15.FontSize, 
        v15.Font, 
        l_Tokens_0
    });
    return v3.createElement("TextLabel", {
        LayoutOrder = l_layoutOrder_0, 
        Size = v18, 
        BackgroundTransparency = 1, 
        Text = l_title_0, 
        Font = v15.Font, 
        TextSize = v15.FontSize, 
        LineHeight = v15.LineHeight, 
        TextColor3 = v16.Color3, 
        TextTransparency = v16.Transparency, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextWrapped = true
    }, v5.Dictionary.join(v11.children or {}, {
        Padding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, l_Tokens_0.Global.Space_25), 
            PaddingBottom = UDim.new(0, l_Tokens_0.Global.Space_25)
        })
    }));
end;
local function v28(v20) --[[ Line: 73 ]] --[[ Name: useRenderLeft ]]
    -- upvalues: v3 (copy), v19 (copy)
    local l_renderNavigation_0 = v20.renderNavigation;
    local l_title_1 = v20.title;
    local l_onMedia_0 = v20.onMedia;
    local l_titleFontStyle_0 = v20.titleFontStyle;
    local l_isTitleCentered_0 = v20.isTitleCentered;
    local l_groupTransparencyLeft_0 = v20.groupTransparencyLeft;
    return v3.useCallback(function(v27) --[[ Line: 81 ]]
        -- upvalues: v3 (ref), l_groupTransparencyLeft_0 (copy), l_renderNavigation_0 (copy), l_title_1 (copy), l_isTitleCentered_0 (copy), v19 (ref), l_titleFontStyle_0 (copy), l_onMedia_0 (copy)
        return v3.createElement(l_groupTransparencyLeft_0 and "CanvasGroup" or "Frame", {
            BackgroundTransparency = 1, 
            GroupTransparency = if l_groupTransparencyLeft_0 then l_groupTransparencyLeft_0.transparency else nil, 
            ref = if l_groupTransparencyLeft_0 then l_groupTransparencyLeft_0.guiObjectRef else nil, 
            BorderSizePixel = 0, 
            AutomaticSize = Enum.AutomaticSize.XY
        }, {
            ListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            Navigation = if l_renderNavigation_0 then l_renderNavigation_0({
                layoutOrder = 1
            }) else nil, 
            Title = if not l_title_1 or l_isTitleCentered_0 then nil else v3.createElement(v19, {
                layoutOrder = 2, 
                title = l_title_1, 
                titleFont = l_titleFontStyle_0, 
                onMedia = l_onMedia_0
            }, if v27 then v27.children else nil)
        });
    end, {
        l_renderNavigation_0, 
        l_title_1, 
        l_titleFontStyle_0, 
        l_groupTransparencyLeft_0, 
        l_onMedia_0, 
        l_isTitleCentered_0
    });
end;
local function v35(v29) --[[ Line: 112 ]] --[[ Name: useRenderCenter ]]
    -- upvalues: v3 (copy), v19 (copy)
    local l_renderCenter_0 = v29.renderCenter;
    local l_title_2 = v29.title;
    local l_onMedia_1 = v29.onMedia;
    local l_titleFontStyle_1 = v29.titleFontStyle;
    local l_isTitleCentered_1 = v29.isTitleCentered;
    return v3.useCallback(function() --[[ Line: 119 ]]
        -- upvalues: l_renderCenter_0 (copy), l_title_2 (copy), l_isTitleCentered_1 (copy), v3 (ref), v19 (ref), l_titleFontStyle_1 (copy), l_onMedia_1 (copy)
        if l_renderCenter_0 then
            return l_renderCenter_0();
        elseif l_title_2 and l_isTitleCentered_1 then
            return v3.createElement(v19, {
                title = l_title_2, 
                titleFont = l_titleFontStyle_1, 
                onMedia = l_onMedia_1
            });
        else
            return nil;
        end;
    end, {
        l_renderCenter_0, 
        l_title_2, 
        l_titleFontStyle_1, 
        l_isTitleCentered_1, 
        l_onMedia_1
    });
end;
local function v43(v36) --[[ Line: 134 ]] --[[ Name: useRenderRight ]]
    -- upvalues: v3 (copy), l_UtilityActionIcon_0 (copy)
    local l_renderUserInfo_0 = v36.renderUserInfo;
    local l_avatarActionIcon_0 = v36.avatarActionIcon;
    local l_searchActionIcon_0 = v36.searchActionIcon;
    local l_renderUtilities_0 = v36.renderUtilities;
    local l_utilitiesGap_0 = v36.utilitiesGap;
    local l_groupTransparencyRight_0 = v36.groupTransparencyRight;
    return v3.useCallback(function() --[[ Line: 143 ]]
        -- upvalues: v3 (ref), l_groupTransparencyRight_0 (copy), l_utilitiesGap_0 (copy), l_renderUserInfo_0 (copy), l_avatarActionIcon_0 (copy), l_UtilityActionIcon_0 (ref), l_searchActionIcon_0 (copy), l_renderUtilities_0 (copy)
        return v3.createElement(l_groupTransparencyRight_0 and "CanvasGroup" or "Frame", {
            Size = UDim2.fromScale(0, 1), 
            BackgroundTransparency = 1, 
            GroupTransparency = if l_groupTransparencyRight_0 then l_groupTransparencyRight_0.transparency else nil, 
            ref = if l_groupTransparencyRight_0 then l_groupTransparencyRight_0.guiObjectRef else nil, 
            BorderSizePixel = 0, 
            AutomaticSize = Enum.AutomaticSize.X
        }, {
            ListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = l_utilitiesGap_0
            }), 
            UserInfo = if l_renderUserInfo_0 then l_renderUserInfo_0({
                layoutOrder = 1, 
                itemsGap = l_utilitiesGap_0
            }) else nil, 
            Avatar = if l_avatarActionIcon_0 then v3.createElement(l_UtilityActionIcon_0, {
                layoutOrder = 2, 
                icon = l_avatarActionIcon_0.icon, 
                iconColor = {}, 
                onActivated = l_avatarActionIcon_0.onActivated
            }) else nil, 
            SearchIcon = if l_searchActionIcon_0 then v3.createElement(l_UtilityActionIcon_0, {
                layoutOrder = 3, 
                icon = l_searchActionIcon_0.icon, 
                onActivated = l_searchActionIcon_0.onActivated
            }) else nil, 
            Utilities = if l_renderUtilities_0 then l_renderUtilities_0({
                layoutOrder = 4, 
                itemsGap = l_utilitiesGap_0
            }) else nil
        });
    end, {
        l_renderUserInfo_0, 
        l_avatarActionIcon_0, 
        l_searchActionIcon_0, 
        l_renderUtilities_0, 
        l_utilitiesGap_0, 
        l_groupTransparencyRight_0
    });
end;
local function _(v44) --[[ Line: 191 ]] --[[ Name: shouldRenderRight ]]
    local l_renderUserInfo_1 = v44.renderUserInfo;
    local l_avatarActionIcon_1 = v44.avatarActionIcon;
    local l_searchActionIcon_1 = v44.searchActionIcon;
    local l_renderUtilities_1 = v44.renderUtilities;
    if l_renderUserInfo_1 or l_avatarActionIcon_1 or l_searchActionIcon_1 or l_renderUtilities_1 then
        return true;
    else
        return false;
    end;
end;
return function(v50) --[[ Line: 203 ]] --[[ Name: AppHeaderBarComponent ]]
    -- upvalues: v5 (copy), v10 (copy), v28 (copy), v35 (copy), v43 (copy), v3 (copy), l_HeaderBar_0 (copy)
    local v51 = v5.Dictionary.join(v10, v50);
    local l_barHeight_0 = v51.barHeight;
    local l_zIndex_0 = v51.zIndex;
    local l_automaticHeight_0 = v51.automaticHeight;
    local l_groupTransparency_0 = v51.groupTransparency;
    local l_backgroundStyle_0 = v51.backgroundStyle;
    local l_hasDivider_0 = v51.hasDivider;
    local l_onMedia_2 = v51.onMedia;
    local l_onHeaderActivated_0 = v51.onHeaderActivated;
    local l_paddingLeft_0 = v51.paddingLeft;
    local l_paddingTop_0 = v51.paddingTop;
    local l_paddingRight_0 = v51.paddingRight;
    local l_paddingBottom_0 = v51.paddingBottom;
    local v64 = v28(v51);
    local v65 = v35(v51);
    local v66 = v43(v51);
    local l_renderUserInfo_2 = v51.renderUserInfo;
    local l_avatarActionIcon_2 = v51.avatarActionIcon;
    local l_searchActionIcon_2 = v51.searchActionIcon;
    local l_renderUtilities_2 = v51.renderUtilities;
    local v71 = not not l_renderUserInfo_2 or (l_avatarActionIcon_2 or l_searchActionIcon_2 or l_renderUtilities_2) and true or false;
    return v3.createElement(l_groupTransparency_0 and "CanvasGroup" or "Frame", {
        Size = UDim2.fromScale(1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        GroupTransparency = if l_groupTransparency_0 then l_groupTransparency_0.transparency else nil, 
        ref = if l_groupTransparency_0 then l_groupTransparency_0.guiObjectRef else nil, 
        AutomaticSize = Enum.AutomaticSize.Y
    }, {
        Bar = v3.createElement(l_HeaderBar_0, {
            barHeight = l_barHeight_0, 
            renderLeft = v64, 
            renderCenter = v65, 
            renderRight = if v71 then v66 else nil, 
            onHeaderActivated = l_onHeaderActivated_0, 
            backgroundStyle = l_backgroundStyle_0, 
            isOnMedia = l_onMedia_2, 
            automaticHeight = l_automaticHeight_0, 
            paddingLeft = l_paddingLeft_0, 
            paddingTop = l_paddingTop_0, 
            paddingRight = l_paddingRight_0, 
            paddingBottom = l_paddingBottom_0, 
            zIndex = l_zIndex_0, 
            hasDivider = l_hasDivider_0
        })
    });
end;
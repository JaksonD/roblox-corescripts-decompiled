local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_ExpandableTextArea_0 = v3.App.Text.ExpandableTextArea;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_RetrievalStatus_0 = v3.App.Loading.Enum.RetrievalStatus;
local l_StyledTextLabel_0 = v3.App.Text.StyledTextLabel;
local l_useStyle_0 = v3.Core.Style.useStyle;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_GetTextSize_0 = require(l_CorePackages_0.Workspace.Packages.Style).GetTextSize;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v12 = require(l_Modules_0.LuaApp.Components.ExperienceDetails.ExperienceDetailsPanel);
local v13 = require(l_Modules_0.LuaApp.Components.ExperienceDetails.sendExpandableTextImpressionEvent);
local l_ContentThresholdImpressionsDetector_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).ContentThresholdImpressionsDetector;
local v15 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local v16 = require(script.Parent.Flags.FFlagExperienceDetailsTextUseTokens);
local l_FFlagLuaAppShowNoticeOnEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppShowNoticeOnEdp;
local l_FFlagLuaAppExpandableTextImpressionsEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppExpandableTextImpressionsEnabled;
local l_useCursor_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useCursor;
local v20 = {
    0.01, 
    0.5, 
    1
};
local function v21() --[[ Line: 51 ]] --[[ Name: NOOP_NEEDED_FOR_SELECTION ]]

end;
return function(v22) --[[ Line: 55 ]]
    -- upvalues: l_useCursor_0 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), v15 (copy), l_useDesignTokens_0 (copy), l_RetrievalStatus_0 (copy), v16 (copy), v2 (copy), l_FFlagLuaAppExpandableTextImpressionsEnabled_0 (copy), l_GetTextSize_0 (copy), v13 (copy), l_HttpService_0 (copy), l_ExpandableTextArea_0 (copy), l_StyledTextLabel_0 (copy), v21 (copy), l_FFlagLuaAppShowNoticeOnEdp_0 (copy), l_ContentThresholdImpressionsDetector_0 (copy), v20 (copy), v12 (copy)
    local v23 = l_useCursor_0("RoundedRect");
    local v24 = l_useStyle_0();
    local v25 = l_useLocalization_0({
        DescriptionTitle = "Feature.ExperienceDetails.Body.DescriptionTitle"
    });
    local v27 = v15(function(v26) --[[ Line: 61 ]]
        return v26.enableExperienceDetailsPanel();
    end);
    local v29 = l_useDesignTokens_0(function(v28) --[[ Line: 64 ]]
        if v28 then
            return v28.LuaApps.ExperienceDetails.PanelWidthScale;
        else
            return 1;
        end;
    end);
    local v31 = l_useDesignTokens_0(function(v30) --[[ Line: 67 ]]
        if v30 then
            return v30.LuaApps.ExperienceDetails.PanelInnerPadding;
        else
            return 0;
        end;
    end);
    local v32 = v22.dataStatus == l_RetrievalStatus_0.Done;
    local v33 = v22.descriptionText and #v22.descriptionText > 0;
    local v35 = l_useDesignTokens_0(function(v34) --[[ Line: 74 ]]
        return v34.Semantic.Typography.Body;
    end);
    local v37 = l_useDesignTokens_0(function(v36) --[[ Line: 77 ]]
        return v36.Semantic.Typography.Header;
    end);
    local v38 = nil;
    local v39 = nil;
    local l_LineHeight_0 = v35.LineHeight;
    if v16 then
        v38 = v35.FontSize;
        v39 = v35.Font;
    else
        v38 = v24.Font.BaseSize * v24.Font.Body.RelativeSize;
        v39 = v24.Font.Body.Font;
    end;
    local v41, v42 = v2.useState(0);
    local v43 = v41 * v29;
    local v45 = v2.useMemo(function() --[[ Line: 96 ]]
        -- upvalues: v33 (copy), l_FFlagLuaAppExpandableTextImpressionsEnabled_0 (ref), v27 (copy), l_GetTextSize_0 (ref), v22 (copy), v38 (ref), v39 (ref), v43 (copy), l_LineHeight_0 (copy)
        if v33 and (l_FFlagLuaAppExpandableTextImpressionsEnabled_0 or v27) then
            local v44 = l_GetTextSize_0(v22.descriptionText, v38, v39, Vector2.new(v43, 1e999));
            if l_FFlagLuaAppExpandableTextImpressionsEnabled_0 and v22.expandable then
                return v44.Y;
            else
                return v44.Y * l_LineHeight_0;
            end;
        else
            return 0;
        end;
    end, {
        v22.descriptionText, 
        v38, 
        v39, 
        v43, 
        if l_FFlagLuaAppExpandableTextImpressionsEnabled_0 then nil else v27, 
        l_LineHeight_0, 
        if l_FFlagLuaAppExpandableTextImpressionsEnabled_0 then v22.expandable else nil, 
        if l_FFlagLuaAppExpandableTextImpressionsEnabled_0 then v33 else nil
    });
    local v46 = nil;
    local v47 = nil;
    if l_FFlagLuaAppExpandableTextImpressionsEnabled_0 then
        v46 = v2.useRef(false);
        v47 = v2.useCallback(function() --[[ Line: 132 ]]
            -- upvalues: v46 (ref)
            v46.current = not v46.current;
        end);
    end;
    local v51 = if l_FFlagLuaAppExpandableTextImpressionsEnabled_0 then v2.useCallback(function(v48) --[[ Line: 138 ]]
        -- upvalues: v13 (ref), v22 (copy), v46 (ref), l_HttpService_0 (ref)
        for _, v50 in v48 do
            v13({
                impressionThreshold = v50 * 100, 
                isButtonExpanded = if v22.expandable then v46.current else nil, 
                interactionUuid = l_HttpService_0:GenerateGUID(false), 
                contentType = "description", 
                pageContext = v22.pageContext, 
                itemId = tonumber(v22.universeId), 
                componentType = v22.componentType or "unknown"
            });
        end;
    end, {
        v46, 
        v22.expandable, 
        v22.universeId, 
        v22.pageContext, 
        v22.componentType
    }) else nil;
    local v52 = if l_FFlagLuaAppExpandableTextImpressionsEnabled_0 then ("ExperienceDescription_%*_%*_%*"):format(v22.universeId, v22.componentType, v22.pageContext) else nil;
    local v53 = if l_FFlagLuaAppExpandableTextImpressionsEnabled_0 then v2.useRef(nil) else nil;
    local v54 = v2.useRef(nil);
    v2.useEffect(function() --[[ Line: 162 ]]
        -- upvalues: v54 (copy), v42 (copy)
        if v54.current then
            v42(v54.current.AbsoluteSize.X);
        end;
    end);
    if v32 and v33 then
        local v55 = if v22.expandable then v2.createElement(l_ExpandableTextArea_0, {
            Text = v22.descriptionText, 
            compactNumberOfLines = 3, 
            padding = Vector2.new(0, 0), 
            gradientColor = v24.Theme.BackgroundContrast.Color, 
            onClick = if l_FFlagLuaAppExpandableTextImpressionsEnabled_0 then v47 else nil
        }) else v2.createElement(l_StyledTextLabel_0, {
            text = v22.descriptionText, 
            size = UDim2.new(v29, 0, 0, v45), 
            textYAlignment = Enum.TextYAlignment.Top, 
            fontStyle = if v16 then v35 else v24.Font.Body, 
            colorStyle = v24.Theme.TextDefault, 
            automaticSize = if v27 then nil else Enum.AutomaticSize.Y, 
            lineHeight = l_LineHeight_0, 
            richText = false, 
            fluidSizing = false
        });
        local v57 = v2.createElement("Frame", {
            ref = v54, 
            [v2.Change.AbsoluteSize] = function(v56) --[[ Line: 191 ]]
                -- upvalues: v42 (copy)
                v42(v56.AbsoluteSize.X);
            end, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = v22.LayoutOrder, 
            Selectable = true, 
            [v2.Event.SelectionGained] = v21, 
            SelectionImageObject = v23
        }, {
            Padding = if v27 then v2.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v31), 
                PaddingTop = UDim.new(0, v31), 
                PaddingRight = UDim.new(0, v31), 
                PaddingBottom = UDim.new(0, v31)
            }) else nil, 
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, v22.listPadding or 24)
            }), 
            Title = if v27 then nil else v2.createElement(l_StyledTextLabel_0, {
                text = if l_FFlagLuaAppShowNoticeOnEdp_0 then v22.headerText or v25.DescriptionTitle else v25.DescriptionTitle, 
                size = UDim2.fromScale(1, 0), 
                fontStyle = if v16 then v37 else v24.Font.Header1, 
                colorStyle = v24.Theme.TextEmphasis, 
                automaticSize = Enum.AutomaticSize.Y, 
                richText = false, 
                fluidSizing = false
            }), 
            Description = if l_FFlagLuaAppExpandableTextImpressionsEnabled_0 then v2.createElement("Frame", {
                ref = v53, 
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                Body = v55
            }) else v55, 
            ContentThresholdImpressionsDetector = if l_FFlagLuaAppExpandableTextImpressionsEnabled_0 then v2.createElement(l_ContentThresholdImpressionsDetector_0, {
                containerRef = v53, 
                fullContentHeight = v45, 
                thresholds = v20, 
                impressionsTag = v52, 
                sendImpressions = v51, 
                viewportBoundsOffset = v22.viewportBoundsOffset
            }) else nil
        });
        if v27 then
            return v2.createElement(v12, {
                title = if l_FFlagLuaAppShowNoticeOnEdp_0 then v22.headerText or v25.DescriptionTitle else v25.DescriptionTitle, 
                onFocusChanged = v22.onFocusChanged
            }, v57);
        else
            return v57;
        end;
    else
        return nil;
    end;
end;
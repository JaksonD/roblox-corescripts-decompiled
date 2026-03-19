local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local l_ExpandableTextArea_0 = v2.App.Text.ExpandableTextArea;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_RetrievalStatus_0 = v2.App.Loading.Enum.RetrievalStatus;
local l_StyledTextLabel_0 = v2.App.Text.StyledTextLabel;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_GetTextSize_0 = require(l_CorePackages_0.Workspace.Packages.Style).GetTextSize;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v11 = require(l_Modules_0.LuaApp.Components.ExperienceDetails.ExperienceDetailsPanel);
local v12 = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
local v13 = require(script.Parent.Flags.FFlagExperienceDetailsTextUseTokens);
local l_FFlagLuaAppShowNoticeOnEdp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppShowNoticeOnEdp;
local l_useCursor_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useCursor;
local function v16() --[[ Line: 33 ]] --[[ Name: NOOP_NEEDED_FOR_SELECTION ]]

end;
return function(v17) --[[ Line: 37 ]]
    -- upvalues: l_useCursor_0 (copy), l_useStyle_0 (copy), l_useLocalization_0 (copy), v12 (copy), l_useDesignTokens_0 (copy), l_RetrievalStatus_0 (copy), v13 (copy), v1 (copy), l_GetTextSize_0 (copy), v16 (copy), l_StyledTextLabel_0 (copy), l_FFlagLuaAppShowNoticeOnEdp_0 (copy), l_ExpandableTextArea_0 (copy), v11 (copy)
    local v18 = l_useCursor_0("RoundedRect");
    local v19 = l_useStyle_0();
    local v20 = l_useLocalization_0({
        DescriptionTitle = "Feature.ExperienceDetails.Body.DescriptionTitle"
    });
    local v22 = v12(function(v21) --[[ Line: 43 ]]
        return v21.enableExperienceDetailsPanel();
    end);
    local v24 = l_useDesignTokens_0(function(v23) --[[ Line: 46 ]]
        if v23 then
            return v23.LuaApps.ExperienceDetails.PanelWidthScale;
        else
            return 1;
        end;
    end);
    local v26 = l_useDesignTokens_0(function(v25) --[[ Line: 49 ]]
        if v25 then
            return v25.LuaApps.ExperienceDetails.PanelInnerPadding;
        else
            return 0;
        end;
    end);
    local v27 = v17.dataStatus == l_RetrievalStatus_0.Done;
    local v28 = v17.descriptionText and #v17.descriptionText > 0;
    local v30 = l_useDesignTokens_0(function(v29) --[[ Line: 56 ]]
        return v29.Semantic.Typography.Body;
    end);
    local v32 = l_useDesignTokens_0(function(v31) --[[ Line: 59 ]]
        return v31.Semantic.Typography.Header;
    end);
    local v33 = nil;
    local v34 = nil;
    local l_LineHeight_0 = v30.LineHeight;
    if v13 then
        v33 = v30.FontSize;
        v34 = v30.Font;
    else
        v33 = v19.Font.BaseSize * v19.Font.Body.RelativeSize;
        v34 = v19.Font.Body.Font;
    end;
    local v36, v37 = v1.useState(0);
    local v38 = v36 * v24;
    local v39 = v1.useMemo(function() --[[ Line: 78 ]]
        -- upvalues: v28 (copy), v22 (copy), l_GetTextSize_0 (ref), v17 (copy), v33 (ref), v34 (ref), v38 (copy), l_LineHeight_0 (copy)
        if v28 and v22 then
            return l_GetTextSize_0(v17.descriptionText, v33, v34, Vector2.new(v38, 1e999)).Y * l_LineHeight_0;
        else
            return 0;
        end;
    end, {
        v17.descriptionText, 
        v33, 
        v34, 
        v38, 
        v22, 
        l_LineHeight_0
    });
    local v40 = v1.useRef(nil);
    v1.useEffect(function() --[[ Line: 107 ]]
        -- upvalues: v40 (copy), v37 (copy)
        if v40.current then
            v37(v40.current.AbsoluteSize.X);
        end;
    end);
    if v27 and v28 then
        local v42 = v1.createElement("Frame", {
            ref = v40, 
            [v1.Change.AbsoluteSize] = function(v41) --[[ Line: 116 ]]
                -- upvalues: v37 (copy)
                v37(v41.AbsoluteSize.X);
            end, 
            Size = UDim2.fromScale(1, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            LayoutOrder = v17.LayoutOrder, 
            Selectable = true, 
            [v1.Event.SelectionGained] = v16, 
            SelectionImageObject = v18
        }, {
            Padding = if v22 then v1.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, v26), 
                PaddingTop = UDim.new(0, v26), 
                PaddingRight = UDim.new(0, v26), 
                PaddingBottom = UDim.new(0, v26)
            }) else nil, 
            UIListLayout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, v17.listPadding or 24)
            }), 
            Title = if v22 then nil else v1.createElement(l_StyledTextLabel_0, {
                text = if l_FFlagLuaAppShowNoticeOnEdp_0 then v17.headerText or v20.DescriptionTitle else v20.DescriptionTitle, 
                size = UDim2.fromScale(1, 0), 
                fontStyle = if v13 then v32 else v19.Font.Header1, 
                colorStyle = v19.Theme.TextEmphasis, 
                automaticSize = Enum.AutomaticSize.Y, 
                richText = false, 
                fluidSizing = false
            }), 
            Description = if v17.expandable then v1.createElement(l_ExpandableTextArea_0, {
                Text = v17.descriptionText, 
                compactNumberOfLines = 3, 
                padding = Vector2.new(0, 0), 
                gradientColor = v19.Theme.BackgroundContrast.Color
            }) else v1.createElement(l_StyledTextLabel_0, {
                text = v17.descriptionText, 
                size = UDim2.new(v24, 0, 0, v39), 
                textYAlignment = Enum.TextYAlignment.Top, 
                fontStyle = if v13 then v30 else v19.Font.Body, 
                colorStyle = v19.Theme.TextDefault, 
                automaticSize = if v22 then nil else Enum.AutomaticSize.Y, 
                lineHeight = l_LineHeight_0, 
                richText = false, 
                fluidSizing = false
            })
        });
        if v22 then
            return v1.createElement(v11, {
                title = if l_FFlagLuaAppShowNoticeOnEdp_0 then v17.headerText or v20.DescriptionTitle else v20.DescriptionTitle, 
                onFocusChanged = v17.onFocusChanged
            }, v42);
        else
            return v42;
        end;
    else
        return nil;
    end;
end;
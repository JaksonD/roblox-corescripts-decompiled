local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReporting");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local _ = require(l_script_FirstAncestor_0.Common.Types);
local function v6(v5) --[[ Line: 8 ]] --[[ Name: tokenSelector ]]
    return v5.LuaApps.AbuseReporting or {
        ReportBackground = {}, 
        ReportHeader = {}, 
        ReportActionBar = {}, 
        ReportStep = {}, 
        ReportListSelection = {}, 
        ReportSubmission = {}
    };
end;
return function() --[[ Line: 20 ]]
    -- upvalues: l_useDesignTokens_0 (copy), v6 (copy), v2 (copy)
    local v7 = l_useDesignTokens_0(v6);
    local l_backgroundColor_0 = v7.ReportBackground.backgroundColor;
    local l_gradientRotation_0 = v7.ReportBackground.gradientRotation;
    local l_gradientTransparency_0 = v7.ReportBackground.gradientTransparency;
    local v11 = {
        backgroundColor = l_backgroundColor_0, 
        gradientRotation = l_gradientRotation_0, 
        gradientTransparency = l_gradientTransparency_0
    };
    local l_size_0 = v7.ReportHeader.size;
    local l_verticalPadding_0 = v7.ReportHeader.verticalPadding;
    local l_titleFontStyle_0 = v7.ReportHeader.titleFontStyle;
    local l_subtitleFontStyle_0 = v7.ReportHeader.subtitleFontStyle;
    local l_titleTextColor_0 = v7.ReportHeader.titleTextColor;
    local l_subtitleTextColor_0 = v7.ReportHeader.subtitleTextColor;
    local l_dividerColor_0 = v7.ReportHeader.dividerColor;
    local l_dividerHeight_0 = v7.ReportHeader.dividerHeight;
    local l_dividerVerticalPadding_0 = v7.ReportHeader.dividerVerticalPadding;
    local v21 = {
        size = l_size_0, 
        verticalPadding = l_verticalPadding_0, 
        titleFontStyle = l_titleFontStyle_0, 
        subtitleFontStyle = l_subtitleFontStyle_0, 
        titleTextColor = l_titleTextColor_0, 
        subtitleTextColor = l_subtitleTextColor_0, 
        dividerColor = l_dividerColor_0, 
        dividerHeight = l_dividerHeight_0, 
        dividerVerticalPadding = l_dividerVerticalPadding_0
    };
    local l_size_1 = v7.ReportActionBar.size;
    local l_buttonListHorizontalPadding_0 = v7.ReportActionBar.buttonListHorizontalPadding;
    local l_buttonHeight_0 = v7.ReportActionBar.buttonHeight;
    local l_buttonWidth_0 = v7.ReportActionBar.buttonWidth;
    local v26 = {
        size = l_size_1, 
        buttonListHorizontalPadding = l_buttonListHorizontalPadding_0, 
        buttonHeight = l_buttonHeight_0, 
        buttonWidth = l_buttonWidth_0
    };
    local l_size_2 = v7.ReportStep.size;
    local l_headerFontStyle_0 = v7.ReportStep.headerFontStyle;
    local l_headerTextColor_0 = v7.ReportStep.headerTextColor;
    local l_verticalPadding_1 = v7.ReportStep.verticalPadding;
    local v31 = {
        size = l_size_2, 
        headerFontStyle = l_headerFontStyle_0, 
        headerTextColor = l_headerTextColor_0, 
        verticalPadding = l_verticalPadding_1
    };
    local l_listEntrySize_0 = v7.ReportListSelection.listEntrySize;
    local v33 = {
        listEntrySize = l_listEntrySize_0
    };
    local l_entryTitleColor_0 = v7.ReportSubmission.entryTitleColor;
    local l_entryTextColor_0 = v7.ReportSubmission.entryTextColor;
    local l_entryFontStyle_0 = v7.ReportSubmission.entryFontStyle;
    local l_entrySize_0 = v7.ReportSubmission.entrySize;
    local l_entryInnerVerticalPadding_0 = v7.ReportSubmission.entryInnerVerticalPadding;
    local l_dividerHeight_1 = v7.ReportSubmission.dividerHeight;
    local l_dividerColor_1 = v7.ReportSubmission.dividerColor;
    local l_dividerVerticalPadding_1 = v7.ReportSubmission.dividerVerticalPadding;
    local v42 = {
        entrySize = l_entrySize_0, 
        entryTitleColor = l_entryTitleColor_0, 
        entryTextColor = l_entryTextColor_0, 
        entryFontStyle = l_entryFontStyle_0, 
        entryInnerVerticalPadding = l_entryInnerVerticalPadding_0, 
        dividerHeight = l_dividerHeight_1, 
        dividerColor = l_dividerColor_1, 
        dividerVerticalPadding = l_dividerVerticalPadding_1
    };
    return v2.useMemo(function() --[[ Line: 112 ]]
        -- upvalues: l_backgroundColor_0 (copy), l_gradientRotation_0 (copy), l_gradientTransparency_0 (copy), l_size_0 (copy), l_verticalPadding_0 (copy), l_titleFontStyle_0 (copy), l_subtitleFontStyle_0 (copy), l_titleTextColor_0 (copy), l_subtitleTextColor_0 (copy), l_dividerColor_0 (copy), l_dividerHeight_0 (copy), l_dividerVerticalPadding_0 (copy), l_size_1 (copy), l_buttonListHorizontalPadding_0 (copy), l_buttonHeight_0 (copy), l_buttonWidth_0 (copy), l_size_2 (copy), l_headerFontStyle_0 (copy), l_headerTextColor_0 (copy), l_verticalPadding_1 (copy), l_listEntrySize_0 (copy), l_entrySize_0 (copy), l_entryTitleColor_0 (copy), l_entryTextColor_0 (copy), l_entryFontStyle_0 (copy), l_entryInnerVerticalPadding_0 (copy), l_dividerHeight_1 (copy), l_dividerColor_1 (copy), l_dividerVerticalPadding_1 (copy)
        return {
            ReportBackground = {
                backgroundColor = l_backgroundColor_0, 
                gradientRotation = l_gradientRotation_0, 
                gradientTransparency = l_gradientTransparency_0
            }, 
            ReportHeader = {
                size = l_size_0, 
                verticalPadding = l_verticalPadding_0, 
                titleFontStyle = l_titleFontStyle_0, 
                subtitleFontStyle = l_subtitleFontStyle_0, 
                titleTextColor = l_titleTextColor_0, 
                subtitleTextColor = l_subtitleTextColor_0, 
                dividerColor = l_dividerColor_0, 
                dividerHeight = l_dividerHeight_0, 
                dividerVerticalPadding = l_dividerVerticalPadding_0
            }, 
            ReportActionBar = {
                size = l_size_1, 
                buttonListHorizontalPadding = l_buttonListHorizontalPadding_0, 
                buttonHeight = l_buttonHeight_0, 
                buttonWidth = l_buttonWidth_0
            }, 
            ReportStep = {
                size = l_size_2, 
                headerFontStyle = l_headerFontStyle_0, 
                headerTextColor = l_headerTextColor_0, 
                verticalPadding = l_verticalPadding_1
            }, 
            ReportListSelection = {
                listEntrySize = l_listEntrySize_0
            }, 
            ReportSubmission = {
                entrySize = l_entrySize_0, 
                entryTitleColor = l_entryTitleColor_0, 
                entryTextColor = l_entryTextColor_0, 
                entryFontStyle = l_entryFontStyle_0, 
                entryInnerVerticalPadding = l_entryInnerVerticalPadding_0, 
                dividerHeight = l_dividerHeight_1, 
                dividerColor = l_dividerColor_1, 
                dividerVerticalPadding = l_dividerVerticalPadding_1
            }
        };
    end, {
        v11, 
        v21, 
        v26, 
        v31, 
        v33, 
        v42
    });
end;
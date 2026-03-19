local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_Parent_0 = script.Parent.Parent.Parent;
local v6 = require(l_Parent_0.Resources.FTUXSlideshowData);
local _ = require(l_Parent_0.Enums.PlatformEnum);
return function(v8) --[[ Line: 19 ]] --[[ Name: Title ]]
    -- upvalues: l_useStyle_0 (copy), v6 (copy), l_withLocalization_0 (copy), v1 (copy), v2 (copy)
    local v9 = l_useStyle_0();
    local l_Theme_0 = v9.Theme;
    local l_Font_0 = v9.Font;
    local l_title_0 = v6[v8.platform][v8.currentIndex].title;
    return l_withLocalization_0({
        titleText = l_title_0
    })(function(v13) --[[ Line: 30 ]]
        -- upvalues: v1 (ref), v2 (ref), l_Font_0 (copy), l_Theme_0 (copy)
        return v1.createElement(v2.App.Text.StyledTextLabel, {
            text = v13.titleText, 
            fontStyle = l_Font_0.SubHeader1, 
            colorStyle = l_Theme_0.TextEmphasis, 
            textXAlignment = Enum.TextXAlignment.Left, 
            size = UDim2.new(1, 0, 0.031, 0), 
            layoutOrder = 1
        });
    end);
end;
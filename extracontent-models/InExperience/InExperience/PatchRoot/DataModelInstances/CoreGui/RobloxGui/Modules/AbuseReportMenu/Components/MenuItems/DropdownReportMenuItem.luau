local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local v3 = require(l_CorePackages_0.Packages.React);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_DropdownMenu_0 = v2.App.Menu.DropdownMenu;
local v6 = require(l_script_FirstAncestor_0.Components.MenuItems.ReportMenuItem);
local l_useStyle_0 = v2.Core.Style.useStyle;
local v8 = require(l_script_FirstAncestor_0.Utility.getMenuItemSizings);
local v9 = require(l_script_FirstAncestor_0.Flags.FFlagHideShortcutsOnReportDropdown);
local v10 = require(l_CorePackages_0.Packages.Cryo);
return function(v11) --[[ Line: 29 ]] --[[ Name: DropdownReportMenuItem ]]
    -- upvalues: l_useStyle_0 (copy), v8 (copy), v3 (copy), l_AppFonts_0 (copy), l_DropdownMenu_0 (copy), v10 (copy), v9 (copy), v6 (copy)
    local l_Theme_0 = l_useStyle_0().Theme;
    local v13 = v8();
    local v15 = if v11.readonlyValue ~= nil then v3.createElement("TextLabel", {
        Text = v11.readonlyValue, 
        Font = l_AppFonts_0.default:getMedium(), 
        TextColor3 = l_Theme_0.TextEmphasis.Color, 
        TextTransparency = l_Theme_0.TextMuted.Transparency, 
        TextSize = v13.DropdownTextSize, 
        TextWrapped = true, 
        TextXAlignment = if v11.isSmallPortraitViewport then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, v11.minHeight), 
        BackgroundTransparency = 1
    }) else v3.createElement(l_DropdownMenu_0, {
        placeholder = v11.placeholderText, 
        onChange = v11.onSelect, 
        height = UDim.new(0, 48), 
        screenSize = Vector2.new(2400, 1800), 
        errorState = false, 
        showDropShadow = true, 
        fixedListHeight = 180, 
        cellDatas = v10.List.map(v11.selections, function(v14) --[[ Line: 58 ]]
            return {
                text = v14
            };
        end), 
        onMenuOpenChange = if v9 then v11.onMenuOpenChange else nil
    });
    return v3.createElement(v6, {
        label = v11.label, 
        layoutOrder = v11.layoutOrder, 
        rightComponent = v15, 
        menuContainerWidth = v11.menuContainerWidth, 
        isSmallPortraitViewport = v11.isSmallPortraitViewport
    });
end;
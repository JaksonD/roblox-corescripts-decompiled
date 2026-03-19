local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.AvatarExperience.Catalog.Components.Search.ResultsHeader);
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
return function(v5) --[[ Line: 15 ]] --[[ Name: WidgetListResultsHeader ]]
    -- upvalues: l_useTokens_0 (copy), v2 (copy), v3 (copy)
    local v6 = l_useTokens_0();
    return v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1
    }, {
        UIListLayout = v2.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, v6.Size.Size_300), 
            PaddingTop = if not v5.pillBarVisible then UDim.new(0, v6.Size.Size_500) else nil
        }), 
        ResultsHeader = if v5.hideResultsHeader then nil else v2.createElement(v3, {
            searchUuid = v5.searchUuid
        })
    });
end;
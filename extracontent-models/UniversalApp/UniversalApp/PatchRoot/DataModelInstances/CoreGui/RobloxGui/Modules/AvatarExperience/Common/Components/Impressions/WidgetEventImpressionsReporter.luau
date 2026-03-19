local l_CorePackages_0 = game:GetService("CorePackages");
local l_ImpressionEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums;
return function(v2, v3) --[[ Line: 4 ]] --[[ Name: WidgetEventImpressionsReporter ]]
    -- upvalues: l_ImpressionEnums_0 (copy)
    local l_ITEM_IMPRESSION_0 = l_ImpressionEnums_0.ActionType.ITEM_IMPRESSION;
    v2.widgetInteractionV2(v3, l_ITEM_IMPRESSION_0);
end;
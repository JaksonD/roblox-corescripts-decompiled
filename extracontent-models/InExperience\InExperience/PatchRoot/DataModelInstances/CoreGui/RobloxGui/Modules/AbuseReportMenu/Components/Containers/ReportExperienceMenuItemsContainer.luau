local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.MenuConfigs.getMenuItemsFromConfigs);
local v4 = require(l_script_FirstAncestor_0.Utility.getMenuItemSizings);
local v5 = require(l_script_FirstAncestor_0.MenuConfigs.Experience.ReportExperienceMenuItemConfigList);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v7 = require(l_script_FirstAncestor_0.Components.Constants);
local v8 = require(l_CorePackages_0.Packages.Cryo);
local v9 = require(l_script_FirstAncestor_0.Reducers.reportExperienceUIStateReducer);
return function(v10) --[[ Line: 17 ]] --[[ Name: ReportExperienceMenuItemsContainer ]]
    -- upvalues: v4 (copy), v2 (copy), v9 (copy), v7 (copy), v3 (copy), v5 (copy), v8 (copy)
    local v11 = v4();
    local v12, v13 = v2.useReducer(v9, v7.InitExperienceUIState);
    v2.useEffect(function() --[[ Line: 21 ]]
        -- upvalues: v10 (copy), v7 (ref)
        if v10.utilityProps.isReportTabVisible then
            v10.utilityProps.analyticsDispatch({
                type = v7.AnalyticsActions.SwitchToExperienceInitialSelections
            });
        end;
    end, {
        v10.utilityProps.isReportTabVisible
    });
    local v14 = v3(v12, v13, v10.utilityProps, v5, v10.isSmallPortraitViewport);
    local v15 = v8.Dictionary.join({
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, v11.ItemPadding)
        })
    }, v14);
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        MenuItems = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        }, v15)
    });
end;
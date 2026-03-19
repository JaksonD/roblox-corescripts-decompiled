local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetWidgetInfo);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ClearWidgetInfo);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Actions.RemoveWidgetInfo);
local v9 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveLook);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ReceivedRecentlyViewedItemsData);
local l_AXRecentlyViewedSearchItemsIXPTest_0 = v4.Experiments.AXRecentlyViewedSearchItemsIXPTest;
local l_FFlagAXFixRemoveLookOnMySharedAvatars_0 = v5.FFlagAXFixRemoveLookOnMySharedAvatars;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
return (v2.createReducer({}, {
    [v6.name] = function(v14, v15) --[[ Line: 42 ]]
        -- upvalues: v3 (copy)
        if not v15.context then
            return v14;
        else
            local v16 = {
                Details = v15.widgetInfo, 
                RequestId = v15.requestId, 
                FetchTime = tick(), 
                Configuration = v15.configuration
            };
            return v3.Dictionary.join(v14, {
                [v15.context] = v16
            });
        end;
    end, 
    [v7.name] = function(v17, v18) --[[ Line: 56 ]]
        -- upvalues: v3 (copy)
        if not v18.context then
            return v17;
        else
            return v3.Dictionary.join(v17, {
                [v18.context] = v3.None
            });
        end;
    end, 
    [v8.name] = function(v19, v20) --[[ Line: 64 ]]
        -- upvalues: v3 (copy)
        local l_widgetId_0 = v20.widgetId;
        local v22 = {};
        for v23, v24 in v19 do
            local v25 = {};
            for v26, v27 in v24.Details do
                if v27.id == l_widgetId_0 then
                    v25[v26] = v3.None;
                end;
            end;
            v22[v23] = v3.Dictionary.join(v24, {
                Details = v3.Dictionary.join(v24.Details, v25)
            });
        end;
        return v22;
    end, 
    [v9.name] = function(v28, v29) --[[ Line: 84 ]]
        -- upvalues: v3 (copy), l_FFlagAXFixRemoveLookOnMySharedAvatars_0 (copy)
        local v30 = table.clone(v28);
        for v31, v32 in pairs(v28) do
            local v33 = {};
            for v34, v35 in pairs(v32.Details) do
                if v35.content then
                    local v36 = {};
                    for _, v38 in v35.content do
                        if v38.id ~= v29.lookId then
                            table.insert(v36, v38);
                        end;
                    end;
                    v33[v34] = v3.Dictionary.join(v35, {
                        content = v36
                    });
                end;
            end;
            if l_FFlagAXFixRemoveLookOnMySharedAvatars_0 then
                v30[v31] = v3.Dictionary.join(v32, {
                    Details = v33
                });
            else
                v30[v31].Details = v3.Dictionary.join(v32.Details, v33);
            end;
        end;
        return v30;
    end, 
    [v10.name] = l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() and function(v39, v40) --[[ Line: 116 ]]
        -- upvalues: v3 (copy)
        local l_widget_0 = v40.widget;
        local v42 = {
            Details = l_widget_0.widgetInfo, 
            RequestId = l_widget_0.requestId, 
            FetchTime = tick()
        };
        return v3.Dictionary.join(v39, {
            [l_widget_0.context] = v42
        });
    end or nil
}));
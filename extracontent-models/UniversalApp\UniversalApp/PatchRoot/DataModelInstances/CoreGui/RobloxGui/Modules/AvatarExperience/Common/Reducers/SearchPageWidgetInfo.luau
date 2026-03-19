local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetWidgetInfo);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ClearWidgetInfo);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Actions.RemoveWidgetInfo);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
return (v2.createReducer({}, {
    [v4.name] = function(v8, v9) --[[ Line: 34 ]]
        -- upvalues: v3 (copy)
        if not v9.query then
            return v8;
        else
            local v10 = {
                Details = v9.widgetInfo, 
                RequestId = v9.requestId, 
                FetchTime = tick(), 
                Configuration = v9.configuration
            };
            return v3.Dictionary.join(v8, {
                [v9.query] = v10
            });
        end;
    end, 
    [v5.name] = function(v11, v12) --[[ Line: 48 ]]
        -- upvalues: v3 (copy)
        if not v12.query then
            return v11;
        else
            return v3.Dictionary.join(v11, {
                [v12.query] = v3.None
            });
        end;
    end, 
    [v6.name] = function(v13, v14) --[[ Line: 56 ]]
        -- upvalues: v3 (copy)
        local l_widgetId_0 = v14.widgetId;
        local v16 = {};
        for v17, v18 in v13 do
            local v19 = {};
            for v20, v21 in v18.Details do
                if v21.id == l_widgetId_0 then
                    v19[v20] = v3.None;
                end;
            end;
            v16[v17] = v3.Dictionary.join(v18, {
                Details = v3.Dictionary.join(v18.Details, v19)
            });
        end;
        return v16;
    end
}));
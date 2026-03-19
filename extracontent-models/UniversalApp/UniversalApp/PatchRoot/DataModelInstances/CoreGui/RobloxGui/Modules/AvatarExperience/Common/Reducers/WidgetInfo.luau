local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetWidgetInfo);
local v5 = require(l_Modules_0.AvatarExperience.Catalog.Actions.ClearWidgetInfo);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Actions.RemoveWidgetInfo);
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local v8 = {
    Details = {}, 
    RequestId = nil, 
    FetchTime = nil, 
    Configuration = nil
};
return (v2.createReducer(v8, {
    [v4.name] = function(v9, v10) --[[ Line: 37 ]]
        if v10.query or v10.context then
            return v9;
        else
            return {
                Details = v10.widgetInfo, 
                RequestId = v10.requestId, 
                FetchTime = tick(), 
                Configuration = v10.configuration
            };
        end;
    end, 
    [v5.name] = function(v11, v12) --[[ Line: 50 ]]
        if v12.query or v12.context then
            return v11;
        else
            return {
                Details = {}
            };
        end;
    end, 
    [v6.name] = function(v13, v14) --[[ Line: 60 ]]
        -- upvalues: v3 (copy)
        local l_widgetId_0 = v14.widgetId;
        local v16 = {};
        for v17, v18 in v13.Details do
            if v18.id == l_widgetId_0 then
                v16[v17] = v3.None;
            end;
        end;
        return v3.Dictionary.join(v13, {
            Details = v3.Dictionary.join(v13.Details, v16)
        });
    end
}));
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Rodux);
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.Dash);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v6 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetHydratedWidgetData);
local v7 = require(l_Modules_0.AvatarExperience.Common.Actions.UpdateLookDetailsAfterSuccessfulPurchase);
local v8 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local v9 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveLook);
local l_FFlagAXFixRemoveLookOnMySharedAvatars_0 = v5.FFlagAXFixRemoveLookOnMySharedAvatars;
return (v2.createReducer({}, {
    [v6.name] = function(v11, v12) --[[ Line: 32 ]]
        -- upvalues: v4 (copy)
        local v13 = {};
        for v14, v15 in v12.payload do
            v13[v14] = v4.joinDeep(v11[v14] or {}, v15);
        end;
        return v4.join(v11, v13);
    end, 
    [v7.name] = function(v16, v17) --[[ Line: 47 ]]
        -- upvalues: v8 (copy), v4 (copy)
        local l_lookId_0 = v17.lookId;
        local l_isOwnedAfterPurchase_0 = v17.isOwnedAfterPurchase;
        if not l_isOwnedAfterPurchase_0 then
            return v16;
        else
            local l_Look_0 = v8.ContentType.Look;
            local v21 = v16[l_Look_0] or {};
            local v22 = v21[l_lookId_0] or {};
            local v23 = v4.join(v22, {
                owned = l_isOwnedAfterPurchase_0
            });
            local v24 = v4.join(v21, {
                [l_lookId_0] = v23
            });
            return (v4.join(v16, {
                [l_Look_0] = v24
            }));
        end;
    end, 
    [v9.name] = function(v25, v26) --[[ Line: 74 ]]
        -- upvalues: v8 (copy), l_FFlagAXFixRemoveLookOnMySharedAvatars_0 (copy), v4 (copy), v3 (copy)
        local l_lookId_1 = v26.lookId;
        local l_Look_1 = v8.ContentType.Look;
        local v29 = v25[l_Look_1] or {};
        local v30 = nil;
        if l_FFlagAXFixRemoveLookOnMySharedAvatars_0 then
            v30 = table.clone(v29);
            v30[l_lookId_1] = nil;
        else
            v30 = v4.join(v29, {
                [l_lookId_1] = v3.None
            });
        end;
        return (v4.join(v25, {
            [l_Look_1] = v30
        }));
    end
}));
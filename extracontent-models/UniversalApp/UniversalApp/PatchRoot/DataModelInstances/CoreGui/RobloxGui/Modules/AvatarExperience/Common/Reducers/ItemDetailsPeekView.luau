local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.Cryo);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v4 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v6 = require(l_CorePackages_0.Packages.Rodux);
local v7 = require(l_Modules_0.AvatarExperience.Common.Actions.SetItemDetailsPeekViewState);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetItemTryOnPeekViewState);
local v9 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTryOnManagerPeekViewState);
local v10 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetLookDetailsPeekViewSelectedTab);
local l_CharacterHistoryStateChangeButtonActivated_0 = v4.State.Actions.CharacterHistoryStateChangeButtonActivated;
if v5.FFlagAXRootSlotBasedEditorFlag then
    local v12 = {
        viewState = l_PeekViewState_0.Closed, 
        tryOnViewState = l_PeekViewState_0.Closed, 
        tryOnManagerViewState = l_PeekViewState_0.Closed, 
        lookDetailsSelectedTab = 2
    };
    return v6.createReducer(v12, {
        [v7.name] = function(v13, v14) --[[ Line: 45 ]]
            -- upvalues: v2 (copy)
            return v2.Dictionary.join(v13, {
                viewState = v14.viewState
            });
        end, 
        [v8.name] = function(v15, v16) --[[ Line: 50 ]]
            -- upvalues: v2 (copy)
            return v2.Dictionary.join(v15, {
                tryOnViewState = v16.viewState
            });
        end, 
        [v9.name] = function(v17, v18) --[[ Line: 55 ]]
            -- upvalues: v2 (copy)
            return v2.Dictionary.join(v17, {
                tryOnManagerViewState = v18.viewState
            });
        end, 
        [v10.name] = function(v19, v20) --[[ Line: 60 ]]
            -- upvalues: v2 (copy)
            return v2.Dictionary.join(v19, {
                lookDetailsSelectedTab = v20.selectedTab
            });
        end, 
        [l_CharacterHistoryStateChangeButtonActivated_0.name] = function(v21, v22) --[[ Line: 65 ]]
            -- upvalues: v2 (copy), l_PeekViewState_0 (copy)
            if v22.tryOn and v22.tryOn.OutfitTryOn then
                local l_LookId_0 = v22.tryOn.OutfitTryOn.LookId;
                local v24 = false;
                if l_LookId_0 ~= nil then
                    v24 = l_LookId_0 ~= v2.None;
                end;
                local v25 = v24 and v21.tryOnManagerViewState == l_PeekViewState_0.Closed;
                local v26 = not v24 and v21.tryOnManagerViewState ~= l_PeekViewState_0.Closed;
                return v2.Dictionary.join(v21, {
                    tryOnManagerViewState = if v25 then l_PeekViewState_0.SuperBrief else if v26 then l_PeekViewState_0.Closed else v21.tryOnManagerViewState
                });
            else
                return v21;
            end;
        end
    });
else
    return function(v27, v28) --[[ Line: 87 ]]
        -- upvalues: l_PeekViewState_0 (copy), v7 (copy), v2 (copy), v8 (copy), v9 (copy), v10 (copy)
        v27 = v27 or {
            viewState = l_PeekViewState_0.Closed, 
            tryOnViewState = l_PeekViewState_0.Closed, 
            tryOnManagerViewState = l_PeekViewState_0.Closed, 
            lookDetailsSelectedTab = 2
        };
        if v28.type == v7.name then
            return (v2.Dictionary.join(v27, {
                viewState = v28.viewState
            }));
        elseif v28.type == v8.name then
            return (v2.Dictionary.join(v27, {
                tryOnViewState = v28.viewState
            }));
        elseif v28.type == v9.name then
            return (v2.Dictionary.join(v27, {
                tryOnManagerViewState = v28.viewState
            }));
        else
            if v28.type == v10.name then
                v27 = v2.Dictionary.join(v27, {
                    lookDetailsSelectedTab = v28.selectedTab
                });
            end;
            return v27;
        end;
    end;
end;
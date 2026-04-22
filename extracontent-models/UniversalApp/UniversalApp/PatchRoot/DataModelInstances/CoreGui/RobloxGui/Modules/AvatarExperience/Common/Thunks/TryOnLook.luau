local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_SetTryOnManagerPeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux).Actions.SetTryOnManagerPeekViewState;
local v7 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v10 = require(l_Modules_0.AvatarExperience.Common.Actions.AddLookDetails);
local v11 = require(l_Modules_0.AvatarExperience.Common.Actions.TryOnLooksOutfit);
local v12 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_NavigateWithLock_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock;
local v14 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v15 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v16 = require(l_Modules_0.LuaApp.Promise);
local v17 = require(l_CorePackages_0.Packages.Cryo);
local function _(v18) --[[ Line: 33 ]] --[[ Name: keyMapper ]]
    -- upvalues: v7 (copy)
    return v7.FetchLookDetailInfoKey .. v18;
end;
return function(v20, v21, v22, v23) --[[ Line: 37 ]]
    -- upvalues: l_PerformFetch_0 (copy), v7 (copy), v8 (copy), l_Logging_0 (copy), v14 (copy), v15 (copy), v10 (copy), l_SetTryOnManagerPeekViewState_0 (copy), l_PeekViewState_0 (copy), v11 (copy), v17 (copy), v12 (copy), l_AvatarScreen_0 (copy), l_NavigateWithLock_0 (copy), v16 (copy)
    return function(v24) --[[ Line: 38 ]]
        -- upvalues: l_PerformFetch_0 (ref), v23 (copy), v7 (ref), v8 (ref), v20 (copy), l_Logging_0 (ref), v14 (ref), v15 (ref), v10 (ref), l_SetTryOnManagerPeekViewState_0 (ref), l_PeekViewState_0 (ref), v11 (ref), v22 (copy), v17 (ref), v21 (copy), v12 (ref), l_AvatarScreen_0 (ref), l_NavigateWithLock_0 (ref), v16 (ref)
        local l_Single_0 = l_PerformFetch_0.Single;
        local l_v23_0 = v23;
        return l_Single_0(v7.FetchLookDetailInfoKey .. l_v23_0, function(v27) --[[ Line: 39 ]]
            -- upvalues: v8 (ref), v20 (ref), v23 (ref), l_Logging_0 (ref), v14 (ref), v15 (ref), v10 (ref), l_SetTryOnManagerPeekViewState_0 (ref), l_PeekViewState_0 (ref), v11 (ref), v22 (ref), v17 (ref), v21 (ref), v12 (ref), l_AvatarScreen_0 (ref), l_NavigateWithLock_0 (ref), v16 (ref)
            return v8.GetLookDetails(v20, v23):andThen(function(v28) --[[ Line: 40 ]]
                -- upvalues: l_Logging_0 (ref), v27 (copy), v14 (ref), v15 (ref), v10 (ref), v23 (ref), l_SetTryOnManagerPeekViewState_0 (ref), l_PeekViewState_0 (ref), v11 (ref), v22 (ref), v17 (ref), v21 (ref), v12 (ref), l_AvatarScreen_0 (ref), l_NavigateWithLock_0 (ref), v16 (ref)
                local l_look_0 = v28.responseBody.look;
                if l_look_0 == nil then
                    l_Logging_0.warn("Unexpectedly received an empty response from Look Details");
                    v27:dispatch(v14({
                        isLocalized = false, 
                        toastType = v15.NetworkingError, 
                        toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong"
                    }));
                    return;
                else
                    v27:dispatch(v10(v23, l_look_0.totalPrice, l_look_0.totalPremiumPrice, l_look_0.items));
                    local v30 = {};
                    for _, v32 in l_look_0.items do
                        table.insert(v30, {
                            itemType = "Asset", 
                            itemSubType = tostring(v32.assetType), 
                            itemId = tostring(v32.id)
                        });
                    end;
                    v27:dispatch(l_SetTryOnManagerPeekViewState_0(l_PeekViewState_0.SuperBrief));
                    v27:dispatch(v11({
                        assetItemIdTypeAndSubtype = v30, 
                        lookId = v23, 
                        analyticsInfo = v22, 
                        lookType = v17.None
                    }));
                    if v21 ~= nil then
                        v27:dispatch(l_NavigateWithLock_0(function() --[[ Line: 78 ]]
                            -- upvalues: v12 (ref), v21 (ref), l_AvatarScreen_0 (ref)
                            v12.closeFiltersAndItemDetails(v21);
                            v12.closeTryOnManager(v21, {
                                l_AvatarScreen_0.LookDetails
                            });
                            v21.navigate(l_AvatarScreen_0.TryOnManager);
                        end));
                    end;
                    return v16.resolve();
                end;
            end, function(_) --[[ Line: 87 ]]
                -- upvalues: l_Logging_0 (ref), v27 (copy), v14 (ref), v15 (ref)
                l_Logging_0.warn("Error in TryOnLook thunk");
                v27:dispatch(v14({
                    isLocalized = false, 
                    toastType = v15.NetworkingError, 
                    toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong"
                }));
            end);
        end)(v24);
    end;
end;
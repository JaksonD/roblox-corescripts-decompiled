local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v4 = require(l_CorePackages_0.Packages.Promise);
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Http.WebApi);
local l_sendAXCounterV2_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2;
local v9 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v10 = require(l_Modules_0.LuaApp.Enum.ToastType);
return function(v11) --[[ Line: 20 ]]
    -- upvalues: l_PerformFetch_0 (copy), v5 (copy), v4 (copy), v7 (copy), l_HttpService_0 (copy), v9 (copy), v10 (copy), l_sendAXCounterV2_0 (copy), v6 (copy)
    return l_PerformFetch_0.Single("CreateLook", function(v12) --[[ Line: 21 ]]
        -- upvalues: v5 (ref), v4 (ref), v7 (ref), v11 (copy), l_HttpService_0 (ref), v9 (ref), v10 (ref), l_sendAXCounterV2_0 (ref), v6 (ref)
        local v13 = v12:getState().AvatarExperience.AvatarScene.Looks[v5.DraftLookId];
        if not v13 then
            return v4.reject("Draft look doesn't exist");
        else
            local v14 = {};
            for v15, v16 in v13.lookAssetInfos do
                table.insert(v14, {
                    id = v15, 
                    meta = v16.meta
                });
            end;
            for v17, v18 in v13.lookBundleInfos do
                for _, v20 in v18.assetsInBundle do
                    if v20.isIncluded then
                        table.insert(v14, {
                            id = v20.id, 
                            bundleId = v17, 
                            meta = v20.meta
                        });
                    end;
                end;
            end;
            return v7.CreateLook(v11, v14, v13):andThen(function(v21) --[[ Line: 50 ]]
                if v21 and v21.responseBody then
                    return v21.responseBody.id;
                else
                    return nil;
                end;
            end):catch(function(v22) --[[ Line: 54 ]]
                -- upvalues: l_HttpService_0 (ref), v12 (copy), v9 (ref), v10 (ref), l_sendAXCounterV2_0 (ref), v5 (ref), v6 (ref)
                warn("Failed to create look", v22);
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 56 ]]
                    -- upvalues: v22 (copy), l_HttpService_0 (ref)
                    return v22.Body and v22.Body ~= "" and l_HttpService_0:JSONDecode(v22.Body);
                end);
                if l_status_0 and l_result_0 and l_result_0.errorDescription then
                    v12:dispatch(v9({
                        toastMessage = l_result_0.errorDescription, 
                        isLocalized = true, 
                        toastType = v10.InformationMessage
                    }));
                    l_sendAXCounterV2_0(v5.Counter.LookComposer.CreateLook, {
                        errorCode = l_result_0.errorCode
                    });
                    return;
                elseif l_status_0 and l_result_0 and l_result_0.errorCode then
                    l_sendAXCounterV2_0(v5.Counter.LookComposer.CreateLook, {
                        errorCode = l_result_0.errorCode
                    });
                    v12:dispatch(v9({
                        toastMessage = v6.AvatarShareErrorMessagesKeys[l_result_0.errorCode] or "Feature.Avatar.Generic.Error", 
                        isLocalized = false, 
                        toastType = v10.InformationMessage
                    }));
                    return;
                else
                    l_sendAXCounterV2_0(v5.Counter.LookComposer.CreateLook, {
                        errorCode = "none"
                    });
                    return;
                end;
            end);
        end;
    end);
end;
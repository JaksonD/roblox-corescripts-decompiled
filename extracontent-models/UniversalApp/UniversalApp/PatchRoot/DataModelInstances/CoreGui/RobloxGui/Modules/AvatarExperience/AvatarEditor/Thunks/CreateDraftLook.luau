local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v5 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v6 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v7 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v8 = require(l_Modules_0.AvatarExperience.Common.Actions.UpdateLookDetails);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Http.WebApi);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v11 = require(l_Modules_0.AvatarExperience.Common.Util.AvatarWidgetBlockyUtils);
local l_sendAXCounterV2_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2;
local l_Localization_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppLocales).Localization;
local v14 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v15 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v16 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v17 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveLook);
local v18 = game:DefineFastFlag("AXLookPreviewWarningToasts", false);
local l_FFlagParseHeadShapeFromAPIResponse_0 = v14.FFlagParseHeadShapeFromAPIResponse;
local function v24(v20, v21) --[[ Line: 33 ]] --[[ Name: translateString ]]
    -- upvalues: l_LocalizationService_0 (copy), l_Localization_0 (copy)
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    local v23 = l_Localization_0.new(l_RobloxLocaleId_0);
    v23:SetLocale(l_RobloxLocaleId_0);
    return v23:Format(v20, v21);
end;
return function(v25) --[[ Line: 41 ]]
    -- upvalues: l_PerformFetch_0 (copy), l_FFlagParseHeadShapeFromAPIResponse_0 (copy), v17 (copy), v5 (copy), v9 (copy), v18 (copy), v15 (copy), v16 (copy), v7 (copy), v6 (copy), v11 (copy), v24 (copy), v8 (copy), l_HttpService_0 (copy), l_sendAXCounterV2_0 (copy)
    return l_PerformFetch_0.Single("PreviewLook", function(v26) --[[ Line: 42 ]]
        -- upvalues: l_FFlagParseHeadShapeFromAPIResponse_0 (ref), v17 (ref), v5 (ref), v9 (ref), v25 (copy), v18 (ref), v15 (ref), v16 (ref), v7 (ref), v6 (ref), v11 (ref), v24 (ref), v8 (ref), l_HttpService_0 (ref), l_sendAXCounterV2_0 (ref)
        local v27 = v26:getState();
        local l_EquippedAssets_0 = v27.AvatarExperience.AvatarEditor.Character.EquippedAssets;
        local l_BodyColor3s_0 = v27.AvatarExperience.AvatarEditor.Character.BodyColor3s;
        local l_AvatarScales_0 = v27.AvatarExperience.AvatarEditor.Character.AvatarScales;
        local v31 = {};
        for _, v33 in l_EquippedAssets_0 do
            for v34, v35 in v33 do
                local v36 = {
                    id = v34
                };
                if v35.isLayered or l_FFlagParseHeadShapeFromAPIResponse_0 and v35.headShape ~= nil then
                    v36.meta = {
                        order = v35.order, 
                        version = tonumber(v35.version)
                    };
                    if l_FFlagParseHeadShapeFromAPIResponse_0 then
                        v36.meta.headShape = v35.headShape;
                    end;
                end;
                table.insert(v31, v36);
            end;
        end;
        v26:dispatch(v17(v5.DraftLookId));
        return v9.GetPreviewLook(v25, v31):andThen(function(v37) --[[ Line: 66 ]]
            -- upvalues: v18 (ref), v26 (copy), v15 (ref), v16 (ref), v27 (copy), v5 (ref), v7 (ref), v6 (ref), l_AvatarScales_0 (copy), v11 (ref), v24 (ref), l_BodyColor3s_0 (copy), v8 (ref)
            if v18 then
                local v38 = v37 and v37.responseBody and v37.responseBody.warnings;
                if v38 then
                    for _, v40 in v38 do
                        v26:dispatch(v15({
                            toastMessage = v40.errorDescription, 
                            isLocalized = true, 
                            toastType = v16.InformationMessage
                        }));
                    end;
                end;
            end;
            local v41 = if v37 and v37.responseBody then v37.responseBody.look else nil;
            if not v41 then
                return;
            else
                local l_LocalUserId_0 = v27.LocalUserId;
                local v43 = v27.Users[l_LocalUserId_0];
                local v44 = {
                    lookType = v5.LookType.Avatar, 
                    totalValue = v41.totalValue, 
                    totalPrice = v41.totalPrice, 
                    curator = if v43 then {
                        type = v7.CreatorType.User, 
                        id = tonumber(l_LocalUserId_0), 
                        name = v43.displayName, 
                        hasVerifiedBadge = v43.hasVerifiedBadge
                    } else nil, 
                    lookAssetInfos = {}, 
                    lookBundleInfos = {}, 
                    avatarProperties = {
                        bodyColor3s = {}, 
                        playerAvatarType = v6.AvatarType.R15, 
                        scale = l_AvatarScales_0
                    }, 
                    displayProperties = {
                        backgroundType = "None"
                    }
                };
                local v45 = {};
                for _, v47 in v41.items do
                    if v47.itemType == v5.ItemType.Asset then
                        v47.id = tostring(v47.id);
                        v44.lookAssetInfos[v47.id] = v47;
                    elseif v47.itemType == v5.ItemType.Bundle then
                        v47.id = tostring(v47.id);
                        v44.lookBundleInfos[v47.id] = v47;
                        if v45 then
                            table.insert(v45, v47);
                        end;
                    end;
                end;
                if v45 then
                    local v48 = v11.buildBlockyLookDetailItem(v45, v24);
                    if v48 ~= nil then
                        v44.lookBundleInfos[v48.id] = v48;
                    end;
                end;
                for v49, v50 in l_BodyColor3s_0 do
                    v44.avatarProperties.bodyColor3s[v49] = v50:ToHex();
                end;
                v26:dispatch(v8(v5.DraftLookId, v44));
                return true;
            end;
        end):catch(function(v51) --[[ Line: 144 ]]
            -- upvalues: l_HttpService_0 (ref), v26 (copy), v15 (ref), v16 (ref), l_sendAXCounterV2_0 (ref), v5 (ref), v6 (ref)
            warn("Failed to create draft look", v51);
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 146 ]]
                -- upvalues: v51 (copy), l_HttpService_0 (ref)
                return v51.Body and v51.Body ~= "" and l_HttpService_0:JSONDecode(v51.Body);
            end);
            if l_status_0 and l_result_0 and l_result_0.errorDescription then
                v26:dispatch(v15({
                    toastMessage = l_result_0.errorDescription, 
                    isLocalized = true, 
                    toastType = v16.InformationMessage
                }));
                l_sendAXCounterV2_0(v5.Counter.LookComposer.PreviewLook, {
                    errorCode = l_result_0.errorCode
                });
            elseif l_status_0 and l_result_0 and l_result_0.errorCode then
                l_sendAXCounterV2_0(v5.Counter.LookComposer.PreviewLook, {
                    errorCode = l_result_0.errorCode
                });
                v26:dispatch(v15({
                    toastMessage = v6.AvatarShareErrorMessagesKeys[l_result_0.errorCode] or "Feature.Avatar.Generic.Error", 
                    isLocalized = false, 
                    toastType = v16.InformationMessage
                }));
            else
                l_sendAXCounterV2_0(v5.Counter.LookComposer.PreviewLook, {
                    errorCode = "none"
                });
            end;
            return false;
        end);
    end);
end;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_Parent_0.Thunk);
local v4 = require(l_Parent_0.Services.Network);
local v5 = require(l_Parent_0.Thunks.SendCounter);
local v6 = require(l_Parent_0.Constants);
local v7 = require(l_Parent_0.Actions.SetAvatarPreviewDetails);
local v8 = require(l_Parent_0.Models.AssetInfo);
local v9 = require(l_Parent_0.Models.BundleInfo);
local v10 = require(l_Parent_0.Actions.SetAssets);
local v11 = require(l_Parent_0.Actions.SetBundles);
local v12 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceInspectAndBuy);
local v13 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_ItemTypeEnum_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Enums.ItemTypeEnum;
local v15 = require(l_Parent_0.Thunks.GetItemDetails);
local l_FFlagAXEnableBatchItemDetailsFetchV2_0 = v13.FFlagAXEnableBatchItemDetailsFetchV2;
local l_BatchItemDetailsPerformFetchKey_0 = v12.Constants.BatchItemDetailsPerformFetchKey;
local v18 = require(l_Parent_0.Flags.FFlagAXWrapInspectAndBuyThunksInTasks);
local v19 = {
    v4
};
return function(v20) --[[ Line: 33 ]] --[[ Name: GetAvatarPreview ]]
    -- upvalues: v3 (copy), v19 (copy), v4 (copy), l_PerformFetch_0 (copy), v7 (copy), l_FFlagAXEnableBatchItemDetailsFetchV2_0 (copy), v18 (copy), l_ItemTypeEnum_0 (copy), v15 (copy), l_BatchItemDetailsPerformFetchKey_0 (copy), v8 (copy), v9 (copy), v10 (copy), v11 (copy), v5 (copy), v6 (copy)
    return v3.new(script.Name, v19, function(v21, v22) --[[ Line: 34 ]]
        -- upvalues: v4 (ref), v20 (copy), l_PerformFetch_0 (ref), v7 (ref), l_FFlagAXEnableBatchItemDetailsFetchV2_0 (ref), v18 (ref), l_ItemTypeEnum_0 (ref), v15 (ref), l_BatchItemDetailsPerformFetchKey_0 (ref), v8 (ref), v9 (ref), v10 (ref), v11 (ref), v5 (ref), v6 (ref)
        local v23 = v22[v4];
        local v24 = {};
        if v20 then
            for _, v26 in v20 do
                table.insert(v24, {
                    id = v26.assetId, 
                    meta = v26.meta
                });
            end;
        end;
        return l_PerformFetch_0.Single("PreviewAvatar", function() --[[ Line: 47 ]]
            -- upvalues: v23 (copy), v24 (copy), v21 (copy), v7 (ref), l_FFlagAXEnableBatchItemDetailsFetchV2_0 (ref), v18 (ref), l_ItemTypeEnum_0 (ref), v15 (ref), l_PerformFetch_0 (ref), l_BatchItemDetailsPerformFetchKey_0 (ref), v8 (ref), v9 (ref), v10 (ref), v11 (ref), v5 (ref), v6 (ref)
            return v23.getPreviewAvatar(v24):andThen(function(v27) --[[ Line: 48 ]]
                -- upvalues: v21 (ref), v7 (ref), l_FFlagAXEnableBatchItemDetailsFetchV2_0 (ref), v18 (ref), l_ItemTypeEnum_0 (ref), v15 (ref), l_PerformFetch_0 (ref), l_BatchItemDetailsPerformFetchKey_0 (ref), v23 (ref), v8 (ref), v9 (ref), v10 (ref), v11 (ref), v5 (ref), v6 (ref)
                v21:dispatch(v7(v27));
                if not l_FFlagAXEnableBatchItemDetailsFetchV2_0 and v27.look and v27.look.items then
                    for _, v29 in v27.look.items do
                        if v18 then
                            task.spawn(function() --[[ Line: 58 ]]
                                -- upvalues: v29 (copy), l_ItemTypeEnum_0 (ref), v21 (ref), v15 (ref)
                                if v29.itemType == l_ItemTypeEnum_0.Asset then
                                    v21:dispatch(v15(v29.id, Enum.AvatarItemType.Asset));
                                    return;
                                else
                                    if v29.itemType == l_ItemTypeEnum_0.Bundle then
                                        v21:dispatch(v15(v29.id, Enum.AvatarItemType.Bundle));
                                    end;
                                    return;
                                end;
                            end);
                        elseif v29.itemType == l_ItemTypeEnum_0.Asset then
                            v21:dispatch(v15(v29.id, Enum.AvatarItemType.Asset));
                        elseif v29.itemType == l_ItemTypeEnum_0.Bundle then
                            v21:dispatch(v15(v29.id, Enum.AvatarItemType.Bundle));
                        end;
                    end;
                end;
                if l_FFlagAXEnableBatchItemDetailsFetchV2_0 then
                    local v30 = {};
                    if v27.look and v27.look.items then
                        for _, v32 in v27.look.items do
                            table.insert(v30, {
                                itemType = if v32.itemType == l_ItemTypeEnum_0.Asset then Enum.AvatarItemType.Asset.Value else Enum.AvatarItemType.Bundle.Value, 
                                id = tonumber(v32.id) or 0
                            });
                        end;
                    end;
                    l_PerformFetch_0.Single(l_BatchItemDetailsPerformFetchKey_0, function() --[[ Line: 91 ]]
                        -- upvalues: v23 (ref), v30 (copy), v18 (ref), l_ItemTypeEnum_0 (ref), v8 (ref), v9 (ref), v21 (ref), v10 (ref), v11 (ref), v5 (ref), v6 (ref)
                        return v23.getBatchItemDetailsV2(v30):andThen(function(v33) --[[ Line: 94 ]]
                            -- upvalues: v18 (ref), l_ItemTypeEnum_0 (ref), v8 (ref), v9 (ref), v21 (ref), v10 (ref), v11 (ref)
                            if v18 and v33 and v33.data then
                                task.spawn(function() --[[ Line: 96 ]]
                                    -- upvalues: v33 (copy), l_ItemTypeEnum_0 (ref), v8 (ref), v9 (ref), v21 (ref), v10 (ref), v11 (ref)
                                    local v34 = {};
                                    local v35 = {};
                                    for _, v37 in v33.data do
                                        if v37.itemType == l_ItemTypeEnum_0.Asset then
                                            table.insert(v34, v8.fromGetItemDetailsV2(v37));
                                        elseif v37.itemType == l_ItemTypeEnum_0.Bundle then
                                            table.insert(v35, v9.fromGetItemDetailsV2(v37));
                                        end;
                                    end;
                                    v21:dispatch(v10(v34));
                                    v21:dispatch(v11(v35));
                                end);
                                return;
                            else
                                if v33 and v33.data then
                                    local v38 = {};
                                    local v39 = {};
                                    for _, v41 in v33.data do
                                        if v41.itemType == l_ItemTypeEnum_0.Asset then
                                            table.insert(v38, v8.fromGetItemDetailsV2(v41));
                                        elseif v41.itemType == l_ItemTypeEnum_0.Bundle then
                                            table.insert(v39, v9.fromGetItemDetailsV2(v41));
                                        end;
                                    end;
                                    v21:dispatch(v10(v38));
                                    v21:dispatch(v11(v39));
                                end;
                                return;
                            end;
                        end, function(_) --[[ Line: 126 ]]
                            -- upvalues: v21 (ref), v5 (ref), v6 (ref)
                            v21:dispatch(v5(v6.Counters.BatchGetItemDetails .. v6.CounterSuffix.RequestRejected));
                        end);
                    end)(v21);
                    v21:dispatch(v5(v6.Counters.BatchGetItemDetails .. v6.CounterSuffix.RequestSucceeded));
                end;
            end, function(_) --[[ Line: 140 ]]
                -- upvalues: v21 (ref), v5 (ref), v6 (ref)
                v21:dispatch(v5(v6.Counters.GetAvatarPreview .. v6.CounterSuffix.RequestRejected));
            end);
        end)(v21):catch(function(_) --[[ Line: 145 ]]
            -- upvalues: v21 (copy), v5 (ref), v6 (ref)
            v21:dispatch(v5(v6.Counters.GetAvatarPreview .. v6.CounterSuffix.RequestFailed));
        end);
    end);
end;
local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Thunk);
local v2 = require(l_Parent_0.Thunks.GetProductInfo);
local v3 = require(l_Parent_0.Thunks.GetVersionInfo);
local v4 = require(l_Parent_0.Models.AssetInfo);
local v5 = require(l_Parent_0.Actions.SetAssets);
local v6 = require(l_Parent_0.Actions.SetEquippedAssets);
local v7 = require(l_Parent_0.Constants);
local v8 = require(l_Parent_0.Thunks.GetAssetBundles);
local v9 = require(l_Parent_0.Thunks.BatchGetAssets);
local v10 = require(l_Parent_0.Flags.FFlagAXEnableRegionalFilteringofAssets);
local v11 = {};
local function v27(v12) --[[ Line: 18 ]] --[[ Name: getAssetIds ]]
    -- upvalues: v7 (copy), v4 (copy)
    local v13 = {};
    for v14, v15 in pairs(v7.AssetTypeIdStringToHumanoidDescriptionProp) do
        if v7.AssetTypeIdToAccessoryTypeEnum[v14] == nil then
            local v16 = v12[v15] or "";
            for _, v18 in pairs(string.split(v16)) do
                if tonumber(v18) and v18 ~= "0" then
                    table.insert(v13, v4.fromHumanoidDescription(v18));
                end;
            end;
        end;
    end;
    local l_v12_Accessories_0 = v12:GetAccessories(true);
    for _, v21 in pairs(l_v12_Accessories_0) do
        v13[#v13 + 1] = v4.fromHumanoidDescription(v21.AssetId);
    end;
    local l_v12_Emotes_0 = v12:GetEmotes();
    for _, v24 in pairs(l_v12_Emotes_0) do
        for _, v26 in pairs(v24) do
            v13[#v13 + 1] = v4.fromHumanoidDescription(v26);
        end;
    end;
    return v13;
end;
return function(v28, v29) --[[ Line: 52 ]] --[[ Name: GetAssetsFromHumanoidDescription ]]
    -- upvalues: v1 (copy), v11 (copy), v27 (copy), v10 (copy), v9 (copy), v2 (copy), v8 (copy), v3 (copy), v5 (copy), v6 (copy)
    return v1.new(script.Name, v11, function(v30, _) --[[ Line: 53 ]]
        -- upvalues: v27 (ref), v28 (copy), v29 (copy), v10 (ref), v9 (ref), v2 (ref), v8 (ref), v3 (ref), v5 (ref), v6 (ref)
        local v32 = v27(v28);
        if not v29 then
            if v10 then
                v30:dispatch(v9(v32));
                return;
            else
                for _, v34 in ipairs(v32) do
                    coroutine.wrap(function() --[[ Line: 61 ]]
                        -- upvalues: v30 (copy), v2 (ref), v34 (copy), v8 (ref), v3 (ref)
                        v30:dispatch(v2(v34.assetId));
                        if v34.parentBundleId == nil then
                            v30:dispatch(v8(v34.assetId));
                        end;
                        v30:dispatch(v3(v34.assetId));
                    end)();
                end;
                v30:dispatch(v5(v32));
                return;
            end;
        else
            v30:dispatch(v6(v32));
            return;
        end;
    end);
end;
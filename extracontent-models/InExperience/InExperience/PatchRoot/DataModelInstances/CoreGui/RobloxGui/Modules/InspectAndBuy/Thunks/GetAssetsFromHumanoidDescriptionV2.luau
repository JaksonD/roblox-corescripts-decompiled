local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Thunk);
local v2 = require(l_Parent_0.Models.AssetInfo);
local v3 = require(l_Parent_0.Actions.SetEquippedAssets);
local v4 = require(l_Parent_0.Constants);
local v5 = require(l_Parent_0.Thunks.GetAvatarPreview);
local l_CorePackages_0 = game:GetService("CorePackages");
local l_FFlagAXInspectAndBuyMakeupSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXInspectAndBuyMakeupSupport;
local v8 = {};
local function v26(v9) --[[ Line: 19 ]] --[[ Name: getAssetIds ]]
    -- upvalues: v4 (copy), v2 (copy), l_FFlagAXInspectAndBuyMakeupSupport_0 (copy)
    local v10 = {};
    local v11 = false;
    for v12, v13 in v4.AssetTypeIdStringToHumanoidDescriptionProp do
        if v4.AssetTypeIdToAccessoryTypeEnum[v12] == nil then
            local v14 = v9[v13] or "";
            local v15 = true;
            if v12 ~= tostring(Enum.AssetType.Head.Value) then
                v15 = v12 == tostring(Enum.AssetType.DynamicHead.Value);
            end;
            if not v11 or not v15 then
                if v15 then
                    v11 = true;
                end;
                for _, v17 in string.split(v14) do
                    if tonumber(v17) and v17 ~= "0" then
                        table.insert(v10, v2.fromHumanoidDescription(v17));
                    end;
                end;
            end;
        end;
    end;
    for _, v19 in (v9:GetAccessories(true)) do
        v10[#v10 + 1] = v2.fromHumanoidDescriptionAccessory(v19);
    end;
    for _, v21 in (v9:GetEmotes()) do
        for _, v23 in v21 do
            v10[#v10 + 1] = v2.fromHumanoidDescription(v23);
        end;
    end;
    if l_FFlagAXInspectAndBuyMakeupSupport_0 then
        for _, v25 in v9:GetChildren() do
            if v25:IsA("MakeupDescription") and v25.AssetId > 0 then
                v10[#v10 + 1] = v2.fromHumanoidDescription(v25.AssetId);
            end;
        end;
    end;
    return v10;
end;
return function(v27, v28) --[[ Line: 83 ]] --[[ Name: GetAssetsFromHumanoidDescriptionV2 ]]
    -- upvalues: v1 (copy), v8 (copy), v26 (copy), v5 (copy), v3 (copy)
    return v1.new(script.Name, v8, function(v29, _) --[[ Line: 84 ]]
        -- upvalues: v26 (ref), v27 (copy), v28 (copy), v5 (ref), v3 (ref)
        local v31 = v26(v27);
        if not v28 then
            v29:dispatch(v5(v31));
            return;
        else
            v29:dispatch(v3(v31));
            return;
        end;
    end);
end;
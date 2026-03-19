local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Thunk);
local v2 = require(l_Parent_0.Models.AssetInfo);
local v3 = require(l_Parent_0.Actions.SetEquippedAssets);
local v4 = require(l_Parent_0.Constants);
local v5 = require(l_Parent_0.Thunks.GetAvatarPreview);
local v6 = {};
local function v22(v7) --[[ Line: 15 ]] --[[ Name: getAssetIds ]]
    -- upvalues: v4 (copy), v2 (copy)
    local v8 = {};
    local v9 = false;
    for v10, v11 in v4.AssetTypeIdStringToHumanoidDescriptionProp do
        if v4.AssetTypeIdToAccessoryTypeEnum[v10] == nil then
            local v12 = v7[v11] or "";
            local v13 = true;
            if v10 ~= tostring(Enum.AssetType.Head.Value) then
                v13 = v10 == tostring(Enum.AssetType.DynamicHead.Value);
            end;
            if not v9 or not v13 then
                if v13 then
                    v9 = true;
                end;
                for _, v15 in string.split(v12) do
                    if tonumber(v15) and v15 ~= "0" then
                        table.insert(v8, v2.fromHumanoidDescription(v15));
                    end;
                end;
            end;
        end;
    end;
    for _, v17 in (v7:GetAccessories(true)) do
        v8[#v8 + 1] = v2.fromHumanoidDescriptionAccessory(v17);
    end;
    for _, v19 in (v7:GetEmotes()) do
        for _, v21 in v19 do
            v8[#v8 + 1] = v2.fromHumanoidDescription(v21);
        end;
    end;
    return v8;
end;
return function(v23, v24) --[[ Line: 71 ]] --[[ Name: GetAssetsFromHumanoidDescriptionV2 ]]
    -- upvalues: v1 (copy), v6 (copy), v22 (copy), v5 (copy), v3 (copy)
    return v1.new(script.Name, v6, function(v25, _) --[[ Line: 72 ]]
        -- upvalues: v22 (ref), v23 (copy), v24 (copy), v5 (ref), v3 (ref)
        local v27 = v22(v23);
        if not v24 then
            v25:dispatch(v5(v27));
            return;
        else
            v25:dispatch(v3(v27));
            return;
        end;
    end);
end;
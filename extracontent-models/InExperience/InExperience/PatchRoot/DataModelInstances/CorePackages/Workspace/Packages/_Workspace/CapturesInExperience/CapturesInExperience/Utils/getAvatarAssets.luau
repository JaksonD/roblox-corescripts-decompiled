local l_Parent_0 = script.Parent.Parent;
local l_Players_0 = game:GetService("Players");
local v2 = require(l_Parent_0.Constants);
local function _() --[[ Line: 9 ]] --[[ Name: getLocalPlayerCharacter ]]
    -- upvalues: l_Players_0 (copy)
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if not l_LocalPlayer_0 then
        return nil;
    else
        return l_LocalPlayer_0.Character;
    end;
end;
return function(v5) --[[ Line: 18 ]]
    -- upvalues: l_Players_0 (copy), v2 (copy)
    local v6 = {};
    local v7 = {};
    if not v5 then
        local l_LocalPlayer_1 = l_Players_0.LocalPlayer;
        v5 = if not l_LocalPlayer_1 then nil else l_LocalPlayer_1.Character;
    end;
    if not v5 then
        return v6;
    else
        local l_Humanoid_0 = v5:FindFirstChildOfClass("Humanoid");
        if not l_Humanoid_0 then
            return v6;
        else
            local l_HumanoidDescription_0 = l_Humanoid_0:FindFirstChildOfClass("HumanoidDescription");
            if not l_HumanoidDescription_0 then
                return v6;
            else
                for v11, v12 in v2.AssetTypeIdStringToHumanoidDescriptionProp do
                    if v2.AssetTypeIdToAccessoryTypeEnum[v11] == nil then
                        local v13 = l_HumanoidDescription_0[v12] or "";
                        for _, v15 in string.split(v13) do
                            local v16 = tonumber(v15);
                            if v16 and v16 ~= 0 and not v7[v16] then
                                v7[v16] = true;
                                table.insert(v6, v16);
                            end;
                        end;
                    end;
                end;
                for _, v18 in (l_HumanoidDescription_0:GetAccessories(true)) do
                    if v18.AssetId and v18.AssetId ~= 0 and not v7[v18.AssetId] then
                        v7[v18.AssetId] = true;
                        table.insert(v6, v18.AssetId);
                    end;
                end;
                return v6;
            end;
        end;
    end;
end;
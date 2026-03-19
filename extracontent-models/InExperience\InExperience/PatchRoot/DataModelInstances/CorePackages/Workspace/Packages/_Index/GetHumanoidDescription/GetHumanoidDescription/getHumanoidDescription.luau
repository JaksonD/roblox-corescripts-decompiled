local l_Players_0 = game:GetService("Players");
local v1 = game:DefineFastFlag("GetHumanoidDescriptionUpdatesV2B", false);
local l_Parent_0 = script:FindFirstAncestor("GetHumanoidDescription").Parent;
local l_GetFFlagGetHumanoidDescriptionUpdatesV2E_0 = require(l_Parent_0.SharedFlags).GetFFlagGetHumanoidDescriptionUpdatesV2E;
local v4 = {
    ERR_RA_CHARACTER = "ERR_RA_CHARACTER", 
    ERR_RA_HUMPLAYER = "ERR_RA_HUMPLAYER", 
    ERR_RA_HUMOBJ = "ERR_RA_HUMOBJ", 
    ERR_RA_HUMDESC = "ERR_RA_HUMDESC", 
    OK = "OK"
};
local function v9(v5) --[[ Line: 65 ]]
    local v6 = {};
    for _, v8 in ipairs(v5) do
        table.insert(v6, {
            AccessoryType = v8.AccessoryType.Value, 
            AssetId = v8.AssetId, 
            IsLayered = v8.IsLayered, 
            Order = v8.Order, 
            Puffiness = v8.Puffiness
        });
    end;
    return v6;
end;
local function v17(v10, v11) --[[ Line: 79 ]]
    local v12 = {};
    for _, v14 in ipairs(v11) do
        local v15 = v10[v14.Name];
        if v15 then
            for v16 = 1, math.min(8, #v15) do
                table.insert(v12, v15[v16]);
            end;
        end;
    end;
    return v12;
end;
local function v23(v18) --[[ Line: 93 ]]
    local v19 = {};
    for _, v21 in (v18:GetPlayingAnimationTracks()) do
        local v22 = string.match(v21.Animation.AnimationId, "(%d+)$");
        if v22 then
            table.insert(v19, v22);
        end;
        if #v19 >= 8 then
            break;
        end;
    end;
    return v19;
end;
return function(v24) --[[ Line: 108 ]]
    -- upvalues: l_Players_0 (copy), v4 (copy), v9 (copy), v1 (copy), v17 (copy), l_GetFFlagGetHumanoidDescriptionUpdatesV2E_0 (copy), v23 (copy)
    local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v24);
    local v26 = {
        BackAccessory = "", 
        BodyTypeScale = 0, 
        ClimbAnimation = 0, 
        DepthScale = 0, 
        Face = 0, 
        FaceAccessory = "", 
        FallAnimation = 0, 
        FrontAccessory = "", 
        GraphicTShirt = 0, 
        HairAccessory = "", 
        HatAccessory = "", 
        Head = 0, 
        HeadColor = {
            0, 
            0, 
            0
        }, 
        HeadScale = 0, 
        HeightScale = 0, 
        IdleAnimation = 0, 
        JumpAnimation = 0, 
        LeftArm = 0, 
        LeftArmColor = {
            0, 
            0, 
            0
        }, 
        LeftLeg = 0, 
        LeftLegColor = {
            0, 
            0, 
            0
        }, 
        MoodAnimation = 0, 
        NeckAccessory = "", 
        Pants = 0, 
        ProportionScale = 0, 
        RightArm = 0, 
        RightArmColor = {
            0, 
            0, 
            0
        }, 
        RightLeg = 0, 
        RightLegColor = {
            0, 
            0, 
            0
        }, 
        RunAnimation = 0, 
        Shirt = 0, 
        ShouldersAccessory = "", 
        SwimAnimation = 0, 
        Torso = 0, 
        TorsoColor = {
            0, 
            0, 
            0
        }, 
        WaistAccessory = "", 
        WalkAnimation = 0, 
        WidthScale = 0
    };
    if not l_l_Players_0_PlayerByUserId_0 then
        return v26, v4.ERR_RA_HUMPLAYER;
    else
        local l_Character_0 = l_l_Players_0_PlayerByUserId_0.Character;
        if l_Character_0 then
            local v28 = l_Character_0:WaitForChild("Humanoid", 1);
            if not v28 then
                return v26, v4.ERR_RA_HUMOBJ;
            else
                local v29 = nil;
                local v30 = nil;
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 167 ]]
                    -- upvalues: v28 (copy)
                    return (v28:GetAppliedDescription());
                end);
                v30 = l_status_0;
                v29 = l_result_0;
                if not v30 then
                    return v26, v4.ERR_RA_HUMOBJ;
                elseif not v29 then
                    return v26, v4.ERR_RA_HUMDESC;
                else
                    l_status_0 = 0;
                    do
                        local l_v29_0 = v29;
                        l_result_0 = function(v34) --[[ Line: 180 ]]
                            -- upvalues: l_v29_0 (ref), v26 (copy)
                            if typeof(l_v29_0[v34]) == "Color3" then
                                v26[v34] = {
                                    l_v29_0[v34].R, 
                                    l_v29_0[v34].G, 
                                    l_v29_0[v34].B
                                };
                                return;
                            else
                                v26[v34] = l_v29_0[v34];
                                return;
                            end;
                        end;
                        for v35, _ in pairs(v26) do
                            if not pcall(l_result_0, v35) then
                                l_status_0 = l_status_0 + 1;
                            end;
                        end;
                        local l_status_1, l_result_1 = pcall(l_v29_0.GetAccessories, l_v29_0, false);
                        if l_status_1 then
                            local l_status_2, l_result_2 = pcall(v9, l_result_1);
                            if l_status_2 then
                                v26.AccessoryBlob = l_result_2;
                            else
                                l_status_0 = l_status_0 + 1;
                            end;
                        else
                            l_status_0 = l_status_0 + 1;
                        end;
                        if v1 then
                            local l_status_3, l_result_3 = pcall(l_v29_0.GetEmotes, l_v29_0);
                            if l_status_3 then
                                v26.Emotes = l_result_3;
                            else
                                l_status_0 = l_status_0 + 1;
                            end;
                        end;
                        local l_status_4, l_result_4 = pcall(l_v29_0.GetEquippedEmotes, l_v29_0);
                        local l_status_5, l_result_5 = pcall(l_v29_0.GetEmotes, l_v29_0);
                        if l_status_4 and l_status_5 then
                            local l_status_6, l_result_6 = pcall(v17, l_result_5, l_result_4);
                            if l_status_6 then
                                v26.Emotes = l_result_6;
                                if l_GetFFlagGetHumanoidDescriptionUpdatesV2E_0() then
                                    local l_status_7, l_result_7 = pcall(v23, v28);
                                    if l_status_7 then
                                        v26.CurrentlyPlayingAnimationIds = l_result_7;
                                    else
                                        l_status_0 = l_status_0 + 1;
                                    end;
                                end;
                            end;
                        else
                            l_status_0 = l_status_0 + 1;
                        end;
                        v26.FieldErrorCount = l_status_0;
                    end;
                    return v26, v4.OK;
                end;
            end;
        else
            return v26, v4.ERR_RA_CHARACTER;
        end;
    end;
end;
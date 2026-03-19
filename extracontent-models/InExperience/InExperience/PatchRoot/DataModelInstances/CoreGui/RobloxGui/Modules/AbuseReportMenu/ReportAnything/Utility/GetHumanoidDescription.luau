local l_script_FirstAncestor_0 = script:FindFirstAncestor("AbuseReportMenu");
local v1 = require(l_script_FirstAncestor_0.Flags.GetFFlagGetHumanoidDescriptionUpdates);
local v2 = game:DefineFastFlag("GetHumanoidDescriptionUpdatesV2A", false);
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GetFFlagGetHumanoidDescriptionUpdatesV2E_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagGetHumanoidDescriptionUpdatesV2E;
local l_Players_0 = game:GetService("Players");
local v6 = {
    ERR_RA_CHARACTER = "ERR_RA_CHARACTER", 
    ERR_RA_HUMPLAYER = "ERR_RA_HUMPLAYER", 
    ERR_RA_HUMOBJ = "ERR_RA_HUMOBJ", 
    ERR_RA_HUMDESC = "ERR_RA_HUMDESC", 
    OK = "OK"
};
local function v11(v7) --[[ Line: 67 ]]
    local v8 = {};
    for _, v10 in ipairs(v7) do
        table.insert(v8, {
            AccessoryType = v10.AccessoryType.Value, 
            AssetId = v10.AssetId, 
            IsLayered = v10.IsLayered, 
            Order = v10.Order, 
            Puffiness = v10.Puffiness
        });
    end;
    return v8;
end;
local function v19(v12, v13) --[[ Line: 81 ]]
    local v14 = {};
    for _, v16 in ipairs(v13) do
        local v17 = v12[v16.Name];
        if v17 then
            for v18 = 1, math.min(8, #v17) do
                table.insert(v14, v17[v18]);
            end;
        end;
    end;
    return v14;
end;
local function v25(v20) --[[ Line: 95 ]]
    local v21 = {};
    for _, v23 in (v20:GetPlayingAnimationTracks()) do
        local v24 = string.match(v23.Animation.AnimationId, "(%d+)$");
        if v24 then
            table.insert(v21, v24);
        end;
        if #v21 >= 8 then
            break;
        end;
    end;
    return v21;
end;
return {
    getHumanoidDescription = function(v26) --[[ Line: 110 ]]
        -- upvalues: l_Players_0 (copy), v6 (copy), v1 (copy), v11 (copy), v2 (copy), v19 (copy), l_GetFFlagGetHumanoidDescriptionUpdatesV2E_0 (copy), v25 (copy)
        local l_l_Players_0_PlayerByUserId_0 = l_Players_0:GetPlayerByUserId(v26);
        local v28 = {
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
            return v28, v6.ERR_RA_HUMPLAYER;
        else
            local l_Character_0 = l_l_Players_0_PlayerByUserId_0.Character;
            if l_Character_0 then
                local v30 = l_Character_0:WaitForChild("Humanoid", 1);
                if not v30 then
                    return v28, v6.ERR_RA_HUMOBJ;
                else
                    local v31 = nil;
                    if v1() then
                        local v32 = nil;
                        local l_status_0, l_result_0 = pcall(function() --[[ Line: 171 ]]
                            -- upvalues: v30 (copy)
                            return (v30:GetAppliedDescription());
                        end);
                        v32 = l_status_0;
                        v31 = l_result_0;
                        if not v32 then
                            return v28, v6.ERR_RA_HUMOBJ;
                        end;
                    else
                        v31 = v30:GetAppliedDescription();
                    end;
                    if not v31 then
                        return v28, v6.ERR_RA_HUMDESC;
                    else
                        local v35 = 0;
                        do
                            local l_v31_0 = v31;
                            if v1() then
                                local function v38(v37) --[[ Line: 188 ]]
                                    -- upvalues: l_v31_0 (ref), v28 (copy)
                                    if typeof(l_v31_0[v37]) == "Color3" then
                                        v28[v37] = {
                                            l_v31_0[v37].R, 
                                            l_v31_0[v37].G, 
                                            l_v31_0[v37].B
                                        };
                                        return;
                                    else
                                        v28[v37] = l_v31_0[v37];
                                        return;
                                    end;
                                end;
                                for v39, _ in pairs(v28) do
                                    if not pcall(v38, v39) then
                                        v35 = v35 + 1;
                                    end;
                                end;
                                local l_status_1, l_result_1 = pcall(l_v31_0.GetAccessories, l_v31_0, false);
                                if l_status_1 then
                                    local l_status_2, l_result_2 = pcall(v11, l_result_1);
                                    if l_status_2 then
                                        v28.AccessoryBlob = l_result_2;
                                    else
                                        v35 = v35 + 1;
                                    end;
                                else
                                    v35 = v35 + 1;
                                end;
                                if v2 then
                                    local l_status_3, l_result_3 = pcall(l_v31_0.GetEmotes, l_v31_0);
                                    if l_status_3 then
                                        v28.Emotes = l_result_3;
                                    else
                                        v35 = v35 + 1;
                                    end;
                                end;
                                local l_status_4, l_result_4 = pcall(l_v31_0.GetEquippedEmotes, l_v31_0);
                                local l_status_5, l_result_5 = pcall(l_v31_0.GetEmotes, l_v31_0);
                                if l_status_4 and l_status_5 then
                                    local l_status_6, l_result_6 = pcall(v19, l_result_5, l_result_4);
                                    if l_status_6 then
                                        v28.Emotes = l_result_6;
                                        if l_GetFFlagGetHumanoidDescriptionUpdatesV2E_0() then
                                            local l_status_7, l_result_7 = pcall(v25, v30);
                                            if l_status_7 then
                                                v28.CurrentlyPlayingAnimationIds = l_result_7;
                                            else
                                                v35 = v35 + 1;
                                            end;
                                        end;
                                    end;
                                else
                                    v35 = v35 + 1;
                                end;
                                v28.FieldErrorCount = v35;
                            else
                                pcall(function() --[[ Line: 255 ]]
                                    -- upvalues: v28 (copy), l_v31_0 (ref)
                                    for v55, _ in pairs(v28) do
                                        if typeof(l_v31_0[v55]) == "Color3" then
                                            v28[v55] = {
                                                l_v31_0[v55].R, 
                                                l_v31_0[v55].G, 
                                                l_v31_0[v55].B
                                            };
                                        else
                                            v28[v55] = l_v31_0[v55];
                                        end;
                                    end;
                                end);
                            end;
                        end;
                        return v28, v6.OK;
                    end;
                end;
            else
                return v28, v6.ERR_RA_CHARACTER;
            end;
        end;
    end
};
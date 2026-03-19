local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_GuiService_0 = game:GetService("GuiService");
local l_AvatarIdentification_0 = require(l_Parent_1.AvatarIdentification).AvatarIdentification;
local v4 = require(l_Parent_1.Dash);
local v5 = require(l_Parent_0.Utils.getAvatarAssets);
local v6 = game:DefineFastInt("CaptureMetadataGetAvatarsTimeoutMs", 150);
local v7 = game:DefineFastInt("CaptureMetadataMaxAvatars", 5);
local v8 = game:DefineFastInt("CaptureMetadataMinAvatarBoundingBoxPixels", 200);
local v9 = game:DefineFastInt("CaptureMetadataMinHitRatePercentage", 50);
local function _() --[[ Line: 17 ]] --[[ Name: getViewportSize ]]
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    if not l_CurrentCamera_0 then
        return;
    else
        return l_CurrentCamera_0.ViewportSize;
    end;
end;
local l_round_0 = math.round;
local function _(v13) --[[ Line: 28 ]] --[[ Name: vec2ToTable ]]
    -- upvalues: l_round_0 (copy)
    return {
        x = l_round_0(v13.X), 
        y = l_round_0(v13.Y)
    };
end;
return function() --[[ Line: 32 ]]
    -- upvalues: v6 (copy), l_AvatarIdentification_0 (copy), v4 (copy), l_GuiService_0 (copy), v7 (copy), v9 (copy), v8 (copy), v5 (copy), l_round_0 (copy)
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    local v16 = if not l_CurrentCamera_1 then nil else l_CurrentCamera_1.ViewportSize;
    if not v16 then
        return {};
    else
        l_CurrentCamera_1 = v6 / 1000;
        local v17 = l_AvatarIdentification_0.getVisibleAvatars(true, l_CurrentCamera_1);
        v17 = v4.values(v17);
        local l_l_GuiService_0_RawScreenScale_0 = l_GuiService_0:GetRawScreenScale();
        for _, v20 in v17 do
            v20.boundingBox.min = v20.boundingBox.min * v16 * l_l_GuiService_0_RawScreenScale_0;
            v20.boundingBox.max = v20.boundingBox.max * v16 * l_l_GuiService_0_RawScreenScale_0;
        end;
        table.sort(v17, function(v21, v22) --[[ Line: 50 ]]
            return (v21.boundingBox.max - v21.boundingBox.min).Magnitude > (v22.boundingBox.max - v22.boundingBox.min).Magnitude;
        end);
        local v23 = 0;
        local v24 = {};
        for _, v26 in v17 do
            if v7 > v23 then
                v23 = v23 + 1;
                if v26.hitRate >= v9 / 100 then
                    if (v26.boundingBox.max - v26.boundingBox.min).Magnitude >= v8 then
                        local l_player_0 = v26.player;
                        local v28 = v5(l_player_0.Character);
                        local l_UserId_0 = l_player_0.UserId;
                        local v30 = {
                            avatarItems = v28
                        };
                        local v31 = {};
                        local l_min_0 = v26.boundingBox.min;
                        v31.min = {
                            x = l_round_0(l_min_0.X), 
                            y = l_round_0(l_min_0.Y)
                        };
                        l_min_0 = v26.boundingBox.max;
                        v31.max = {
                            x = l_round_0(l_min_0.X), 
                            y = l_round_0(l_min_0.Y)
                        };
                        v30.boundingBox = v31;
                        v24[l_UserId_0] = v30;
                    else
                        break;
                    end;
                end;
            else
                break;
            end;
        end;
        return v24;
    end;
end;
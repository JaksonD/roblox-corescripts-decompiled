local v0 = require(script.Parent.Flags);
local l_GetFStringPremiumSponsoredExperienceInstances_0 = v0.GetFStringPremiumSponsoredExperienceInstances;
local v2 = v0.GetFIntPremiumSponsoredExperienceWaitTimeSeconds();
local l_Parent_0 = script.Parent.Parent;
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local v5 = require(script.Parent.TelemetryConfig);
local l_Players_0 = game:GetService("Players");
local function v13(v7, v8) --[[ Line: 18 ]] --[[ Name: reportVideoEvent ]]
    -- upvalues: l_Players_0 (copy), l_default_0 (copy), v5 (copy)
    local l_Name_0 = v7.Name;
    local l_Video_0 = v7.Video;
    local l_LocalPlayer_0 = l_Players_0.LocalPlayer;
    if l_LocalPlayer_0 ~= nil then
        local v12 = {
            place_id = tostring(game.PlaceId), 
            universe_id = tostring(game.GameId), 
            user_id = tostring(l_LocalPlayer_0.UserId), 
            video_asset_id = l_Video_0, 
            instance_name = l_Name_0, 
            event_type = v8
        };
        l_default_0:logRobloxTelemetryEvent(v5, nil, v12);
    end;
end;
local function v19(v14) --[[ Line: 38 ]] --[[ Name: waitForFullPathVideoFrame ]]
    -- upvalues: v2 (copy)
    local l_game_0 = game;
    for _, v17 in ipairs(v14:split(".")) do
        l_game_0 = l_game_0:WaitForChild(v17, v2);
        if not l_game_0 then
            error("Could not find child " .. tostring(v17) .. " in " .. v14);
        end;
    end;
    local l_ClassName_0 = l_game_0.ClassName;
    if l_ClassName_0 ~= "VideoFrame" then
        error("Expected VideoFrame at " .. v14 .. ", got " .. l_ClassName_0);
    end;
    return l_game_0;
end;
local function v25(v20) --[[ Line: 55 ]] --[[ Name: listenForVideoFrameEvents ]]
    -- upvalues: v19 (copy), v13 (copy)
    local v21 = v19(v20);
    local v22 = false;
    local v23 = false;
    if v21.Playing then
        v13(v21, "VideoStart");
        v22 = true;
    else
        v21.Played:Connect(function() --[[ Line: 67 ]]
            -- upvalues: v22 (ref), v13 (ref), v21 (copy)
            if not v22 then
                v13(v21, "VideoStart");
                v22 = true;
            end;
        end);
    end;
    local function v24() --[[ Line: 75 ]] --[[ Name: onEndedOrLooped ]]
        -- upvalues: v23 (ref), v13 (ref), v21 (copy)
        if not v23 then
            v13(v21, "VideoEnd");
            v23 = true;
        end;
    end;
    v21.Ended:Connect(v24);
    v21.DidLoop:Connect(v24);
end;
return function() --[[ Line: 86 ]] --[[ Name: starterScript ]]
    -- upvalues: l_GetFStringPremiumSponsoredExperienceInstances_0 (copy), v25 (copy)
    local v26 = tostring(game.PlaceId);
    for _, v28 in ipairs(l_GetFStringPremiumSponsoredExperienceInstances_0():split(",")) do
        local v29, v30 = unpack(v28:split(":"));
        if v29 == v26 then
            spawn(function() --[[ Line: 92 ]]
                -- upvalues: v25 (ref), v30 (copy)
                v25(v30);
            end);
        end;
    end;
end;
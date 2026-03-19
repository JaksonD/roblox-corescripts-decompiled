local _ = require(script.Parent.VoiceChatServiceManager);
local function _(v1) --[[ Line: 4 ]] --[[ Name: getPlayerPrimaryPart ]]
    return v1 and v1.Character and v1.Character.PrimaryPart;
end;
local function _(v3, v4) --[[ Line: 8 ]] --[[ Name: getPlayerDistanceFrom ]]
    local v5 = v3 and v3.Character and v3.Character.PrimaryPart;
    local v6 = nil;
    if v5 then
        v6 = (v5.Position - v4).Magnitude;
    end;
    return v6;
end;
return {
    getComparator = function(v8) --[[ Line: 19 ]] --[[ Name: getComparator ]]
        return function(v9, v10) --[[ Line: 20 ]]
            -- upvalues: v8 (copy)
            local v11 = v9 and v9.Character and v9.Character.PrimaryPart;
            local v12 = v10 and v10.Character and v10.Character.PrimaryPart;
            if not v11 and not v12 then
                return v9.Name:lower() < v10.Name:lower();
            elseif v11 and not v12 then
                return true;
            elseif not v11 and v12 then
                return false;
            else
                local l_v8_0 = v8;
                local v14 = v9 and v9.Character and v9.Character.PrimaryPart;
                local v15 = nil;
                if v14 then
                    v15 = (v14.Position - l_v8_0).Magnitude;
                end;
                local l_v15_0 = v15;
                v14 = v8;
                v15 = v10 and v10.Character and v10.Character.PrimaryPart;
                local v17 = nil;
                if v15 then
                    v17 = (v15.Position - v14).Magnitude;
                end;
                return l_v15_0 < v17;
            end;
        end;
    end, 
    getSortedPlayers = function(v18, v19, v20, v21, v22, v23, v24) --[[ Line: 41 ]] --[[ Name: getSortedPlayers ]]
        local v25 = {};
        local function v35(v26, v27) --[[ Line: 20 ]]
            -- upvalues: v20 (copy)
            local v28 = v26 and v26.Character and v26.Character.PrimaryPart;
            local v29 = v27 and v27.Character and v27.Character.PrimaryPart;
            if not v28 and not v29 then
                return v26.Name:lower() < v27.Name:lower();
            elseif v28 and not v29 then
                return true;
            elseif not v28 and v29 then
                return false;
            else
                local l_v20_0 = v20;
                local v31 = v26 and v26.Character and v26.Character.PrimaryPart;
                local v32 = nil;
                if v31 then
                    v32 = (v31.Position - l_v20_0).Magnitude;
                end;
                local l_v32_0 = v32;
                v31 = v20;
                v32 = v27 and v27.Character and v27.Character.PrimaryPart;
                local v34 = nil;
                if v32 then
                    v34 = (v32.Position - v31).Magnitude;
                end;
                return l_v32_0 < v34;
            end;
        end;
        for v36, _ in pairs(v19.participants) do
            local l_v18_PlayerByUserId_0 = v18:GetPlayerByUserId(v36);
            if l_v18_PlayerByUserId_0 and v23 ~= l_v18_PlayerByUserId_0 and (v24 or l_v18_PlayerByUserId_0 and l_v18_PlayerByUserId_0.Character and l_v18_PlayerByUserId_0.Character.PrimaryPart) then
                if v21 and l_v18_PlayerByUserId_0 then
                    local v39 = l_v18_PlayerByUserId_0 and l_v18_PlayerByUserId_0.Character and l_v18_PlayerByUserId_0.Character.PrimaryPart;
                    local v40 = nil;
                    if v39 then
                        v40 = (v39.Position - v20).Magnitude;
                    end;
                    if v21 < v40 then
                        continue;
                    end;
                end;
                if not v22 or v19:getRecentUsersInteractionData()[tostring(l_v18_PlayerByUserId_0.UserId)] then
                    table.insert(v25, l_v18_PlayerByUserId_0);
                end;
            end;
        end;
        table.sort(v25, v35);
        return v25;
    end
};
local l_HttpService_0 = game:GetService("HttpService");
local l_Players_0 = game:GetService("Players");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SquadsCore");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_script_FirstAncestor_0.Analytics.EventNames);
local _ = require(l_script_FirstAncestor_0.Enums.SquadCoplayJoin);
local v6 = require(l_script_FirstAncestor_0.Enums.SquadLocationEnum);
local v7 = require(l_script_FirstAncestor_0.Flags.FFlagEncodeSquadMembersUpdated);
local v8 = require(l_script_FirstAncestor_0.Common.encodeSquadMembers);
local v9 = require(l_Parent_0.Cryo);
local _ = require(l_Parent_0.RoduxSquads);
local v14 = if v7 then require(l_script_FirstAncestor_0.Common.encodeUserIds) else function(v11) --[[ Line: 21 ]]
    -- upvalues: l_HttpService_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 22 ]]
        -- upvalues: l_HttpService_0 (ref), v11 (copy)
        return l_HttpService_0:JSONEncode(v11);
    end);
    if l_status_0 then
        return l_result_0;
    else
        return "[]";
    end;
end;
return function(v15, v16, v17, v18, v19) --[[ Line: 33 ]]
    -- upvalues: v6 (copy), l_Players_0 (copy), v7 (copy), v14 (copy), v8 (copy), v9 (copy), v4 (copy)
    if v17 == v6.InExperience then
        local v20 = {};
        local v21 = {};
        for _, v23 in ipairs(v16) do
            v20[v23.userId] = true;
        end;
        for _, v25 in l_Players_0:GetPlayers() do
            if v20[v25.UserId] then
                table.insert(v21, v25.UserId);
            end;
        end;
        local v26 = nil;
        local v27 = nil;
        local v28 = nil;
        if v7 then
            v27 = v14(v21);
            v28 = v8(v16);
        else
            v26 = v9.List.map(v16, function(v29) --[[ Line: 63 ]]
                return v29.userId;
            end);
            v27 = v14(v21);
            v28 = v14(v26);
        end;
        v19(v4.PartyCoplay, {
            partyCoplayEvent = v18, 
            partyId = v15, 
            partyPlayersInGameInstanceCount = #v21, 
            partyPlayersInGameInstanceUserIds = v27, 
            partyTotalSize = if v7 then #v16 else #v26, 
            partyTotalSizeUserIds = v28
        });
    end;
end;
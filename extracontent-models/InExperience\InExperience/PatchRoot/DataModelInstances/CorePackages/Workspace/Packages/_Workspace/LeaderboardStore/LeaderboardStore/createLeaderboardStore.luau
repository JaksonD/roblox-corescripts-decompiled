local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local _ = require(l_Parent_1.Signals);
local l_createSignalMap_0 = require(l_Parent_1.CoreScriptsRoactCommon).Utilities.createSignalMap;
local _ = require(l_Parent_0.LeaderboardStoreTypes);
local v5 = require(l_Parent_0.LeaderboardStore);
return function(v6, v7) --[[ Line: 22 ]] --[[ Name: createLeaderboardStore ]]
    -- upvalues: v5 (copy), l_createSignalMap_0 (copy)
    return function() --[[ Line: 23 ]]
        -- upvalues: v6 (copy), v7 (copy), v5 (ref), l_createSignalMap_0 (ref)
        local v8 = if v6 then v6 else game:GetService("Teams");
        local v9 = if v7 then v7 else game:GetService("Players");
        local v10 = v5.new(v8, v9);
        return {
            getGameStatsList = function() --[[ Line: 30 ]] --[[ Name: getGameStatsList ]]
                -- upvalues: v10 (ref), l_createSignalMap_0 (ref)
                if not v10 then
                    return l_createSignalMap_0();
                else
                    return v10:getGameStatsList();
                end;
            end, 
            getTeamList = function() --[[ Line: 36 ]] --[[ Name: getTeamList ]]
                -- upvalues: v10 (ref), l_createSignalMap_0 (ref)
                if not v10 then
                    return l_createSignalMap_0();
                else
                    return v10:getTeamList();
                end;
            end, 
            getTeamPlayerList = function(v11, v12) --[[ Line: 42 ]] --[[ Name: getTeamPlayerList ]]
                -- upvalues: v10 (ref), l_createSignalMap_0 (ref)
                if not v10 then
                    return l_createSignalMap_0();
                else
                    return v10:getTeamPlayerList(v11, v12);
                end;
            end, 
            getPlayerEntry = function(v13, v14) --[[ Line: 48 ]] --[[ Name: getPlayerEntry ]]
                -- upvalues: v10 (ref)
                if not v10 then
                    return nil;
                else
                    return (v10:getPlayerEntry(v13, v14));
                end;
            end, 
            cleanUp = function() --[[ Line: 56 ]] --[[ Name: cleanUp ]]
                -- upvalues: v10 (ref)
                v10:destroy();
                v10 = nil;
            end
        };
    end;
end;
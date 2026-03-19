local l_Players_0 = game:GetService("Players");
local l_ClientChatModules_0 = game:GetService("Chat"):WaitForChild("ClientChatModules");
local l_ChatSettings_0 = require(l_ClientChatModules_0:WaitForChild("ChatSettings"));
local v3 = {
    ChattingToSelf = 1, 
    NoMatches = 2, 
    MultipleMatches = 3
};
return {
    CommandErrorCodes = v3, 
    getUserNameFromChattedName = function(v4, v5, v6) --[[ Line: 14 ]] --[[ Name: getUserNameFromChattedName ]]
        -- upvalues: v3 (copy), l_Players_0 (copy), l_ChatSettings_0 (copy)
        if v5 == v4 then
            return v5, v3.ChattingToSelf;
        else
            local l_l_Players_0_Players_0 = l_Players_0:GetPlayers();
            for _, v9 in pairs(l_l_Players_0_Players_0) do
                if string.lower(v9.Name) == string.lower(v4) then
                    return v9.Name, nil;
                end;
            end;
            local v10 = 0;
            local v11 = nil;
            if l_ChatSettings_0.PlayerDisplayNamesEnabled then
                for _, v13 in pairs(l_l_Players_0_Players_0) do
                    if v13.Name ~= v5 and string.lower(v13.DisplayName) == string.lower(v4) then
                        v10 = v10 + 1;
                        v11 = v13.Name;
                    end;
                end;
            end;
            if v10 == 1 then
                return v11, nil;
            elseif v10 == 0 then
                if v6 == v4 then
                    return v6, v3.ChattingToSelf;
                else
                    return v4, v3.NoMatches;
                end;
            elseif v10 >= 2 then
                return v4, v3.MultipleMatches;
            else
                return;
            end;
        end;
    end, 
    getUsersWithDisplayNameString = function(v14, v15) --[[ Line: 56 ]] --[[ Name: getUsersWithDisplayNameString ]]
        -- upvalues: l_Players_0 (copy)
        local v16 = {};
        local v17 = "";
        local l_l_Players_0_Players_1 = l_Players_0:GetPlayers();
        for _, v20 in pairs(l_l_Players_0_Players_1) do
            if v20.Name ~= v15 and string.lower(v20.DisplayName) == string.lower(v14) then
                table.insert(v16, v20.Name);
            end;
        end;
        for v21, v22 in pairs(v16) do
            if v21 ~= #v16 then
                v17 = v17 .. "@" .. v22 .. ", ";
            else
                v17 = v17 .. "@" .. v22;
            end;
        end;
        return v17;
    end
};
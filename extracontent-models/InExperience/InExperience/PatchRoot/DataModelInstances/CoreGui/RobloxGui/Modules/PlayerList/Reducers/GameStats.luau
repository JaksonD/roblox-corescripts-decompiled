local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local l_Parent_0 = script.Parent.Parent;
local l_Actions_0 = l_Parent_0.Actions;
local v4 = require(l_Actions_0.AddGameStat);
local v5 = require(l_Actions_0.RemoveGameStat);
local v6 = require(l_Actions_0.SetGameStatText);
local v7 = require(l_Actions_0.SetGameStatAddId);
local v8 = require(l_Parent_0.Flags.FFlagLeaderstatsWithASideOfClient);
local v9 = require(l_Parent_0.FormatStatString);
local function v14(v10, v11) --[[ Line: 17 ]] --[[ Name: gameStatsComp ]]
    -- upvalues: v8 (copy)
    if v10.isPrimary ~= v11.isPrimary then
        return v10.isPrimary;
    elseif v10.priority == v11.priority then
        if v8 then
            local l_serverAddId_0 = v10.serverAddId;
            local l_serverAddId_1 = v11.serverAddId;
            if l_serverAddId_0 and l_serverAddId_1 then
                return l_serverAddId_0 < l_serverAddId_1;
            end;
        end;
        return v10.addId < v11.addId;
    else
        return v10.priority > v11.priority;
    end;
end;
local v15 = 0;
return function(v16, v17) --[[ Line: 35 ]] --[[ Name: GameStats ]]
    -- upvalues: v4 (copy), v9 (copy), v8 (copy), v15 (ref), v1 (copy), v14 (copy), v5 (copy), v6 (copy), v7 (copy)
    v16 = v16 or {};
    if v17.type == v4.name then
        local v18 = nil;
        local v19 = nil;
        local v20 = v9(nil);
        local v21 = {};
        for _, v23 in ipairs(v16) do
            if v23.name == v17.statName then
                v18 = v23.addId;
                v20 = v23.text;
                if v8 then
                    v19 = v23.serverAddId;
                end;
            else
                table.insert(v21, v23);
            end;
        end;
        v15 = v15 + 1;
        v21 = v1.List.join(v21, {
            {
                name = v17.statName, 
                text = v20, 
                addId = v18 or v15, 
                isPrimary = v17.isPrimary, 
                priority = v17.priority, 
                serverAddId = v19
            }
        });
        table.sort(v21, v14);
        return v21;
    elseif v17.type == v5.name then
        return v1.List.filter(v16, function(v24) --[[ Line: 68 ]]
            -- upvalues: v17 (copy)
            return v24.name ~= v17.statName;
        end);
    elseif v17.type == v6.name then
        return v1.List.map(v16, function(v25) --[[ Line: 72 ]]
            -- upvalues: v17 (copy), v1 (ref)
            return v25.name == v17.statName and v1.Dictionary.join(v25, {
                text = v17.text
            }) or v25;
        end);
    elseif v8 and v17.type == v7.name then
        local v27 = v1.List.map(v16, function(v26) --[[ Line: 76 ]]
            -- upvalues: v17 (copy), v1 (ref)
            return v26.name == v17.statName and v1.Dictionary.join(v26, {
                serverAddId = v17.serverAddId
            }) or v26;
        end);
        table.sort(v27, v14);
        return v27;
    else
        return v16;
    end;
end;
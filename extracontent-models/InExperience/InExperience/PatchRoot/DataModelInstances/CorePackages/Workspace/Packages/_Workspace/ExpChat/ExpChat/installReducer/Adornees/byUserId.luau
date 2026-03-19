local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v4 = require(l_Parent_0.ExpChatShared);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v6 = require(l_Actions_0.AdorneeAdded);
local l_PlayerRemoved_0 = v4.Actions.PlayerRemoved;
local v8 = require(l_Actions_0.HumanoidDied);
local function v14(v9, v10, v11) --[[ Line: 16 ]] --[[ Name: findFirstChildByNameAndClass ]]
    for _, v13 in ipairs(v9:GetChildren()) do
        if v13.Name == v10 and v13:IsA(v11) then
            return v13;
        end;
    end;
    return nil;
end;
return v2.createReducer({}, {
    [v6.name] = function(v15, v16) --[[ Line: 27 ]]
        -- upvalues: v14 (copy), l_Dictionary_0 (copy)
        local v17 = v14(v16.character, "Head", "BasePart");
        local v18 = if v16.humanoid.Health == 0 then v17 else v16.character;
        return l_Dictionary_0.join(v15, {
            [v16.userId] = v18
        });
    end, 
    [v8.name] = function(v19, v20) --[[ Line: 36 ]]
        -- upvalues: v14 (copy), l_Dictionary_0 (copy)
        local v21 = v19[v20.userId];
        local v22 = nil;
        if v21 then
            v22 = v14(v21, "Head", "BasePart") or v21;
        end;
        return l_Dictionary_0.join(v19, {
            [v20.userId] = v22
        });
    end, 
    [l_PlayerRemoved_0.name] = function(v23, v24) --[[ Line: 48 ]]
        -- upvalues: l_Dictionary_0 (copy)
        return l_Dictionary_0.removeKey(v23, v24.userId);
    end
});
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_Parent_0.ExpChatShared).Logger:new("ExpChat/Reducers/" .. script.Name);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v5 = require(l_Actions_0.AvatarContextMenuWhisperSelected);
return v2.createReducer(1, {
    [v5.name] = function(v6, _) --[[ Line: 14 ]]
        -- upvalues: v3 (copy)
        v3:trace("AvatarContextMenuWhisperSelected dispatched");
        return v6 * -1;
    end
});
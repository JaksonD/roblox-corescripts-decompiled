local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local l_ClientAppLoaded_0 = require(l_Parent_0.ExpChatShared).Actions.ClientAppLoaded;
local v4 = require(l_script_FirstAncestor_0.Actions.LastInputTypeChanged);
return v2.createReducer(false, {
    [l_ClientAppLoaded_0.name] = function(_, v6) --[[ Line: 10 ]]
        return v6.isTouchEnabled;
    end, 
    [v4.name] = function(v7, v8) --[[ Line: 13 ]]
        if v8.lastInputTypeUsed == Enum.UserInputType.Touch then
            return true;
        elseif v8.lastInputTypeUsed == Enum.UserInputType.Keyboard then
            return false;
        else
            return v7;
        end;
    end
});
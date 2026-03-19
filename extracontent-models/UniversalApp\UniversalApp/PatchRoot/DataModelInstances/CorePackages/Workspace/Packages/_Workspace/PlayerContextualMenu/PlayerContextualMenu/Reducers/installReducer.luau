local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlayerContextualMenu");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Rodux);
local v3 = require(l_script_FirstAncestor_0.Rodux.UserBlocking);
local v4 = require(l_script_FirstAncestor_0.Flags.FFlagUserBlockingApiPlayerContextMenuEnabled);
return function() --[[ Line: 9 ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy)
    return v2.combineReducers({
        IsBlockedByMe = if not v4 then require(script.Parent.IsBlockedByMe) else nil, 
        UserBlocking = if v4 then v3.installReducer() else nil
    });
end;
local v0 = require(script.Parent.event);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.SharedFlags);
local l_Actions_0 = l_script_FirstAncestor_0.Actions;
local v5 = require(l_Actions_0.LegacyBubbleTextUpdated);
local v6 = require(l_script_FirstAncestor_0.Stores.GetMessagesStore);
if v3.FFlagExpChatUseMessagesStore then
    return function(v7, v8) --[[ Line: 14 ]]
        -- upvalues: v6 (copy)
        v6(false).handleLegacyBubbleTextUpdated(v7, v8);
    end;
else
    return v0(v5);
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_FFlagExpChatUseChannelTabsStore_0 = require(l_Parent_0.SharedFlags).FFlagExpChatUseChannelTabsStore;
local v3 = require(l_script_FirstAncestor_0.Flags.getFFlagExpChatEnableChannelTabsUI);
local v4 = require(l_script_FirstAncestor_0.Stores.GetChannelTabsStore);
return function(v5) --[[ Line: 13 ]]
    -- upvalues: l_FFlagExpChatUseChannelTabsStore_0 (copy), v4 (copy), v3 (copy)
    if l_FFlagExpChatUseChannelTabsStore_0 then
        return v4(false).getSelectedTabName(false);
    elseif v3() and v5 ~= nil then
        return v5.ChannelTabs.selectedTabName;
    else
        return nil;
    end;
end;
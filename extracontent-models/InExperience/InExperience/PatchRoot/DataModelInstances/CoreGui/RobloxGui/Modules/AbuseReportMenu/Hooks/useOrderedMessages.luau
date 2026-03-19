local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Workspace.Packages.ExpChat);
local v3 = require(l_CorePackages_0.Packages.React);
local l_useExpChatMessagesReducerSlice_0 = v2.Hooks.useExpChatMessagesReducerSlice;
return function() --[[ Line: 9 ]]
    -- upvalues: l_useExpChatMessagesReducerSlice_0 (copy), v3 (copy), v1 (copy)
    local v5 = l_useExpChatMessagesReducerSlice_0();
    if not v5 then
        return {};
    else
        local l_byMessageId_0 = v5.byMessageId;
        local l_windowMessagesInOrder_0 = v5.windowMessagesInOrder;
        return v3.useMemo(function() --[[ Line: 19 ]]
            -- upvalues: v1 (ref), l_windowMessagesInOrder_0 (copy), l_byMessageId_0 (copy)
            return v1.List.map(l_windowMessagesInOrder_0, function(v8) --[[ Line: 20 ]]
                -- upvalues: l_byMessageId_0 (ref)
                return l_byMessageId_0[v8];
            end);
        end, {
            l_byMessageId_0, 
            l_windowMessagesInOrder_0
        });
    end;
end;
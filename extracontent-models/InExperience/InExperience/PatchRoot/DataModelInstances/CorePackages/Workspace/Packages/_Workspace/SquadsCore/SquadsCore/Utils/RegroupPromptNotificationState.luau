local l_GuiService_0 = game:GetService("GuiService");
local v1 = {};
local v2 = nil;
local v3 = nil;
v1.setActive = function(v4, v5) --[[ Line: 7 ]] --[[ Name: setActive ]]
    -- upvalues: v2 (ref), v3 (ref)
    v2 = v4;
    v3 = v5;
end;
v1.getActiveNotifId = function() --[[ Line: 12 ]] --[[ Name: getActiveNotifId ]]
    -- upvalues: v2 (ref)
    return v2;
end;
v1.getActiveSquadId = function() --[[ Line: 16 ]] --[[ Name: getActiveSquadId ]]
    -- upvalues: v3 (ref)
    return v3;
end;
v1.clearActive = function(v6) --[[ Line: 20 ]] --[[ Name: clearActive ]]
    -- upvalues: v2 (ref), v3 (ref)
    if v6 == nil or v2 == v6 then
        v2 = nil;
        v3 = nil;
    end;
end;
v1.dismissNotification = function(v7) --[[ Line: 27 ]] --[[ Name: dismissNotification ]]
    -- upvalues: l_GuiService_0 (copy), v1 (copy)
    if v7 == nil then
        return;
    else
        pcall(function() --[[ Line: 31 ]]
            -- upvalues: l_GuiService_0 (ref), v7 (copy)
            l_GuiService_0:DismissNotification(v7);
        end);
        v1.clearActive(v7);
        return;
    end;
end;
return v1;
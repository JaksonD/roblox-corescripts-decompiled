local v0 = game:DefineFastFlag("FriendCarouselHas10ftPolicies", false);
local l_GuiService_0 = game:GetService("GuiService");
return function() --[[ Line: 4 ]]
    -- upvalues: v0 (copy), l_GuiService_0 (copy)
    if v0 then
        return l_GuiService_0:IsTenFootInterface();
    else
        return false;
    end;
end;
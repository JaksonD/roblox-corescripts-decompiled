local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Constants);
return function(v2) --[[ Line: 5 ]] --[[ Name: waitForFlashOverlay ]]
    -- upvalues: v1 (copy)
    if not v2:getState()[v1.RoduxKey].IsOverlayFlashActive then
        return;
    else
        local v3 = tick();
        while v2:getState()[v1.RoduxKey].IsOverlayFlashActive and tick() - v3 <= v1.FlashTimeout do
            task.wait();
        end;
        return;
    end;
end;
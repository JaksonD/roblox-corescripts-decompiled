local l_Parent_0 = script:FindFirstAncestor("VoiceChat").Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
return function(v3) --[[ Line: 6 ]]
    -- upvalues: l_AppPage_0 (copy), l_NavigateDown_0 (copy)
    return function(v4) --[[ Line: 7 ]]
        -- upvalues: l_AppPage_0 (ref), v3 (copy), l_NavigateDown_0 (ref)
        local v5 = {
            name = l_AppPage_0.AgeVerificationRequired, 
            detail = v3
        };
        v4:dispatch(l_NavigateDown_0(v5));
    end;
end;
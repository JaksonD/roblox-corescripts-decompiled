local l_script_FirstAncestor_0 = script:FindFirstAncestor("LoginV2");
local l_AccountService_0 = game:GetService("AccountService");
local l_game_EngineFeature_0 = game:GetEngineFeature("MagicLogin");
local v3 = require(l_script_FirstAncestor_0.Components.Constants);
return function(v4) --[[ Line: 8 ]]
    -- upvalues: l_AccountService_0 (copy), l_game_EngineFeature_0 (copy), v3 (copy)
    if l_AccountService_0 and l_game_EngineFeature_0 then
        if v4 then
            l_AccountService_0:MagicLogin(v3.START_ADVERTISEMENT);
            return;
        else
            l_AccountService_0:MagicLogin(v3.STOP_ADVERTISEMENT);
        end;
    end;
end;
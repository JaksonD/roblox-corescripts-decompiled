local l_Parent_0 = script:FindFirstAncestor("AmpUpsell").Parent;
local l_default_0 = require(l_Parent_0.LoggingProtocol).default;
local v2 = game:DefineFastFlag("EnableAmpUpsellLogging", false);
return {
    logEventOnceIfEnabled = function(v3) --[[ Line: 20 ]] --[[ Name: logEventOnceIfEnabled ]]
        -- upvalues: v2 (copy), l_default_0 (copy)
        if v2 then
            l_default_0:logEventOnce(v3);
        end;
    end
};
local l_script_FirstAncestor_0 = script:FindFirstAncestor("SduiCoreSystem");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.Signals);
local _ = require(l_script_FirstAncestor_0.SduiBuilderTypes);
local l_PropResultCategory_0 = require(l_script_FirstAncestor_0.ClientBinding.SduiClientBindingTypes).PropResultCategory;
local v5 = require(l_script_FirstAncestor_0.ClientBinding.SduiTokenBinder);
local v6 = require(l_script_FirstAncestor_0.ClientBinding.PropBuilder.SduiPropUtils);
local l_FFlagSduiInputDataSignals_0 = require(l_Parent_0.SharedFlags).FFlagSduiInputDataSignals;
return function(v8, v9, _, _, v12, _) --[[ Line: 29 ]] --[[ Name: buildTokenOnlyProp ]]
    -- upvalues: l_FFlagSduiInputDataSignals_0 (copy), v6 (copy), l_PropResultCategory_0 (copy), v5 (copy)
    if v8 == "token" then
        if l_FFlagSduiInputDataSignals_0 then
            return v6.generateTokenBindingPropValue(v9, v12), l_PropResultCategory_0.PropSignal;
        else
            local v14 = string.split(v9, ".");
            return v5.createTokenComputed(v14, v12.appPage), l_PropResultCategory_0.PropSignal;
        end;
    else
        if v8 == "conditional" then
            error("TODO Conditionals not yet supported");
        end;
        return nil, l_PropResultCategory_0.Failed;
    end;
end;
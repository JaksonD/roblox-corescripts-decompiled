local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_llama_0 = v1.llama;
return function(v4) --[[ Line: 6 ]]
    -- upvalues: l_Roact_0 (copy), l_llama_0 (copy)
    return function(v5) --[[ Line: 7 ]]
        -- upvalues: l_Roact_0 (ref), v4 (copy), l_llama_0 (ref)
        return function(v6) --[[ Line: 8 ]]
            -- upvalues: l_Roact_0 (ref), v4 (ref), l_llama_0 (ref), v5 (copy)
            local v7 = l_Roact_0.Component:extend("Connected-" .. tostring(v6));
            v7.render = function(v8) --[[ Line: 11 ]] --[[ Name: render ]]
                -- upvalues: l_Roact_0 (ref), v4 (ref), v6 (copy), l_llama_0 (ref), v5 (ref)
                return l_Roact_0.createElement(v4.Consumer, {
                    render = function(v9) --[[ Line: 13 ]] --[[ Name: render ]]
                        -- upvalues: l_Roact_0 (ref), v6 (ref), l_llama_0 (ref), v8 (copy), v5 (ref)
                        return l_Roact_0.createElement(v6, l_llama_0.Dictionary.join(v8.props, v5(v9)));
                    end
                });
            end;
            return v7;
        end;
    end;
end;
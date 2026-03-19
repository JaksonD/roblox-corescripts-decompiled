local l_Parent_0 = script:FindFirstAncestor("ExpChat").Parent;
local v1 = require(l_Parent_0.React);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local _ = function(v3) --[[ Line: 6 ]] --[[ Name: getConnect ]]
    -- upvalues: l_Dictionary_0 (copy), v1 (copy)
    return function(v4) --[[ Line: 7 ]]
        -- upvalues: l_Dictionary_0 (ref), v1 (ref), v3 (copy)
        local function v11(v5, v6) --[[ Line: 8 ]] --[[ Name: transformedMapper ]]
            -- upvalues: l_Dictionary_0 (ref), v4 (copy)
            return l_Dictionary_0.map(v4(v6), function(v7, _) --[[ Line: 9 ]]
                -- upvalues: v5 (copy)
                local l_status_0, l_result_0 = pcall(function() --[[ Line: 10 ]]
                    -- upvalues: v5 (ref), v7 (copy)
                    return v5:TranslateGameText(game, v7);
                end);
                if l_status_0 then
                    return l_result_0;
                else
                    return "";
                end;
            end);
        end;
        return function(v12) --[[ Line: 22 ]]
            -- upvalues: v1 (ref), v3 (ref), l_Dictionary_0 (ref), v11 (copy)
            local v13 = v1.Component:extend("Connected-" .. tostring(v12));
            v13.render = function(v14) --[[ Line: 25 ]] --[[ Name: render ]]
                -- upvalues: v1 (ref), v3 (ref), v12 (copy), l_Dictionary_0 (ref), v11 (ref)
                return v1.createElement(v3.Consumer, {
                    render = function(v15) --[[ Line: 27 ]] --[[ Name: render ]]
                        -- upvalues: v1 (ref), v12 (ref), l_Dictionary_0 (ref), v14 (copy), v11 (ref)
                        return v1.createElement(v12, l_Dictionary_0.join(v14.props, v11(v15, v14.props)));
                    end
                });
            end;
            return v13;
        end;
    end;
end;
return function(v17) --[[ Line: 41 ]]
    -- upvalues: v1 (copy), l_Dictionary_0 (copy)
    local v18 = v1.createContext(v17);
    return {
        Consumer = v18.Consumer, 
        Provider = v18.Provider, 
        connect = function(v19) --[[ Line: 7 ]]
            -- upvalues: l_Dictionary_0 (ref), v1 (ref), v18 (copy)
            local function v26(v20, v21) --[[ Line: 8 ]] --[[ Name: transformedMapper ]]
                -- upvalues: l_Dictionary_0 (ref), v19 (copy)
                return l_Dictionary_0.map(v19(v21), function(v22, _) --[[ Line: 9 ]]
                    -- upvalues: v20 (copy)
                    local l_status_1, l_result_1 = pcall(function() --[[ Line: 10 ]]
                        -- upvalues: v20 (ref), v22 (copy)
                        return v20:TranslateGameText(game, v22);
                    end);
                    if l_status_1 then
                        return l_result_1;
                    else
                        return "";
                    end;
                end);
            end;
            return function(v27) --[[ Line: 22 ]]
                -- upvalues: v1 (ref), v18 (ref), l_Dictionary_0 (ref), v26 (copy)
                local v28 = v1.Component:extend("Connected-" .. tostring(v27));
                v28.render = function(v29) --[[ Line: 25 ]] --[[ Name: render ]]
                    -- upvalues: v1 (ref), v18 (ref), v27 (copy), l_Dictionary_0 (ref), v26 (ref)
                    return v1.createElement(v18.Consumer, {
                        render = function(v30) --[[ Line: 27 ]] --[[ Name: render ]]
                            -- upvalues: v1 (ref), v27 (ref), l_Dictionary_0 (ref), v29 (copy), v26 (ref)
                            return v1.createElement(v27, l_Dictionary_0.join(v29.props, v26(v30, v29.props)));
                        end
                    });
                end;
                return v28;
            end;
        end
    };
end;
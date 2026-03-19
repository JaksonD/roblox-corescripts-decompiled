local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.React);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v5 = require(l_script_FirstAncestor_0.Flags.FFlagExpChatTcIndicator);
local function v12(v6, v7) --[[ Line: 11 ]] --[[ Name: mapStringToBeLocalized ]]
    if type(v7) == "table" then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 13 ]]
            -- upvalues: v6 (copy), v7 (copy)
            return v6:FormatByKey(v7[1], v7[2]);
        end);
        if l_status_0 then
            return l_result_0;
        else
            return "";
        end;
    elseif type(v7) == "string" then
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 23 ]]
            -- upvalues: v6 (copy), v7 (copy)
            return v6:FormatByKey(v7);
        end);
        if l_status_1 then
            return l_result_1;
        else
            return "";
        end;
    else
        return "";
    end;
end;
local _ = function(v13) --[[ Line: 37 ]] --[[ Name: getConnect ]]
    -- upvalues: l_Dictionary_0 (copy), v5 (copy), v12 (copy), v2 (copy)
    return function(v14) --[[ Line: 38 ]]
        -- upvalues: l_Dictionary_0 (ref), v5 (ref), v12 (ref), v2 (ref), v13 (copy)
        local function v23(v15, v16) --[[ Line: 39 ]] --[[ Name: transformedMapper ]]
            -- upvalues: l_Dictionary_0 (ref), v14 (copy), v5 (ref), v12 (ref)
            return l_Dictionary_0.map(v14(v16), function(v17, _) --[[ Line: 40 ]]
                -- upvalues: v5 (ref), v12 (ref), v15 (copy)
                if v5 then
                    return (v12(v15, v17));
                elseif type(v17) == "table" then
                    local l_status_2, l_result_2 = pcall(function() --[[ Line: 46 ]]
                        -- upvalues: v15 (ref), v17 (copy)
                        return v15:FormatByKey(v17[1], v17[2]);
                    end);
                    if l_status_2 then
                        return l_result_2;
                    else
                        return "";
                    end;
                elseif type(v17) == "string" then
                    local l_status_3, l_result_3 = pcall(function() --[[ Line: 56 ]]
                        -- upvalues: v15 (ref), v17 (copy)
                        return v15:FormatByKey(v17);
                    end);
                    if l_status_3 then
                        return l_result_3;
                    else
                        return "";
                    end;
                else
                    return "";
                end;
            end);
        end;
        return function(v24) --[[ Line: 71 ]]
            -- upvalues: v2 (ref), v13 (ref), l_Dictionary_0 (ref), v23 (copy)
            local v25 = v2.Component:extend("Connected-" .. tostring(v24));
            v25.render = function(v26) --[[ Line: 74 ]] --[[ Name: render ]]
                -- upvalues: v2 (ref), v13 (ref), v24 (copy), l_Dictionary_0 (ref), v23 (ref)
                return v2.createElement(v13.Consumer, {
                    render = function(v27) --[[ Line: 76 ]] --[[ Name: render ]]
                        -- upvalues: v2 (ref), v24 (ref), l_Dictionary_0 (ref), v26 (copy), v23 (ref)
                        return v2.createElement(v24, l_Dictionary_0.join(v26.props, v23(v27, v26.props)));
                    end
                });
            end;
            return v25;
        end;
    end;
end;
local _ = function(v29) --[[ Line: 90 ]] --[[ Name: getUseLocalization ]]
    -- upvalues: v3 (copy), l_Dictionary_0 (copy), v12 (copy)
    return function(v30) --[[ Line: 91 ]]
        -- upvalues: v3 (ref), v29 (copy), l_Dictionary_0 (ref), v12 (ref)
        local v31 = v3.useContext(v29);
        return l_Dictionary_0.map(v30, function(v32, _) --[[ Line: 93 ]]
            -- upvalues: v12 (ref), v31 (copy)
            return (v12(v31, v32));
        end);
    end;
end;
return function(v35) --[[ Line: 99 ]]
    -- upvalues: v2 (copy), l_Dictionary_0 (copy), v5 (copy), v12 (copy), v3 (copy)
    local v36 = v2.createContext(v35);
    return {
        Consumer = v36.Consumer, 
        Provider = v36.Provider, 
        connect = function(v37) --[[ Line: 38 ]]
            -- upvalues: l_Dictionary_0 (ref), v5 (ref), v12 (ref), v2 (ref), v36 (copy)
            local function v46(v38, v39) --[[ Line: 39 ]] --[[ Name: transformedMapper ]]
                -- upvalues: l_Dictionary_0 (ref), v37 (copy), v5 (ref), v12 (ref)
                return l_Dictionary_0.map(v37(v39), function(v40, _) --[[ Line: 40 ]]
                    -- upvalues: v5 (ref), v12 (ref), v38 (copy)
                    if v5 then
                        return (v12(v38, v40));
                    elseif type(v40) == "table" then
                        local l_status_4, l_result_4 = pcall(function() --[[ Line: 46 ]]
                            -- upvalues: v38 (ref), v40 (copy)
                            return v38:FormatByKey(v40[1], v40[2]);
                        end);
                        if l_status_4 then
                            return l_result_4;
                        else
                            return "";
                        end;
                    elseif type(v40) == "string" then
                        local l_status_5, l_result_5 = pcall(function() --[[ Line: 56 ]]
                            -- upvalues: v38 (ref), v40 (copy)
                            return v38:FormatByKey(v40);
                        end);
                        if l_status_5 then
                            return l_result_5;
                        else
                            return "";
                        end;
                    else
                        return "";
                    end;
                end);
            end;
            return function(v47) --[[ Line: 71 ]]
                -- upvalues: v2 (ref), v36 (ref), l_Dictionary_0 (ref), v46 (copy)
                local v48 = v2.Component:extend("Connected-" .. tostring(v47));
                v48.render = function(v49) --[[ Line: 74 ]] --[[ Name: render ]]
                    -- upvalues: v2 (ref), v36 (ref), v47 (copy), l_Dictionary_0 (ref), v46 (ref)
                    return v2.createElement(v36.Consumer, {
                        render = function(v50) --[[ Line: 76 ]] --[[ Name: render ]]
                            -- upvalues: v2 (ref), v47 (ref), l_Dictionary_0 (ref), v49 (copy), v46 (ref)
                            return v2.createElement(v47, l_Dictionary_0.join(v49.props, v46(v50, v49.props)));
                        end
                    });
                end;
                return v48;
            end;
        end, 
        useLocalization = function(v51) --[[ Line: 91 ]]
            -- upvalues: v3 (ref), v36 (copy), l_Dictionary_0 (ref), v12 (ref)
            local v52 = v3.useContext(v36);
            return l_Dictionary_0.map(v51, function(v53, _) --[[ Line: 93 ]]
                -- upvalues: v12 (ref), v52 (copy)
                return (v12(v52, v53));
            end);
        end
    };
end;
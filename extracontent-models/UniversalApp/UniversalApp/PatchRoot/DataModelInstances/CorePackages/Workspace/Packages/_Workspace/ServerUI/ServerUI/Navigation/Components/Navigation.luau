local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerUI");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_script_FirstAncestor_0.Navigation.NavigationContext);
return function(v5) --[[ Line: 7 ]] --[[ Name: Navigation ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy)
    local v6, v7 = v2.useState({});
    local v8 = v2.useMemo(function() --[[ Line: 10 ]]
        -- upvalues: v6 (copy)
        return v6 and v6[#v6] or nil;
    end);
    local function v12(v9, v10, v11) --[[ Line: 14 ]] --[[ Name: reset ]]
        -- upvalues: v7 (copy)
        v7({
            {
                componentRefs = v9, 
                params = v10, 
                templateName = v11
            }
        });
    end;
    local function v16(v13, v14, v15) --[[ Line: 22 ]] --[[ Name: push ]]
        -- upvalues: v8 (copy), v7 (copy), v3 (ref), v6 (copy)
        if v15 or v8 and v8.templateName then
            v7(v3.List.join(v6, {
                {
                    componentRefs = v13, 
                    params = v14, 
                    templateName = v15 or v8.templateName
                }
            }));
        end;
    end;
    local function v18(v17) --[[ Line: 34 ]] --[[ Name: pushParams ]]
        -- upvalues: v8 (copy), v7 (copy), v3 (ref), v6 (copy)
        if v8 then
            v7(v3.List.join(v6, {
                {
                    componentRefs = v8.componentRefs, 
                    params = v17, 
                    templateName = v8.templateName
                }
            }));
        end;
    end;
    return v2.createElement(v4.Provider, {
        value = {
            stack = v6, 
            setStack = v7, 
            currentRoute = v8, 
            reset = v12, 
            push = v16, 
            pushParams = v18
        }
    }, v5.children);
end;
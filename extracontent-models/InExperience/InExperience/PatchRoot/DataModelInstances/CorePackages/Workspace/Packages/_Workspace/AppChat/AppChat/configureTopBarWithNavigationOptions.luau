local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.ArgCheck);
local v3 = require(l_Parent_0.Cryo);
local v4 = require(l_Parent_0.Roact);
local v5 = require(l_Parent_0.RoactNavigation);
local v6 = require(l_Parent_0.SignalsReact);
local v7 = require(l_script_FirstAncestor_0.createChatTopBar);
local v8 = require(l_script_FirstAncestor_0.Stores.GetTopBarStore);
local v9 = require(l_script_FirstAncestor_0.TopBarContext);
local v10 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatTopBarSignalsStore);
local v11 = game:DefineFastFlag("AppChatFixChatDetailsStaleData", false);
local function v22(v12) --[[ Line: 65 ]] --[[ Name: TopBarFromStore ]]
    -- upvalues: v5 (copy), v8 (copy), v6 (copy), v2 (copy), v11 (copy), v3 (copy), v7 (copy)
    local l_navigation_0 = v12.navigation;
    local v14 = v5.getActiveChildNavigationOptions(l_navigation_0);
    local l_state_0 = l_navigation_0.state;
    local v16 = l_state_0.routes[l_state_0.index];
    local v17 = v8(false).getScreenTopBar(v16.routeName);
    local v18 = v6.useSignalState(v17);
    v2.isType(v18, "table", "screenTopBar");
    local l_v18_0 = v18;
    if v11 then
        local v20 = v16.params and v16.params.conversationId;
        local l_conversationId_0 = v18.conversationId;
        if v20 and l_conversationId_0 and v20 ~= l_conversationId_0 then
            l_v18_0 = v3.Dictionary.union(v18, {
                headerText = {
                    raw = "", 
                    shouldLocalize = false
                }
            });
        end;
    end;
    return v7(v3.Dictionary.join(l_v18_0, v14, {
        navigation = l_navigation_0
    }));
end;
local function v33(v23) --[[ Line: 98 ]] --[[ Name: TopBarFromContext ]]
    -- upvalues: v5 (copy), v4 (copy), v9 (copy), v2 (copy), v11 (copy), v3 (copy), v7 (copy)
    local l_navigation_1 = v23.navigation;
    local v25 = v5.getActiveChildNavigationOptions(l_navigation_1);
    return v4.createElement(v9.Consumer, {
        render = function(v26) --[[ Line: 103 ]] --[[ Name: render ]]
            -- upvalues: l_navigation_1 (copy), v2 (ref), v11 (ref), v3 (ref), v7 (ref), v25 (copy)
            local l_state_1 = l_navigation_1.state;
            local v28 = l_state_1.routes[l_state_1.index];
            local v29 = v26.getScreenTopBar(v28.routeName);
            v2.isType(v29, "table", "screenTopBar");
            local l_v29_0 = v29;
            if v11 then
                local v31 = v28.params and v28.params.conversationId;
                local l_conversationId_1 = v29.conversationId;
                if v31 and l_conversationId_1 and v31 ~= l_conversationId_1 then
                    l_v29_0 = v3.Dictionary.union(v29, {
                        headerText = {
                            raw = "", 
                            shouldLocalize = false
                        }
                    });
                end;
            end;
            return v7(v3.Dictionary.join(l_v29_0, v25, {
                navigation = l_navigation_1
            }));
        end
    });
end;
return function(v34) --[[ Line: 133 ]]
    -- upvalues: v10 (copy), v22 (copy), v33 (copy), v4 (copy)
    local v35 = if v10 then v22 else v33;
    return v4.createElement(v35, {
        navigation = v34
    });
end;
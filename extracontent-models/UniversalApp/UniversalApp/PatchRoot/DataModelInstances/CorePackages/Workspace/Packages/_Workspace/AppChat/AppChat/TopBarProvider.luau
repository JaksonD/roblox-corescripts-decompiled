local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SignalsReact);
local v4 = require(l_script_FirstAncestor_0.Stores.GetTopBarStore);
local v5 = require(l_script_FirstAncestor_0.TopBarContext);
local v6 = require(l_script_FirstAncestor_0.Flags.FFlagAppChatTopBarSignalsStore);
local function v14(v7) --[[ Line: 15 ]] --[[ Name: TopBarFromStore ]]
    -- upvalues: v4 (copy), v3 (copy), v2 (copy)
    local l_screenName_0 = v7.screenName;
    local l_render_0 = v7.render;
    local v10 = v4(false);
    local v11 = v10.getScreenTopBar(l_screenName_0);
    local v12 = v3.useSignalState(v11);
    return l_render_0((v2.useMemo(function() --[[ Line: 23 ]]
        -- upvalues: l_screenName_0 (copy), v12 (copy), v10 (copy)
        return {
            getScreenTopBar = function(v13) --[[ Line: 25 ]] --[[ Name: getScreenTopBar ]]
                -- upvalues: l_screenName_0 (ref), v12 (ref), v10 (ref)
                if v13 == l_screenName_0 then
                    return v12;
                else
                    return v10.getScreenTopBar(v13)(false) or {};
                end;
            end, 
            setScreenTopBar = v10.setScreenTopBar
        };
    end, {
        l_screenName_0, 
        v12
    })));
end;
if v6 then
    return v14;
else
    return v5.Consumer;
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v1 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateDown);
local v2 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateFromWebView);
local v3 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateBack);
local v4 = require(l_script_FirstAncestor_0.LuaApp.AppPage);
return function() --[[ Line: 10 ]]
    -- upvalues: v3 (copy), v1 (copy), v4 (copy), v2 (copy)
    return function(v5) --[[ Line: 11 ]]
        -- upvalues: v3 (ref), v1 (ref), v4 (ref), v2 (ref)
        local function v6() --[[ Line: 12 ]] --[[ Name: onClose ]]
            -- upvalues: v5 (copy), v3 (ref)
            v5:dispatch(v3());
        end;
        v5:dispatch(v1({
            name = v4.VerifiedBadgeModal, 
            extraProps = {
                onConfirm = function() --[[ Line: 19 ]] --[[ Name: onConfirm ]]
                    -- upvalues: v5 (copy), v2 (ref), v4 (ref), v6 (copy)
                    v5:dispatch(v2({
                        name = v4.GenericWebPage, 
                        detail = "https://en.help.roblox.com/hc/en-us/articles/7997207259156", 
                        extraProps = {
                            onClose = v6
                        }
                    }));
                end, 
                onClose = v6
            }
        }));
    end;
end;
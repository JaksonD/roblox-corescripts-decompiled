local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Responsive);
local l_useIsWideMode_0 = require(l_Parent_0.SocialCommon).Hooks.useIsWideMode;
local v4 = require(l_script_FirstAncestor_0.Flags.FIntAppChatWideBreakpointMinHeight);
local v5 = require(l_script_FirstAncestor_0.Flags.FIntAppChatWideBreakpointMinWidth);
return function(v6) --[[ Line: 10 ]]
    -- upvalues: l_useIsWideMode_0 (copy), v2 (copy), v5 (copy), v4 (copy)
    local v7 = l_useIsWideMode_0();
    local v8 = v2.useOrientation();
    local v9 = v2.useResponsive({
        {
            Key = "wide", 
            minWidth = v5, 
            minHeight = v4
        }
    }) == "wide";
    if not v6 then
        return v7;
    else
        local v10 = true;
        if v8 == v2.Keys.Portrait or not v9 then
            v10 = false;
        end;
        return v10;
    end;
end;
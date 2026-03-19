local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_makeActionCreator_0 = require(l_Parent_0.Rodux).makeActionCreator;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
return l_makeActionCreator_0(script.Name, function(v4) --[[ Line: 8 ]]
    -- upvalues: l_AppPage_0 (copy), l_mutedError_0 (copy)
    if l_AppPage_0[v4] == nil then
        l_mutedError_0("SetPageSessionTimestamp action expects page to be a valid page type, %s is not in AppPage", v4);
    end;
    return {
        page = v4, 
        timestamp = tick()
    };
end);
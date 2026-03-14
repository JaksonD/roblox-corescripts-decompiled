local l_Parent_0 = script:FindFirstAncestor("AvatarExperienceCommon").Parent;
local v1 = require(l_Parent_0.React);
local l_useFocusNavigableSurfaceRegistryConnection_0 = require(l_Parent_0.FocusNavigationUtils).useFocusNavigableSurfaceRegistryConnection;
local l_FocusNavigableSurfaceIdentifierEnum_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum;
return function(v4) --[[ Line: 8 ]] --[[ Name: Overlay ]]
    -- upvalues: v1 (copy), l_useFocusNavigableSurfaceRegistryConnection_0 (copy), l_FocusNavigableSurfaceIdentifierEnum_0 (copy)
    local v5 = nil;
    local v6 = nil;
    local v7, v8 = v1.useState(nil);
    v5 = v7;
    v6 = v8;
    l_useFocusNavigableSurfaceRegistryConnection_0(v5, l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay);
    v7 = table.clone(v4);
    v7.ref = v6;
    v7.SelectionGroup = true;
    v7.SelectionBehaviorDown = Enum.SelectionBehavior.Stop;
    v7.SelectionBehaviorUp = Enum.SelectionBehavior.Stop;
    v7.SelectionBehaviorRight = Enum.SelectionBehavior.Stop;
    v7.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop;
    return v1.createElement("Frame", v7);
end;
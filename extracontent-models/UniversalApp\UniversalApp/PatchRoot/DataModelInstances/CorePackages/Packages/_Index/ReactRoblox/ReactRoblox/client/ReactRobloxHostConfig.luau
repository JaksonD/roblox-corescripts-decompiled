local function _(v0) --[[ Line: 13 ]] --[[ Name: unimplemented ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring(v0));
    error("FIXME (roblox): " .. v0 .. " is unimplemented", 2);
end;
local l_CollectionService_0 = game:GetService("CollectionService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(l_Parent_0.ReactGlobals);
local v5 = require(l_Parent_0.LuauPolyfill);
local l_inspect_0 = v5.util.inspect;
local l_console_0 = require(l_Parent_0.Shared).console;
local l_Object_0 = v5.Object;
local l_setTimeout_0 = v5.setTimeout;
local l_clearTimeout_0 = v5.clearTimeout;
local _ = require(script.Parent["ReactRobloxHostTypes.roblox"]);
local v12 = require(script.Parent.ReactRobloxComponentTree);
local l_precacheFiberNode_0 = v12.precacheFiberNode;
local l_uncacheFiberNode_0 = v12.uncacheFiberNode;
local l_updateFiberProps_0 = v12.updateFiberProps;
local v16 = require(script.Parent.ReactRobloxComponent);
local l_setInitialProperties_0 = v16.setInitialProperties;
local l_diffProperties_0 = v16.diffProperties;
local l_updateProperties_0 = v16.updateProperties;
local l_cleanupHostComponent_0 = v16.cleanupHostComponent;
local l_enableCreateEventHandleAPI_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableCreateEventHandleAPI;
local _ = function(v22) --[[ Line: 206 ]] --[[ Name: recursivelyUncacheFiberNode ]]
    -- upvalues: l_uncacheFiberNode_0 (copy)
    if typeof(v22) ~= "Instance" then
        return;
    else
        l_uncacheFiberNode_0(v22);
        for _, v24 in v22:GetDescendants() do
            l_uncacheFiberNode_0(v24);
        end;
        return;
    end;
end;
local v26 = {};
l_Object_0.assign(v26, require(l_Parent_0.Shared).ReactFiberHostConfig.WithNoPersistence);
v26.getRootHostContext = function(v27) --[[ Line: 224 ]]
    return v27.ClassName;
end;
v26.getChildHostContext = function(v28, _, _) --[[ Line: 262 ]]
    return v28;
end;
v26.getPublicInstance = function(v31) --[[ Line: 283 ]]
    return v31;
end;
v26.prepareForCommit = function(_) --[[ Line: 287 ]]
    -- upvalues: l_enableCreateEventHandleAPI_0 (copy)
    if l_enableCreateEventHandleAPI_0 then
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("UNIMPLEMENTED ERROR: " .. tostring("enableCreateEventHandleAPI"));
        error("FIXME (roblox): enableCreateEventHandleAPI is unimplemented", 2);
    end;
    return nil;
end;
v26.beforeActiveInstanceBlur = function() --[[ Line: 302 ]]
    -- upvalues: l_enableCreateEventHandleAPI_0 (copy)
    if l_enableCreateEventHandleAPI_0 then
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("UNIMPLEMENTED ERROR: " .. tostring("enableCreateEventHandleAPI"));
        error("FIXME (roblox): enableCreateEventHandleAPI is unimplemented", 2);
    end;
end;
v26.afterActiveInstanceBlur = function() --[[ Line: 311 ]]
    -- upvalues: l_enableCreateEventHandleAPI_0 (copy)
    if l_enableCreateEventHandleAPI_0 then
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        print("UNIMPLEMENTED ERROR: " .. tostring("enableCreateEventHandleAPI"));
        error("FIXME (roblox): enableCreateEventHandleAPI is unimplemented", 2);
    end;
end;
v26.resetAfterCommit = function(_) --[[ Line: 320 ]]

end;
v26.createInstance = function(v34, v35, _, _, v38) --[[ Line: 328 ]]
    -- upvalues: l_precacheFiberNode_0 (copy), l_updateFiberProps_0 (copy)
    local v39 = Instance.new(v34);
    if v38.key then
        v39.Name = v38.key;
    else
        local l_return__0 = v38.return_;
        while l_return__0 do
            if l_return__0.key then
                v39.Name = l_return__0.key;
                break;
            else
                l_return__0 = l_return__0.return_;
            end;
        end;
    end;
    l_precacheFiberNode_0(v38, v39);
    l_updateFiberProps_0(v39, v35);
    return v39;
end;
v26.appendInitialChild = function(v41, v42) --[[ Line: 395 ]]
    v42.Parent = v41;
end;
v26.finalizeInitialChildren = function(v43, v44, v45, v46, _) --[[ Line: 400 ]]
    -- upvalues: l_setInitialProperties_0 (copy)
    l_setInitialProperties_0(v43, v44, v45, v46);
    return false;
end;
v26.prepareUpdate = function(v48, v49, v50, v51, v52, _) --[[ Line: 412 ]] --[[ Name: prepareUpdate ]]
    -- upvalues: l_diffProperties_0 (copy)
    return l_diffProperties_0(v48, v49, v50, v51, v52);
end;
v26.shouldSetTextContent = function(_, _) --[[ Line: 439 ]]
    return false;
end;
v26.createTextInstance = function(_, _, _, _) --[[ Line: 455 ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring("createTextInstance"));
    error("FIXME (roblox): createTextInstance is unimplemented", 2);
    return nil;
end;
v26.isPrimaryRenderer = true;
v26.warnsIfNotActing = true;
v26.scheduleTimeout = l_setTimeout_0;
v26.cancelTimeout = l_clearTimeout_0;
v26.noTimeout = -1;
v26.supportsMutation = true;
v26.commitMount = function(_, _, _, _) --[[ Line: 481 ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring("commitMount"));
    error("FIXME (roblox): commitMount is unimplemented", 2);
end;
v26.commitUpdate = function(v64, v65, _, v67, v68, _) --[[ Line: 503 ]]
    -- upvalues: l_updateFiberProps_0 (copy), l_updateProperties_0 (copy)
    l_updateFiberProps_0(v64, v68);
    l_updateProperties_0(v64, v65, v67);
end;
local function v71(v70) --[[ Line: 532 ]] --[[ Name: checkTags ]]
    -- upvalues: l_console_0 (copy), l_inspect_0 (copy), l_CollectionService_0 (copy)
    if typeof(v70) ~= "Instance" then
        l_console_0.warn("Could not check tags on non-instance %s.", l_inspect_0(v70));
        return;
    else
        if not v70:IsDescendantOf(game) and #l_CollectionService_0:GetTags(v70) > 0 then
            l_console_0.warn("Tags applied to orphaned %s \"%s\" cannot be accessed via CollectionService:GetTagged. If you're relying on tag behavior in a unit test, consider mounting your test root into the DataModel.", v70.ClassName, v70.Name);
        end;
        return;
    end;
end;
v26.appendChild = function(v72, v73) --[[ Line: 551 ]]
    -- upvalues: v4 (copy), v71 (copy)
    v73.Parent = v72;
    if v4.__DEV__ then
        v71(v73);
    end;
end;
v26.appendChildToContainer = function(v74, v75) --[[ Line: 560 ]]
    -- upvalues: v26 (copy)
    v26.appendChild(v74, v75);
end;
v26.insertBefore = function(v76, v77, _) --[[ Line: 589 ]]
    -- upvalues: v4 (copy), v71 (copy)
    v77.Parent = v76;
    if v4.__DEV__ then
        v71(v77);
    end;
end;
v26.insertInContainerBefore = function(v79, v80, v81) --[[ Line: 602 ]]
    -- upvalues: v26 (copy)
    v26.insertBefore(v79, v80, v81);
end;
v26.removeChild = function(_, v83) --[[ Line: 644 ]]
    -- upvalues: l_uncacheFiberNode_0 (copy), l_cleanupHostComponent_0 (copy)
    if typeof(v83) == "Instance" then
        l_uncacheFiberNode_0(v83);
        for _, v85 in v83:GetDescendants() do
            l_uncacheFiberNode_0(v85);
        end;
    end;
    l_cleanupHostComponent_0(v83);
    v83.Parent = nil;
    v83:Destroy();
end;
v26.removeChildFromContainer = function(v86, v87) --[[ Line: 656 ]]
    -- upvalues: v26 (copy)
    v26.removeChild(v86, v87);
end;
v26.clearSuspenseBoundary = function(_, _) --[[ Line: 667 ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring("clearSuspenseBoundary"));
    error("FIXME (roblox): clearSuspenseBoundary is unimplemented", 2);
end;
v26.clearSuspenseBoundaryFromContainer = function(_, _) --[[ Line: 707 ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring("clearSuspenseBoundaryFromContainer"));
    error("FIXME (roblox): clearSuspenseBoundaryFromContainer is unimplemented", 2);
end;
v26.hideInstance = function(_) --[[ Line: 724 ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring("hideInstance"));
    error("FIXME (roblox): hideInstance is unimplemented", 2);
end;
v26.hideTextInstance = function(_) --[[ Line: 738 ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring("hideTextInstance"));
    error("FIXME (roblox): hideTextInstance is unimplemented", 2);
end;
v26.unhideInstance = function(_, _) --[[ Line: 743 ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring("unhideInstance"));
    error("FIXME (roblox): unhideInstance is unimplemented", 2);
end;
v26.unhideTextInstance = function(_, _) --[[ Line: 757 ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring("unhideTextInstance"));
    error("FIXME (roblox): unhideTextInstance is unimplemented", 2);
end;
v26.clearContainer = function(v98) --[[ Line: 762 ]]
    -- upvalues: v26 (copy)
    for _, v100 in v98:GetChildren() do
        v26.removeChild(v98, v100);
    end;
end;
v26.preparePortalMount = function(_) --[[ Line: 1205 ]]

end;
return v26;
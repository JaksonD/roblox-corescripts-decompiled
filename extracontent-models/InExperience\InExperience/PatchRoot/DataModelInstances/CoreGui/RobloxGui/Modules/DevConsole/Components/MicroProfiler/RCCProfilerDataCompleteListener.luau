local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(script.Parent.Parent.Parent.Util.getClientReplicator);
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local l_Actions_0 = script.Parent.Parent.Parent.Actions;
local v5 = require(l_Actions_0.AppendRecentDumpPath);
local v6 = require(l_Actions_0.SetRCCProfilerState);
local v7 = v2.Component:extend("RCCProfilerDataCompleteListener");
v7.didMount = function(v8) --[[ Line: 13 ]] --[[ Name: didMount ]]
    -- upvalues: v1 (copy)
    local v9 = v1();
    if v9 then
        v8.completeSignal = v9.RCCProfilerDataComplete:Connect(function(v10, v11) --[[ Line: 16 ]]
            -- upvalues: v8 (copy)
            if v8.props.waitingForRecording then
                if not v10 then
                    warn(v11);
                    v8.props.dispatchSetRCCProfilerState(false);
                    return;
                else
                    v8.props.dispatchSetRCCProfilerState(false, v11);
                    v8.props.dispatchAppendRecentDumpPath(v11);
                end;
            end;
        end);
    end;
end;
v7.willUnmount = function(v12) --[[ Line: 30 ]] --[[ Name: willUnmount ]]
    if v12.completeSignal then
        v12.completeSignal:Disconnect();
        v12.completeSignal = nil;
    end;
end;
v7.render = function(_) --[[ Line: 37 ]] --[[ Name: render ]]
    return nil;
end;
return v3.UNSTABLE_connect2(function(v14, _) --[[ Line: 41 ]] --[[ Name: mapStateToProps ]]
    return {
        waitingForRecording = v14.MicroProfiler.waitingForRecording
    };
end, function(v16) --[[ Line: 47 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v5 (copy), v6 (copy)
    return {
        dispatchAppendRecentDumpPath = function(v17) --[[ Line: 49 ]] --[[ Name: dispatchAppendRecentDumpPath ]]
            -- upvalues: v16 (copy), v5 (ref)
            v16(v5(v17));
        end, 
        dispatchSetRCCProfilerState = function(v18, v19) --[[ Line: 52 ]] --[[ Name: dispatchSetRCCProfilerState ]]
            -- upvalues: v16 (copy), v6 (ref)
            v16(v6(v18, v19));
        end
    };
end)(v7);
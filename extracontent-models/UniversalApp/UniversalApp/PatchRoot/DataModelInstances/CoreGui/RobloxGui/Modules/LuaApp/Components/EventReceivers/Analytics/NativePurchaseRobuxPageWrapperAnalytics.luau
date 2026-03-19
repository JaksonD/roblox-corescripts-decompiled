local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
local v3 = require(l_Modules_0.LuaApp.Flags.FFlagNativePurchaseRobuxPageWrapperEnableTelemetryV2);
local v4 = {};
v4.__index = v4;
v4.new = function(v5, v6) --[[ Line: 27 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy)
    local v7 = {
        buyrobux_latency_metrics_session_id = v5, 
        init_time = v6, 
        did_mount_time = nil, 
        render_time = nil, 
        webview_load_time = nil, 
        get_robux_balance_start = nil, 
        get_robux_balance_response = nil, 
        api_latency_ms = nil, 
        init_to_mount_latency_ms = nil, 
        mount_to_render_latency_ms = nil
    };
    setmetatable(v7, v4);
    return v7;
end;
v4.setMountTime = function(v8, v9) --[[ Line: 46 ]] --[[ Name: setMountTime ]]
    v8.did_mount_time = v9;
    if v8.init_time then
        v8.init_to_mount_latency_ms = (v9 - v8.init_time) * 1000;
    end;
end;
v4.setRenderTime = function(v10, v11) --[[ Line: 53 ]] --[[ Name: setRenderTime ]]
    v10.render_time = v11;
    if v10.did_mount_time then
        v10.mount_to_render_latency_ms = (v11 - v10.did_mount_time) * 1000;
    end;
end;
v4.setApiTiming = function(v12, v13, v14) --[[ Line: 60 ]] --[[ Name: setApiTiming ]]
    v12.get_robux_balance_start = v13;
    v12.get_robux_balance_response = v14;
    v12.api_latency_ms = (v14 - v13) * 1000;
end;
v4.setWebViewLoadTime = function(v15, v16) --[[ Line: 66 ]] --[[ Name: setWebViewLoadTime ]]
    v15.webview_load_time = v16;
end;
local v17 = {};
v17.__index = v17;
local v18 = game:DefineFastInt("NativePurchaseRobuxPageWrapperEventThrottlingPercentage", 100);
local v19 = game:DefineFastInt("NativePurchaseRobuxPageWrapperStatThrottlingPercentage", 1000);
v17.EventName = if v3 then {
    Init = "NativePurchaseRobuxPageWrapper_Init", 
    Mount = "NativePurchaseRobuxPageWrapper_Mount", 
    ApiCall = "NativePurchaseRobuxPageWrapper_ApiCall", 
    ApiResponse = "NativePurchaseRobuxPageWrapper_ApiResponse", 
    Render = "NativePurchaseRobuxPageWrapper_Render", 
    WebViewLoad = "NativePurchaseRobuxPageWrapper_WebViewLoad"
} else {
    Init = "NativePurchaseRobuxPageWrapper:Init", 
    Mount = "NativePurchaseRobuxPageWrapper:Mount", 
    ApiCall = "NativePurchaseRobuxPageWrapper:ApiCall", 
    ApiResponse = "NativePurchaseRobuxPageWrapper:ApiResponse", 
    Render = "NativePurchaseRobuxPageWrapper:Render", 
    WebViewLoad = "NativePurchaseRobuxPageWrapper:WebViewLoad"
};
v17.TelemetryStat = {
    InitToMountLatency = {
        eventName = v3 and "NativePurchaseRobuxPageWrapper_InitToMountLatency" or "NativePurchaseRobuxPageWrapper:InitToMountLatency", 
        backends = {
            "RobloxTelemetryStat"
        }, 
        lastUpdated = {
            2025, 
            8, 
            13
        }, 
        throttlingPercentage = v19, 
        description = "Stat for tracking initialization to mount latency in NativePurchaseRobuxPageWrapper to detect performance issues", 
        links = ""
    }, 
    ApiLatency = {
        eventName = v3 and "NativePurchaseRobuxPageWrapper_ApiLatency" or "NativePurchaseRobuxPageWrapper:ApiLatency", 
        backends = {
            "RobloxTelemetryStat"
        }, 
        lastUpdated = {
            2025, 
            8, 
            13
        }, 
        throttlingPercentage = v19, 
        description = "Stat for tracking API response latency in NativePurchaseRobuxPageWrapper to detect performance issues", 
        links = ""
    }, 
    InitToRenderLatency = {
        eventName = v3 and "NativePurchaseRobuxPageWrapper_InitToRenderLatency" or "NativePurchaseRobuxPageWrapper:InitToRenderLatency", 
        backends = {
            "RobloxTelemetryStat"
        }, 
        lastUpdated = {
            2025, 
            8, 
            13
        }, 
        throttlingPercentage = v19, 
        description = "Stat for tracking initialization to render latency in NativePurchaseRobuxPageWrapper to detect performance issues", 
        links = ""
    }, 
    MountToRenderLatency = {
        eventName = v3 and "NativePurchaseRobuxPageWrapper_MountToRenderLatency" or "NativePurchaseRobuxPageWrapper:MountToRenderLatency", 
        backends = {
            "RobloxTelemetryStat"
        }, 
        lastUpdated = {
            2025, 
            8, 
            13
        }, 
        throttlingPercentage = v19, 
        description = "Stat for tracking mount to render latency in NativePurchaseRobuxPageWrapper to detect performance issues", 
        links = ""
    }, 
    RenderToWebViewLatency = {
        eventName = v3 and "NativePurchaseRobuxPageWrapper_RenderToWebViewLatency" or "NativePurchaseRobuxPageWrapper:RenderToWebViewLatency", 
        backends = {
            "RobloxTelemetryStat"
        }, 
        lastUpdated = {
            2025, 
            8, 
            13
        }, 
        throttlingPercentage = v19, 
        description = "Stat for tracking render to WebView load latency in NativePurchaseRobuxPageWrapper to detect performance issues", 
        links = ""
    }
};
v17.sendWebViewMetrics = function(v20, v21, v22, v23) --[[ Line: 155 ]] --[[ Name: sendWebViewMetrics ]]
    -- upvalues: v2 (copy), v18 (copy)
    local v24 = {
        eventName = "BuyRobuxWebViewMetrics", 
        backends = {
            v2.TelemetryBackends.EventIngest
        }, 
        throttlingPercentage = v18, 
        lastUpdated = {
            2025, 
            8, 
            13
        }, 
        description = "Event sent to track BuyRobux WebView latency metrics and lifecycle events", 
        links = ""
    };
    local v25 = {
        buyrobux_latency_metrics_session_id = v22.buyrobux_latency_metrics_session_id, 
        triggering_context = "NativePurchaseRobuxPage", 
        lifecycle_event_type = v21, 
        component_name = "NativePurchaseRobuxPageWrapper", 
        target = "client", 
        local_timestamp = os.date("!%Y-%m-%dT%H:%M:%S.000Z")
    };
    for v26, v27 in pairs(v23) do
        v25[v26] = v27;
    end;
    v20.telemetryService:LogEvent(v24, {
        customFields = v25
    });
end;
v17.onInit = function(v28, v29) --[[ Line: 187 ]] --[[ Name: onInit ]]
    -- upvalues: v17 (copy)
    v28:sendWebViewMetrics(v17.EventName.Init, v29, {
        init_time = tostring(v29.init_time)
    });
end;
v17.onMount = function(v30, v31) --[[ Line: 193 ]] --[[ Name: onMount ]]
    -- upvalues: v17 (copy), v2 (copy)
    if not v31.did_mount_time then
        return;
    else
        local v32 = v31.did_mount_time - v31.init_time;
        v30:sendWebViewMetrics(v17.EventName.Mount, v31, {
            init_time = tostring(v31.init_time), 
            did_mount_time = tostring(v31.did_mount_time), 
            init_to_mount_latency_ms = tostring(v32 * 1000)
        });
        v2.default:logRobloxTelemetryStat(v17.TelemetryStat.InitToMountLatency, v32 * 1000, {
            component = "NativePurchaseRobuxPageWrapper", 
            target = "client"
        });
        return;
    end;
end;
v17.onApiCall = function(v33, v34, v35) --[[ Line: 216 ]] --[[ Name: onApiCall ]]
    -- upvalues: v17 (copy)
    if not v34.get_robux_balance_start then
        return;
    else
        v33:sendWebViewMetrics(v17.EventName.ApiCall, v34, {
            get_robux_balance_start = tostring(v34.get_robux_balance_start), 
            api_call_type = v35
        });
        return;
    end;
end;
v17.onApiResponse = function(v36, v37, v38, v39) --[[ Line: 227 ]] --[[ Name: onApiResponse ]]
    -- upvalues: v17 (copy), v2 (copy)
    if not v37.get_robux_balance_start or not v37.get_robux_balance_response or not v37.api_latency_ms then
        return;
    else
        v36:sendWebViewMetrics(v17.EventName.ApiResponse, v37, {
            get_robux_balance_start = tostring(v37.get_robux_balance_start), 
            get_robux_balance_response = tostring(v37.get_robux_balance_response), 
            api_latency_ms = tostring(v37.api_latency_ms), 
            api_call_type = v38, 
            robux_balance = v39
        });
        v2.default:logRobloxTelemetryStat(v17.TelemetryStat.ApiLatency, v37.api_latency_ms, {
            component = "NativePurchaseRobuxPageWrapper", 
            target = "client", 
            api_call_type = v38
        });
        return;
    end;
end;
v17.onRender = function(v40, v41) --[[ Line: 259 ]] --[[ Name: onRender ]]
    -- upvalues: v17 (copy), v2 (copy)
    if not v41.render_time then
        return;
    else
        local l_render_time_0 = v41.render_time;
        local v43 = l_render_time_0 - v41.init_time;
        local v44 = 0;
        local v45 = 0;
        local v46 = {
            init_time = tostring(v41.init_time), 
            render_time = tostring(l_render_time_0), 
            init_to_render_latency_ms = tostring(v43 * 1000)
        };
        if v41.did_mount_time then
            v44 = v41.did_mount_time - v41.init_time;
            v45 = l_render_time_0 - v41.did_mount_time;
            v46.did_mount_time = tostring(v41.did_mount_time);
            v46.init_to_mount_latency_ms = tostring(v44 * 1000);
            v46.mount_to_render_latency_ms = tostring(v45 * 1000);
        end;
        v40:sendWebViewMetrics(v17.EventName.Render, v41, v46);
        v2.default:logRobloxTelemetryStat(v17.TelemetryStat.InitToRenderLatency, v43 * 1000, {
            component = "NativePurchaseRobuxPageWrapper", 
            target = "client"
        });
        if v41.did_mount_time then
            v2.default:logRobloxTelemetryStat(v17.TelemetryStat.MountToRenderLatency, v45 * 1000, {
                component = "NativePurchaseRobuxPageWrapper", 
                target = "client"
            });
        end;
        return;
    end;
end;
v17.onWebViewLoad = function(v47, v48, v49) --[[ Line: 306 ]] --[[ Name: onWebViewLoad ]]
    -- upvalues: v17 (copy), v2 (copy)
    if not v48.webview_load_time then
        return;
    else
        local l_webview_load_time_0 = v48.webview_load_time;
        local v51 = l_webview_load_time_0 - v49;
        v47:sendWebViewMetrics(v17.EventName.WebViewLoad, v48, {
            render_time = tostring(v49), 
            webview_load_time = tostring(l_webview_load_time_0), 
            render_to_webview_latency_ms = tostring(v51 * 1000)
        });
        v2.default:logRobloxTelemetryStat(v17.TelemetryStat.RenderToWebViewLatency, v51 * 1000, {
            component = "NativePurchaseRobuxPageWrapper", 
            target = "client"
        });
        return;
    end;
end;
v17.new = function(v52) --[[ Line: 330 ]]
    -- upvalues: v17 (copy)
    local v53 = {
        telemetryService = v52
    };
    setmetatable(v53, v17);
    return v53;
end;
return {
    NativePurchaseRobuxPageWrapperAnalytics = v17, 
    TimingData = v4
};
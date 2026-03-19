local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local v7 = require(l_Modules_0.LuaApp.Thunks.NativePurchaseComplete);
local v8 = require(l_Modules_0.LuaApp.Thunks.NativePurchaseCompleteDEP);
local v9 = require(l_Modules_0.LuaApp.Enum.NativePurchaseStatus);
local v10 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v12 = v4.PureComponent:extend("MarketplaceServiceEventReciever");
v12.render = function(v13) --[[ Line: 18 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v6 (copy), l_MarketplaceService_0 (copy)
    if game:GetEngineFeature("NativePurchaseWithLocalPlayer") then
        return v4.createFragment({
            v4.createElement(v6, {
                event = l_MarketplaceService_0.NativePurchaseFinishedWithLocalPlayer, 
                callback = function(v14, v15) --[[ Line: 23 ]] --[[ Name: callback ]]
                    -- upvalues: v13 (copy)
                    v13.props.nativePurchaseFinishedWithLocalPlayer(v13.props.networking, v14, v15);
                end
            }), 
            v4.createElement(v6, {
                event = l_MarketplaceService_0.NativePurchaseFinished, 
                callback = function(v16, v17, v18) --[[ Line: 29 ]] --[[ Name: callback ]]
                    -- upvalues: v13 (copy)
                    v13.props.nativePurchaseFinishedWithNetwork(v13.props.networking, v16, v17, v18);
                end
            })
        });
    else
        return v4.createElement(v6, {
            event = l_MarketplaceService_0.NativePurchaseFinished, 
            callback = function(v19, v20, v21) --[[ Line: 37 ]] --[[ Name: callback ]]
                -- upvalues: v13 (copy)
                v13.props.nativePurchaseFinishedWithNetwork(v13.props.networking, v19, v20, v21);
            end
        });
    end;
end;
v12 = l_RoactServices_0.connect({
    networking = v10
})(v12);
return v5.connect(nil, function(v22) --[[ Line: 48 ]]
    -- upvalues: v8 (copy), v9 (copy), v7 (copy)
    return {
        nativePurchaseFinished = function(_, v24, v25) --[[ Line: 50 ]] --[[ Name: nativePurchaseFinished ]]
            -- upvalues: v22 (copy), v8 (ref)
            return v22(v8(v24, v25));
        end, 
        nativePurchaseFinishedWithNetwork = function(v26, _, v28, v29) --[[ Line: 53 ]] --[[ Name: nativePurchaseFinishedWithNetwork ]]
            -- upvalues: v9 (ref), v22 (copy), v7 (ref)
            local v30 = if v29 then v9.Success else v9.Failed;
            return v22(v7(v26, v28, v30));
        end, 
        nativePurchaseFinishedWithLocalPlayer = function(v31, v32, v33) --[[ Line: 57 ]] --[[ Name: nativePurchaseFinishedWithLocalPlayer ]]
            -- upvalues: v9 (ref), v22 (copy), v7 (ref)
            local v34 = if v33 then v9.Success else v9.Failed;
            return v22(v7(v31, v32, v34));
        end
    };
end)(v12);
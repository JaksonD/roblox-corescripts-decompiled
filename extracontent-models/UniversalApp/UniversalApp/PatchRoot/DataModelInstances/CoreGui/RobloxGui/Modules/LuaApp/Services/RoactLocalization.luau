local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_Modules_0.Common.Immutable);
local v4 = require(l_Modules_0.Common.Roact);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_Modules_0.Common.RoactUtilities.ExternalEventConnection);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v8 = require(l_CorePackages_0.Packages.tutils);
local l_RoactServicesContext_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServicesContext;
local v10 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagMigrateRoactUtilsToReactUtils();
local v11 = l_RoactServices_0.createService(script.Name);
v11.connect = function(v12) --[[ Line: 23 ]] --[[ Name: connect ]]
    -- upvalues: v4 (copy), v11 (copy), l_LocalizationService_0 (copy), v3 (copy), v10 (copy), v6 (copy), v8 (copy), l_RoactServicesContext_0 (copy), v5 (copy)
    local v13 = {};
    for _, v15 in ipairs(v12) do
        v13[v15] = true;
    end;
    return function(v16) --[[ Line: 29 ]]
        -- upvalues: v4 (ref), v11 (ref), l_LocalizationService_0 (ref), v13 (copy), v3 (ref), v10 (ref), v6 (ref), v8 (ref), l_RoactServicesContext_0 (ref), v5 (ref)
        assert(v16 ~= nil, "Expected component to be passed to connection, got nil.");
        local v17 = ("Localize(%s)"):format((tostring(v16)));
        local v18 = v4.Component:extend(v17);
        v18.init = function(v19) --[[ Line: 35 ]] --[[ Name: init ]]
            -- upvalues: v11 (ref), v16 (copy), l_LocalizationService_0 (ref)
            local v20 = v11.get(v19.props.services);
            assert(v20 ~= nil, table.concat({
                "Cannot initialize RoactLocalization component without being a descendent of ServiceProvider!", 
                ("Tried to wrap component %q"):format((tostring(v16))), 
                "Make sure there is a ServiceProvider above this component in the tree."
            }, "\n"));
            v19.state = {
                locale = l_LocalizationService_0.RobloxLocaleId
            };
            v19.localization = v20;
            v19.updateLocalization = function(v21) --[[ Line: 52 ]]
                -- upvalues: v19 (copy)
                v19:setState({
                    locale = v21
                });
            end;
        end;
        v18.render = function(v22) --[[ Line: 59 ]] --[[ Name: render ]]
            -- upvalues: v11 (ref), v13 (ref), v3 (ref), v16 (copy), v10 (ref), v4 (ref), v6 (ref), l_LocalizationService_0 (ref)
            local v23 = v11.get(v22.props.services);
            local v24 = {};
            for v25 in pairs(v13) do
                local v26 = v22.props.innerProps[v25];
                assert(v26 ~= nil, ("No localization string or table found for \"%s\""):format(v25));
                local v27 = true;
                if type(v26) ~= "table" then
                    v27 = type(v26) == "string";
                end;
                assert(v27, ("Localized field \"%s\" is not a string or table."):format(v25));
                if type(v26) == "table" then
                    assert(type(v26[1]) == "string", ("Localization table \"%s\" requires a key of type string, got %s"):format(v25, (type(v26[1]))));
                    v24[v25] = v23:Format(v26[1], v26);
                else
                    v24[v25] = v23:Format(v26);
                end;
            end;
            local v28 = v3.JoinDictionaries(v22.props.innerProps, v24);
            if type(v16) == "string" then
                v28.locale = nil;
            end;
            if v10 then
                return v4.createFragment({
                    RobloxLocaleIdChangedConnection = v4.createElement(v6, {
                        event = l_LocalizationService_0:GetPropertyChangedSignal("RobloxLocaleId"), 
                        callback = v22.updateLocalization
                    }), 
                    Component = v4.createElement(v16, v28)
                });
            else
                return v4.createElement(v6, {
                    event = l_LocalizationService_0:GetPropertyChangedSignal("RobloxLocaleId"), 
                    callback = v22.updateLocalization
                }, {
                    Component = v4.createElement(v16, v28)
                });
            end;
        end;
        v18.shouldUpdate = function(v29, v30, v31) --[[ Line: 109 ]] --[[ Name: shouldUpdate ]]
            -- upvalues: v13 (ref), v8 (ref)
            if v31 ~= v29.state then
                return true;
            else
                for v32 in pairs(v13) do
                    local v33 = v30.innerProps[v32];
                    local v34 = v29.props.innerProps[v32];
                    if v33 ~= nil and v34 ~= nil then
                        if type(v33) == "table" and type(v34) == "table" then
                            if not v8.shallowEqual(v33, v34) then
                                return true;
                            end;
                        elseif v33 ~= v34 then
                            return true;
                        end;
                    elseif v33 ~= nil or v34 ~= nil then
                        return true;
                    end;
                end;
                return not v8.shallowEqual(v30, v29.props.innerProps, v13);
            end;
        end;
        local v35 = v4.PureComponent:extend("ConnectionWrapper");
        v35.render = function(v36) --[[ Line: 135 ]] --[[ Name: render ]]
            -- upvalues: v4 (ref), l_RoactServicesContext_0 (ref), v5 (ref), v18 (copy)
            return v4.createElement(l_RoactServicesContext_0.Consumer, {
                render = function(v37) --[[ Line: 137 ]] --[[ Name: render ]]
                    -- upvalues: v5 (ref), v36 (copy), v4 (ref), v18 (ref)
                    local v38 = v5.Dictionary.join(v36.props, {
                        forwardRef = v5.None, 
                        [v4.Ref] = v36.props.forwardRef
                    });
                    return v4.createElement(v18, {
                        services = v37, 
                        innerProps = v38
                    });
                end
            });
        end;
        return v4.forwardRef(function(v39, v40) --[[ Line: 151 ]]
            -- upvalues: v4 (ref), v35 (copy), v5 (ref)
            return v4.createElement(v35, v5.Dictionary.join(v39, {
                forwardRef = v40
            }));
        end);
    end;
end;
return v11;
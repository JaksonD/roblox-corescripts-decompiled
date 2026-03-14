local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.ApolloClient);
local l_AppUserLayers_0 = require(l_script_FirstAncestor_0.Parent.ExperimentLayers).AppUserLayers;
local v3 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v4 = require(l_script_FirstAncestor_0.Parent.React);
local l_useUserExperiment_0 = require(l_script_FirstAncestor_0.Parent.RoactAppExperiment).useUserExperiment;
local v6 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local v7 = require(l_script_FirstAncestor_0.Parent.Foundation);
local l_useLocalization_0 = require(l_script_FirstAncestor_0.Parent.Localization).Hooks.useLocalization;
local v9 = require(l_script_FirstAncestor_0.Components.EventDetailsPage);
local v10 = require(l_script_FirstAncestor_0.Components.EventDetailsVerticalPage);
local v11 = require(l_script_FirstAncestor_0.Components.EventNotFoundModal);
local v12 = require(l_script_FirstAncestor_0.requests);
local v13 = require(l_script_FirstAncestor_0.Common.getRetrievalStatusFromApolloQuery);
local l_useQuery_0 = v1.useQuery;
local l_LoadingStateContainer_0 = v6.App.Container.LoadingStateContainer;
local l_RetrievalStatus_0 = v6.App.Loading.Enum.RetrievalStatus;
local l_EmptyState_0 = v6.App.Indicator.EmptyState;
local l_AppStyleProvider_0 = v6.App.Style.AppStyleProvider;
local v19 = require(l_script_FirstAncestor_0.Flags.FFlagLuaAppCreatorSuccessVirtualEventsLayerUseRoactExperiment);
local v20 = require(l_script_FirstAncestor_0.Flags.FFlagLuaAppFixEventNotFoundErrorStateExit);
return function(v21) --[[ Line: 33 ]] --[[ Name: EventDetailsPageLoader ]]
    -- upvalues: l_useQuery_0 (copy), v12 (copy), v13 (copy), l_useLocalization_0 (copy), v19 (copy), l_useUserExperiment_0 (copy), l_AppUserLayers_0 (copy), v4 (copy), l_LoadingStateContainer_0 (copy), l_RetrievalStatus_0 (copy), v3 (copy), v7 (copy), l_AppStyleProvider_0 (copy), v10 (copy), v9 (copy), v20 (copy), v11 (copy), l_EmptyState_0 (copy)
    local v22 = l_useQuery_0(v12.GET_VIRTUAL_EVENT, {
        variables = {
            virtualEventId = v21.virtualEventId
        }
    });
    local v23 = v13(v22);
    local v24 = l_useLocalization_0({
        notFound = "Feature.VirtualEvents.EventNotFound"
    });
    if v21.mockNetworkStatus then
        v23 = v21.mockNetworkStatus;
    end;
    local v25 = nil;
    local v26 = nil;
    if v19 then
        local v29, v30 = l_useUserExperiment_0({
            l_AppUserLayers_0.CreatorSuccessVirtualEvents
        }, function(v27) --[[ Line: 54 ]]
            -- upvalues: l_AppUserLayers_0 (ref)
            local v28 = v27[l_AppUserLayers_0.CreatorSuccessVirtualEvents] or {};
            return v28.EnableEventDetailsNewModal, v28.NotifyMeUseEmphasisVariant;
        end, true);
        v25 = v29;
        v26 = v30;
    end;
    return v4.createElement(l_LoadingStateContainer_0, {
        dataStatus = l_RetrievalStatus_0.fromRawValue(v23), 
        renderOnLoaded = function() --[[ Line: 64 ]] --[[ Name: renderOnLoaded ]]
            -- upvalues: v3 (ref), v21 (copy), v22 (copy), v19 (ref), v26 (ref), v25 (ref), v4 (ref), v7 (ref), l_AppStyleProvider_0 (ref), v10 (ref), v9 (ref)
            local v31 = v3.Dictionary.join(v21, {
                virtualEvent = v22.data.virtualEvent, 
                virtualEventId = v3.None, 
                notifyMeUseEmphasisVariant = if v19 then v26 else false
            });
            if if v19 then v25 else false then
                return v4.createElement(v4.Fragment, nil, {
                    FoundationProvider = v4.createElement(v7.FoundationProvider, {
                        theme = v7.Enums.Theme.Dark
                    }, {
                        AppStyleProvider = v4.createElement(l_AppStyleProvider_0, {
                            style = {
                                themeName = "dark"
                            }
                        }, {
                            EventDetailsPage = v4.createElement(v10, v31)
                        })
                    })
                });
            else
                return v4.createElement(v4.Fragment, nil, {
                    EventDetailsPage = v4.createElement(v9, v31)
                });
            end;
        end, 
        renderOnFailed = function() --[[ Line: 98 ]] --[[ Name: renderOnFailed ]]
            -- upvalues: v20 (ref), v4 (ref), v11 (ref), v21 (copy), l_EmptyState_0 (ref), v24 (copy)
            if v20 then
                return (v4.createElement(v11, {
                    onClose = v21.onClose
                }));
            else
                return (v4.createElement(v4.Fragment, nil, {
                    EventNotFound = v4.createElement(l_EmptyState_0, {
                        text = v24.notFound
                    })
                }));
            end;
        end
    });
end;
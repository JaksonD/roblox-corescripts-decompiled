local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_MemStorageService_0 = game:GetService("MemStorageService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_HttpService_0 = game:GetService("HttpService");
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_CorePackages_0.Packages.Roact);
local v7 = require(l_CorePackages_0.Packages.RoactRodux);
local v8 = require(l_CorePackages_0.Packages.t);
local l_DateTime_0 = require(l_CorePackages_0.Workspace.Packages.Time).DateTime;
local l_TimeZone_0 = require(l_CorePackages_0.Workspace.Packages.Time).TimeZone;
local v11 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v12 = require(l_Modules_0.LuaApp.AppPage);
local v13 = require(l_Modules_0.Luobu.Components.More.TencentNoticeCenter.NoticeListCell);
local v14 = require(l_Modules_0.Luobu.Actions.DecrementUnreadTencentNoticeCount);
local v15 = require(l_Modules_0.Luobu.Actions.ReadTencentNoticeId);
local v16 = require(l_Modules_0.Luobu.Enum.TencentNoticeType);
local v17 = require(l_Modules_0.Luobu.Enum.MemStorageKeys);
local v18 = v6.PureComponent:extend("TencentNoticeItemContainer");
v18.validateProps = v8.strictInterface({
    layoutInfo = v8.table, 
    item = v8.optional(v8.table), 
    dateText = v8.optional(v8.string), 
    navigateDown = v8.callback, 
    decrementUnreadTencentNoticeCount = v8.callback, 
    readTencentNoticeId = v8.callback, 
    noticeReadStatus = v8.table
});
local function _(v19) --[[ Line: 34 ]] --[[ Name: getDateText ]]
    -- upvalues: l_DateTime_0 (copy), l_LocalizationService_0 (copy), l_TimeZone_0 (copy)
    local v20 = l_DateTime_0.fromUnixTimestamp(v19);
    local l_RobloxLocaleId_0 = l_LocalizationService_0.RobloxLocaleId;
    return (v20:GetLongRelativeTime(v20, l_TimeZone_0.Current, l_RobloxLocaleId_0));
end;
v18.init = function(v23) --[[ Line: 41 ]] --[[ Name: init ]]
    -- upvalues: v16 (copy), v12 (copy)
    v23.onActivated = function() --[[ Line: 42 ]]
        -- upvalues: v23 (copy), v16 (ref), v12 (ref)
        local l_item_0 = v23.props.item;
        if l_item_0.type == v16.Web then
            v23.props.navigateDown({
                name = v12.GenericWebPage, 
                detail = l_item_0.webTypeUrl or l_item_0.noticeUrl, 
                extraProps = {
                    title = l_item_0.title
                }
            });
        else
            v23.props.navigateDown({
                name = v12.TencentNoticeContent, 
                extraProps = {
                    notice = l_item_0, 
                    dateText = v23.props.dateText
                }
            });
        end;
        local l_noticeReadStatus_0 = v23.props.noticeReadStatus;
        if (l_item_0.hasRead or l_noticeReadStatus_0[l_item_0.noticeId] or false) == false then
            v23:fireNoticeIdHasRead(l_item_0.noticeId, l_item_0.endTime);
        end;
    end;
end;
v18.fireNoticeIdHasRead = function(v26, v27, v28) --[[ Line: 69 ]] --[[ Name: fireNoticeIdHasRead ]]
    -- upvalues: l_MemStorageService_0 (copy), v17 (copy), l_HttpService_0 (copy)
    l_MemStorageService_0:Fire(v17.TencentNoticeIdReadStatus, l_HttpService_0:JSONEncode({
        noticeId = v27, 
        endTime = v28
    }));
    v26.props.decrementUnreadTencentNoticeCount();
    v26.props.readTencentNoticeId(v27);
end;
v18.render = function(v29) --[[ Line: 82 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v13 (copy), v5 (copy)
    local l_layoutInfo_0 = v29.props.layoutInfo;
    return v6.createElement(v13, v5.Dictionary.join(l_layoutInfo_0, {
        item = v29.props.item, 
        dateText = v29.props.dateText, 
        onActivated = v29.onActivated
    }));
end;
return (v7.connect(function(v31, v32) --[[ Line: 94 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_DateTime_0 (copy), l_LocalizationService_0 (copy), l_TimeZone_0 (copy)
    local v33 = false;
    local v34 = v32.item and v32.item.startTime or nil;
    local v35 = {};
    local v36;
    if v34 then
        local v37 = l_DateTime_0.fromUnixTimestamp(v34);
        local l_RobloxLocaleId_1 = l_LocalizationService_0.RobloxLocaleId;
        v36 = v37:GetLongRelativeTime(v37, l_TimeZone_0.Current, l_RobloxLocaleId_1);
        v33 = v36;
    end;
    if not v33 then
        v36 = nil;
    end;
    v33 = false;
    v35.dateText = v36;
    v35.noticeReadStatus = v31.Luobu.TencentNoticeReadStatus;
    return v35;
end, function(v39) --[[ Line: 102 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v11 (copy), v14 (copy), v15 (copy)
    return {
        navigateDown = function(v40) --[[ Line: 104 ]] --[[ Name: navigateDown ]]
            -- upvalues: v39 (copy), v11 (ref)
            v39(v11(v40));
        end, 
        decrementUnreadTencentNoticeCount = function() --[[ Line: 107 ]] --[[ Name: decrementUnreadTencentNoticeCount ]]
            -- upvalues: v39 (copy), v14 (ref)
            return v39(v14());
        end, 
        readTencentNoticeId = function(v41) --[[ Line: 110 ]] --[[ Name: readTencentNoticeId ]]
            -- upvalues: v39 (copy), v15 (ref)
            return v39(v15(v41));
        end
    };
end)(v18));
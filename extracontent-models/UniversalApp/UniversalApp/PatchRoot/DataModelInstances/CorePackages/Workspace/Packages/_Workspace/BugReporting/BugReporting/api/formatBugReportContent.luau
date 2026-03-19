local _ = require(script.Parent.Parent.BugReporterTypes);
return function(v1, v2) --[[ Line: 5 ]] --[[ Name: formatBugReportContent ]]
    local v3 = v1.description or "";
    local v4 = v2 < #v3 and "..." or "";
    local v5 = string.sub(v3, 1, v2) .. v4;
    local v6 = table.concat({
        v3, 
        "\n", 
        "*Metadata:*", 
        ("- User ID: %*"):format(v1.userId), 
        ("- User Name: %*"):format(v1.userDisplayName), 
        ("- Screen: %*"):format(v1.additionalInfo.screen), 
        ("- Locale: %*"):format(v1.additionalInfo.locale), 
        ("- Client Channel: %*"):format(v1.additionalInfo.clientChannel), 
        ("- CoreScript Version: %*"):format(v1.additionalInfo.coreScriptVersion), 
        ("- Manufacturer: %*"):format(v1.systemInfo.manufacturer), 
        ("- Device Name: %*"):format(v1.systemInfo.deviceName), 
        ("- OS: %*"):format(v1.systemInfo.baseOs), 
        ("- System Version: %*"):format(v1.systemInfo.systemVersion), 
        ("- App Version: %*"):format(v1.systemInfo.appVersion), 
        ("- Network Type: %*"):format(v1.systemInfo.networkType), 
        "\n\n", 
        v1.logUrl and ("[Backtrace Device Log|%*]"):format(v1.logUrl) or ""
    }, "\n");
    return {
        title = v5, 
        description = v6
    };
end;
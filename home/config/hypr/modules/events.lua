hl.on("monitor.added", function(m)
    hl.notification.create({ text = "New monitor connected ! ", timeout = 3000, icon = "ok" })
end)

hl.on("monitor.removed", function(m)
    hl.notification.create({ text = "Monitor disconnected ! ", timeout = 3000, icon = "ok" })
end)

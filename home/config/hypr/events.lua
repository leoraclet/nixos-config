hl.on("monitor.added", function(m)
    hl.notification.create({ text = "New monitor connected ! ", timeout = 5000, icon = "ok" })
end)

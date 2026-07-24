c = get_config() #noqa

# No banner
c.TerminalIPythonApp.display_banner = False

# No exception tracebacks
c.InteractiveShell.xmode = "minimal"

# Do not confirm on exit
c.TerminalInteractiveShell.confirm_exit = False

c.InteractiveShell.deep_reload = True
c.InteractiveShell.autoindent = True

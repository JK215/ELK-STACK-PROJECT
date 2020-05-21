
#!/bin/bash
#priorities alert or higher
journalctl -p alert -b
#check size of system disk journal
journalctl --disk-usage -b
#remove except most recent files
journalctl --vacuum-files-2

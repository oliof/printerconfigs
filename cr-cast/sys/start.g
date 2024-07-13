; rehome if not homed
if !move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed ; || !move.axes[3].homed
  G28


; select first tool if none are selected
if state.currentTool == -1
  T0

M98 P"0:/macros/prime-blob.g" D0
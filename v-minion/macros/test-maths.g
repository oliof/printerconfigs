if limits.tools == null
  abort "No tools defined, nothing to prime"

if param.D > {#tools-1}
  abort "Parameter D must be set to an existing tool"

var blob_pos_x = {move.axes[0].max-5-(param.D*10)} 
echo "blob pos x = " ^ var.blob_pos_x 
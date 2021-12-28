# V-Minion RepRap Configuration files

**Work In Progress** 

This is a basic RepRapFirmware setup for the RatRig V-Minion.

Use at your own risk.

# Notes:

 * Requires RepRapFirmware 3.4beta6 or higher.
 * The configuration is tested with the SKR RRF 1.1 board
   and the excellent STM32 port by teamgloomy.
 * Configurations are added for both accelerometer support
   and 12864 display support, but you can only attach one
   at a time on the SKR RRF 1.1 due to the limited availability
   of pins. 
 * config.g makes use of some global variables.
 * Sensorless homing _will_ require tuning on your machine.
 * This setup uses sensorless homing for rough homing and
   then uses the Z probe to find the bed edges.
 * menu files are based on the [Ultimate Duet Menu System](https://github.com/jadonmmiller/UltimateDuetMenuSystem).
   They are included here for eventual changes.

# Get in Touch

You will find helpful and supportive people at the [STM RRF Discord](https://discord.gg/uS97Qs7)
and the [Unofficial RatRig Discord](https://discord.gg/DcCEk8u).

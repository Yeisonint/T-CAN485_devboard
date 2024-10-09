# T-CAN485_devboard
LilyGO [T-CAN485](https://github.com/Xinyuan-LilyGO/T-CAN485) board test

Using PlatformIO, so after install dependencies the `platformio` binary is available in `~/.platformio/penv/bin/platformio`

# Available make commands (Optional)

- Install dependencies: `make install-dependencies`
- Compile: `make compile`
- Upload: `PORT=/dev/ttyACM0 make upload`
- Monitor: `PORT=/dev/ttyACM0 make monitor`
- List boards: `make list-boards`
- Clean: `make clean`
CURRENT_DIR = $(shell pwd)
PATH_TO_PLATFORMIO_CLI="$(HOME)/.platformio/penv/bin/platformio"

all: install-dependencies compile list-boards

install-dependencies:
	@echo "Looking for arduino-cli in $(HOME)/.local/bin"
	@if [ -f $(PATH_TO_PLATFORMIO_CLI) ]; then \
		echo "platformio found, skipping installation"; \
	else \
		echo "Installing platformio..."; \
		curl -fsSL -o /tmp/get-platformio.py https://raw.githubusercontent.com/platformio/platformio-core-installer/master/get-platformio.py; \
		python3 /tmp/get-platformio.py; \
		rm /tmp/get-platformio.py; \
		echo 'export PATH=$${HOME}/.platformio/penv/bin:$${PATH}' >> ~/.bashrc; \
	fi
	@echo "Installing libraries..."

compile:
	@echo "Compiling..."
	@pio run

upload:
	@echo "Using port: $(PORT)"
	@pio run --target upload --upload-port $(PORT)

monitor:
	@echo "Using port: $(PORT)"
	@pio device monitor -p $(PORT) --baud 115200

list-boards:
	@echo "Boards connected:"
	@pio device list

clean:
	@echo "Cleaning up..."
	@pio run --target clean
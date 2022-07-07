.PHONY: all

all: clean build run

.PHONY: clean

clean:
	@rm -rf ./Test\ Application.app ./ui/build
	@echo "[✔️] Clean complete!"

.PHONY: build

build:
	@cd ./ui && npm install
	@cd ./ui && npm run build
	@mkdir -p ./Test\ Application.app/Contents/MacOS
	@bash setup.sh Test\ Application icon/icon.png
	@go build -o ./Test\ Application.app/Contents/MacOS/Test\ Application
	@echo "[✔️] Build complete!"

.PHONY: run

run:
	@open ./Test\ Application.app
	@echo "[✔️] App is running!"

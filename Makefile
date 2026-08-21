DC = docker compose

unit-tests: dc-build unit-tests-dmd unit-tests-ldc

unit-tests-dmd:
	$(DC) run --rm dmd dub -q test --config=default
	$(DC) run --rm dmd dub build -b release --config=default
	$(DC) run --rm dmd dub -q test --config=requests-driver
	$(DC) run --rm dmd dub build -b release --config=requests-driver

unit-tests-ldc:
	$(DC) run --rm ldc dub -q test --config=default
	$(DC) run --rm ldc dub build -b release --config=default
	$(DC) run --rm ldc dub -q test --config=requests-driver
	$(DC) run --rm ldc dub build -b release --config=requests-driver

shell-dmd:
	$(DC) run --rm dmd bash

shell-ldc:
	$(DC) run --rm ldc bash

dc-build:
	$(DC) build

generate-api:
	cd generator && dub build && ./bin/telega-api-generator --file fixtures/botapi.html --target-dir ../source/telega/telegram/generated

generate-api-live:
	cd generator && dub build && ./bin/telega-api-generator --target-dir ../source/telega/telegram/generated

check-generated-api: generate-api
	git diff --exit-code -- source/telega/telegram/generated || (echo "Generated code is out of date. Run 'make generate-api' and commit." && exit 1)

run-example-echobot:
	$(DC) -f docker-compose.examples.yml run --workdir=/dlang/app/examples/echobot --rm example dub

run-example-keyboard:
	$(DC) -f docker-compose.examples.yml run --workdir=/dlang/app/examples/keyboard --rm example dub

run-example-pollbot:
	$(DC) -f docker-compose.examples.yml run --workdir=/dlang/app/examples/pollbot --rm example dub

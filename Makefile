TOKEN=$(shell oc whoami --show-token)
SERVER=$(shell oc whoami --show-server)

all: schemas/master-standalone/namespace-v1.json schemas/master-standalone-strict/namespace-v1.json

openapi.json:
	curl -sf -k \
		-H "Authorization: Bearer $(TOKEN)" \
		"$(SERVER)/openapi/v2" | jq > $@ || { rm -f $@; exit 1; }

schemas/master-standalone/namespace-v1.json: openapi.json
	mkdir -p schemas
	openapi2jsonschema --kubernetes --expanded \
		-o schemas/master-standalone openapi.json

schemas/master-standalone-strict/namespace-v1.json: openapi.json
	mkdir -p schemas
	openapi2jsonschema --kubernetes --expanded --strict \
		-o schemas/master-standalone-strict openapi.json

refresh:
	rm -f openapi.json

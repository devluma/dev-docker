#!/bin/bash

if [ "${MONGO_INITDB_ROOT_USERNAME}" ] && [ "${MONGO_INITDB_ROOT_PASSWORD}" ]; then
ROOT_AUTH_DATABASE='admin'
"${mongo[@]}" "${MONGO_INITDB_DATABASE}" <<-EOJS
	db.createUser({
		user: $(_js_escape "${MONGO_INITDB_ROOT_USERNAME}"),
		pwd: $(_js_escape "${MONGO_INITDB_ROOT_PASSWORD}"),
		roles: [ { role: 'root', db: $(_js_escape "${ROOT_AUTH_DATABASE}") } ]
	})
	db.public.insert({
		name: $(_js_escape 'default')
	})
	quit()
EOJS
fi
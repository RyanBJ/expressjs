#!/bin/bash
sed -i 's/3000/'$NODE_PORT'/g' /home/node/index.js
exec "$@"
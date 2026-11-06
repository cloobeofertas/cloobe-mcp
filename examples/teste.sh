#!/bin/sh
# Lista as ferramentas e faz uma busca de exemplo no MCP do cloo.be
URL=https://cloo.be/mcp
H='Content-Type: application/json'
curl -s -X POST "$URL" -H "$H" -d '{"jsonrpc":"2.0","id":1,"method":"tools/list"}'
echo
curl -s -X POST "$URL" -H "$H" -d '{"jsonrpc":"2.0","id":2,"method":"tools/call","params":{"name":"ofertas_em_alta","arguments":{"por_tema":2}}}'
